//
//  UIView+Category.m
//  BaiJiaHao
//
//  Created by hfzhao on 17/7/25.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
-(void)radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor;
}

// 获取view的controller
- (UIViewController *)getCurrentViewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
- (void)drawCorners:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii].CGPath;
    self.layer.mask = shapeLayer;
}

- (void)clickAnimationFinished:(void(^)(void))block {
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations: ^{
            self.transform = CGAffineTransformMakeScale(0.95, 0.95);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations: ^{
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:^(BOOL finished) {
        if (block) {
            block();
        }
    }];
}

@end
