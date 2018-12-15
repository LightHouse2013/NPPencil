//
//  CAShapeLayer+PencilPath.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/23.
//

#import "CAShapeLayer+PencilPath.h"
#import "NPPencilPath.h"

@implementation CAShapeLayer (PencilPath)

+ (CAShapeLayer *)layerWithPath:(NPPencilPath *)path {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = path.material.bodyColor.CGColor;
    shapeLayer.lineWidth = path.material.bodyWeight;
    if (path.material.shadowColor && path.material.shadowWeight > 0.0f) {
        shapeLayer.shadowColor = path.material.shadowColor.CGColor;
        shapeLayer.shadowRadius = path.material.shadowWeight;
        shapeLayer.shadowOffset = CGSizeZero;
        shapeLayer.shadowOpacity = 1.0;
    }
    
    shapeLayer.drawsAsynchronously = YES;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    return shapeLayer;
}

@end
