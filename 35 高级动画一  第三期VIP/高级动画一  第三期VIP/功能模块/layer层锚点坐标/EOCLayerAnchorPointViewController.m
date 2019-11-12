//
//  EOCLayerAnchorPointViewController.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/3.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//  frame、anchorPoint、position等属性

#import "EOCLayerAnchorPointViewController.h"
#import "EOCView.h"


@interface EOCLayerAnchorPointViewController () {
    
    EOCView *viewOne;
    UIView *viewTwo;
}

@end

@implementation EOCLayerAnchorPointViewController

/**
 1、view的frame实际上是通过layer的frame属性而改变的, layer的frame改变又会影响position和bounds
 2、frame的计算公式 (frame的size不一定等于bounds的size，旋转视图看结果)

 
 3、anchorPoint和position的关系
 4、anchorPoint的运用案例 秒针
 
 */

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewOne = [[EOCView alloc] init];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];
    
    //[self testAnchorPoint];
    [self testFrame];
    //[self anchorPointCase];
}

//2.设置frame的本质
- (void)testFrame {
//推导出frame的计算公式 （不包含旋转角度）：
// frame.origin.x = position.x - anchorPoint.x*width
// frame.origin.y = position.y - anchorPoint.y*height
// frame.width
// frame.height
    
    UIView *viewThree = [[UIView alloc] init];
    viewThree.backgroundColor = [UIColor yellowColor];
    viewThree.frame = CGRectMake(100.f, 300.f, 200.f, 200.f);  //内部会设置position、bounds
    viewThree.layer.anchorPoint = CGPointMake(0, 0);
    
    NSLog(@"position %@", NSStringFromCGPoint(viewThree.layer.position));  //{100, 300}、{200, 400}
    
    [self.view addSubview:viewThree];
}

//1.展示锚点和postion两者之间的关系
- (void)testAnchorPoint {
    
    //参照物viewTwo
    viewTwo = [[UIView alloc] init];
    viewTwo.layer.position = CGPointMake( 200.f, 200.f);
    viewTwo.layer.bounds = CGRectMake(0.f, 0.f, 100.f, 100.f);
    //设置完position和bounds就相当于设置了frame
    viewTwo.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:viewTwo];
    
    //进行试验的viewOne
    viewOne = [[EOCView alloc] init];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];
    viewOne.layer.position = CGPointMake( 200.f, 200.f);
    viewOne.layer.anchorPoint = CGPointMake(0.f, 0.f); //默认值为0.5  0.5
    viewOne.layer.bounds = CGRectMake(0.f, 0.f, 100.f, 100.f);
    
    //position {200, 200} anchorPoint {0, 0}
    //position {200, 200} anchorPoint {1, 0}
    
//1、anchorPoint是锚点，它的值范围为（0～1），是相对于layer本身的坐标；
//2、view的旋转是围绕着锚点来旋转的；
//3、postion是anchorPoint相对于父层的坐标，position和anchorPoint实际指的是同一个点；
//4、anchorPoint和position改变，对另外一个值没影响；
//5、anchorPoint值的修改，是可以可以改变view的布局；
//
//总结：知道position的值，把锚点这个点和positon对齐，就是view的布局。

    NSLog(@"position %@ anchorPoint %@ ", NSStringFromCGPoint(viewOne.layer.position), NSStringFromCGPoint(viewOne.layer.anchorPoint));
}

//3.锚点的运用
- (void)anchorPointCase {
    
    //我们的layer或者view，你对它进行旋转的时候，它是围绕着锚点来旋转的
    //我写一个秒针，我让秒针来动
    CALayer *secondLayer = [CALayer layer];
    secondLayer.bounds = CGRectMake(0.f, 0.f, 10.f, 40.f);
    secondLayer.position = CGPointMake(50.f, 50.f);
    secondLayer.anchorPoint = CGPointMake(0.5f, 1.0f);
    secondLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [viewOne.layer addSublayer:secondLayer];
    
    //开启一个定时器
    static int currentSecond = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        currentSecond++;
        secondLayer.transform = CATransform3DMakeRotation(currentSecond*(M_PI*2)/60, 0.f, 0.f, 1.f);
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //修改viewOne的坐标：
    //1、先调用setFrame，后调用position，最后调用bounds (通过打印的次序 以及 注释掉 [super setFrame:frame] 得出结论)
    //2、修改frame，本质是修改layer层的position和bounds
    
    viewOne.frame = CGRectMake(100.f, 200.f, 100.f, 100.f);
    
    // 这个不是隐式动画,这个是添加到layer层的BasicAnimation
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//    anim.duration = 6.f;
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300.f, 300.f)];
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//
//    [viewOne.layer addAnimation:anim forKey:nil];
}

@end
