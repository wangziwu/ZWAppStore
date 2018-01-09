//
//  ZWUpdateAppView.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2018/1/3.
//  Copyright © 2018年 wang_ziwu. All rights reserved.
//

#import "ZWUpdateAppView.h"

@interface  ZWUpdateAppView ()
@property (weak, nonatomic) IBOutlet UILabel *notesLab;
@property (weak, nonatomic) IBOutlet UIScrollView *mScroll;
@property (nonatomic, strong) ZWAppStoreModel *appModel;
@end
@implementation ZWUpdateAppView
- (instancetype)init {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                              owner:nil
                                            options:nil] firstObject];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self contentSizeToFit];
}
#pragma mark - exportAPI

+ (instancetype)zw_updateAppView:(ZWAppStoreModel *)appModel; {
    ZWUpdateAppView *view = [[ZWUpdateAppView alloc] init];
    view.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    view.appModel = appModel;
    return view;
}
#pragma mark - config
#pragma mark - lifeCycle
#pragma mark - delegate
#pragma mark - actionFunction
- (IBAction)actionCancle:(id)sender {
    [self hiddenAnimation];
}
- (IBAction)actionUpdate:(id)sender {
    NSURL *url = [NSURL URLWithString:self.appModel.trackViewUrl];
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        [self hiddenAnimation];
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
#pragma mark - function
- (void)hiddenAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)contentSizeToFit{
    BOOL wasShowingVerticalScrollIndicator = self.mScroll.showsVerticalScrollIndicator;
    BOOL wasShowingHorizontalScrollIndicator = self.mScroll.showsHorizontalScrollIndicator;
    
    self.mScroll.showsVerticalScrollIndicator = NO;
    self.mScroll.showsHorizontalScrollIndicator = NO;
    
    CGRect rect = CGRectZero;
    for ( UIView *view in self.mScroll.subviews ) {
        rect = CGRectUnion(rect, view.frame);
    }
    rect.size.height += 10;
    
    self.mScroll.showsVerticalScrollIndicator = wasShowingVerticalScrollIndicator;
    self.mScroll.showsHorizontalScrollIndicator = wasShowingHorizontalScrollIndicator;
    self.mScroll.contentSize = rect.size;
}
#pragma mark - layzing
- (void)setAppModel:(ZWAppStoreModel *)appModel {
    _appModel = appModel;
    self.notesLab.text = appModel.releaseNotes;
    [self.notesLab sizeToFit];
    [self.mScroll layoutIfNeeded];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
