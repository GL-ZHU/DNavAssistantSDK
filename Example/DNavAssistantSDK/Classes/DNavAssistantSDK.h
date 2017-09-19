//
//  DNavAssistantSDK.h
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNavBlockProperty.m"

typedef NS_ENUM(NSUInteger, DNavAssistantSDKContentStatus) {
    DNavAssistantSDKContentBegin,       //开始
    DNavAssistantSDKContentSuccess,     //成功
    DNavAssistantSDKContentFailed,      // 失败
    DNavAssistantSDKContentDisconnect   // 断开
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


@end
