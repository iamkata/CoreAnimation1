//
//  ViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/3.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "ViewController.h"
#import "EOCLayerAnchorPointViewController.h"
#import "EOCLayerContentViewController.h"
#import "EOCModelLayerAndPresentationLayerViewController.h"
#import "EOCUnregularViewController.h"
#import "EOCLayerAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"八点钟学院";
    
    NSArray *titleArr = @[@"layer坐标", @"layer的contents", @"模型树和呈现树", @"不规则矩形", @"layer的动画"];
    
    for (int i=0; i<titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100.f, 100.f+100.f*i, 200.f, 50.f);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.f)/255.f green:arc4random_uniform(256.f)/255.f blue:arc4random_uniform(256.f)/255.f alpha:1.f];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [btn setAccessibilityValue:[NSString stringWithFormat:@"%d", i]];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)btn {
    
    int index = btn.accessibilityValue.intValue;
    
    if (0 == index) {  //layer的anchorPoint
        
        EOCLayerAnchorPointViewController *layerAnchorView = [[EOCLayerAnchorPointViewController alloc] init];
        [self.navigationController pushViewController:layerAnchorView animated:YES];
        
    } else if (1 == index) {  //layer的contents
        
        EOCLayerContentViewController *layerContentView = [[EOCLayerContentViewController alloc] init];
        [self.navigationController pushViewController:layerContentView animated:YES];
        
    }  else if (2 == index) {  //模型树和呈现树
        
        EOCModelLayerAndPresentationLayerViewController *layerContentView = [[EOCModelLayerAndPresentationLayerViewController alloc] init];
        [self.navigationController pushViewController:layerContentView animated:YES];
        
    } else if (3 == index) {   //不规则矩形
        
        EOCUnregularViewController *layerContentView = [[EOCUnregularViewController alloc] init];
        [self.navigationController pushViewController:layerContentView animated:YES];
        
    } else if (4 == index) {   //layer的动画
        
        EOCLayerAnimationViewController *animationView = [[EOCLayerAnimationViewController alloc] init];
        [self.navigationController pushViewController:animationView animated:YES];
        
    }
    
}

@end
