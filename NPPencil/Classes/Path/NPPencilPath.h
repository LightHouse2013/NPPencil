//
//  NPPencilPath.h
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/21.
//  Copyright © 2018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPPencilMaterial.h"

NS_ASSUME_NONNULL_BEGIN

@interface NPPencilPath : UIBezierPath

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, strong, readonly) NPPencilMaterial *material;

- (instancetype)initWithMaterial:(NPPencilMaterial *)material;

@end

NS_ASSUME_NONNULL_END
