//
//  NdBackgroundNode.h
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TolUtilities.h"
#import "GKButtonNode.h"

@interface NdBackgroundNode : SKSpriteNode

// the "other" background node needed to create an infinite scroll
@property (nonatomic) NdBackgroundNode *siblong;

#pragma mark - Initializing

+ (id)withNameString:(NSString *)aName colour:(SKColor *)aColor yStartOffsetValue:(NSInteger)anOffset;
- (id)initWithNameString:(NSString *)aName colour:(SKColor *)aColor yStartOffsetValue:(NSInteger)anOffset;

#pragma mark - Animating

- (void)startAnimating;
- (void)stopAnimatingWithReverse:(BOOL)shouldReverse completion:(void (^)())acompletiveBlock;
- (void)incAnimationSpeedBy:(CGFloat)aFloat;
- (void)update;
- (NSInteger)getTop;

#pragma mark - Buttons

- (void)addButtonNodes;
- (GKButtonNode *)buttonAtTouch:(UITouch *)aTouch;
- (GKButtonNode *)buttonAtPoint:(CGPoint)aPoint;
- (GKButtonNode *)anyButton;

@end
