//
//  UCAppDelegateReduceConstFile.m
//  Pods
//
//  Created by Link on 2019/2/12.
//

#import "UCAppDelegateReduceConstFile.h"

#pragma mark - add method name
NSString *const kUCAppDelegateReduceInvokeOriginDelegateMethod = @"uc_invokeOriginalMethod:arguments:";
NSString *const kUCAppDelegateReduceSendNewDelegateMethod = @"uc_sendModuleAppdelegateMethodWithMethodType:arguments:";

#pragma mark - error const
NSString *const kUCAppDelegateReduceErrorDomain = @"com.UCAppDelegateReduce.UCAppDelegateMethodExchangeManager";
NSString *const kUCAppDelegateReduceErrorInfoKey = @"kUCAppDelegateReduceErrorInfoKey";

NSUInteger const kUCOriginalDelegateUndefindErrorCode = 7901;
NSString *const kUCOriginalDelegateUndefindErrorInfo = @"原来的appdelegate名称错误";

NSUInteger const kUCOriginalDelegateUndefindMethodErrorCode = 7902;
NSString *const kUCOriginalDelegateUndefindMethodErrorInfo = @"原来的appdelegate没有实现这个方法";

NSUInteger const kUCNewDelegateUndefindErrorCode = 7903;
NSString *const kUNewDelegateUndefindErrorInfo = @"新delegate名称异常";

NSUInteger const kUCNewDelegateUndefindMethodErrorCode = 7904;
NSString *const kUCNewDelegateUndefindMethodErrorInfo = @"新delegate没实现这个方法";
