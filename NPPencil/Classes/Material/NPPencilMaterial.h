//
//  NPPencilMaterial.h
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NPPencilMaterial : NSObject

@property (nonatomic, strong) UIColor *bodyColor;

@property (nonatomic, assign) CGFloat bodyWeight;

@property (nonatomic, strong) UIColor * _Nullable shadowColor;

@property (nonatomic, assign) CGFloat shadowWeight;

+ (instancetype)materialWithColor:(UIColor *)bodyColor
                       bodyWeight:(CGFloat)bodyWeight
                      shadowColor:(UIColor * _Nullable)shadowColor
                     shadowWeight:(CGFloat)shadowWeight;


@end

NS_ASSUME_NONNULL_END
