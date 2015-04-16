//
//  TweenColor.m
//  Kiddo
//
//  Created by Bruno Guerra on 4/16/15.
//  Copyright (c) 2015 Kiddo Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KiddoTweenColor.h"

@interface KiddoTweenColor ()

@property (strong) UIColor *pStart;
@property (strong) UIColor *pEnd;

@end

@implementation KiddoTweenColor

CGFloat startRed,
        startGreen,
        startBlue,
        startAlpha;
CGFloat endRed,
        endGreen,
        endBlue,
        endAlpha;

+(float)scrollScaleWithMaxScale:(float)maxC minScale:(float)minC position:(float)pos maxPosition:(float)maxPos {
    float color = (maxC - minC) * (pos / maxPos) + minC;
    if (maxC>minC) {
        return MIN(color, maxC);
    } else {
        return MAX(color, maxC);
    }
    
}

+ (BOOL)getComponentsFrom:(UIColor *)color red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha NS_AVAILABLE_IOS(5_0) {
    // iOS 5
    if ([color respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [color getRed:red green:green blue:blue alpha:alpha];
    } else {
        // < iOS 5
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        *red = components[0];
        *green = components[1];
        *blue = components[2];
        *alpha = components[3];
    }
    
    return YES;
}

+ (UIColor *)colorScrollWithPosition:(double)pos
                         maxPosition:(double)maxPosition
                            startRed:(CGFloat)sRed
                          startGreen:(CGFloat)sGreen
                           startBlue:(CGFloat)sBlue
                          startAlpha:(CGFloat)sAlpha
                           andEndRed:(CGFloat)eRed
                            endGreen:(CGFloat)eGreen
                             endBlue:(CGFloat)eBlue
                            endAlpha:(CGFloat)eAlpha
{
    
    CGFloat redS = 0.0,
            greenS = 0.0,
            blueS = 0.0,
            alphaS = 0.0;
    
    
    redS = [self scrollScaleWithMaxScale:sRed minScale:eRed position:pos maxPosition:maxPosition];
    greenS = [self scrollScaleWithMaxScale:sGreen minScale:eGreen position:pos maxPosition:maxPosition];
    blueS = [self scrollScaleWithMaxScale:sBlue minScale:eBlue position:pos maxPosition:maxPosition];
    alphaS = [self scrollScaleWithMaxScale:sAlpha minScale:eAlpha position:pos maxPosition:maxPosition];
    
    return [UIColor colorWithRed:redS green:greenS blue:blueS alpha:alphaS];
    
}

+ (UIColor *)colorScrollWithPosition:(double)pos maxPosition:(double)maxPosition startColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    
    CGFloat red = 0.0,
    green = 0.0,
    blue = 0.0,
    alpha = 0.0;
    CGFloat redMax = 0.0,
    greenMax = 0.0,
    blueMax = 0.0,
    alphaMax = 0.0;
    
    [self getComponentsFrom:startColor red:&red green:&green blue:&blue alpha:&alpha];
    [self getComponentsFrom:endColor red:&redMax green:&greenMax blue:&blueMax alpha:&alphaMax];
    
    return [KiddoTweenColor colorScrollWithPosition:pos maxPosition:maxPosition startRed:red startGreen:green startBlue:blue startAlpha:alpha andEndRed:redMax endGreen:greenMax endBlue:blueMax endAlpha:alphaMax];
}

- (void)setStart:(UIColor *)color {
    self.pStart = color;
    
    [KiddoTweenColor getComponentsFrom:self.pStart red:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha];
}

- (void)setEnd:(UIColor *)color {
    self.pEnd = color;
    
    [KiddoTweenColor getComponentsFrom:self.pEnd red:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha];
}

- (UIColor *) scroll:(double)position {

    
    return [KiddoTweenColor colorScrollWithPosition:position maxPosition:self.maxPosition startRed:startRed startGreen:startGreen startBlue:startBlue startAlpha:startAlpha andEndRed:endRed endGreen:endGreen endBlue:endBlue endAlpha:endAlpha];
}

@end