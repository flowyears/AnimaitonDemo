//
//  ColorAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/13.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "ColorAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"


@interface ColorAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@end
@implementation ColorAnimationVC
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
        self.blueView.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
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
