//
//  UtyColor.m
//  TapThatColour
//
//  Created by Cohen Adair on 2015-07-22.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "UtyColor.h"

@implementation UtyColor

#pragma mark - Initializing

+ (UtyColor *)redColour {
    return [[self alloc] initWithColor:[UIColor redColor] comparisonId:0];
}

+ (UtyColor *)orangeColour {
    return [[self alloc] initWithColor:[UIColor orangeColor] comparisonId:1];
}

+ (UtyColor *)yellowColour {
    return [[self alloc] initWithColor:[UIColor yellowColor] comparisonId:2];
}

+ (UtyColor *)greenColour {
    return [[self alloc] initWithColor:[UIColor greenColor] comparisonId:3];
}

+ (UtyColor *)blueColour {
    return [[self alloc] initWithColor:[UIColor blueColor] comparisonId:4];
}

+ (UtyColor *)purpleColour {
    return [[self alloc] initWithColor:[UIColor purpleColor] comparisonId:5];
}

+ (UtyColor *)magentaColour {
    return [[self alloc] initWithColor:[UIColor magentaColor] comparisonId:6];
}

+ (UtyColor *)cyanColour {
    return [[self alloc] initWithColor:[UIColor cyanColor] comparisonId:7];
}

+ (UtyColor *)brownColour {
    return [[self alloc] initWithColor:[UIColor brownColor] comparisonId:8];
}

+ (UtyColor *)randomColour {
    NSArray *colorList =
        @[[self redColour], [self orangeColour], [self yellowColour],
          [self greenColour], [self blueColour], [self magentaColour],
          [self cyanColour], [self purpleColour], [self brownColour]];
    
    return [colorList objectAtIndex:arc4random_uniform((u_int32_t)[colorList count])];
}

- (UtyColor *)initWithColor:(UIColor *)aColor comparisonId:(NSInteger)anId {
    if (self = [super init]) {
        self.colour = aColor;
        self.comparisonId = anId;
    }
    
    return self;
}

#pragma mark - Comparing

- (BOOL)isEqualToColour:(UtyColor *)aColor {
    return (self.comparisonId == aColor.comparisonId);
}

@end
