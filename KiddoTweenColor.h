//
//  TweenColor.h
//  Teste
//
//  Created by Bruno Guerra on 4/16/15.
//  Copyright (c) 2015 Kiddo Labs. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface KiddoTweenColor : NSObject

@property (assign) CGFloat maxPosition;

+ (float)scrollScaleWithMaxScale:(float)maxC minScale:(float)minC position:(float)pos maxPosition:(float)maxPos;

+ (BOOL)getComponentsFrom:(UIColor *)color red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha NS_AVAILABLE_IOS(5_0);

+ (UIColor *)colorScrollWithPosition:(double)pos maxPosition:(double)maxPosition startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

- (void)setStart:(UIColor *)color;

- (void)setEnd:(UIColor *)color;

- (UIColor *) scroll:(double)position;
@end
