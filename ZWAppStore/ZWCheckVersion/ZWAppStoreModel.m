//
//  ZWAppStoreModel.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import "ZWAppStoreModel.h"

@implementation ZWAppStoreModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.zw_description = value;
    }
}
@end
