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




![](https://github.com/AaronDQQ/YSSlider/blob/master/Images/Slider.png)
