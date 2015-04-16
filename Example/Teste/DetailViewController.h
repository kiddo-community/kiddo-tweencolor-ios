//
//  DetailViewController.h
//  Teste
//
//  Created by Kiddo Labs on 4/10/15.
//  Copyright (c) 2015 Kiddo Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

