//
//  UCAppDelegateInvokeCache.m
//  Pods-UCAppDelegateReduce_Example
//
//  Created by Link on 2019/2/13.
//

#import "UCAppDelegateInvokeCache.h"
#import "UCAppDelegateConfigModel.h"

@interface UCAppDelegateInvokeCache ()
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *invokeCacheDict;
@end
@implementation UCAppDelegateInvokeCache

- (void)parsingWithInvokeConfigArray:(NSArray<UCAppDelegateConfigModel *> *)invokeConfigArray {
    
    for (UCAppDelegateConfigModel *model in invokeConfigArray) {
        NSArray<NSNumber *> *enumNumberArray = [self parsingOptionsEnum:model.sendMessageType];
        for (NSNumber *enumNumber in enumNumberArray) {
            UCAppDelegateSendMessageType messageType = enumNumber.unsignedIntegerValue;
            [self p_addInvokeModuleName:model.moduleName invokeMethodType:messageType];
        }
    }
}

- (void)removeInvokeModuleName:(NSString *)moduleName
              invokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType {
    NSArray<NSNumber *> *enumNumberArray = [self parsingOptionsEnum:invokeMethodType];
    for (NSNumber *enumNumber in enumNumberArray) {
        UCAppDelegateSendMessageType messageType = enumNumber.unsignedIntegerValue;
        NSString *methodName = getSendMessageMethodName(messageType);
        NSMutableArray *moduleNameMArray = self.invokeCacheDict[methodName];
        if (!moduleNameMArray) {continue;}
        
        [moduleNameMArray removeObject:methodName];
    }
}

- (NSArray<NSString *> *)getModuleNameWithInvokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType {
    NSString *methodName = getSendMessageMethodName(invokeMethodType);
    NSArray *moduleNameArray = self.invokeCacheDict[methodName];
    return moduleNameArray;
}

- (void)p_addInvokeModuleName:(NSString *)moduleName
             invokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType {
    NSArray<NSNumber *> *enumNumberArray = [self parsingOptionsEnum:invokeMethodType];
    for (NSNumber *enumNumber in enumNumberArray) {
        UCAppDelegateSendMessageType messageType = enumNumber.unsignedIntegerValue;
        NSString *methodName = getSendMessageMethodName(messageType);
        NSMutableArray *moduleNameMArray = self.invokeCacheDict[methodName];
        // 若无数组则先创建数组
        if (!moduleNameMArray) {
            moduleNameMArray = [NSMutableArray array];
        }
        
        //遍历下当前数组,看是否已经添加过
        BOOL isNeedContinue = NO;
        for (NSString *traverseModuleName in moduleNameMArray) {
            if ([traverseModuleName isEqualToString:moduleName]) {
                isNeedContinue = YES;
                break;
            }
        }
        if (isNeedContinue) {continue;}
        [moduleNameMArray addObject:moduleName];
        self.invokeCacheDict[methodName] = moduleNameMArray;
    }
}

- (NSArray<NSNumber *> *)parsingOptionsEnum:(UCAppDelegateSendMessageType)invokeMethodType {
    
    NSMutableArray *result = [NSMutableArray array];
    
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didFinishLaunchingWithOptions];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationWillResignActive];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationDidEnterBackground];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationWillEnterForeground];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationDidBecomeActive];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationWillTerminate];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:willChangeStatusBarFrame];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didRegisterUserNotificationSettings];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:handleOpenURL];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:openURL_sourceApplication_annotation];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:openURL_options];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:continueUserActivity_restorationHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didRegisterForRemoteNotificationsWithDeviceToken];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didFailToRegisterForRemoteNotificationsWithError];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:handleActionWithIdentifier_forRemoteNotification_completionHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didReceiveLocalNotification];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didReceiveRemoteNotification];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:didReceiveRemoteNotification_fetchCompletionHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:performActionForShortcutItem_completionHandler];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:supportedInterfaceOrientationsForWindow];
    [self p_addEnumWithArray:result invokeMethodType:invokeMethodType enumType:applicationDidReceiveMemoryWarning];
    
    return [result copy];
}

- (void)p_addEnumWithArray:(NSMutableArray *)array
          invokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType
                  enumType:(UCAppDelegateSendMessageType)enumType {
    
    BOOL isAddAllEnum = invokeMethodType & allMessageSend;
    if (isAddAllEnum || invokeMethodType & enumType) {
        [array addObject:@(enumType)];
    }
}

- (NSMutableDictionary<NSString *,NSArray<NSString *> *> *)invokeCacheDict {
    if (!_invokeCacheDict) {
        _invokeCacheDict = [NSMutableDictionary dictionary];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    return _invokeCacheDict;
#pragma clang diagnostic pop
}
@end
