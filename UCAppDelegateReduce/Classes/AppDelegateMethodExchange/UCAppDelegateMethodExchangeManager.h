//
//  UCAppDelegateMethodExchangeManager.h
//  Pods
//
//  Created by Link on 2019/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UCAppDelegateConfigModel;
@interface UCAppDelegateMethodExchangeManager : NSObject

+ (nonnull instancetype)share;

/// 替换所有的method
- (void)startExchangeAllMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
                            newModuleAppDelegateNameArray:(NSArray<NSString *> *)newModuleAppDelegateNameArray;

/// 可以对替换的module进行配置
- (void)startExchangeMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
                       newModuleAppDelegateConfigArray:(NSArray<UCAppDelegateConfigModel *> *)newModuleAppDelegateConfigArray;

/// 需要处理变换错误时使用的api
//- (void)startExchangeMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
//                       newModuleAppDelegateConfigArray:(NSArray<UCAppDelegateConfigModel *> *)newModuleAppDelegateConfigArray
//                                         exchangeError:(NSError * __autoreleasing *)exchangeError;
//
//- (void)startExchangeMethodWithOriginalAppDelegateName:(NSString *)originalAppDelegateName
//                       newModuleAppDelegateConfigArray:(NSArray<UCAppDelegateConfigModel *> *)newModuleAppDelegateConfigArray
//                                    exchangeErrorBlock:(void (^)(NSError *error))exchangeErrorBlock;

- (void)p_exchangeAllMethodWithOriginalAppdelegateName:(NSString *)originalAppdelegateName
                                                 error:(NSError * __autoreleasing *)error;
- (void)p_addMethodOriginalAppdelegateName:(NSString *)originalAppdelegateName
                                methodName:(NSString *)methodName
                                     error:(NSError * __autoreleasing *)error;
@end

NS_ASSUME_NONNULL_END
