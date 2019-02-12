//
//  UCAppDelegateReduceConstFile.h
//  Pods
//
//  Created by Link on 2019/2/12.
//

#ifndef UCAppDelegateReduceConstFile_h
#define UCAppDelegateReduceConstFile_h

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, UCAppDelegateSendMessageType) {
    //只是转发下面的method,并不是全部UIApplicationDelegate协议的方法
    allMessageSend                                    = 1 << 0,
    didFinishLaunchingWithOptions                     = 1 << 1,
    applicationWillResignActive                       = 1 << 2,
    applicationDidEnterBackground                     = 1 << 3,
    applicationWillEnterForeground                    = 1 << 4,
    applicationDidBecomeActive                        = 1 << 5,
    applicationWillTerminate                          = 1 << 6,
    willChangeStatusBarFrame                          = 1 << 7,
    didRegisterUserNotificationSettings               = 1 << 8,
    handleOpenURL                                     = 1 << 9,
    openURL_sourceApplication_annotation              = 1 << 10,
    openURL_options                                   = 1 << 11,
    continueUserActivity_restorationHandler           = 1 << 12,
    didRegisterForRemoteNotificationsWithDeviceToken  = 1 << 13,
    didFailToRegisterForRemoteNotificationsWithError  = 1 << 14,
    handleActionWithIdentifier_forRemoteNotification_completionHandler = 1 << 15,
    handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler = 1<< 16,
    handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler = 1 << 17,
    didReceiveLocalNotification                       = 1 << 18,
    didReceiveRemoteNotification                      = 1 << 19,
    didReceiveRemoteNotification_fetchCompletionHandler = 1 << 20,
    performActionForShortcutItem_completionHandler    = 1 << 21,
    supportedInterfaceOrientationsForWindow           = 1 << 22,
    applicationDidReceiveMemoryWarning                = 1 << 23,
    //如果还需要新增方法,可以在下面添加
};

static inline NSString* getSendMessageMethodName(UCAppDelegateSendMessageType sendMessageType) {
    
    switch (sendMessageType) {
        case allMessageSend:                return @"allMessageSend";
        case didFinishLaunchingWithOptions: return @"application:didFinishLaunchingWithOptions:";
        case applicationWillResignActive:   return @"applicationWillResignActive:";
        case applicationDidEnterBackground: return @"applicationDidEnterBackground:";
        case applicationWillEnterForeground:return @"applicationWillEnterForeground:";
        case applicationDidBecomeActive:    return @"applicationDidBecomeActive:";
        case applicationWillTerminate:      return @"applicationWillTerminate:";
        case willChangeStatusBarFrame:      return @"application:willChangeStatusBarFrame:";
        case didRegisterUserNotificationSettings: return @"application:didRegisterUserNotificationSettings:";
        case handleOpenURL:                 return @"application:handleOpenURL:";
        case openURL_sourceApplication_annotation: return @"application:openURL:sourceApplication:annotation:";
        case openURL_options:               return @"application:openURL:options:";
        case continueUserActivity_restorationHandler: return @"application:continueUserActivity:restorationHandler:";
        case didRegisterForRemoteNotificationsWithDeviceToken: return @"application:didRegisterForRemoteNotificationsWithDeviceToken:";
        case didFailToRegisterForRemoteNotificationsWithError: return @"application:didFailToRegisterForRemoteNotificationsWithError:";
        case handleActionWithIdentifier_forRemoteNotification_completionHandler: return @"application:handleActionWithIdentifier:forRemoteNotification:completionHandler:";
        case handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler: return @"application:handleActionWithIdentifier:forLocalNotification:completionHandler:";
        case handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler: return @"application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:";
        case didReceiveLocalNotification:   return @"application:didReceiveLocalNotification:";
        case didReceiveRemoteNotification:  return @"application:didReceiveRemoteNotification:";
        case didReceiveRemoteNotification_fetchCompletionHandler: return @"application:didReceiveRemoteNotification:fetchCompletionHandler:";
        case performActionForShortcutItem_completionHandler: return @"application:performActionForShortcutItem:completionHandler:";
        case supportedInterfaceOrientationsForWindow: return @"application:supportedInterfaceOrientationsForWindow:";
        case applicationDidReceiveMemoryWarning:  return @"applicationDidReceiveMemoryWarning:";
    }
}

#pragma mark - add method name
FOUNDATION_EXPORT NSString *const kUCAppDelegateReduceInvokeOriginDelegateMethod;

#pragma mark - error const
FOUNDATION_EXPORT NSString *const kUCAppDelegateReduceErrorDomain;
FOUNDATION_EXPORT NSString *const kUCAppDelegateReduceErrorInfoKey;

//原来的appdelegate名称错误,找不到delegate
FOUNDATION_EXPORT NSUInteger const kUCOriginalDelegateUndefindErrorCode;
FOUNDATION_EXPORT NSString *const kUCOriginalDelegateUndefindErrorInfo;

// 原来的appdelegate没有实现这个方法
FOUNDATION_EXPORT NSUInteger const kUCOriginalDelegateUndefindMethodErrorCode;
FOUNDATION_EXPORT NSString *const kUCOriginalDelegateUndefindMethodErrorInfo;

// 新delegate名称异常
FOUNDATION_EXPORT NSUInteger const kUCNewDelegateUndefindErrorCode;
FOUNDATION_EXPORT NSString *const kUNewDelegateUndefindErrorInfo;

// 新delegate没实现这个方法
FOUNDATION_EXPORT NSUInteger const kUCNewDelegateUndefindMethodErrorCode;
FOUNDATION_EXPORT NSString *const kUCNewDelegateUndefindMethodErrorInfo;



#endif /* UCAppDelegateReduceConstFile_h */
