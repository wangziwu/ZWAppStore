//
//  ZWCheckVersion.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWAppStoreModel.h"
#import "ZWUpdateAppView.h"
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
/**
 *  获取前期应用在App Store的信息详情
 *  1、自动读取当前APP的App Store信息
 *  2、itunesId:自定义传入APP应用的iTunesId
 */
+ (void)zw_getNewAppStoreInfo:(BlockAppStoreInfo)appInfo;
+ (void)zw_getNewAppStoreInfoItunesId:(NSString *)itunesId appInfo:(BlockAppStoreInfo)appInfo;
@end
