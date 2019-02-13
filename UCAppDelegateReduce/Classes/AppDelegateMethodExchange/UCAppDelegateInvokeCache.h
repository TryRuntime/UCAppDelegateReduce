//
//  UCAppDelegateInvokeCache.h
//  Pods-UCAppDelegateReduce_Example
//
//  Created by Link on 2019/2/13.
//

#import <Foundation/Foundation.h>
#import "UCAppDelegateReduceConstFile.h"
NS_ASSUME_NONNULL_BEGIN

@class UCAppDelegateConfigModel;
@interface UCAppDelegateInvokeCache : NSObject

/**
 解析config

 @param invokeConfigArray config数组
 */
- (void)parsingWithInvokeConfigArray:(NSArray<UCAppDelegateConfigModel *> *)invokeConfigArray;

/**
 移除当前method对应的model,一旦移除后,除非手动添加,否则不会调用后面新动态添加的方法

 @param moduleName 模块负责处理appdelegate转发的类名
 @param invokeMethodType 需要移除的方法枚举,支持位移枚举
 */
- (void)removeInvokeModuleName:(NSString *)moduleName
              invokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType;

/**
 解析当前位移枚举

 @param invokeMethodType 位移枚举
 @return NSNumber包裹的枚举数组
 */
- (NSArray<NSNumber *> *)parsingOptionsEnum:(UCAppDelegateSendMessageType)invokeMethodType;


/**
 返回当前枚举对应的module类名

 @param invokeMethodType 调用枚举,注意不支持位移枚举!
 @return 返回当前枚举对应的module类名
 */
- (NSArray<NSString *> *)getModuleNameWithInvokeMethodType:(UCAppDelegateSendMessageType)invokeMethodType;
@end

NS_ASSUME_NONNULL_END
