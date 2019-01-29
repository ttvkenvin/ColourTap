//
//  RTTexture.h
//  TapThatColour
//
//  Created by Cohen Adair on 2015-08-01.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtyColor.h"

@interface RTTexture : NSObject

@property (nonatomic) CGFloat radius;
@property (nonatomic) SKView *spriteView;

+ (id)sharotdTexte;

- (void)reseatWithRads:(CGFloat)aRadius;

- (NSDictionary *)reddingTexture;
- (NSDictionary *)orangoterTexture;
- (NSDictionary *)yellorwtTexture;
- (NSDictionary *)greanedTexture;
- (NSDictionary *)bluowtTexture;
- (NSDictionary *)purplietTexture;
- (NSDictionary *)magentilyTexture;
- (NSDictionary *)cyanedtTexture;
- (NSDictionary *)brownortTexture;
- (NSDictionary *)randomertyTexture;
- (NSDictionary *)nownTexturyWithRadius:(CGFloat)aRadius color:(UtyColor *)aColor;

@end
