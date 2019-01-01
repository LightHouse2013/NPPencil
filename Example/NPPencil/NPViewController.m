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
@end

@implementation NPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NPPencilCanvas *canvas = [[NPPencilCanvas alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:canvas];
    canvas.material = [NPPencilMaterial materialWithColor:[UIColor blueColor] bodyWeight:10.0f shadowColor:[UIColor greenColor] shadowWeight:5.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
