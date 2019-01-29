//
//  ProGameDifficulty.m
//  TapThatColour
//
//  Created by Cohen Adair on 2015-08-03.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "ProGameDifficulty.h"

@implementation ProGameDifficulty

+ (id)withNameStr:(NSString *)aName leadboardId:(NSString *)aLeaderboardId contrllerIndex:(NSInteger)anInteger {
    return [[self alloc] initWithNameStr:aName leaderbrdIdnty:aLeaderboardId contrlIndx:anInteger];

}

- (id)initWithNameStr:(NSString *)aName leaderbrdIdnty:(NSString *)aLeaderboardId contrlIndx:(NSInteger)anInteger {
    if (self = [super init]) {
        self.nameStr = aName;
        self.leadrbrdId = aLeaderboardId;
        self.contlIndx = anInteger;
    }
    
    return self;
}

@end
