//
//  NPViewController.m
//  NPPencil
//
//  Created by DarkKnightOne on 01/01/2019.
//  Copyright (c) 2019 DarkKnightOne. All rights reserved.
//

#import "NPViewController.h"
#include <NPPencil/NPPencilCanvas.h>

@interface NPViewController ()
@property (nonatomic, strong) NPPencilCanvas *canvas;
@end

@implementation NPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _canvas = [[NPPencilCanvas alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_canvas];
    NPPencilMaterial *material = [NPPencilMaterial materialWithColor:[UIColor blueColor] bodyWeight:10.0f shadowColor:[UIColor greenColor] shadowWeight:5.0f];
    _canvas.material = material;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
