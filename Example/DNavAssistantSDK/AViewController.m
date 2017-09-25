//
//  AViewController.m
//  DNavAssistantSDK
//
//  Created by GL-ZHU on 09/19/2017.
//  Copyright (c) 2017 GL-ZHU. All rights reserved.
//

#import "AViewController.h"
#import <DNavAssistantSDK_iOS/DNavAssistantSDK_iOS.h>

@interface AViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *content;


@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.name.text = @"连接中...";
    DNavAssistantSDK *sdk = [DNavAssistantSDK defaultSDK];
    [sdk contentBluetooth:^(NSString *buletoothName) {
        NSLog(@"连接成功的蓝牙名称%@",buletoothName);

        [sdk switchChannel:DNavAssistantSDKChannelRTK];
        
        self.name.text = buletoothName;
    } failed:^(NSString *reason) {
        NSLog(@"%@",reason);
    } withContentStatus:^(DNavAssistantSDKContentStatus status) {
        NSLog(@"当前连接状态:%ld",status);
    }];
    
}

- (IBAction)send:(id)sender {
    DNavAssistantSDK *sdk = [DNavAssistantSDK defaultSDK];
    
    [sdk RTKChannelStartResponse:^(NSData *response) {
        NSLog(@"%@",response);
    }];
    
    [sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
        dataControl.read(DNSearchPosition);
    } response:^(NSDictionary *result) {
        NSLog(@"%@",result);
    }];
    
    [sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
        dataControl.write(DNFixPosition).longitude(120.20).latitude(20.102).height(10.21);
    } response:^(NSDictionary *result) {
        NSLog(@"%@",result);
    }];
    
//    [sdk switchChannel:DNavAssistantSDKChannelDataControl];
//    [sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
//        dataControl.read(DNSearchStar);
//    } response:^(NSDictionary *result) {
//        NSLog(@"%@",result);
//    }];
//
//    [sdk groundStationChannelDataControl:^(DNavAssistantDataControl *dataControl) {
//        dataControl.write(DNFixPosition).height(20).latitude(120.09).longitude(12);
//    } response:^(NSDictionary *result) {
//        NSLog(@"%@",result);
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
