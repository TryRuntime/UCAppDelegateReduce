//
//  UCAppDelegateConfigModel.m
//  Pods
//
//  Created by Link on 2019/2/11.
//

#import "UCAppDelegateConfigModel.h"

@interface UCAppDelegateConfigModel ()
@property (copy, nonatomic, readwrite) NSString *moduleName;
@property (assign, nonatomic, readwrite) UCAppDelegateSendMessageType sendMessageType;
@end

@implementation UCAppDelegateConfigModel

- (instancetype)initWithModuleName:(NSString *)moduleName
                   sendMessageType:(UCAppDelegateSendMessageType)sendMessageType {
    if (self = [super init]) {
        self.moduleName = moduleName;
        self.sendMessageType = sendMessageType;
    }
    return self;
}
@end
