//
//  NPPencilCanvas.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import "NPPencilCanvas.h"
#import "NPPencilBrush.h"
#import "NPPencilPath.h"
#import "CAShapeLayer+PencilPath.h"
#import "UIView+Snapshot.h"

@interface NPPencilCanvas() <NPPencilBrushDelegate>

@property (nonatomic, strong) NPPencilBrush *brush;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<CAShapeLayer *> *> *historyPathLayers;
@property (nonatomic, strong) NSUndoManager *pathUndoManager;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *lastPathLayers;
@property (nonatomic, strong) NPPencilPath *lastPath;

@property (nonatomic, assign, getter=isDrawing) BOOL drawing;

@end

@implementation NPPencilCanvas

#pragma mark - LifeCircle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _brush = [[NPPencilBrush alloc] init];
        _brush.delegate = self;
        _historyPathLayers = [NSMutableDictionary dictionary];
        _pathUndoManager = [NSUndoManager new];
        self.layer.masksToBounds = YES;
    }
    return self;
}

#pragma mark - Public
- (void)undo {
    if (self.isDrawing) { return; }
    if ([_pathUndoManager canUndo]) {
        [_pathUndoManager undo];
    }
}

- (void)reset {
    if (self.isDrawing) { return; }
    [_pathUndoManager removeAllActions];
    
    for (NSString *key in _historyPathLayers) {
        NSArray *layers = [_historyPathLayers objectForKey:key];
        for (CALayer *lyr in layers) {
            [lyr removeFromSuperlayer];
        }
    }
    [_historyPathLayers removeAllObjects];
    
    for (CAShapeLayer *path in _lastPathLayers) {
        [path removeFromSuperlayer];
    }
    [_lastPathLayers removeAllObjects];
    _lastPath = nil;
}

- (UIImage *)snapShot {
    return [self takeSnapShot];
}

#pragma mark - Protocol
#pragma mark NPPencilBrushDelegate
- (void)pencilBrush:(NPPencilBrush *)brush startPath:(NPPencilPath *)path {
    self.lastPath = path;
    self.drawing = YES;
    self.lastPathLayers = [NSMutableArray array];
}

- (void)pencilBrushRender:(NPPencilBrush *)brush {
    [self render];
}

- (void)pencilBrushEnd:(NPPencilBrush *)brush {
    [self render];
    [_pathUndoManager registerUndoWithTarget:self selector:@selector(__undoAction:) object:_lastPath];
    [_historyPathLayers setObject:[NSArray arrayWithArray:_lastPathLayers] forKey:_lastPath.identifier];
    _lastPath = nil;
    [_lastPathLayers removeAllObjects];
    self.drawing = NO;
}

#pragma mark - Private
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [_brush beginDrawAtPoint:point material:self.material];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint prePoint = [touch previousLocationInView:self];
    CGPoint point = [touch locationInView:self];
    [_brush moveDrawFromPoint:prePoint toPoint:point];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_brush endDraw];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_brush endDraw];
}

- (void)render {
    for (CAShapeLayer *path in _lastPathLayers) {
        [path removeFromSuperlayer];
    }
    [_lastPathLayers removeAllObjects];
    
    NPPencilPath *last = self.lastPath;
    CAShapeLayer *normal = [CAShapeLayer layerWithPath:last];
    [self.layer addSublayer:normal];
    [self.lastPathLayers addObject:normal];
}

- (void)__undoAction:(NPPencilPath *)path {
    NSArray<CAShapeLayer *> *pathLayers = [self.historyPathLayers objectForKey:path.identifier];
    [self.historyPathLayers removeObjectForKey:path.identifier];
    for (CAShapeLayer *path in pathLayers) {
        [path removeFromSuperlayer];
    }
}

#pragma mark - GET, SET
- (void)setDrawing:(BOOL)drawing {
    if (_drawing != drawing) {
        _drawing = drawing;
        if ([_delegate respondsToSelector:@selector(pencilCanvas:drawStateChanged:)]) {
            [_delegate pencilCanvas:self drawStateChanged:drawing];
        }
    }
}

- (BOOL)isCanUndo {
    return [_pathUndoManager canUndo];
}

@end
