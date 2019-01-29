//
//  GKButtonNode.h
//  TapThatColor
//
//  Created by Cohen Adair on 2015-07-18.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TolUtilities.h"
#import "UtyColor.h"
#import "SirUserSettings.h"

@interface GKButtonNode : SKSpriteNode

@property (nonatomic) UtyColor *myColour;
@property (nonatomic) BOOL wasTappied; // so the same button can't be tapped twice for 2x the points

+ (id)withTexture:(SKTexture *)aTexture color:(UtyColor *)aColor;
+ (id)withRandomColor;
- (id)initWithTexture:(SKTexture *)aTexture color:(UtyColor *)aColor;

- (void)onCorrectTouch;
- (void)onIncorrectTouchWithCompletion:(void (^)())acompletiveBlock;
- (void)reset;

@end
