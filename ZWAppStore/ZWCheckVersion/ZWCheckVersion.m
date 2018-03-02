//
//  ZWCheckVersion.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import "ZWCheckVersion.h"
#import "ZWUpdateAppView.h"
#define APP_InfoDict                [[NSBundle mainBundle] infoDictionary]
//应用版本
#define APP_Version                 [APP_InfoDict objectForKey:@"CFBundleShortVersionString"]
//应用BundleId
#define APP_BundleId                [APP_InfoDict objectForKey:@"CFBundleIdentifier"]
//区域编码
#define APP_CountryCode             [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]

#define AppStore_ResultCount        @"resultCount"
#define AppStore_Results            @"results"
@interface ZWCheckVersion ()
@property (nonatomic, strong) ZWAppStoreModel *appModel;
@end
@implementation ZWCheckVersion
/**
 *  自动检测app版本更新
 *  自动读取BundleId去App Store获取信息
 */
+ (void)zw_autoCheckVersion {
    [self zw_autoCheckVersionHandleView:nil];
}
+ (void)zw_autoCheckVersionHandleView:(BlockAppStoreInfo)appInfo {
    NSString *base = @"https://itunes.apple.com/lookup?bundleId=%@&country=%@";
    NSString *url = [NSString stringWithFormat:base,APP_BundleId,APP_CountryCode];
    __weak typeof(self) weakSelf = self;
    [self zw_getAppInfoByUrl:url appStore:^(ZWAppStoreModel *appModel) {
        if ([weakSelf zw_shouldUpdateApp:appModel]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (appInfo){
                    appInfo(appModel);
                }else{
                    [ZWUpdateAppView zw_updateAppView:appModel];
                }
            });
        }
    }];
}
/**
 *  根据应用itunesId版本更新
 */
+ (void)zw_checkVersionItunesId:(NSString *)itunesId {
    [self zw_checkVersionItunesId:itunesId handleView:nil];
}
+ (void)zw_checkVersionItunesId:(NSString *)itunesId handleView:(BlockAppStoreInfo)appInfo {
    NSString *base = @"https://itunes.apple.com/lookup?id=%@&country=%@";
    NSString *url = [NSString stringWithFormat:base,itunesId,APP_CountryCode];
    __weak typeof(self) weakSelf = self;
    [self zw_getAppInfoByUrl:url appStore:^(ZWAppStoreModel *appModel) {
        if ([weakSelf zw_shouldUpdateApp:appModel]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (appInfo){
                    appInfo(appModel);
                }else{
                    [ZWUpdateAppView zw_updateAppView:appModel];
                }
            });
        }
    }];
}
/**
 *  获取App Store应用信息
 */
+ (void)zw_getAppInfoByUrl:(NSString *)url appStore:(BlockAppStoreInfo)appInfo {
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if ([dict[AppStore_ResultCount] integerValue] == 0) {
            NSLog(@"please check you App!");
            return;
        }
        ZWAppStoreModel *model = [[ZWAppStoreModel alloc] init];
        NSDictionary *results = [dict[AppStore_Results] firstObject];
        [model setValuesForKeysWithDictionary:results];
        appInfo(model);
    }];
    [dataTask resume];
}
/**
 *  判断是否需要更新
 */
+ (BOOL)zw_shouldUpdateApp:(ZWAppStoreModel *)model {
    NSMutableArray *currentVersions = [NSMutableArray array];
    NSMutableArray *appStoreVersions = [NSMutableArray array];
    [currentVersions addObjectsFromArray:[APP_Version componentsSeparatedByString:@"."]];
    [appStoreVersions addObjectsFromArray:[model.version componentsSeparatedByString:@"."]];
    NSInteger difference = currentVersions.count - appStoreVersions.count;
    if (difference < 0) {
        for (NSInteger i = 0; i < labs(difference); i++) {
            [currentVersions addObject:@"0"];
        }
    }else if (difference > 0){
        for (NSInteger i = 0; i < labs(difference); i++) {
            [appStoreVersions addObject:@"0"];
        }
    }
    for (NSInteger i = 0; i < appStoreVersions.count; i++) {
        NSInteger currNum = [currentVersions[i] integerValue];
        NSInteger appStoreNum = [appStoreVersions[i] integerValue];
        if (appStoreNum > currNum) {
            return YES;
        }else if (appStoreNum < currNum) {
            return NO;
        }
    }
    return NO;
}
@end
