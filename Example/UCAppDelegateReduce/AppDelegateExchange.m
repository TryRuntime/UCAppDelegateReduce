//
//  AppDelegateExchange.m
//  UCAppDelegateReduce_Example
//
//  Created by Link on 2019/2/12.
//  Copyright © 2019 Link913. All rights reserved.
//

#import "AppDelegateExchange.h"
#import "UCAppDelegateMethodExchangeManager.h"

@implementation AppDelegateExchange

+ (void)load {

    UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
    [manager p_addMethodOriginalAppdelegateName:@"UCAppDelegate"
                                     methodName:@"uc_invokeOriginalMethod:arguments:"
                                          error:nil];
    [manager p_exchangeAllMethodWithOriginalAppdelegateName:@"UCAppDelegate" error:nil];
}
@end
