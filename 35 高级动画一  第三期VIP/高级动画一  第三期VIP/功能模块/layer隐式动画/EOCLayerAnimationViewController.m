//
//  EOCLayerAnimationViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCLayerAnimationViewController.h"
#import "EOCLayerThree.h"
#import "EOCViewThree.h"

@interface EOCLayerAnimationViewController () {
    EOCViewThree *viewThree;
    EOCLayerThree *layerThree;
}

@end

@implementation EOCLayerAnimationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewThree = [[EOCViewThree alloc] initWithFrame:CGRectMake(100.f, 100.f, 200.f, 200.f)];
    viewThree.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewThree];
    
    layerThree = [EOCLayerThree layer];
    layerThree.frame = CGRectMake(100.f, 400.f, 200.f, 200.f);
    layerThree.backgroundColor = [UIColor redColor].CGColor;
    //layerThree.delegate = viewThree;
    [self.view.layer addSublayer:layerThree];
}


//view层属性的修改，没有动画；   自定义的layer层属性修改，有隐式动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //修改viewOne的backgroundColor  这里加一个UIView animation的block
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(256.f)/255.f green:arc4random_uniform(256.f)/255.f blue:arc4random_uniform(256.f)/255.f alpha:1.f];

    //[CATransaction setAnimationDuration:3.f];
    viewThree.backgroundColor = color;
    //修改View的背景其实就是修改主layer的背景,如下,都没有隐式动画
    //viewThree.layer.backgroundColor = color.CGColor;
    
    //layer层隐式动画增加时间
    [CATransaction setAnimationDuration:3.f];
    
    //关闭掉隐式动画
    //[CATransaction setDisableActions:YES];
    
    //修改layerOne的backgroundColor
    layerThree.backgroundColor = color.CGColor;
}

@end
