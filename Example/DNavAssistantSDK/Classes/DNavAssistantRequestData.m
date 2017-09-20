//
//  DNavAssistantRequestData.m
//  DNavAssistantSDK_Example
//
//  Created by 朱国良 on 2017/9/20.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import "DNavAssistantRequestData.h"
#import "NSData+DNavAssistantSDKExtension.h"

@implementation DNavAssistantRequestData

- (NSData *)switchDifferentialChannel{
    NSMutableData *data = [[NSMutableData alloc] init];
    [data appendData:[NSData newsHeader]];
    [data appendData:[NSData stationAddress]];
    [data appendData:[NSData read]];
    [data appendData:[NSData rktAddress]];
    [data appendData:[NSData crc:data]];
    return [data copy];
}


@end
