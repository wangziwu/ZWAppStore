//
//  ZWAppStoreModel.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWAppStoreModel : NSObject
/*--------------------------------------常用基本信息----------------------------------------*/
/**
 *  App iTunes Preview
 *  用于跳转去更新
 */
@property (nonatomic, copy) NSString *trackViewUrl;
/**
 *  当前App Store最新版本
 */
@property (nonatomic, copy) NSString *version;
/**
 *  APP应用在iTunes中唯一ID
 */
@property (nonatomic, assign) NSInteger trackId;
/**
 *  APP应用名称
 */
@property (nonatomic, copy) NSString *trackName;
/**
 *  APP应用bundleId
 */
@property (nonatomic, copy) NSString *bundleId;
/**
 *  最新版本更新记录
 */
@property (nonatomic, copy) NSString *releaseNotes;
/**
 *  最新版本更新日期
 */
@property (nonatomic, copy) NSString *releaseDate;
/**
 *  应用描述
 */
@property (nonatomic, copy) NSString *zw_description;
/*--------------------------------------其他信息----------------------------------------*/
/**
 *  ipad屏幕截屏
 */
@property (nonatomic, copy) NSArray *ipadScreenshotUrls;
/**
 *  appletv屏幕截屏
 */
@property (nonatomic, copy) NSArray *appletvScreenshotUrls;
/**
 *  512尺寸图
 */
@property (nonatomic, copy) NSString *artworkUrl512;
/**
 *  100尺寸图
 */
@property (nonatomic, copy) NSString *artworkUrl100;
/**
 *  60尺寸图
 */
@property (nonatomic, copy) NSString *artworkUrl60;
/**
 *  App开发者(公司)拥有App iTunes Preview
 */
@property (nonatomic, copy) NSString *artistViewUrl;
/**
 *  应用类别
 */
@property (nonatomic, copy) NSString *kind;
/**
 *  应用特色
 */
@property (nonatomic, copy) NSArray *features;
/**
 *  应用支持手机型号
 *  eg:[@"iPhone8Plus-iPhone8Plus",@"iPhoneX-iPhoneX"];
 */
@property (nonatomic, copy) NSArray *supportedDevices;
/**
 *  iPhone应用截屏
 */
@property (nonatomic, copy) NSArray *screenshotUrls;
/**
 *  advisories
 */
@property (nonatomic, copy) NSArray *advisories;
/**
 *  是否属于游戏
 */
@property (nonatomic, assign) BOOL isGameCenterEnabled;
/**
 *  averageUserRatingForCurrentVersion
 */
@property (nonatomic, copy) NSString *averageUserRatingForCurrentVersion;
/**
 *  出版商
 */
@property (nonatomic, copy) NSString *trackCensoredName;
/**
 *  语言编码支持
 *  eg:[@"ZH"]
 */
@property (nonatomic, copy) NSArray *languageCodesISO2A;
/**
 *  APP应用大小
 */
@property (nonatomic, copy) NSString *fileSizeBytes;
/**
 *  APP所属公司URL
 */
@property (nonatomic, copy) NSString *sellerUrl;
/**
 *  APP内容限制级别
 *  eg:"4+"
 */
@property (nonatomic, copy) NSString *contentAdvisoryRating;
/**
 *  userRatingCountForCurrentVersion
 */
@property (nonatomic, copy) NSString *userRatingCountForCurrentVersion;
/**
 *  APP应用限制级别
 *  eg:"4+"
 */
@property (nonatomic, copy) NSString *trackContentRating;
/**
 *  APP收费类型
 *  eg:"免费"/"收费"
 */
@property (nonatomic, copy) NSString *formattedPrice;
/**
 *  开发商英文名称
 */
@property (nonatomic, copy) NSString *sellerName;
/**
 *  APP类型、体裁id
 */
@property (nonatomic, copy) NSArray *genreIds;
/**
 *  当前版本发布日期
 */
@property (nonatomic, copy) NSString *currentVersionReleaseDate;
/**
 *  货币类型
 *  eg:@"CNY":人民币
 */
@property (nonatomic, copy) NSString *currency;
/**
 *  应用类型英文名
 *  eg:@"software"
 */
@property (nonatomic, copy) NSString *wrapperType;
/**
 *  开发商iTunes id
 *  每个开发商(开发者账号)拥有一个artistId
 *  每个开发商(开发者账号)拥有多个APP应用
 *  每个APP应用拥有一个trackId
 */
@property (nonatomic, assign) NSInteger artistId;
/**
 *  开发商中文名称
 */
@property (nonatomic, copy) NSString *artistName;
/**
 *  APP类型、体裁中文名称数组
 */
@property (nonatomic, copy) NSArray *genres;
/**
 *  APP价格
 */
@property (nonatomic, assign) NSInteger price;
/**
 *  isVppDeviceBasedLicensingEnabled
 */
@property (nonatomic, assign) BOOL isVppDeviceBasedLicensingEnabled;
/**
 *  APP主演的类型、体裁英文名称
 */
@property (nonatomic, copy) NSString *primaryGenreName;
/**
 *  APP最低支持版本
 */
@property (nonatomic, copy) NSString *minimumOsVersion;
/**
 *  APP主演的类型、体裁ID
 */
@property (nonatomic, copy) NSString *primaryGenreId;
@end
