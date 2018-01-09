//
//  ViewController.m
//  ZWAppStoreDemo
//
//  Created by 王子武 on 2017/12/28.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ViewController.h"
#import "ZWAppStore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSHomeDirectory());
}
- (IBAction)actionCheckVersion:(id)sender {
    //eg:微信
    [ZWCheckVersion zw_checkVersionItunesId:@"414478124"];
    //推荐方法
//    [ZWCheckVersion zw_autoCheckVersion];
}
- (IBAction)actionShowReview:(id)sender {
    
    [ZWActionReview instanceReview].probabilityDaliy = 1.f;
    [ZWActionReview instanceReview].maxNumDaliy = 100;
    [ZWActionReview instanceReview].maxTotalNum = 500;
    [[ZWActionReview instanceReview] zw_actionRequestReview:@"414478124"];
    //推荐方法
//    [[ZWActionReview instanceReview] zw_actionRequestReview];
}
- (IBAction)actionSkipWriteReview:(id)sender {
    [[ZWActionReview instanceReview] zw_skipToAppStoreReview:@"414478124"];
    //推荐方法
//    [[ZWActionReview instanceReview] zw_skipToAppStoreReview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
