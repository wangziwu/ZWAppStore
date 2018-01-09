//
//  ZWActionReview.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/8.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZWActionReview : NSObject
/**
 *  请求评论视图
 *  视图出现逻辑：限制每日最多出现次数、限制每次出现概率、限制最大出现次数避免用户反感。
 */
+ (instancetype)instanceReview;
/**
 *  请求评论视图、每次出现的概率(0~1)
 *  默认:0.1
 */
@property (nonatomic, assign) CGFloat probabilityDaliy;
/**
 *  请求评论视图、每日最多出现的次数
 *  默认:每天最多出现一次
 */
@property (nonatomic, assign) NSInteger maxNumDaliy;
/**
 *  请求评论视图、一共允许出现的次数
 *  默认:一共允许出现最多5次、避免引起用户反感
 */
@property (nonatomic, assign) NSInteger maxTotalNum;
/**
 *  请求应用评论弹窗
 *  自动根据BundleId请求App Store获取评论地址
 */
- (void)zw_actionRequestReview;
/**
 *  请求应用评论弹窗
 *  自定义iTunesId
 */
- (void)zw_actionRequestReview:(NSString *)itunesId;
/**
 *  前往当前应用的App Store评论界面
 */
- (void)zw_skipToAppStoreReview;
/**
 *  前往指定itunesId应用的App Store评论界面
 */
- (void)zw_skipToAppStoreReview:(NSString *)itunesId;
@end
