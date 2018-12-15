//
//  NPPencilPath.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import "NPPencilPath.h"

@implementation NPPencilPath

- (instancetype)initWithMaterial:(NPPencilMaterial *)material {
    if (self = [super init]) {
        _identifier = [NSString stringWithFormat:@"%f", CACurrentMediaTime()];
        _material = material;
    }
    return self;
}

@end
