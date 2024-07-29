//
//  UIView+Category.h
//  BaiJiaHao
//
//  Created by hfzhao on 17/7/25.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

- (void)radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor;

- (UIViewController *)getCurrentViewController;

- (void)drawCorners:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii;

// 点击缩放动画
- (void)clickAnimationFinished:(void(^)(void))block;

@end
