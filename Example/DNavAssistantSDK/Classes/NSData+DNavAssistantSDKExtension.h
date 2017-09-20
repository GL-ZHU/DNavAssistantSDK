//
//  NSData+Extension.h
//  DNavAssistantSDK_Example
//
//  Created by 朱国良 on 2017/9/20.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DNavAssistantSDKExtension)
/// 消息头
+ (NSData *)newsHeader;
/// 移动寄存器地址
+ (NSData *)mobileAddress;
/// 基站寄存器地址
+ (NSData *)stationAddress;
/// 读命令
+ (NSData *)read;
/// 写命令
+ (NSData *)write;
/// 设置位置
+ (NSData *)positionAddress;
/// 自动定位
+ (NSData *)aotoLocationAddress;
/// 搜星数
+ (NSData *)startNum;
/// 定位状态
+ (NSData *)statusArrdess;
/// 卫星数
+ (NSData *)satelliteAddress;
/// rkt差分频道寄存器地址
+ (NSData *)rktAddress;
/// 消息的数据长度
+ (NSData *)length;
/// CRC校验位
+ (NSData *)crc:(NSData *)crcD;


@end
