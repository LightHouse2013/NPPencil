//
//  NPViewController.m
//  NPPencil
//
//  Created by DarkKnightOne on 12/15/2018.
//  Copyright (c) 2018 DarkKnightOne. All rights reserved.
//

#import "NPViewController.h"
#import <NPPencil/NPPencilCanvas.h>

@interface NPViewController ()

@property (nonatomic, strong) NPPencilCanvas *canvas;

@end

@implementation NPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _canvas = [[NPPencilCanvas alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_canvas];
    _canvas.material = [NPPencilMaterial materialWithColor:[UIColor redColor] bodyWeight:10.f shadowColor:[UIColor blueColor] shadowWeight:10.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
