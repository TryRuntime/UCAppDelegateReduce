//
//  AppDelegateExchange.m
//  UCAppDelegateReduce_Example
//
//  Created by Link on 2019/2/12.
//  Copyright © 2019 Link913. All rights reserved.
//

#import "AppDelegateExchange.h"
#import <UCAppDelegateReduce/UCAppDelegateReduce.h>
@implementation AppDelegateExchange

+ (void)load {

    UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
    UCAppDelegateConfigModel *model1 = [[UCAppDelegateConfigModel alloc] initWithModuleName:@"UCObjcModule1AppDelegate" sendMessageType:didFinishLaunchingWithOptions];
    UCAppDelegateConfigModel *model2 = [[UCAppDelegateConfigModel alloc] initWithModuleName:@"UCObjcModule2AppDelegate" sendMessageType:handleOpenURL | didFinishLaunchingWithOptions];
    
    [manager startExchangeMethodWithOriginalAppDelegateName:@"UCAppDelegate" newModuleAppDelegateConfigArray:@[model1, model2]];
}
@end
