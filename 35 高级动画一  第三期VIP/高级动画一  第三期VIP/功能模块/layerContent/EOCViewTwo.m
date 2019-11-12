//
//  EOCViewTwo.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCViewTwo.h"

@implementation EOCViewTwo

//进行绘制 没有必要不要调用drawRect方法,因为获取图形上线文,需要消耗内存
- (void)drawRect:(CGRect)rect {


    CGContextRef context = UIGraphicsGetCurrentContext();



    [super drawRect:rect];
    NSLog(@"drawRect");

}

//2.关于layer的代理
//1.重写displayLayer  drawLayer inContext：就不会调用
//2.drawLayer inContext 内部通过[super drawLayer inContext]会调用UIView的drawRect方法
//3.不是实在需要不重写drawRect方法, 因为drawRect方法里面需要图形上下文,耗内存比比重写多

//view.layer的代理就是view；layer层的两个代理方法：displayLayer、drawLayer inContext：
//- (void)displayLayer:(CALayer *)layer {
//
//    NSLog(@"%s", __func__);
//    self.layer.contents = (__bridge id)[UIImage imageNamed:@"1.png"].CGImage;
//
//}

//绘制内容  CGContext方法来绘制
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    NSLog(@"%s", __func__);
    [super drawLayer:layer inContext:ctx];
    
}

@end
