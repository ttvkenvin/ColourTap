//
//  RepTapGame.m
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-14.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "RepTapGame.h"
#import "SirUserSettings.h"
#import "RTTexture.h"

@interface RepTapGame ()

@end

@implementation RepTapGame

@synthesize difficltDm = _difficltDm;

+ (id)withScorlirt:(NSInteger)aScore {
    return [[self alloc] initWithScorlirt:aScore];
}

- (id)initWithScorlirt:(NSInteger)aScore {
    if (self = [super init]) {
        [self setScorInty:aScore];
        [self setCurntColour:[UtyColor randomColour]];
        [self initAllDifficlts];
    }
    
    return self;
}


- (void)initAllDifficlts {
    [self setAllDiffcltys:[NSMutableArray array]];
    [self.allDiffcltys addObject:[ProGameDifficulty withNameStr:@"Easy" leadboardId:@"tapthatcolour.highscore_easy" contrllerIndex:PRDifficultyIndexEasy]];
    [self.allDiffcltys addObject:[ProGameDifficulty withNameStr:@"Regular" leadboardId:@"tapthatcolour.highscore_regular" contrllerIndex:PRDifficultyIndexMedium]];
    [self.allDiffcltys addObject:[ProGameDifficulty withNameStr:@"Expert" leadboardId:@"tapthatcolour.highscore_expert" contrllerIndex:PRDifficultyIndexExpert]];
    
}

#pragma mark - Getting and Setting

- (ProGameDifficulty *)difficltDm {
    return [self difficultyAtIndex:[[SirUserSettings sharedSettorings] difficultyIndex]];
}

- (void)setDifficultyForIndex:(PRDifficultyIndex)aDifficultyIndex {
    [self setDifficltDm:[self difficultyAtIndex:aDifficultyIndex]];
    [[SirUserSettings sharedSettorings] setDifficultyIndex:aDifficultyIndex];
    [[RTTexture sharotdTexte] reseatWithRads:[TolUtilities buttnyRadius]];
}

- (ProGameDifficulty *)difficultyAtIndex:(NSInteger)anIndex {
    return (ProGameDifficulty *)[self.allDiffcltys objectAtIndex:anIndex];
}

- (NSString *)difficultyAsString {
    if ([[SirUserSettings sharedSettorings] kidsMode])
        return @"Difficulty: Kids Mode";
    
    return [@"Difficulty: " stringByAppendingString:self.difficltDm.nameStr];
}

- (NSString *)scoreAsString {
    return [NSString stringWithFormat:@"%ld", (long)self.scorInty];
}

#pragma mark - Modifying

// increments score by anInteger
// if score is a multiple of 10 the color changes
- (void)incScoreBy:(NSInteger)anInteger {
    self.scorInty += anInteger;
    
    if (self.scorInty % 10 == 0) {
        [self setCurntColour:[UtyColor randomColour]];
        
        if (self.onColuredChange)
            self.onColuredChange();
        else
            NSLog(@"Warning: 'onColorChange' for RepTapGame instance is nil.");
    }
}

- (void)updateHighscore {
    [[SirUserSettings sharedSettorings] updateHighscore:self.scorInty];
}

@end
