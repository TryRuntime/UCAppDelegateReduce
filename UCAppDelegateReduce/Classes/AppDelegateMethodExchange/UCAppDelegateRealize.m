//
//  UCAppDelegateRealize.m
//  Pods
//
//  Created by Link on 2019/2/12.
//

#import "UCAppDelegateRealize.h"
#import <UCRuntimeKit/UCMediator.h>
#import <UCRuntimeKit/UCMediatorAppdelegateArguments.h>
#import "UCAppDelegateReduceConstFile.h"
#import "UCAppDelegateMethodExchangeManager.h"
#import "UCAppDelegateInvokeCache.h"

@implementation UCAppDelegateRealize

/// didFinishLaunchingWithOptions
- (BOOL)uc_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:launchOptions];
    
    //先调用旧的方法
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didFinishLaunchingWithOptions arguments:arguments];
    return [result boolValue];
}

/// applicationWillResignActive
- (void)uc_applicationWillResignActive:(UIApplication *)application {
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationWillResignActive arguments:arguments];
}

/// applicationDidEnterBackground
- (void)uc_applicationDidEnterBackground:(UIApplication *)application {
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationDidEnterBackground arguments:arguments];
}

/// applicationWillEnterForeground
- (void)uc_applicationWillEnterForeground:(UIApplication *)application {
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationWillEnterForeground arguments:arguments];
}

/// applicationDidBecomeActive
- (void)uc_applicationDidBecomeActive:(UIApplication *)application {
    
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationDidBecomeActive arguments:arguments];
}

/// applicationWillTerminate
- (void)uc_applicationWillTerminate:(UIApplication *)application {
    
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationWillTerminate arguments:arguments];
}

/// willChangeStatusBarFrame
- (void)uc_application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
    
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:willChangeStatusBarFrame arguments:arguments];
}

/// didRegisterUserNotificationSettings
- (void)uc_application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didRegisterUserNotificationSettings arguments:arguments];
}

/// handleOpenURL
- (BOOL)uc_application:(UIApplication *)application
         handleOpenURL:(NSURL *)url {
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:url];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    [self uc_sendModuleAppdelegateMethodWithMethodType:handleOpenURL arguments:arguments];
    return [result boolValue];
}

/// openURL_sourceApplication_annotation
- (BOOL)uc_application:(UIApplication *)application
               openURL:(NSURL *)url
     sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation {
    
    UCMediatorAppdelegateArguments *arguments = [[[[[UCMediatorAppdelegateArguments new] addElement:application] addElement:url] addElement:sourceApplication] addElement:annotation];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    [self uc_sendModuleAppdelegateMethodWithMethodType:openURL_sourceApplication_annotation arguments:arguments];
    return [result boolValue];
}

/// openURL_options
- (BOOL)uc_application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    UCMediatorAppdelegateArguments *arguments = [[[[UCMediatorAppdelegateArguments new]
                                                   addElement:app]
                                                  addElement:url]
                                                 addElement:options];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    [self uc_sendModuleAppdelegateMethodWithMethodType:openURL_options arguments:arguments];
    return [result boolValue];
}

/// continueUserActivity_restorationHandler
- (BOOL)uc_application:(UIApplication *)application
  continueUserActivity:(NSUserActivity *)userActivity
    restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[UCMediatorAppdelegateArguments new]
                                                   addElement:application]
                                                  addElement:userActivity]
                                                 addElement:restorationHandler];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    [self uc_sendModuleAppdelegateMethodWithMethodType:continueUserActivity_restorationHandler arguments:arguments];
    return [result boolValue];
}

/// didRegisterForRemoteNotificationsWithDeviceToken
- (void)uc_application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:deviceToken];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didRegisterForRemoteNotificationsWithDeviceToken arguments:arguments];
}

/// didFailToRegisterForRemoteNotificationsWithError
- (void)uc_application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:error];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didFailToRegisterForRemoteNotificationsWithError arguments:arguments];
}

/// handleActionWithIdentifier_forRemoteNotification_completionHandler
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
- (void)uc_application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
 forRemoteNotification:(NSDictionary *)userInfo
     completionHandler:(nonnull void (^)())completionHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[[UCMediatorAppdelegateArguments new] addElement:application] addElement:identifier] addElement:userInfo] addElement:completionHandler];
    [self uc_sendModuleAppdelegateMethodWithMethodType:handleActionWithIdentifier_forRemoteNotification_completionHandler arguments:arguments];
}

/// handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler
- (void)uc_application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
  forLocalNotification:(UILocalNotification *)notification
     completionHandler:(void (^)())completionHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:identifier] addElement:notification] addElement:completionHandler];
    [self uc_sendModuleAppdelegateMethodWithMethodType:handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler arguments:arguments];
}

/// handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler
- (void)uc_application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
  forLocalNotification:(UILocalNotification *)notification
      withResponseInfo:(NSDictionary *)responseInfo
     completionHandler:(void (^)())completionHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:identifier] addElement:notification] addElement:responseInfo] addElement:completionHandler];
    [self uc_sendModuleAppdelegateMethodWithMethodType:handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler arguments:arguments];
}
#pragma clang diagnostic pop

/// didReceiveLocalNotification
- (void)uc_application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    UCMediatorAppdelegateArguments *arguments = [[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:notification];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didReceiveLocalNotification arguments:arguments];
}

/// didReceiveRemoteNotification
- (void)uc_application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    UCMediatorAppdelegateArguments *arguments = [[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:userInfo];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didReceiveRemoteNotification arguments:arguments];
}

/// didReceiveRemoteNotification_fetchCompletionHandler
- (void)uc_application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:userInfo] addElement:completionHandler];
    [self uc_sendModuleAppdelegateMethodWithMethodType:didReceiveRemoteNotification_fetchCompletionHandler arguments:arguments];
}

/// performActionForShortcutItem_completionHandler
- (void)uc_application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
     completionHandler:(void (^)(BOOL))completionHandler {
    UCMediatorAppdelegateArguments *arguments = [[[[[UCMediatorAppdelegateArguments alloc] init] addElement:application] addElement:shortcutItem] addElement:completionHandler];
    [self uc_sendModuleAppdelegateMethodWithMethodType:performActionForShortcutItem_completionHandler arguments:arguments];
}

/// supportedInterfaceOrientationsForWindow
- (UIInterfaceOrientationMask)uc_application:(UIApplication *)application
     supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new]
                                                  addElement:application]
                                                 addElement:window];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
        [self uc_sendModuleAppdelegateMethodWithMethodType:supportedInterfaceOrientationsForWindow arguments:arguments];
    return [result unsignedIntegerValue];
}

/// applicationDidReceiveMemoryWarning
- (void)uc_applicationDidReceiveMemoryWarning:(UIApplication *)application {
    UCMediatorAppdelegateArguments *arguments = [[UCMediatorAppdelegateArguments new] addElement:application];
    [self uc_sendModuleAppdelegateMethodWithMethodType:applicationDidReceiveMemoryWarning arguments:arguments];
}

#pragma mark - 原来的appdelegate动态添加的方法实现
/// 这里不能通过self直接调用,因为当方法交换时,self已经改变了
- (nullable id)uc_invokeOriginalMethod:(const char *)cString
                             arguments:(UCMediatorAppdelegateArguments *)arguments{
    NSString *str = [NSString stringWithUTF8String:cString];
    NSRange spaceRange = [str rangeOfString:@" "];
    NSRange methodRange = NSMakeRange(spaceRange.location + 1, str.length - spaceRange.location - 2);
    NSString *methodName = [str substringWithRange:methodRange];
    return [[UCMediator sharedInstance] performAppDelegateTarget:@"UCAppDelegateRealize" actionName:methodName params:arguments];
}

/// 仅支持单一枚举
- (void)uc_sendModuleAppdelegateMethodWithMethodType:(UCAppDelegateSendMessageType)methodType
                                           arguments:(UCMediatorAppdelegateArguments *)arguments {
    UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
    NSArray *moduleNameArray = [manager.invokeCache getModuleNameWithInvokeMethodType:methodType];
    NSString *methodName = getSendMessageMethodName(methodType);
    for (NSString *moduleName in moduleNameArray) {
        [[UCMediator sharedInstance] performAppDelegateTarget:moduleName actionName:methodName params:arguments];
    }
}
@end
