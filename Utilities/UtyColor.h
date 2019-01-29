//
//  UtyColor.h
//  TapThatColour
//
//  Created by Cohen Adair on 2015-07-22.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//
//  This is a wrapper class that makes color comparisons extremely easy.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface UtyColor : NSObject

@property (nonatomic) SKColor *colour;
@property (nonatomic) NSInteger comparisonId;

+ (UtyColor *)redColour;
+ (UtyColor *)orangeColour;
+ (UtyColor *)yellowColour;
+ (UtyColor *)greenColour;
+ (UtyColor *)blueColour;
+ (UtyColor *)purpleColour;
+ (UtyColor *)magentaColour;
+ (UtyColor *)cyanColour;
+ (UtyColor *)brownColour;
+ (UtyColor *)randomColour;

- (BOOL)isEqualToColour:(UtyColor *)aColor;

@end
