//
//  DNavAssistantSDK.h
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNavAssistantDataControl.h"

typedef NS_ENUM(NSUInteger, DNavAssistantSDKContentStatus) {
    DNavAssistantSDKContentBegin = 0,   //开始
    DNavAssistantSDKContentSuccess,     //成功
    DNavAssistantSDKContentFailed,      // 失败
    DNavAssistantSDKContentDisconnect   // 断开
};
typedef NS_ENUM(NSUInteger, DNavAssistantSDKChannel) {
    DNavAssistantSDKChannelRTK,         //RTK频道
    DNavAssistantSDKChannelDataControl  //数据控制频道(数据的读取、设置)
};

/// 连接状态
typedef void(^ContentStatus)(DNavAssistantSDKContentStatus status);
/// 连接蓝牙成功
typedef void(^ContentSuccess)(NSString *buletoothName);
/// 连接蓝牙失败
typedef void(^ContentFailed)(NSString *reason);
/// 差分系统数据响应
typedef void(^DifferentialResponse)(NSData *response);
/// 地面站数据设置
typedef void(^GsDataControl)(DNavAssistantDataControl *dataControl);
/// 地面站数据处理结果
typedef void(^GsDataControlResult)(NSDictionary *result);


@interface DNavAssistantSDK : NSObject

/**
 快速初始化SDK（单利）

 @return 实例对象
 */
+ (instancetype)defaultSDK;

/**
 连接蓝牙(默认已经实现自动重连)

 @param successBlock 成功
 @param failedBlock 失败
 @param statusBlock 状态
 */
- (void)contentBluetooth:(ContentSuccess)successBlock
                  failed:(ContentFailed)failedBlock
       withContentStatus:(ContentStatus)statusBlock;
/**
 断开所有的连接
 */
- (void)cancelAllPeripheralsConnection;

/**
 切换频道

 @param channel 频道
 @param completionBlock 完成
 */
- (void)switchChannel:(DNavAssistantSDKChannel)channel;

/**
 调用此接口开始接收差分数据

 @param responseBlock 当接收到差分数据时候回触发这个回调
 */
- (void)RTKChannelStartResponse:(DifferentialResponse)responseBlock;

/**
 地面站数据控制（设置、读取）

 @param gsControlBlock 数据控制
 @param resultBlock 数据处理结果
 */
- (void)groundStationChannelDataControl:(GsDataControl)gsControlBlock
                               response:(GsDataControlResult)resultBlock;
@end
