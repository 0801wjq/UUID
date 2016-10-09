//
//  UUIDTool.h
//  SlobberPad
//
//  Created by 吴家庆 on 16/3/3.
//  Copyright © 2016年 对口投资管理有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UUIDTool : NSObject

/**
 *  生成UUID方法
 *
 *  @return 返回UUID
 */
+ (NSString *) getUUIDString;

/**
 *  生成字符串中间没有-的uuid
 *
 *  @return uuid
 */
+ (NSString *) get32UUIDString;

/**
 *  把UUID转换成int64
 *
 *  @param UUID 32位的UUID
 *
 *  @return 19位int64的uuid
 */
+ (long long)changeUUIDToInt64:(NSString *)UUID;

/**
 *  把UUID转换成int64String
 */
+ (NSString *)changeUUIDToInt64String:(NSString *)UUID;

/**
 *  获取一个随机的19位UUID
 *
 *  @return 返回19位UUID的字符串
 */
+ (NSString *)getAnInt64UUID;


@end
