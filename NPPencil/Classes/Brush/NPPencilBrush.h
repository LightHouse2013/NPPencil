//
//  NPPencilBrush.h
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NPPencilMaterial.h"

NS_ASSUME_NONNULL_BEGIN

@class NPPencilBrush, NPPencilPath;
@protocol NPPencilBrushDelegate <NSObject>

- (void)pencilBrush:(NPPencilBrush *)brush startPath:(NPPencilPath *)path;
- (void)pencilBrushRender:(NPPencilBrush *)brush;
- (void)pencilBrushEnd:(NPPencilBrush *)brush;

@end

@interface NPPencilBrush : NSObject

@property (nonatomic, strong, readonly) NPPencilMaterial *material;
@property (nonatomic, weak) id<NPPencilBrushDelegate> delegate;

- (void)beginDrawAtPoint:(CGPoint)point material:(NPPencilMaterial *)material;
- (void)moveDrawFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2;
- (void)endDraw;

@end

NS_ASSUME_NONNULL_END
