//
//  ViewController.m
//  AnimationDemo
//
//  Created by boolean on 16/5/13.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "ViewController.h"
#import "UtilsMacro.h"
#import "PositionAnimationVC.h"
#import "OpacityAnimationVC.h"
#import "ScaleAnimationVC.h"
#import "ColorAnimationVC.h"
#import "RotationAnimationVC.h"
#import "RepeatAnimationVC.h"
#import "EasingAnimationVC.h"
#import "SpringAnimationVC.h"

static NSString *const kIdentifier = @"cellIdentifier";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIToolbarDelegate
>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *titleArray;

@property(nonatomic,strong)UIToolbar *myToolbar;
@property(nonatomic,strong)UIImageView *navHairline;
@property(nonatomic,strong)UISegmentedControl *segment;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navHairline = [self findHairlineImageViewUnder:self.navigationController.navigationBar];;
    
    [self.titleArray addObjectsFromArray:@[@[@"PositionAnimation",@"OpacityAnimation",@"ScaleAnimation",@"ColorAnimation",@"RotationAnimation"],@[@"Repeat",@"Easing",@"Spring"],@[@"Repeat",@"Easing",@"Spring"],@[@"Repeat",@"Easing",@"Spring"],@[@"Repeat",@"Easing",@"Spring"],@[@"Repeat",@"Easing",@"Spring"]]];
    
    self.navigationItem.title = @"AnimationDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.table];
    [self.view addSubview:self.myToolbar];
    
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView)
        {
            return imageView;
        }
    }
    return nil;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navHairline.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navHairline.hidden = NO;
}

- (void)_moveHairline:(BOOL)appearing
{
    // move the hairline below the segmentbar
    CGRect hairlineFrame = self.navHairline.frame;
    self.navHairline.hidden = !appearing;
    if (appearing)
    {
        hairlineFrame.origin.y += self.myToolbar.bounds.size.height;
    } else {
        hairlineFrame.origin.y -= self.myToolbar.bounds.size.height;
    }
    self.navHairline.frame = hairlineFrame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.titleArray[indexPath.section][indexPath.row];
    UIViewController *con = nil;
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    PositionAnimationVC *vc = [[PositionAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 1:
                {
                    OpacityAnimationVC *vc = [[OpacityAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 2:
                {
                    ScaleAnimationVC *vc = [[ScaleAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 3:
                {
                    ColorAnimationVC *vc = [[ColorAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 4:
                {
                    RotationAnimationVC *vc = [[RotationAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                default:
                    break;
            }
        }
            break;
         case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    RepeatAnimationVC *vc = [[RepeatAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 1:
                {
                    EasingAnimationVC *vc = [[EasingAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                case 2:
                {
                    SpringAnimationVC *vc = [[SpringAnimationVC alloc] init];
                    con = vc;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    if (con)
    {
        con.navigationItem.title = title;
        [self.navigationController pushViewController:con animated:YES];
    }
}

//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return indexPath.row;
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titleArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
    
    NSString *title = self.titleArray[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.text = title;
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"动画入门":@"动画进阶";
}
#pragma mark - UIToolbarDelegate
- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return  UIBarPositionTopAttached;
}
#pragma mark - Getter And Setter
- (UITableView *)table
{
    if (!_table)
    {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40)
                                              style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
        
    }
    return _table;
}

- (NSMutableArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = [[NSMutableArray alloc] init];
    }
    return _titleArray;
}
- (UIToolbar *)myToolbar
{
    if (!_myToolbar)
    {
        _myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.segment];
        _myToolbar.items = @[fixItem,item,fixItem];
        //_myToolbar.barTintColor = [UIColor whiteColor];
        _myToolbar.delegate = self;
    }
    return _myToolbar;
}
- (UISegmentedControl *)segment
{
    if (!_segment)
    {
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"First",@"Second",@"Third"]];
        _segment.selectedSegmentIndex = 0;
        _segment.frame = CGRectMake(0, 0, SCREEN_WIDTH - 80, 26);
    }
    return _segment;
}
@end
