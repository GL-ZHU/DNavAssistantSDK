//
//  DNavAssistantSDK.m
//  DNavAssistantSDK
//
//  Created by 朱国良 on 2017/9/19.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import "DNavAssistantSDK.h"
#import "DNavStaticString.m"
#import <BabyBluetooth/BabyBluetooth.h>

@interface DNavAssistantSDK()

@property(nonatomic,strong)BabyBluetooth *baby;
@property(nonatomic,copy)ContentSuccess selfContentSuccess;
@property(nonatomic,copy)ContentStatus selfContentStatus;
@property(nonatomic,strong)CBPeripheral *peripheral;

@end

@implementation DNavAssistantSDK

+ (instancetype)defaultSDK{
    
    static DNavAssistantSDK *_SDK;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _SDK = [[DNavAssistantSDK alloc] init];
        _SDK.baby = [[BabyBluetooth alloc] init];
    });
    return _SDK;
}

- (void)contentBluetooth:(ContentSuccess)successBlock withContentStatus:(ContentStatus)statusBlock{
    // 1.连接成功的回调
    self.selfContentSuccess = successBlock;
    self.selfContentStatus = statusBlock;
    // 2.设置默认代理
    [self scan];
    // 3.设置委托后直接可以使用，无需等待CBCentralManagerStatePoweredOn状态，扫描设备
    self.baby.scanForPeripherals().begin();
}

- (void)scan{
    //设置扫描到设备的委托
    __weak typeof(self) weakSelf = self;
    if (self.selfContentStatus) {
        self.selfContentStatus(DNavAssistantSDKContentBegin);
    }
    [self.baby setBlockOnDiscoverToPeripherals:^(CBCentralManager *central, CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI) {
        if ([peripheral.name hasPrefix:BluetoothName]) {
            // 保存peripheral
            weakSelf.peripheral = peripheral;
            // 主动连接服务
            [weakSelf content];
        }
    }];
    // 连接外设成功
    [self.baby setBlockOnConnectedAtChannel:CHANLE_NAME block:^(CBCentralManager *central, CBPeripheral *peripheral) {
        // 自动重连
        [weakSelf.baby AutoReconnect:weakSelf.peripheral];
        // 停止扫描
        [weakSelf.baby cancelScan];
        NSLog(@"设备：%@--连接成功",peripheral.name);
    }];
    [self.baby setBlockOnFailToConnectAtChannel:CHANLE_NAME block:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
        if (weakSelf.selfContentStatus) {
            weakSelf.selfContentStatus(DNavAssistantSDKContentFailed);
        }
    }];
    // 设备断开连接的委托
    [self.baby setBlockOnDisconnectAtChannel:CHANLE_NAME block:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
        if (weakSelf.selfContentStatus) {
            weakSelf.selfContentStatus(DNavAssistantSDKContentDisconnect);
        }
        NSLog(@"设备：%@--断开连接",peripheral.name);
    }];
}

- (void)content{
    __weak typeof(self) weakSelf = self;
    //设置发现设service的Characteristics的委托
    [self.baby setBlockOnDiscoverCharacteristicsAtChannel:CHANLE_NAME block:^(CBPeripheral *peripheral, CBService *service, NSError *error) {
        if ([service.UUID.UUIDString isEqualToString:PERIPHERAL_SERVICE]) {
            for (CBCharacteristic *characteristic in service.characteristics) {
                if ([characteristic.UUID.UUIDString isEqualToString:PERIPHERAL_CHARACTERISTICS]) {
                    // 连接服务和特征成功
                    if (weakSelf.selfContentSuccess) {
                        weakSelf.selfContentSuccess(weakSelf.peripheral.name);
                    }
                    if (weakSelf.selfContentStatus) {
                        weakSelf.selfContentStatus(DNavAssistantSDKContentSuccess);
                    }
                }
            }
        }
    }];
    self.baby.having(self.peripheral).and.channel(CHANLE_NAME).then.connectToPeripherals().discoverServices().discoverCharacteristics().readValueForCharacteristic().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin();
}
     

@end
