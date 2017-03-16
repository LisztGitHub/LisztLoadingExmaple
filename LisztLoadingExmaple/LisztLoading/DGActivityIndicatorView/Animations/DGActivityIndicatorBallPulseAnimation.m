//
//  DGActivityIndicatorBallPulseAnimation.m
//  DGActivityIndicatorExample
//
//  Created by Nguyen Vinh on 7/19/15.
//  Copyright (c) 2015 Danil Gontovnik. All rights reserved.
//

#import "DGActivityIndicatorBallPulseAnimation.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

@interface DGActivityIndicatorBallPulseAnimation(){
    /*circle*/
    NSMutableArray *circles;
}

@end

@implementation DGActivityIndicatorBallPulseAnimation

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat circlePadding = 5.0f;
    CGFloat circleSize = (size.width - 2 * circlePadding) / 3;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - circleSize) / 2;
    CGFloat duration = 0.75;
    NSArray *timeBegins = @[@0.12f, @0.24f, @0.36f];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2f :0.68f :0.18f :1.08f];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.3f, 0.3f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
    animation.keyTimes = @[@0.0f, @0.3f, @1.0f];
    animation.timingFunctions = @[timingFunction, timingFunction];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    
    circles = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 3; i++) {
        CALayer *circle = [CALayer layer];
        
        circle.frame = CGRectMake(x + i * circleSize + i * circlePadding, y, circleSize, circleSize);
        circle.backgroundColor = tintColor.CGColor;
        circle.cornerRadius = circle.bounds.size.width / 2;
        animation.beginTime = [timeBegins[i] floatValue];
        [circle addAnimation:animation forKey:@"animation"];
        [circles addObject:circle];
        [layer addSublayer:circle];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(action) userInfo:nil repeats:YES];
}

- (void)action{
    NSArray *array = @[RGBA(70, 179, 158, 1),RGBA(193, 57, 43,1),RGBA(243,156, 17, 1)];
    CGColorRef randColor = [array[arc4random_uniform(3)] CGColor];
    for(CALayer *circle in circles){
        circle.backgroundColor = randColor;
    }
}

@end
