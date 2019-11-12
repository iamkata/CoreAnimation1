//
//  EOCLayerThree.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/4.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCLayerThree.h"
#import <UIKit/UIKit.h>

@implementation EOCLayerThree

/*
 *  actionForKey:event这个方法内部实现逻辑：
 
 以下4个步骤，如果步骤返回nil，那么继续执行；如果非空，那么就是非空的值，停止执行
 *
 * 1. if defined, call the delegate method -actionForLayer:forKey:
 * 2. look in the layer's `actions' dictionary
 * 3. look in any `actions' dictionaries in the `style' hierarchy
 * 4. call +defaultActionForKey: on the layer's class
 *
 */

- (nullable id<CAAction>)actionForKey:(NSString *)event {
    
    NSLog(@"%s", __func__);
    
    return [super actionForKey:event];
    
}

+ (id)defaultActionForKey:(NSString *)key {
    
   NSLog(@"%s", __func__);
    
   return [super defaultActionForKey:key];
    
}

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key {
    
    NSLog(@"%s", __func__);
    NSLog(@"anim: %@   key: %@", anim, key);
    
    [super addAnimation:anim forKey:key];
    
}

@end
