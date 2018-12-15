//
//  NPPencilCanvas.h
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPPencilMaterial.h"

NS_ASSUME_NONNULL_BEGIN

@class NPPencilCanvas;
@protocol NPPencilCanvasDelegate <NSObject>

- (void)pencilCanvas:(NPPencilCanvas *)canvas drawStateChanged:(BOOL)isDrawing;

@end

@interface NPPencilCanvas : UIView

@property (nonatomic, strong) NPPencilMaterial *material;
@property (nonatomic, assign, readonly, getter=isDrawing) BOOL drawing;
@property (nonatomic, assign, readonly) BOOL isCanUndo;

@property (nonatomic, weak) id<NPPencilCanvasDelegate> delegate;

- (void)undo;
- (void)reset;
- (UIImage *)snapShot;

@end

NS_ASSUME_NONNULL_END
