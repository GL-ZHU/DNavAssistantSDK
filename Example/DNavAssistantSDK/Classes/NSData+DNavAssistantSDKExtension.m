//
//  NSData+Extension.m
//  DNavAssistantSDK_Example
//
//  Created by 朱国良 on 2017/9/20.
//  Copyright © 2017年 GL-ZHU. All rights reserved.
//

#import "NSData+DNavAssistantSDKExtension.h"

@implementation NSData (DNavAssistantSDKExtension)
+ (NSData *)newsHeader{
    u_char head1 = 0xAA;
    u_char head2 = 0x14;
    u_char head3 = 0x28;
    NSMutableData *data = [NSMutableData data];
    [data appendBytes:&head1 length:sizeof(head1)];
    [data appendBytes:&head2 length:sizeof(head2)];
    [data appendBytes:&head3 length:sizeof(head3)];
    return [data copy];
}

+ (NSData *)mobileAddress{
    u_char address = 0x05;
    return [NSData dataWithBytes:&address length:sizeof(address)];
}

+ (NSData *)stationAddress{
    u_char address = 0x03;
    return [NSData dataWithBytes:&address length:sizeof(address)];
}

+ (NSData *)read{
    u_char read = 0x03;
    return [NSData dataWithBytes:&read length:sizeof(read)];
}

+ (NSData *)write{
    u_char write = 0x10;
    return [NSData dataWithBytes:&write length:sizeof(write)];
}

/**
 位置数据地址
 */
+ (NSData *)positionAddress{
    u_char address1 = 0x00;
    u_char address2 = 0x01;
    return [self address1:address1 withAddress2:address2];
}

/**
 自动定位地址
 */
+ (NSData *)aotoLocationAddress{
    u_char address1 = 0x00;
    u_char address2 = 0x02;
    return [self address1:address1 withAddress2:address2];
}

/**
 星数地址
 */
+ (NSData *)startNum{
    u_char address1 = 0x00;
    u_char address2 = 0x04;
    return [self address1:address1 withAddress2:address2];
}

/**
 测算状态地址
 */
+ (NSData *)statusArrdess{
    u_char address1 = 0x00;
    u_char address2 = 0x05;
    return [self address1:address1 withAddress2:address2];
}

/**
 卫星属性寄存器地址
 */
+ (NSData *)satelliteAddress{
    u_char address1 = 0x00;
    u_char address2 = 0x08;
    return [self address1:address1 withAddress2:address2];
}
+ (NSData *)rktAddress{
    u_char address1 = 0x00;
    u_char address2 = 0x07;
    return [self address1:address1 withAddress2:address2];
}

+ (NSData *)address1:(u_char)address1 withAddress2:(u_char)address2{
    NSMutableData *data = [NSMutableData data];
    [data appendBytes:&address1 length:sizeof(address1)];
    [data appendBytes:&address2 length:sizeof(address2)];
    return [data copy];
}

/**
 获取数据长度
 */
+ (NSData *)length{
    u_char len = 0;
    return [NSData dataWithBytes:&len length:1];
}

/**
 获取crc
 */
+ (NSData *)crc:(NSData *)crcD{
    uint16_t crc = [crcD crc16];
    NSData *data = [NSData dataWithBytes:&crc length:sizeof(crc)];
    NSLog(@"CRC:%@",data);
    return data;
}

//获取crc16校验码
- (uint16_t)crc16 {
    uint8_t *byte = (uint8_t *)self.bytes;
    uint16_t length = (uint16_t)self.length;
    return gen_crc16(byte, length);
}

#define CRC_SEED   0xFFFF   /* 该位称为预置值，使用人工算法（长除法）时 需要将除数多项式先与该与职位 异或 ，才能得到最后的除数多项式*/
#define POLY16 0x1021  /* 该位为简式书写 实际为0x11021*/
uint16_t gen_crc16(uint8_t *buf,uint8_t length)
{
    uint16_t shift,data = 0,val;
    uint8_t i;
    
    shift = CRC_SEED;
    
    for(i=0;i<length;i++)
    {
        if((i % 8) == 0)
            data = (*buf++) << 8;
        val = shift ^ data;
        shift = shift << 1;
        data = data << 1;
        if(val & 0x8000)
            shift = shift ^ POLY16;
    }
    return shift;
}
@end
