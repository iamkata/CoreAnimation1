//
//  EOCViewThree.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCViewThree.h"
#import "EOCLayerThree.h"

@implementation EOCViewThree

//layer层的actionForKey:event这个方法内部
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    
    NSLog(@"%s", __func__);
    //return nil; //还会往下执行,就有动画了
    return [super actionForLayer:layer forKey:event];  //[NSNull null] 不会往下执行了, 系统把他拦截了,就没动画了
}

@end
