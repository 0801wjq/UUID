//
//  UUIDTool.m
//  SlobberPad
//
//  Created by 吴家庆 on 16/3/3.
//  Copyright © 2016年 对口投资管理有限公司. All rights reserved.
//

#import "UUIDTool.h"

@implementation UUIDTool

#pragma mark - 获取一个随机的19位UUID

+ (NSString *)getAnInt64UUID{
    
   return [NSString stringWithFormat:@"%lld",[UUIDTool changeUUIDToInt64:[UUIDTool getUUIDString]]];
}

#pragma mark - 生成UUID

+ (NSString*) getUUIDString
{
    
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    return uuidString;
    
}

+ (NSString *) get32UUIDString{
    NSString *uuid = [UUIDTool getUUIDString];
    NSMutableString *uuid32 = [[NSMutableString alloc]init];
    
    NSArray *array = [uuid componentsSeparatedByString:@"-"];
    for (NSString *str in array) {
        [uuid32 appendString:str];
    }
    return uuid32;
}

#pragma mark - 32位UUID转成int64

+ (long long)changeUUIDToInt64:(NSString *)UUID{
    
    int64_t (^BitConverterToInt64)(uuid_t) = ^(uuid_t uu) {
        unsigned char n[8] = {};
        n[0] = uu[3];
        n[1] = uu[2];
        n[2] = uu[1];
        n[3] = uu[0];
        n[4] = uu[5];
        n[5] = uu[4];
        n[6] = uu[7];
        n[7] = uu[6];
        return *(int64_t *)n;
    };
    
    int parse_ret;
    uuid_t uuid3 = {};
    const char *color_char = [UUID cStringUsingEncoding:NSASCIIStringEncoding];
//    uuid_string_t
    char uuid3_str [37];
    strcpy(uuid3_str,color_char);
    
    parse_ret = uuid_parse(uuid3_str, uuid3);
    if (parse_ret != 0) {
        printf("uuid解析失败\n");
    }
//    printf("uuid string === %s \n", uuid3_str);
//    uuid_print(uuid3);
    long long uuid = BitConverterToInt64(uuid3);
//    NSLog(@"int64数字 === %lld", BitConverterToInt64(uuid3));
    return uuid;
}

+ (NSString *)changeUUIDToInt64String:(NSString *)UUID{
    return [NSString stringWithFormat:@"%lld",[UUIDTool changeUUIDToInt64:UUID]];
}

void(^uuid_print)(uuid_t) = ^(uuid_t uu){
    printf("uuid === ");
    for(int i = 0 ; i < 16 ; i++){
        printf("%x",uu[i]);
    }
    printf("\n");
};

@end
