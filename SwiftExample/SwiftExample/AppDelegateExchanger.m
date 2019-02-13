//
//  AppDelegateExchanger.m
//  SwiftExample
//
//  Created by Link on 2019/2/13.
//  Copyright © 2019 Link. All rights reserved.
//

#import "AppDelegateExchanger.h"
#import <UCAppDelegateReduce/UCAppDelegateReduce.h>
#import "UCRuntimeKit-Swift.h"

@implementation AppDelegateExchanger
+ (void)load {
    
    UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
    
    NSString *swiftModule1Name = [UCMediatorParameterParser getObjcClassName:@"SwiftModule1AppDelegate"];
    UCAppDelegateConfigModel *model1 = [[UCAppDelegateConfigModel alloc] initWithModuleName:swiftModule1Name sendMessageType:didFinishLaunchingWithOptions];
    
    NSString *swiftModule2Name = [UCMediatorParameterParser getObjcClassName:@"SwiftModule2AppDelegate"];
    UCAppDelegateConfigModel *model2 = [[UCAppDelegateConfigModel alloc] initWithModuleName:swiftModule2Name sendMessageType:handleOpenURL | didFinishLaunchingWithOptions];
    
    NSString *originalDelegateName = [UCMediatorParameterParser getObjcClassName:@"AppDelegate"];
    [manager startExchangeMethodWithOriginalAppDelegateName:originalDelegateName newModuleAppDelegateConfigArray:@[model1, model2]];
}

//public class func getObjcClassName(_ swiftClassNameStr: String) -> String {
//    guard let prefix = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {return ""}
//    let className = prefix + "." + swiftClassNameStr
//    return className
//}
@end
