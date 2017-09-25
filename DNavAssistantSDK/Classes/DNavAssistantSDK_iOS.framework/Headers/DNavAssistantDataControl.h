//
//  DNavAssistantDataControl.h
//  DNavAssistantSDK_Example
//
//  Created by 朱国良 on 2017/9/21.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNavStaticString.h"

@interface Read : NSObject

@end

@interface Write : NSObject
{
@public
    double _longitude;
    double _latitude;
    double _height;
    float _time;
}
/**如果是设置经度、纬度、高程或者是时间使用以下几个函数，如果是读取操作，则不需要使用*/
- (Write *(^)(double longitude))longitude;
- (Write *(^)(double latitude))latitude;
- (Write *(^)(double height))height;
- (Write *(^)(float time))time;

@end

@interface DNavAssistantDataControl : NSObject

- (Read *(^)(DNavAssistantDataControlKey))read;
- (Write *(^)(DNavAssistantDataControlKey))write;

@end
