//
//  PositionAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/13.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "PositionAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"


@interface PositionAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@end
@implementation PositionAnimationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.blueView.centerX = SCREEN_WIDTH - self.blueView.center.x;
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
//    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        self.blueView.centerX = SCREEN_WIDTH/2 - self.blueView.center.x;
//    } completion:^(BOOL finished) {
//        
//    }];
}
#pragma mark - Getter And Setter
- (UIView *)blueView
{
    if (!_blueView)
    {
        _blueView = [[UIView alloc] initWithFrame:CGRectMake(10, 84, 50, 50)];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}
@end
