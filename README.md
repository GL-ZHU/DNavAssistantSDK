# DNavAssistantSDK

[![CI Status](http://img.shields.io/travis/GL-ZHU/DNavAssistantSDK.svg?style=flat)](https://travis-ci.org/GL-ZHU/DNavAssistantSDK)
[![Version](https://img.shields.io/cocoapods/v/DNavAssistantSDK.svg?style=flat)](http://cocoapods.org/pods/DNavAssistantSDK)
[![License](https://img.shields.io/cocoapods/l/DNavAssistantSDK.svg?style=flat)](http://cocoapods.org/pods/DNavAssistantSDK)
[![Platform](https://img.shields.io/cocoapods/p/DNavAssistantSDK.svg?style=flat)](http://cocoapods.org/pods/DNavAssistantSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DNavAssistantSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DNavAssistantSDK'
```
## 用法
### DNavAssistantSDK

DNavAssistantSDK是SDK中最主要的类，用来管理蓝牙的连接、断开、自动重连（内部已经实现），获取数据等。所以在使用sdk的第一步，需要使用执行类方法defaultSDK初始化默认的SDK。
#### 初始化
```ruby
DNavAssistantSDK *sdk = [DNavAssistantSDK defaultSDK];
```
#### 连接蓝牙
```ruby
[sdk contentBluetooth:^(NSString *buletoothName) {
    NSLog(@"连接成功的蓝牙名称%@",buletoothName);
} failed:^(NSString *reason) {
    NSLog(@"错误原因:%@",reason);
} withContentStatus:^(DNavAssistantSDKContentStatus status) {
    NSLog(@"当前连接状态:%ld",status);
}];
```
#### 切换频道
##### 注意：如果需要获取RTK转发的数据，首先需要将切换为DNavAssistantSDKChannelRTK频道；在执行切换操作前，一定要确保蓝牙处于连接状态，否则调用此函数没有任何效果。
```ruby
// 切换到RTK数据接收频道
[sdk switchChannel:DNavAssistantSDKChannelRTK];
```
#### 接收RTK频道数据
```ruby
// 接收数据前，要确保已经将频道切换到DNavAssistantSDKChannelRTK
[sdk RTKChannelStartResponse:^(NSData *response) {
    NSLog(@"接收到RTK数据%@",response);
}];
```
#### 地面站数据控制
##### 查询经纬度、高程信息
```ruby
[sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
    dataControl.read(DNSearchPosition);
} response:^(NSDictionary *result) {
    NSLog(@"%@",result);
}];
```
##### 设置经纬度、高程等信息
```ruby
[sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
    dataControl.write(DNFixPosition).longitude(120.20).latitude(20.102).height(10.21);
} response:^(NSDictionary *result) {
    NSLog(@"%@",result);
}];
```
#### DNavAssistantDataControl
DNavAssistantDataControl是地面站数据控制的管理者，可以通过链式语法直接构造自己需要的数据链。
##### DNavAssistantDataControl的使用注意：
该类主要有读、写两个操作；目前所有的数据操作分为以下两种：
###### read
读、后面不需要传入任何的参数。
```ruby
DNSearchPosition
DNSearchStar
DNSearchStatus
DNGpsTimeSmart
DNGpsStandardDeviation
```
###### write
写、后面一定要传入参数，否则会导致蓝牙通讯出错
```ruby
DNFixPosition
DNFixFromTimePosition
```

## Author

GL-ZHU, caimter@163.com

## License

DNavAssistantSDK is available under the MIT license. See the LICENSE file for more info.
