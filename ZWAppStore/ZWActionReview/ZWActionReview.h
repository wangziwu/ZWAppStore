//
//  ZWActionReview.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/8.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZWRequestReview.h"
@interface ZWActionReview : NSObject
/**
 *  请求评论视图
 *  视图出现逻辑：限制每日最多出现次数、限制每次出现概率、限制最大出现次数避免用户反感。
 */
+ (instancetype)instanceReview;
/**
 *  请求应用评论弹窗
 *  自动根据BundleId请求App sStore获取评论地址
 *  itunesId: 指定iTunesId弹出应用评论弹框
 */
- (void)zw_actionRequestReview;
- (void)zw_actionRequestReview:(NSString *)itunesId;
/**
 *  前往当前应用的App Store评论界面
 *  itunesId: 指定iTunesId前往应用评论界面
 */
- (void)zw_skipToAppStoreReview;
- (void)zw_skipToAppStoreReview:(NSString *)itunesId;
/**
 *  请求评论视图、每次请求出现的概率(0~1)
 *  默认:0.5
 *  配置通过配置概率改变打开应用就弹出的几率、避免用户反感。
 */
@property (nonatomic, assign) CGFloat probabilityDaliy;
/**
 *  请求评论视图、每日最多出现的次数
 *  默认:每天最多出现5次
 */
@property (nonatomic, assign) NSInteger maxNumDaliy;
/**
 *  请求评论视图、一共允许出现的次数
 *  默认:一共允许出现最多20次、避免引起用户反感
 */
@property (nonatomic, assign) NSInteger maxTotalNum;

@end
