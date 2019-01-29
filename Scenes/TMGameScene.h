//
//  TMGameScene.h
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PopMainViewController.h"
#import "CLScoreboardNode.h"
#import "NdBackgroundNode.h"

@interface TMGameScene : SKScene

@property (nonatomic) PopMainViewController *viewCntroll;
@property (nonatomic) CLScoreboardNode *scorebrdNde;
@property (nonatomic) BOOL autolatStart; // used when users tap the "replay" button
@property (nonatomic, copy) void (^onNowGameStart)();
@property (nonatomic) BOOL isGamorOver; // used to prevent unwanted update: calls
@property (nonatomic) BOOL animativeBegan;

@end
