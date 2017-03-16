//
//  UIView+LisztLoading.m
//  LisztLoadingExmaple
//
//  Created by 软擎信息科技 on 2016/12/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "UIView+LisztLoading.h"
#import "DGActivityIndicatorView.h"

@implementation UIView (LisztLoading)
- (void)addLoadingIndicator{
    [self addLoadingIndicatorFrame:self.bounds];
}
- (void)addLoadingIndicatorFrame:(CGRect)frame{
    LisztLoadingView *loadingView = [[LisztLoadingView alloc]initWithFrame:frame];
    [self addSubview:loadingView];
}

- (void)hideLoadingView{
    for(UIView *view in self.subviews){
        if([view isKindOfClass:[LisztLoadingView class]]){
            [view removeFromSuperview];
        }
    }
}

@end

@implementation LisztLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallPulse tintColor:[UIColor redColor]];
        activityIndicatorView.frame = CGRectMake((CGRectGetWidth(self.bounds) - 40)/2,(CGRectGetHeight(self.bounds) - 40)/2,40,40);
        [activityIndicatorView startAnimating];
        [self addSubview:activityIndicatorView];
    }
    return self;
}

@end

