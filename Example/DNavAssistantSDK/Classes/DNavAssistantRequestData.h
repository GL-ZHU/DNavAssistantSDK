//
//  DNavAssistantRequestData.h
//  DNavAssistantSDK_Example
//
//  Created by 朱国良 on 2017/9/20.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNavAssistantRequestData : NSObject

/**
 切换差分系统

 @return 切换语句
 */
- (NSData *)switchDifferentialChannel;
@end
