//
//  DNavAssistantRTKBestPostData.h
//  DNavAssistantSDK_iOS
//
//  Created by 朱国良 on 2017/10/25.
//  Copyright © 2017年 朱国良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNavAssistantRTKBestPostData : NSObject
/// 经度
@property(nonatomic,assign)double longitude;
/// 纬度
@property(nonatomic,assign)double latitude;
/// 高程
@property(nonatomic,assign)double height;
/// 搜星数
@property(nonatomic,assign)int starCount;
/// 解算星数
@property(nonatomic,assign)int resolvingStartCount;
/// 定位状态
@property(nonatomic,copy)NSString *locationStatus;
/// 解算状态
@property(nonatomic,copy)NSString *resolvingStatus;
/// 时间 年-月-日-时-分-秒
@property(nonatomic,copy)NSString *locationTime;
@end
