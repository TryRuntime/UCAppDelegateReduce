//
//  UCAppDelegateConfigModel.h
//  Pods
//
//  Created by Link on 2019/2/11.
//

#import <Foundation/Foundation.h>
#import "UCAppDelegateReduceConstFile.h"

NS_ASSUME_NONNULL_BEGIN

@interface UCAppDelegateConfigModel : NSObject

@property (copy, nonatomic, readonly) NSString *moduleName;
@property (assign, nonatomic, readonly) UCAppDelegateSendMessageType sendMessageType;

- (instancetype)initWithModuleName:(NSString *)moduleName
                   sendMessageType:(UCAppDelegateSendMessageType)sendMessageType;
@end

NS_ASSUME_NONNULL_END
