//
//  ZWRequestReview.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/8.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import "ZWRequestReview.h"
@interface ZWRequestReview ()
@property (nonatomic, copy) NSString *requestUrl;
@end
@implementation ZWRequestReview
- (instancetype)init {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                              owner:nil
                                            options:nil] firstObject];
    }
    return self;
}
/**
 *  提示升级视图
 */
+ (instancetype)zw_requestReview:(NSString *)requestUrl {
    ZWRequestReview *view = [[ZWRequestReview alloc] init];
    view.frame = [UIScreen mainScreen].bounds;
    view.requestUrl =requestUrl;
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    return view;
}
#pragma mark - config
#pragma mark - lifeCycle
#pragma mark - delegate
#pragma mark - actionFunction
- (IBAction)actionReview:(id)sender {
    NSURL *url = [NSURL URLWithString:self.requestUrl];
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        return;
    }
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
        [[UIApplication sharedApplication] openURL:url];
    }
    [self hiddenAnimation];
}
- (IBAction)actionCancle:(id)sender {
    [self hiddenAnimation];
}
#pragma mark - function
- (void)hiddenAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - layzing
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
