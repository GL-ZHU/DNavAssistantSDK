//
//  DNavStaticString.m
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NSString * DNavAssistantDataControlKey NS_EXTENSIBLE_STRING_ENUM;

/// write操作的参数
/// 设置位置
UIKIT_EXTERN DNavAssistantDataControlKey const DNFixPosition;
/// 依据时间设置位置
UIKIT_EXTERN DNavAssistantDataControlKey const DNFixFromTimePosition;
/// 获取经纬度、高程
UIKIT_EXTERN DNavAssistantDataControlKey const DNSearchPosition;

/// read操作的参数
/// 搜索星数
UIKIT_EXTERN DNavAssistantDataControlKey const DNSearchStar;
/// 查看定位状态
UIKIT_EXTERN DNavAssistantDataControlKey const DNSearchStatus;
/// GPS定位时间戳
UIKIT_EXTERN DNavAssistantDataControlKey const DNGpsTimeSmart;
/// GPS经纬度标准方差
UIKIT_EXTERN DNavAssistantDataControlKey const DNGpsStandardDeviation;
