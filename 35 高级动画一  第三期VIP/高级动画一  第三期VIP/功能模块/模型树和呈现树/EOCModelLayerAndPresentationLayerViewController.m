//
//  EOCModelLayerAndPresentationLayerViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCModelLayerAndPresentationLayerViewController.h"

@interface EOCModelLayerAndPresentationLayerViewController () {
    
    UIView *viewOne;
    
}

@property(nonatomic, strong)CALayer *caseLayer;

@end

@implementation EOCModelLayerAndPresentationLayerViewController

/*
 
 layer层有三层树结构：presentationLayer Tree（呈现树）、modelLayer Tree（模型树）、Render Tree（渲染树）
 presentationLayer Tree用来展示的，modelLayer Tree用来存储数据和值的（怎么验证）
 动画的时候是对presentLayer操作，modelLayer还是保持原来的值，可以通过点击事件，确认到
 
 模型树：是用来存储数据的、响应事件
 呈现树：用来根据模型树的数据，展示
 呈现树是对模型树的copy
 
 如果说：你添加了一个动画，那么此时呈现树的数据来自于动画，而不是模型树；当动画结束之后，才又会根据模型树的数据展示；如果动画结束了，但是动画不移除，那么呈现树的数据依然来自于动画；
 
 引申：每一个runloop循环的时候，会提交一个事务：CATransaction，让呈现树根据数据  展示
 当然，你也可以显性写出CATransaction提交数据展示。
 
 */

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.caseLayer = [CALayer layer];
    self.caseLayer.frame = CGRectMake(100.f, 100.f, 50.f, 50.f);
    self.caseLayer.backgroundColor = [UIColor redColor].CGColor;
    self.caseLayer.cornerRadius = 8.f;
    self.caseLayer.masksToBounds = YES;
    [self.view.layer addSublayer:self.caseLayer];
    
//    viewOne = [[UIView alloc] init];
//    viewOne.backgroundColor = [UIColor redColor];
//    viewOne.layer.position = CGPointMake( 100.f, 100.f);
//    viewOne.layer.bounds = CGRectMake(0.f, 0.f, 100.f, 100.f);
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//    [viewOne addGestureRecognizer:tapGesture];
//
//    [self.view addSubview:viewOne];
}

- (void)tapAction {
    
    NSLog(@"tapAction");
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.duration = 5.f;
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200.f, 200.f)];
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    //[viewOne.layer addAnimation:anim forKey:nil];
    
    [self.caseLayer addAnimation:anim forKey:nil];
    
//    __weak typeof(self) weakSelf = self;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//            NSLog(@"presentationLayer.frame %@, modelLayer.frame %@ presentationLayer %@, modelLayer%@ ", NSStringFromCGRect(weakSelf.caseLayer.presentationLayer.frame), NSStringFromCGRect(weakSelf.caseLayer.modelLayer.frame), weakSelf.caseLayer.presentationLayer, weakSelf.caseLayer.modelLayer);
//
//        }];
//
//    });
    
}

@end
