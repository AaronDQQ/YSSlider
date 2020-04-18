//
//  YSSlider.m
//
//  Created by Aaron on 2019/10/16.
//  Copyright © 2019 Aaron. All rights reserved.
//

#import "YSSlider.h"

#import "UIView+Extension.h"

@interface YSSlider () {
    UIView *_minSliderLine;
    UIView *_maxSliderLine;
    UIView *_mainSliderLine;
    
    CGFloat _constOffY;
    
    CGFloat _tatol;
}

@property (nonatomic, copy) void(^valueBlock)(CGFloat minValue, CGFloat maxValue);

@end

@implementation YSSlider

- (instancetype)initWithFrame:(CGRect)frame WithBlock:(nonnull void (^)(CGFloat, CGFloat))block {
    if (self == [super initWithFrame:frame]) {
        if (frame.size.height < 30.0f) {
            self.height = 30.0f;
        }
        self.valueBlock = block;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    _mainSliderLine = [[UIView alloc]initWithFrame:CGRectMake(10, self.height/2-1, self.width-20, 2)];
    _mainSliderLine.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:_mainSliderLine];
    
    _minSliderLine = [[UIView alloc]initWithFrame:CGRectMake(10, _mainSliderLine.top, 0, _mainSliderLine.height)];
    _minSliderLine.backgroundColor = [UIColor redColor];
    [self addSubview:_minSliderLine];
    
    _maxSliderLine = [[UIView alloc]initWithFrame:CGRectMake(self.width-10, _mainSliderLine.top, 0, _mainSliderLine.height)];
    _maxSliderLine.backgroundColor = [UIColor redColor];
    [self addSubview:_maxSliderLine];
    
    UIButton *minSliderButton = [[UIButton alloc]initWithFrame:CGRectMake(0,self.height/2-25/2, 25, 25)];
    minSliderButton.backgroundColor = [UIColor whiteColor];
    minSliderButton.showsTouchWhenHighlighted = YES;
    minSliderButton.layer.cornerRadius = minSliderButton.width/2.0f;
    minSliderButton.layer.masksToBounds = YES;
    minSliderButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    minSliderButton.layer.borderWidth = 2;
    UIPanGestureRecognizer *minSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMinSliderButton:)];
    [minSliderButton addGestureRecognizer:minSliderButtonPanGestureRecognizer];
    [self addSubview:minSliderButton];
    _minSlider = minSliderButton;
    
    UIButton *maxSliderButton = [[UIButton alloc]initWithFrame:CGRectMake(self.width-20, self.height/2-25/2, 25, 25)];
    maxSliderButton.backgroundColor = [UIColor whiteColor];
    maxSliderButton.showsTouchWhenHighlighted = YES;
    maxSliderButton.layer.cornerRadius = minSliderButton.width/2.0f;
    maxSliderButton.layer.masksToBounds = YES;
    maxSliderButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    maxSliderButton.layer.borderWidth = 2;
    UIPanGestureRecognizer *maxSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMaxSliderButton:)];
    [maxSliderButton addGestureRecognizer:maxSliderButtonPanGestureRecognizer];
    [self addSubview:maxSliderButton];
    _maxSlider = maxSliderButton;
    _constOffY = _minSlider.centerY;
}

- (void)panMinSliderButton:(UIPanGestureRecognizer *)pgr {
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.centerY = _constOffY;
    
    
    if (pgr.view.right > _maxSlider.right) {
        pgr.view.right = _maxSlider.right;
    } else {
        if (pgr.view.centerX < 10) {
            pgr.view.centerX = 10;
        }
        if (pgr.view.centerX > self.width-10) {
            pgr.view.centerX = self.width-10;
        }
    }
    _minSliderLine.frame = CGRectMake(_minSliderLine.left, _minSliderLine.top,  pgr.view.centerX-_minSliderLine.left, _minSliderLine.height);
    [self valueMinChange:_minSliderLine.right];
}

- (void)panMaxSliderButton:(UIPanGestureRecognizer *)pgr {
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.centerY = _constOffY;
    
    if (pgr.view.left < _minSlider.left) {
        pgr.view.left = _minSlider.left;
    }else{
        if (pgr.view.centerX < 10) {
            pgr.view.centerX = 10;
        }
        if (pgr.view.centerX > self.width-10) {
            pgr.view.centerX = self.width-10;
        }
    }
    _maxSliderLine.frame = CGRectMake(pgr.view.centerX, _maxSliderLine.top, self.width-pgr.view.centerX-10, _maxSliderLine.height);
    [self valueMaxChange:_maxSliderLine.left];
}

- (void)valueMinChange:(CGFloat)num {
    
    _currentMinValue = _minNum + ((_maxNum - _minNum) * ((num-10)/(self.width-20)));
    self.valueBlock(_currentMinValue, _currentMaxValue);
}

- (void)valueMaxChange:(CGFloat)num {
    
    _currentMaxValue = _minNum +((_maxNum - _minNum) * ((num-10)/(self.width-20)));
    self.valueBlock(_currentMinValue, _currentMaxValue);
}

- (void)setCurrentMinValue:(CGFloat)currentMinValue {
    _currentMinValue = currentMinValue;
    CGFloat percentage = (currentMinValue - _minNum) / (_maxNum - _minNum);
    _minSliderLine.frame = CGRectMake(_minSliderLine.left, _minSliderLine.top, (self.frame.size.width-20)*percentage, _minSliderLine.height);
    _minSlider.center = CGPointMake(CGRectGetMaxX(_minSliderLine.frame), _minSlider.center.y);
}

- (void)setCurrentMaxValue:(CGFloat)currentMaxValue {
    _currentMaxValue = currentMaxValue;
    CGFloat percentage = (currentMaxValue-_minNum) / (_maxNum - _minNum);
    CGFloat x = (self.width-20)*percentage;
    _maxSliderLine.frame = CGRectMake(x+10, _maxSliderLine.top, self.width-20-x, _maxSliderLine.height);
    _maxSlider.center = CGPointMake(CGRectGetMinX(_maxSliderLine.frame), _minSlider.center.y);
}

- (void)setMinNum:(CGFloat)minNum {
    _minNum = minNum;
}

- (void)setMaxNum:(CGFloat)maxNum {
    _maxNum = maxNum;
}

- (void)setMinTintColor:(UIColor *)minTintColor {
    _minTintColor = minTintColor;
    _minSliderLine.backgroundColor = minTintColor;
}

- (void)setMaxTintColor:(UIColor *)maxTintColor {
    _maxTintColor = maxTintColor;
    _maxSliderLine.backgroundColor = maxTintColor;
}

- (void)setMainTintColor:(UIColor *)mainTintColor {
    _mainTintColor = mainTintColor;
    _mainSliderLine.backgroundColor = mainTintColor;
}

- (void)setBordColor:(UIColor *)bordColor {
    _minSlider.layer.borderColor = bordColor.CGColor;
    _maxSlider.layer.borderColor = bordColor.CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
