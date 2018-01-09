//
//  ZWCheckVersion.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWAppStoreModel.h"
typedef void(^BlockAppStoreInfo)(ZWAppStoreModel *appModel);
@interface ZWCheckVersion : NSObject
/**
 *  自动检测app版本更新
 *  自动读取BundleId去App Store获取信息
 *  appInfo:根据App Store信息自定义处理更新版本视图。
 */
+ (void)zw_autoCheckVersion;
+ (void)zw_autoCheckVersionHandleView:(BlockAppStoreInfo)appInfo;
/**
 *  根据应用itunesId版本更新
 *  appInfo:根据App Store信息自定义处理更新版本视图。
 */
+ (void)zw_checkVersionItunesId:(NSString *)itunesId;
+ (void)zw_checkVersionItunesId:(NSString *)itunesId handleView:(BlockAppStoreInfo)appInfo;
/**
 *  判断是否需要更新
 */
+ (BOOL)zw_shouldUpdateApp:(ZWAppStoreModel *)model;
@end
