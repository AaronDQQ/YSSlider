# YSSlider


`pod 'YSSlider'
`

**该控件为双滑块进度条，左右两个滑块可以重叠**

-------

1. 设置最小值（范围） : (CGFloat) minNum

2. 设置最大值（范围） : (CGFloat) maxNum

3. 设置min 颜色 : (UIColor *) minTintColor

4. 设置max 颜色 : (UIColor *) maxTintColor

5. 设置 中间 颜色 : (UIColor *) mainTintColor

6. 当前最小值 : (CGFloat) currentMinValue

7. 当前最大值 : (CGFloat) currentMaxValue

8. 滑块外围颜色 : (UIColor *) bordColor


```
///初始化方法，通过block返回实时的最大值和最小值
- (instancetype)initWithFrame:(CGRect)frame WithBlock:(void(^)(CGFloat minValue, CGFloat maxValue))block;
```




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

/**
初始化函数，
通过 Block，返回最大值和最小值
*/
- (instancetype)initWithFrame:(CGRect)frame WithBlock:(void(^)(CGFloat minValue, CGFloat maxValue))block;

///FIXME: - 两个滑块可以重叠

![](https://github.com/AaronDQQ/YSSlider/blob/master/Images/Slider.png)
