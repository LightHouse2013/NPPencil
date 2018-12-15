//
//  NPPencilMaterial.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import "NPPencilMaterial.h"

@implementation NPPencilMaterial

+ (instancetype)materialWithColor:(UIColor *)bodyColor
                       bodyWeight:(CGFloat)bodyWeight
                      shadowColor:(UIColor *)shadowColor
                     shadowWeight:(CGFloat)shadowWeight {
    NPPencilMaterial *m = [[NPPencilMaterial alloc] init];
    m.bodyColor = bodyColor;
    m.bodyWeight = bodyWeight;
    m.shadowColor = shadowColor;
    m.shadowWeight = shadowWeight;
    return m;
}

@end
