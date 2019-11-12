//
//  EOCView.m
//  高级动画一  第三期VIP
//
//  Created by 八点钟学院 on 2018/5/3.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCView.h"
#import "EOCLayer.h"

@implementation EOCView

+ (Class)layerClass {
    
    return [EOCLayer class];
    
}

@end
