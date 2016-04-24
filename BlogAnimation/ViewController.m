//
//  ViewController.m
//  BlogAnimation
//
//  Created by liyang on 16/4/23.
//  Copyright © 2016年 liyang. All rights reserved.
//

/*
 需求：
 文字慢慢消失，alpha
 显示头像，头像慢慢上移的动画
 // 完成动画
 */

#import "ViewController.h"
#import "WelcomeView.h"

@interface ViewController ()
@property (weak, nonatomic) UIImageView *sloganView;

@property (weak, nonatomic) UILabel *textView;
@property (weak, nonatomic) UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setUpLaunch];
}
- (void)setUpLaunch
{
    WelcomeView *wlc = [WelcomeView weicomeView];
    wlc.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:wlc];
}



@end
