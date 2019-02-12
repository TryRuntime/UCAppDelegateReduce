//
//  UCAppDelegateRealize.m
//  Pods
//
//  Created by Link on 2019/2/12.
//

#import "UCAppDelegateRealize.h"
#import <UCRuntimeKit/UCRuntimeKit.h>

@implementation UCAppDelegateRealize

/// didFinishLaunchingWithOptions
- (BOOL)uc_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:launchOptions];

    NSLog(@"调用了新的");
    //先调用旧的方法
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];

    return [result boolValue];
}

/// applicationWillResignActive
- (void)uc_applicationWillResignActive:(UIApplication *)application {
    
}

/// applicationDidEnterBackground
- (void)uc_applicationDidEnterBackground:(UIApplication *)application {
    
}

/// applicationWillEnterForeground
- (void)uc_applicationWillEnterForeground:(UIApplication *)application {
    
}

/// applicationDidBecomeActive
- (void)uc_applicationDidBecomeActive:(UIApplication *)application {
    
}

/// applicationWillTerminate
- (void)uc_applicationWillTerminate:(UIApplication *)application {
    
}

/// willChangeStatusBarFrame
- (void)uc_application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
    
}

/// didRegisterUserNotificationSettings
- (void)uc_application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
}

/// handleOpenURL
- (BOOL)uc_application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:url];

    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    
    return [result boolValue];
}

/// openURL_sourceApplication_annotation
- (BOOL)uc_application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new] addElement:application] addElement:url];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    
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
    
    return [result boolValue];
}

/// didRegisterForRemoteNotificationsWithDeviceToken
- (void)uc_application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

/// didFailToRegisterForRemoteNotificationsWithError
- (void)uc_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}

/// handleActionWithIdentifier_forRemoteNotification_completionHandler
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
- (void)uc_application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(nonnull void (^)())completionHandler {
    
}
/// handleActionWithIdentifier_forRemoteNotification_forLocalNotification_completionHandler
- (void)uc_application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    
}

/// handleActionWithIdentifier_forRemoteNotification_forLocalNotification_withResponseInfo_completionHandler
- (void)uc_application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler {
    
}
#pragma clang diagnostic pop

/// didReceiveLocalNotification
- (void)uc_application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
}

/// didReceiveRemoteNotification
- (void)uc_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

/// didReceiveRemoteNotification_fetchCompletionHandler
- (void)uc_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
}

/// performActionForShortcutItem_completionHandler
- (void)uc_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
}

/// supportedInterfaceOrientationsForWindow
- (UIInterfaceOrientationMask)uc_application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    UCMediatorAppdelegateArguments *arguments = [[[UCMediatorAppdelegateArguments new]
                                                   addElement:application]
                                                  addElement:window];
    
    id result = [self uc_invokeOriginalMethod:__func__ arguments:arguments];
    
    return [result unsignedIntegerValue];
}

/// applicationDidReceiveMemoryWarning
- (void)uc_applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
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
@end
