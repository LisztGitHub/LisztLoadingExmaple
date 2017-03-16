//
//  ViewController.m
//  LisztLoadingExmaple
//
//  Created by 软擎信息科技 on 2016/12/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LisztLoading.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAction:(id)sender {
    [self.view addLoadingIndicator];
}

- (IBAction)buttonAction:(id)sender {
    [self.view hideLoadingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
