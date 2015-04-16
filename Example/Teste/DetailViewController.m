//
//  DetailViewController.m
//  Teste
//
//  Created by Kiddo Labs on 4/10/15.
//  Copyright (c) 2015 Kiddo Labs. All rights reserved.
//

#import "DetailViewController.h"
#import "KiddoTweenColor.h"

@interface DetailViewController ()

@property (assign) float pMax;
@property (strong) KiddoTweenColor *tweenColor;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    self.tweenColor = [[KiddoTweenColor alloc] init];
    
    self.tweenColor.start =[UIColor colorWithRed:0.3 green:0.39 blue:0.42 alpha:1];
    self.tweenColor.end   = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.tweenColor.maxPosition = [self.slider maximumValue]*0.8;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)sliderChanged:(id)sender {
    double pos = [self.slider value];
    
    CGFloat redS = 0.0,
            greenS = 0.0,
            blueS = 0.0,
            alphaS = 0.0;
    double maxPosition = 0.0;
    
    
    maxPosition = [self.slider maximumValue]*0.8;
    
    UIColor * newColor = [self.tweenColor scroll:pos];
    
    [KiddoTweenColor getComponentsFrom:newColor red:&redS green:&greenS blue:&blueS alpha:&alphaS];
    
    self.view.backgroundColor = newColor;
    
    NSLog(@"%f %f %f %f", redS, greenS, blueS, alphaS);
    
}

@end
