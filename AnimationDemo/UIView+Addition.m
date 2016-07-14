//
//  UIView+Addition.m
//  Communication
//
//  Created by andy on 14-8-20.
//  Copyright (c) 2014年 wangfan. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)
- (void)setSize:(CGSize)size;
{
    CGPoint origin = [self frame].origin;
    
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

- (CGSize)size;
{
    return [self frame].size;
}

- (CGFloat)left;
{
    return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x;
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)top;
{
    return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y;
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)right;
{
    return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = [self frame];
    frame.origin.x = right - frame.size.width;
    
    [self setFrame:frame];
}

- (CGFloat)bottom;
{
    return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom;
{
    CGRect frame = [self frame];
    frame.origin.y = bottom - frame.size.height;
    
    [self setFrame:frame];
}

- (CGFloat)centerX;
{
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX;
{
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY;
{
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY;
{
    [self setCenter:CGPointMake(self.center.x, centerY)];
}

- (CGFloat)centerx;
{
    return self.width/2;
}

- (void)setCenterx:(CGFloat)centerx;
{
    self.centerX  =self.superview.width/2;
}

- (CGFloat)centery;
{
    return self.height/2;
}

- (void)setCentery:(CGFloat)centery;
{
    self.centerY  = self.superview.height/2;
}


- (CGFloat)width;
{
    return CGRectGetWidth([self frame]);
}

- (void)setWidth:(CGFloat)width;
{
    CGRect frame = [self frame];
    frame.size.width = width;
    
    [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)height;
{
    return CGRectGetHeight([self frame]);
}

- (void)setHeight:(CGFloat)height;
{
    CGRect frame = [self frame];
    frame.size.height = height;
	
    [self setFrame:CGRectStandardize(frame)];
}
- (CGPoint)origin;
{
    CGRect frame = [self frame];
    return CGPointMake(frame.origin.x, frame.origin.y);
}

- (void)setOrigin:(CGPoint)point;
{
    CGRect frame = [self frame];
    frame.origin.x = point.x;
    frame.origin.y = point.y;
    [self setFrame:CGRectStandardize(frame)];
}


-(void)removeAllSubviews
{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

-(void)removeAllSubviewsExTag:(NSInteger) exTag
{
    for (UIView *subView in self.subviews) {
        if (subView.tag != exTag) {
            [subView removeFromSuperview];
        }
    }
}

//设置点击动画
- (void)showScaleAnimation
{
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.duration = 0.1;
    animation1.repeatCount = 1;
    animation1.autoreverses = NO;
    animation1.fromValue = [NSNumber numberWithFloat:0.9];
    animation1.toValue = [NSNumber numberWithFloat:1.2];
    animation1.removedOnCompletion = NO;
    animation1.beginTime = 0;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.repeatCount = 1;
    animation2.duration = 0.1;
    animation2.autoreverses = NO;
    animation2.fromValue = [NSNumber numberWithFloat:1.2];
    animation2.toValue = [NSNumber numberWithFloat:0.9];
    animation2.removedOnCompletion = NO;
    animation2.beginTime = 0.1;
    
    CABasicAnimation * animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.repeatCount = 1;
    animation3.duration = 0.1;
    animation3.autoreverses = NO;
    animation3.fromValue = [NSNumber numberWithFloat:0.9];
    animation3.toValue = [NSNumber numberWithFloat:1.1];
    animation3.removedOnCompletion = NO;
    animation3.beginTime = 0.2;
    
    CABasicAnimation * animation4 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation4.repeatCount = 1;
    animation4.duration = 0.1;
    animation4.autoreverses = NO;
    animation4.fromValue = [NSNumber numberWithFloat:1.1];
    animation4.toValue = [NSNumber numberWithFloat:1.0];
    animation4.removedOnCompletion = YES;
    animation4.beginTime = 0.3;
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    [group setDuration:0.4];
    [group setAnimations:[NSArray arrayWithObjects:animation1, animation2, animation3, animation4, nil]];
    
    [self.layer addAnimation:group forKey:@"group-scale-layer"];
}
@end
