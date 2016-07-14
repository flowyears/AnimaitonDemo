//
//  SpringAnimationVC.m
//  AnimationDemo
//
//  Created by boolean on 16/5/16.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "SpringAnimationVC.h"
#import "UtilsMacro.h"
#import "UIView+Addition.h"


@interface SpringAnimationVC ()
@property(nonatomic,strong)UIView *blueView;
@end
@implementation SpringAnimationVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.blueView.centerX = SCREEN_WIDTH/2 - self.blueView.center.x;
    } completion:^(BOOL finished) {
        
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
