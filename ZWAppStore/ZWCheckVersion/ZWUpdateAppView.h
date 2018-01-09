//
//  ZWUpdateAppView.h
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWAppStoreModel.h"
@interface ZWUpdateAppView : UIView
/**
 *  提示升级视图
 */
+ (instancetype)zw_updateAppView:(ZWAppStoreModel *)appModel;
@end
