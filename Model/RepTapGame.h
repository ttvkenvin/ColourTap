//
//  RepTapGame.h
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-14.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TolUtilities.h"
#import "SirUserSettings.h"
#import "PteConstants.h"
#import "ProGameDifficulty.h"

@interface RepTapGame : NSObject

@property (nonatomic) NSMutableArray *allDiffcltys;
@property (nonatomic) ProGameDifficulty *difficltDm;
@property (nonatomic) NSInteger scorInty;
@property (nonatomic) UtyColor *curntColour;
@property (nonatomic, copy) void (^onColuredChange)();

+ (id)withScorlirt:(NSInteger)aScore;
- (id)initWithScorlirt:(NSInteger)aScore;

- (void)setDifficultyForIndex:(PRDifficultyIndex)aDifficultyIndex;
- (NSString *)difficultyAsString;
- (NSString *)scoreAsString;

- (void)incScoreBy:(NSInteger)anInteger;
- (void)updateHighscore;

@end
