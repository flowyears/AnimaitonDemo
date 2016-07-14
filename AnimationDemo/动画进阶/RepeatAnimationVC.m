//
//  RepeatAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/16.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "RepeatAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"


@interface RepeatAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@property(nonatomic,strong)UIView *redView;
@property(nonatomic,strong)UIView *greenView;
@end
@implementation RepeatAnimationVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
     [self.view addSubview:self.greenView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionRepeat animations:^{
        self.blueView.centerX = SCREEN_WIDTH - self.blueView.center.x;
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
        self.redView.centerX = SCREEN_WIDTH - self.redView.center.x;
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
        self.greenView.centerX = SCREEN_WIDTH - self.greenView.center.x;
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

- (UIView *)redView
{
    if (!_redView)
    {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(10, 160, 50, 50)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)greenView
{
    if (!_greenView)
    {
        _greenView = [[UIView alloc] initWithFrame:CGRectMake(10, 240, 50, 50)];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
@end
