//
//  EOCLayerContentViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/3.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCLayerContentViewController.h"
#import "EOCViewTwo.h"

@interface EOCLayerContentViewController () {
    EOCViewTwo *customImgView;
    UIImageView *imgView;
}

@end

@implementation EOCLayerContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
//    imgView.frame = CGRectMake(100.f, 100.f, 200.f, 200.f);
//    [self.view addSubview:imgView];
    
}

//1. 使用layer.contents模仿系统的UIImageView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    customImgView = [[EOCViewTwo alloc] initWithFrame:CGRectMake(100.f, 200.f, 3000.f, 3000.f)]; //retina屏幕，每个点包含了2个像素
    customImgView.backgroundColor = [UIColor redColor];
//    customImgView.layer.contents = (__bridge id)[UIImage imageNamed:@"1.png"].CGImage;
    [self.view addSubview:customImgView];
    
}

@end
