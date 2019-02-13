# UCAppDelegateReduce

[![Version](https://img.shields.io/cocoapods/v/UCAppDelegateReduce.svg?style=flat)](https://cocoapods.org/pods/UCAppDelegateReduce)
[![License](https://img.shields.io/cocoapods/l/UCAppDelegateReduce.svg?style=flat)](https://cocoapods.org/pods/UCAppDelegateReduce)
[![Platform](https://img.shields.io/cocoapods/p/UCAppDelegateReduce.svg?style=flat)](https://cocoapods.org/pods/UCAppDelegateReduce)

| Branch | Build States  |
| --- | ---  |
| Master  |[![CI Status](https://travis-ci.org/TryRuntime/UCAppDelegateReduce.svg?branch=master)](https://travis-ci.org/TryRuntime/UCRuntimeKit)|
| Develop |[![CI Status](https://travis-ci.org/TryRuntime/UCAppDelegateReduce.svg?branch=develop)](https://travis-ci.org/TryRuntime/UCRuntimeKit) |

## 安装

pod 'UCAppDelegateReduce'

## 简介

这个小工具是为了优雅的实现组件化,对appdelegate中的方法进行减负诞生的,以前的一个项目,使用了大量的宏加字符串runtime派发,很难维护加上断点也很难走,所以自己写了一个比较优雅的.支持Objc和Swift.

例如我们的分享业务,和支付业务需要在appdelegate中注册相应的key,通过这个小工具,就可以优雅的把这些事情放到对应的各自Module里.

## 原理

先对原有的appdelegate中的23个方法进行替换,这里会判断旧delegate是否实现了这些方法,新的delegate是否实现了方法,满足条件才会交换.同时交换后会先调用原来的appdelegate中的逻辑.

支持位移枚举配置想转发给各个模块的方法数量,目前只提供了23个方法,如果有需要在增加新的的话可以在枚举里加完提pr或者给我提issure.

后面会发个PPT详细讲下,想看运行效果可以运行下`Example`和`SwiftExample`.

## 使用步骤

### Objc

- 1.新建一个Objc类,例如我这里取名叫`AppDelegateExchange`
- 2.在load类方法里进行下面的配置,就可以了

		+ (void)load {

        UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
        // sendMessageType 是位移枚举,可以选择自己想给子模块派发的方法
        UCAppDelegateConfigModel *model1 = [[UCAppDelegateConfigModel alloc] initWithModuleName:@"UCObjcModule1AppDelegate" sendMessageType:didFinishLaunchingWithOptions];
        UCAppDelegateConfigModel *model2 = [[UCAppDelegateConfigModel alloc] initWithModuleName:@"UCObjcModule2AppDelegate" sendMessageType:handleOpenURL | didFinishLaunchingWithOptions];
        
        [manager startExchangeMethodWithOriginalAppDelegateName:@"UCAppDelegate" newModuleAppDelegateConfigArray:@[model1, model2]];
    	}
    	
### Swift

- 1.新建一个Objc类,例如我这里取名叫`AppDelegateExchange`
- 2.要转发的Module中的appdelegate方法前要加`@objc`,负责不支持动态调用
- 3.在load类方法里进行下面的配置,就可以了

		+ (void)load {
        
        UCAppDelegateMethodExchangeManager *manager = [UCAppDelegateMethodExchangeManager share];
        
        // 这里Objc调用Swift需要加上类似命名空间的前缀,否则找不到这个Swift class
        NSString *swiftModule1Name = [UCMediatorParameterParser getObjcClassName:@"SwiftModule1AppDelegate"];
        // 支持位移枚举
        UCAppDelegateConfigModel *model1 = [[UCAppDelegateConfigModel alloc] initWithModuleName:swiftModule1Name sendMessageType:didFinishLaunchingWithOptions];
        
        NSString *swiftModule2Name = [UCMediatorParameterParser getObjcClassName:@"SwiftModule2AppDelegate"];
        UCAppDelegateConfigModel *model2 = [[UCAppDelegateConfigModel alloc] initWithModuleName:swiftModule2Name sendMessageType:handleOpenURL | didFinishLaunchingWithOptions];
        
        NSString *originalDelegateName = [UCMediatorParameterParser getObjcClassName:@"AppDelegate"];
        [manager startExchangeMethodWithOriginalAppDelegateName:originalDelegateName newModuleAppDelegateConfigArray:@[model1, model2]];
    	}


## Author

Link913, fanyang_32012@outlook.com

## License

UCAppDelegateReduce is available under the MIT license. See the LICENSE file for more info.
