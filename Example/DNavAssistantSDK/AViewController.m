//
//  AViewController.m
//  DNavAssistantSDK
//
//  Created by GL-ZHU on 09/19/2017.
//  Copyright (c) 2017 GL-ZHU. All rights reserved.
//

#import "AViewController.h"
#import "DNavAssistantSDK.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    DNavAssistantSDK *sdk = [DNavAssistantSDK defaultSDK];
    [sdk contentBluetooth:^(NSString *buletoothName) {
        NSLog(@"连接成功的蓝牙名称%@",buletoothName);
        
        [sdk switchChannelTo:DNavAssistantSDKChannelRTK];
        [sdk RKTChannelResponse:^(NSData *response) {
            
            NSLog(@"%@",response);
        }];
        
    } withContentStatus:^(NSUInteger status) {
        
        NSLog(@"当前连接状态:%ld",status);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
