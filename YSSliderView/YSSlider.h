//
//  YSSlider.h
//
//  Created by Aaron on 2019/10/16.
//  Copyright © 2019 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface YSSlider : UIView

/**
 设置最小值
 */
@property (nonatomic, assign) CGFloat minNum;

/**
 设置最大值
 */
@property (nonatomic, assign) CGFloat maxNum;

/**
 设置min 颜色
 */
@property (nonatomic, weak) UIColor * minTintColor;

/**
 设置max 颜色
 */
@property (nonatomic, weak) UIColor * maxTintColor;

/**
 设置 中间 颜色
 */
@property (nonatomic, weak) UIColor * mainTintColor;

/**
 当前最小值
 */
@property (nonatomic, assign) CGFloat currentMinValue;

/**
 当前最大值
 */
@property (nonatomic, assign) CGFloat currentMaxValue;

/**
 显示 min 滑块
 */
@property (nonatomic, strong) UIButton * minSlider;

/**
 显示 max 滑块
 */
@property (nonatomic, strong) UIButton * maxSlider;

/**
 滑块外围颜色
 */
@property (nonatomic, weak) UIColor * bordColor;

- (instancetype)initWithFrame:(CGRect)frame WithBlock:(void(^)(CGFloat minValue, CGFloat maxValue))block;

@end

NS_ASSUME_NONNULL_END
