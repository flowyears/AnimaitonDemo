//
//  ScaleAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/13.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "ScaleAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"

@interface ScaleAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@end
@implementation ScaleAnimationVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueView];
    self.blueView.centerX = self.view.centerX;
    self.blueView.centerY = self.view.centerY;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 delay:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.blueView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}
#pragma mark - Getter And Setter
- (UIView *)blueView
{
    if (!_blueView)
    {
        _blueView = [[UIView alloc] initWithFrame:CGRectMake(10, 104, 50, 50)];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}
@end
