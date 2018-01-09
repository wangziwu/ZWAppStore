//
//  ZWActionReview.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/8.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import "ZWActionReview.h"
#import "ZWRequestReview.h"
#import "ZWCheckVersion.h"
//区域编码
#define APP_CountryCode             [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]
#define APP_ActionReview            @"https://itunes.apple.com/app/id%@?action=write-review&country=%@"
#define APP_DaliyMaxNum             @"ZWActionReview_MaxNumDaliy"
#define APP_TotalNum                @"ZWActionReview_TotalNum"
static id _instances;
@implementation ZWActionReview
+ (instancetype)instanceReview {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instances = [[ZWActionReview alloc] init];
    });
    return _instances;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.probabilityDaliy   = 0.1f;
        self.maxNumDaliy        = 1;
        self.maxTotalNum        = 5;
    }
    return self;
}
/**
 *  请求应用评论弹窗
 *  自动根据BundleId请求App Store获取评论地址
 */
- (void)zw_actionRequestReview {
    if (![self zw_judgeAllowShowReview]) {
        return;
    }
    [ZWCheckVersion zw_autoCheckVersionHandleView:^(ZWAppStoreModel *appModel) {
        NSString *requestUrl = [NSString stringWithFormat:@"%@&action=write-review",appModel.trackViewUrl];
        [ZWRequestReview zw_requestReview:requestUrl];
    }];
}
/**
 *  请求应用评论弹窗
 *  自定义iTunesId跳转
 */
- (void)zw_actionRequestReview:(NSString *)itunesId {
    if (![self zw_judgeAllowShowReview]) {
        return;
    }
    NSString *requestUrl = [NSString stringWithFormat:APP_ActionReview,itunesId,APP_CountryCode];
    [ZWRequestReview zw_requestReview:requestUrl];
}
/**
 *  前往当前应用的App Store评论界面
 */
- (void)zw_skipToAppStoreReview {
    [ZWCheckVersion zw_autoCheckVersionHandleView:^(ZWAppStoreModel *appModel) {
        NSString *requestUrl = [NSString stringWithFormat:@"%@&action=write-review",appModel.trackViewUrl];
        [self zw_openURL:requestUrl];
    }];
}
/**
 *  前往指定itunesId应用的App Store评论界面
 */
- (void)zw_skipToAppStoreReview:(NSString *)itunesId {
    NSString *requestUrl = [NSString stringWithFormat:APP_ActionReview,itunesId,APP_CountryCode];
    [self zw_openURL:requestUrl];
}
- (BOOL)zw_judgeAllowShowReview {
    //1、视图出现概率
    CGFloat random = arc4random() % 10 / 10.f;
    if (random > self.probabilityDaliy) {
        return NO;
    }
    //2、视图出现总数
    NSUserDefaults *userDfaults = [NSUserDefaults standardUserDefaults];
    NSInteger totalNum = [[userDfaults objectForKey:APP_TotalNum] integerValue];
    if (totalNum >= self.maxTotalNum) {
        return NO;
    }
    //3、每日出现最大次数
    NSArray *daliyArray = [userDfaults objectForKey:APP_DaliyMaxNum];
    NSInteger daliyNum = [[daliyArray lastObject] integerValue];
    NSDate *daliyDate = [daliyArray firstObject];
    if (!daliyDate) {
        daliyDate = [NSDate date];
    }
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *udDateStr=[dateformatter stringFromDate:daliyDate];
    NSString *currDateStr = [dateformatter stringFromDate:[NSDate date]];
    
    if (![udDateStr isEqualToString:currDateStr]) {
        totalNum++;
        NSString *newTotalNum = [NSString stringWithFormat:@"%ld",(long)totalNum];
        [userDfaults setObject:@[[NSDate date],@"1"] forKey:APP_DaliyMaxNum];
        [userDfaults setObject:newTotalNum forKey:APP_TotalNum];
        [userDfaults synchronize];
        return YES;
    }else if(daliyNum < self.maxNumDaliy){
        daliyNum++;
        totalNum++;
        NSString *newDaliyNum = [NSString stringWithFormat:@"%ld",(long)daliyNum];
        NSString *newTotalNum = [NSString stringWithFormat:@"%ld",(long)totalNum];
        [userDfaults setObject:@[[NSDate date],newDaliyNum] forKey:APP_DaliyMaxNum];
        [userDfaults setObject:newTotalNum forKey:APP_TotalNum];
        [userDfaults synchronize];
        return YES;
    }
    return NO;
}
- (void)zw_openURL:(NSString *)requestUrl {
    NSURL *url = [NSURL URLWithString:requestUrl];
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        return;
    }
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end
