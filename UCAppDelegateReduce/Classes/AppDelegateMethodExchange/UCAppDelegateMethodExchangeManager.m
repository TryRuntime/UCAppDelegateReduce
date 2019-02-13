//
//  UCAppDelegateMethodExchangeManager.m
//  Pods
//
//  Created by Link on 2019/2/12.
//

#import "UCAppDelegateMethodExchangeManager.h"
#import "UCAppDelegateConfigModel.h"
#import <UCRuntimeKit/UCOtherMacro.h>
#import <objc/runtime.h>
#import "UCAppDelegateInvokeCache.h"

@interface UCAppDelegateMethodExchangeManager ()
@property(nonatomic, strong, readwrite) UCAppDelegateInvokeCache *invokeCache;
@end

@implementation UCAppDelegateMethodExchangeManager

+ (nonnull instancetype)share{
    static UCAppDelegateMethodExchangeManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[UCAppDelegateMethodExchangeManager alloc] init];
    });
    return _manager;
}

- (void)startExchangeAllMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
                            newModuleAppDelegateNameArray:(NSArray<NSString *> *)newModuleAppDelegateNameArray {
    NSMutableArray *configArray = [NSMutableArray array];
    for (NSString *moduleName in newModuleAppDelegateNameArray) {
        UCAppDelegateConfigModel *configModel = [[UCAppDelegateConfigModel alloc] initWithModuleName:moduleName
                                                                                     sendMessageType:allMessageSend];
        [configArray addObject:configModel];
    }
    [self startExchangeMethodWithOriginalAppDelegateName:originalAppDelegateName
                         newModuleAppDelegateConfigArray:configArray];
}

- (void)startExchangeMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
                       newModuleAppDelegateConfigArray:(NSArray<UCAppDelegateConfigModel *> *)newModuleAppDelegateConfigArray {
    [self startExchangeMethodWithOriginalAppDelegateName:originalAppDelegateName newModuleAppDelegateConfigArray:newModuleAppDelegateConfigArray exchangeError:nil];
}

- (void)startExchangeMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
                       newModuleAppDelegateConfigArray:(NSArray<UCAppDelegateConfigModel *> *)newModuleAppDelegateConfigArray
                                         exchangeError:(NSError * __autoreleasing *)exchangeError {
    //先添加方法
    [self p_addAllMethodOriginAppdelegateName:originalAppDelegateName error:exchangeError];
    
    //交换方法
    [self p_exchangeAllMethodWithOriginalAppdelegateName:originalAppDelegateName error:exchangeError];
    
    //解析并缓存config
    [self.invokeCache parsingWithInvokeConfigArray:newModuleAppDelegateConfigArray];
}
#pragma mark - 添加方法
/// 向原来的delegate添加所有方法
- (void)p_addAllMethodOriginAppdelegateName:(NSString *)originalAppdelegateName
                                    error:(NSError * __autoreleasing *)error {
    
    // 添加调用原来delegate的一个方法
    [self p_addMethodOriginalAppdelegateName:originalAppdelegateName
                                  methodName:kUCAppDelegateReduceInvokeOriginDelegateMethod
                                       error:error];
    // 添加派发各个模块的方法
    [self p_addMethodOriginalAppdelegateName:originalAppdelegateName
                                  methodName:kUCAppDelegateReduceSendNewDelegateMethod
                                       error:error];
}

/// 向原来的delegate添加单个方法
- (void)p_addMethodOriginalAppdelegateName:(NSString *)originalAppdelegateName
                                methodName:(NSString *)methodName
                                     error:(NSError * __autoreleasing *)error {
    
    SEL newSel = NSSelectorFromString(methodName);
    Class originAppDelegateClass = NSClassFromString(originalAppdelegateName);
    if (!originAppDelegateClass) {
        if (error != NULL) {*error = UCOriginalDelegateUndefindError();}
        UCLog(@"用于替换的class不存在,请检查传入字符串");
        return;
    }
    
    NSString *newClassName = @"UCAppDelegateRealize";
    Class newClass = NSClassFromString(newClassName);
    Method newMethod = class_getInstanceMethod(newClass, newSel);
    IMP newImp = method_getImplementation(newMethod);
    class_addMethod(originAppDelegateClass, newSel, newImp, method_getTypeEncoding(newMethod));
}

#pragma mark - 交换方法
- (void)p_exchangeAllMethodWithOriginalAppdelegateName:(NSString *)originalAppdelegateName
                                                 error:(NSError * __autoreleasing *)error{
    
    //没找到appdelegate这个对象,提前中断
    Class originalDelegateClass = NSClassFromString(originalAppdelegateName);
    if (originalDelegateClass == NULL) {
        if (error != NULL) { *error = UCOriginalDelegateUndefindError();}
        UCLog(@"用于替换的class不存在,请检查传入字符串");
        return;
    }
    
    //枚举数量,以后新增枚举的话这里需要维护
    NSUInteger enumCount = 23;
    for (int i = 1; i <= enumCount; i++) {
        NSUInteger enumValue = 1 << i;
        NSString *selName = getSendMessageMethodName(enumValue);
        [self p_exchangeMethodWithOriginalAppdelegateName:originalAppdelegateName methodName:selName error:nil];
    }
}

- (void)p_exchangeMethodWithOriginalAppdelegateName:(nonnull NSString *)originalAppdelegateName
                                         methodName:(nonnull NSString *)methodName
                                              error:(NSError * __autoreleasing *)error{
    //判断目标delegate是否实现了这个方法
    Class newClass = NSClassFromString(@"UCAppDelegateRealize");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    NSString *newMethodName = [NSString stringWithFormat:@"uc_%@", methodName];
    SEL newSEL = NSSelectorFromString(newMethodName);
    if (!checkTargetDelegateAndAction(newClass, newSEL, error)) {return;}
    
    //判断原来的delegate是否实现了这个方法
    Class originalDelegateClass = NSClassFromString(originalAppdelegateName);
    SEL originalSEL = NSSelectorFromString(methodName);
#pragma clang diagnostic pop
    if (![[originalDelegateClass new] respondsToSelector:originalSEL]) {
        if (error != NULL) { *error = UCOriginalDelegateUndefindMethodError();}
        UCLog(@"用于替换的%@类不存在%@方法,请检查传入字符串", originalAppdelegateName, methodName);
        return;
    }
    
    //开始交换方法
    Method origilalMethod = class_getInstanceMethod(originalDelegateClass, originalSEL);
    Method newMethod = class_getInstanceMethod(newClass, newSEL);
    
    method_exchangeImplementations(origilalMethod, newMethod);
}

static inline BOOL checkTargetDelegateAndAction(Class target, SEL action, NSError **error) {
    NSString *errorStr;
    if (!target) {
        errorStr = [NSString stringWithFormat:@"用于替换delegate的%@类不存在", target];
        if (error != NULL) {
            *error = UCNewDelegateUndefindError();
        }
    } else if (![[target new] respondsToSelector:action]) {
        NSString *actionStr = NSStringFromSelector(action);
        errorStr = [NSString stringWithFormat:@"用于替换delegate的%@类没有实现%@方法, 请检查调用", target, actionStr];
        if (error != NULL) {
            *error = UCNewDelegateUndefindMethodError();
        }
    }
    if (errorStr) {UCLog(@"%@", errorStr);}
    return errorStr.length == 0;
}

#pragma mark - error function
//原来的appdelegate名称错误,找不到delegate
static inline NSError * UCOriginalDelegateUndefindError() {
    return [[NSError alloc] initWithDomain:kUCAppDelegateReduceErrorDomain
                                      code:kUCOriginalDelegateUndefindErrorCode
                                  userInfo:@{kUCAppDelegateReduceErrorInfoKey: kUCOriginalDelegateUndefindErrorInfo}];
}

// 原来的appdelegate没有实现这个方法
static inline NSError * UCOriginalDelegateUndefindMethodError() {
    return [[NSError alloc] initWithDomain:kUCAppDelegateReduceErrorDomain
                                      code:kUCOriginalDelegateUndefindMethodErrorCode
                                  userInfo:@{kUCAppDelegateReduceErrorInfoKey: kUCOriginalDelegateUndefindMethodErrorInfo}];
}

// 新delegate名称异常
static inline NSError * UCNewDelegateUndefindError() {
    return [[NSError alloc] initWithDomain:kUCAppDelegateReduceErrorDomain
                                      code:kUCNewDelegateUndefindErrorCode
                                  userInfo:@{kUCAppDelegateReduceErrorInfoKey: kUNewDelegateUndefindErrorInfo}];
}

// 新delegate没实现这个方法
static inline NSError * UCNewDelegateUndefindMethodError() {
    return [[NSError alloc] initWithDomain:kUCAppDelegateReduceErrorDomain
                                      code:kUCNewDelegateUndefindMethodErrorCode
                                  userInfo:@{kUCAppDelegateReduceErrorInfoKey: kUCNewDelegateUndefindMethodErrorInfo}];
}

- (UCAppDelegateInvokeCache *)invokeCache {
    if (!_invokeCache) {
        _invokeCache = [[UCAppDelegateInvokeCache alloc] init];
    }
    return _invokeCache;
}
@end

