//
//  NPPencilBrush.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import "NPPencilBrush.h"
#import "NPPencilPath.h"
#import "NPPencilMaterial.h"

@interface NPPencilBrush ()

@property (nonatomic, strong) NPPencilMaterial *material;
@property (nonatomic, strong) NPPencilPath *path;
@property (nonatomic, assign) BOOL isPointPath;
@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation NPPencilBrush

#pragma mark - Public
- (void)beginDrawAtPoint:(CGPoint)point material:(NPPencilMaterial *)material {
    _isPointPath = YES;
    _startPoint = point;
    self.material = material;
    _path = [[NPPencilPath alloc] initWithMaterial:material];
    [_path moveToPoint:point];
    if ([_delegate respondsToSelector:@selector(pencilBrush:startPath:)]) {
        [_delegate pencilBrush:self startPath:_path];
    }
}

- (void)moveDrawFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2 {
    _isPointPath = NO;
    [_path addQuadCurveToPoint:MidPoint(point1, point2) controlPoint:point1];
    if ([_delegate respondsToSelector:@selector(pencilBrushRender:)]) {
        [_delegate pencilBrushRender:self];
    }
}

- (void)endDraw {
    if (_isPointPath) {
        [_path addLineToPoint:_startPoint];
    }
    if ([_delegate respondsToSelector:@selector(pencilBrushEnd:)]) {
        [_delegate pencilBrushEnd:self];
    }
}

#pragma mark - Private
static CGPoint MidPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) / 2.0, (p1.y + p2.y) / 2.0);
}

@end
