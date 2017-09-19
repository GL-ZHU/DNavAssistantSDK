//
//  DNavAssistantSDK.m
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import "DNavAssistantSDK.h"

@implementation DNavAssistantSDK

+ (instancetype)shareSDK
{
    static DNavAssistantSDK *_SDK;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _SDK = [[DNavAssistantSDK alloc] init];
    });
    return _SDK;
}
@end
