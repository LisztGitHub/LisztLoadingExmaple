//
//  UIView+LisztLoading.h
//  LisztLoadingExmaple
//
//  Created by 软擎信息科技 on 2016/12/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LisztLoading)
/*
 添加一个加载指示器
 */
- (void)addLoadingIndicator;

/*
 添加一个自定义Frame的指示器
 @param frame 指示器背景视图大小
 */
- (void)addLoadingIndicatorFrame:(CGRect)frame;

/*
 清空加载指示器
 */
- (void)hideLoadingView;
@end



@interface LisztLoadingView : UIView
@end
