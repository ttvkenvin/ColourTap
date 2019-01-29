//
//  ProGameDifficulty.h
//  TapThatColour
//
//  Created by Cohen Adair on 2015-08-03.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProGameDifficulty : NSObject

@property (nonatomic) NSString *nameStr;
@property (nonatomic) NSString *leadrbrdId;
@property (nonatomic) NSInteger contlIndx;

+ (id)withNameStr:(NSString *)aName leadboardId:(NSString *)aLeaderboardId contrllerIndex:(NSInteger)anInteger;
- (id)initWithNameStr:(NSString *)aName leaderbrdIdnty:(NSString *)aLeaderboardId contrlIndx:(NSInteger)anInteger;

@end
