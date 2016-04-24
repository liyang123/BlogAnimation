//
//  WelcomeView.m
//  BlogAnimation
//
//  Created by liyang on 16/4/24.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView ()
@property (weak, nonatomic) IBOutlet UIImageView *sloganImg;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *welLabel;

@end

@implementation WelcomeView

+ (instancetype)weicomeView
{
    return [[NSBundle mainBundle] loadNibNamed:@"WelcomeView" owner:nil options:nil][0];
}

- (void)awakeFromNib
{
    self.iconImg.layer.cornerRadius = 50;
    self.iconImg.layer.masksToBounds = YES;
    self.iconImg.hidden = YES;
    self.welLabel.hidden = YES;
}
/**
 *  当视图加载到父试图上的时候，会自动调用这个方法
 */
- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self change];
}

/**
 *  做动画形变
 */
- (void)change
{
    NSLog(@"11");
    self.iconImg.transform = CGAffineTransformMakeTranslation(0, 50);
    [UIView animateWithDuration:0.5 animations:^{
        self.sloganImg.alpha = 0;
    } completion:^(BOOL finished) {
        self.iconImg.hidden = NO;
        
        // 这个动画有弹簧效果
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _iconImg.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.welLabel.alpha = 0;
            self.welLabel.hidden = NO;
            // 文字慢慢显示
            [UIView animateWithDuration:0.5 animations:^{
                self.welLabel.alpha = 1;
            } completion:^(BOOL finished) {
                // 过一秒后移除视图
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // 完成动画后再慢慢退出
                    [UIView animateWithDuration:2.0 animations:^{
                        self.alpha = 0;
                    } completion:^(BOOL finished) {
                        [self removeFromSuperview];
                    }];
                });
            }];
        }];
    }];
}
















@end
