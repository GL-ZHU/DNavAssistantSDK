//
//  DNavAssistantSDK.h
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNavBlockProperty.h"

typedef NS_ENUM(NSUInteger, DNavAssistantSDKContentStatus) {
    DNavAssistantSDKContentBegin = 0,       //开始
    DNavAssistantSDKContentSuccess,     //成功
    DNavAssistantSDKContentFailed,      // 失败
    DNavAssistantSDKContentDisconnect   // 断开
};

typedef NS_ENUM(NSUInteger, DNavAssistantSDKChannel) {
    DNavAssistantSDKChannelRTK = 0,      //RTK转发
    DNavAssistantSDKChannelDataControl   //数据控制（设置、查询）
};

@interface DNavAssistantSDK : NSObject

/**
 快速初始化SDK（单利）

 @return 实例对象
 */
+ (instancetype)defaultSDK;

/**
 连接蓝牙

 @param successBlock 成功
 @param statusBlock 状态变化
 */
- (void)contentBluetooth:(ContentSuccess)successBlock withContentStatus:(ContentStatus)statusBlock;

/**
 切换频道

 @param channel 频道枚举
 */
- (void)switchChannelTo:(DNavAssistantSDKChannel)channel;

/**
 注意：只有DNavAssistantSDKChannel = DNavAssistantSDKChannelRTK时，
 调用此接口才能够接收差分数据

 @param responseBlock 当接收到差分数据时候回触发这个回调
 */
- (void)RKTChannelResponse:(DifferentialResponse)responseBlock;


@end
