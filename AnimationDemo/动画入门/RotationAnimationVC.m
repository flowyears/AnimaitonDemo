//
//  RotationAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/13.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "RotationAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"


@interface RotationAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@end


@implementation RotationAnimationVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self spin];
}

- (void)spin
{
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.blueView.transform = CGAffineTransformRotate(self.blueView.transform, M_PI);
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self spin];
        }
    }];
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
