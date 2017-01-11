//
//  GTBaseViewController.m
//  GTRootKit
//
//  Created by 郭通 on 17/1/11.
//  Copyright © 2017年 郭通. All rights reserved.
//

#import "GTBaseViewController.h"
#import <GTSpec/GTDefine.h>

#define COLOR_TITLE                     RGBA(0,0,0,1)

@interface GTBaseViewController ()

@property(nonatomic,strong)UILabel* dmTitleLabel;
@property (strong, nonatomic) UIActivityIndicatorView *activityView;

@end

@implementation GTBaseViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self prepareTabbarItem];
}
- (void) loadView
{
    [super loadView];
    [self prepareTabbarItem];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.dmTitleLabel;
    
    self.view.backgroundColor = RGBA(234, 234, 234, 1);
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.bounds = CGRectMake(0, 0, 40, 40);
    CGPoint newCenter = self.view.center;
    newCenter.y -= 50;
    _activityView.center = newCenter;
    [self.view addSubview:_activityView];
    
    [self adaptUI];
}
- (void) loadSubviews
{
    // 子类实现
}
-(void)adaptUI
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.barTintColor = COLOR_NAV;
    self.navigationController.navigationBar.tintColor = COLOR_TITLE;
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundColor:COLOR_NAV];
    
    //    UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height-0.5, UI_SCREEN_WIDTH, 0.5)];
    //    lineView.backgroundColor = RGBA(193, 193, 193,1);
    //    [self.navigationController.navigationBar addSubview:lineView];
}
-(void)addLeftBarButtonWithTitle:(NSString*)title
                           image:(UIImage*)image
                 backgroundImage:(UIImage*)background
                          action:(SEL)action
{
    UIBarButtonItem* left;
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -12;//此处修改到边界的距离
    
    if ([title length]) {
        left = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    }else if (image){
        left = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    }
    [left setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:FONT_(16), NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    if (background) {
        [left setBackgroundImage:background forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    //    self.navigationItem.leftBarButtonItem = left;
    [self.navigationItem setLeftBarButtonItems:@[negativeSeperator, left]];
}
-(void)addRightBarButtonWithTitle:(NSString*)title
                            image:(UIImage*)image
                  backgroundImage:(UIImage*)background
                           action:(SEL)action
{
    UIBarButtonItem* right;
    
    if ([title length]) {
        right = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    }else if (image){
        UIImage* originalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        right = [[UIBarButtonItem alloc] initWithImage:originalImage style:UIBarButtonItemStylePlain target:self action:action];
    }
    [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:FONT_(16), NSFontAttributeName,nil] forState:UIControlStateNormal];
    if (background) {
        [right setBackgroundImage:background forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    self.navigationItem.rightBarButtonItem = right;
}
- (void) goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareTabbarItem
{
    
}
@end
