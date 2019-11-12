//
//  EOCUnregularViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCUnregularViewController.h"

@interface EOCUnregularViewController () {
    
    UIImageView *imgView;
    
}

@end

@implementation EOCUnregularViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100.f, 100.f, 200.f, 200.f)];
    imgView.image = [UIImage imageNamed:@"bg-mine.png"];
    [self.view addSubview:imgView];
    
    //通过layer.mask 来塑造一个不透明控件
    UIImage *image = [UIImage imageNamed:@"bubble.png"];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)image.CGImage;
    imageLayer.frame = imgView.bounds;
    imgView.layer.mask = imageLayer;
}

@end
