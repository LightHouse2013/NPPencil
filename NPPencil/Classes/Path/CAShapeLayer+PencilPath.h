//
//  CAShapeLayer+PencilPath.h
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/23.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@class NPPencilPath;
@interface CAShapeLayer (PencilPath)

+ (CAShapeLayer *)layerWithPath:(NPPencilPath *)path;

@end

NS_ASSUME_NONNULL_END
