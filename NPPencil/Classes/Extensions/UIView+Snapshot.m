//
//  UIView+Snapshot.m
//  NPPencil
//
//  Created by zhang.wenhai on 2018/11/23.
//

#import "UIView+Snapshot.h"

@implementation UIView (Snapshot)

- (UIImage *)takeSnapShot {
    UIImage *image = nil;
    UIView *shotView = self;
    UIGraphicsBeginImageContextWithOptions(shotView.bounds.size, NO, [UIScreen mainScreen].scale);
    [shotView.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
