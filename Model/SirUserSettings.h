//
//  SirUserSettings.h
//  TapThatColour
//
//  Created by Cohen Adair on 2015-07-26.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//
//  Used for saving/retrieving NSUserDefault settings.
//

#import <Foundation/Foundation.h>
#import "PteConstants.h"

@interface SirUserSettings : NSObject

+ (id)sharedSettorings;

- (void)setMuted:(BOOL)aBool;
- (BOOL)muted;
- (void)setKidsMode:(BOOL)aBool;
- (BOOL)kidsMode;
- (void)setHighscore:(NSInteger)anInteger;
- (NSInteger)highscore;
- (void)setDifficultyIndex:(PRDifficultyIndex)aDifficulty;
- (NSInteger)difficultyIndex;
- (void)updateHighscore:(NSInteger)anInteger;

@end
