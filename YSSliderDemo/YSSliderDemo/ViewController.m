//
//  ViewController.m
//  YSSliderDemo
//
//  Created by Aaron on 2020/4/18.
//  Copyright © 2020 Aaron. All rights reserved.
//

#import "ViewController.h"

#import "YSSlider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YSSlider * slider = [[YSSlider alloc] initWithFrame:CGRectMake(30, 300, 300, 30) WithBlock:^(CGFloat minValue, CGFloat maxValue) {
        
    }];
    slider.minNum = 0;
    slider.maxNum = 100;
    slider.minTintColor = [UIColor greenColor];
    slider.maxTintColor = [UIColor greenColor];
    slider.mainTintColor = [UIColor redColor];
    slider.bordColor = [UIColor redColor];
    [self.view addSubview:slider];
}


@end
