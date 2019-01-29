//
//  MenAudio.m
//  TapThatColour
//
//  Created by Cohen Adair on 2015-07-31.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "MenAudio.h"

@implementation MenAudio

+ (id)sharationdAudiol {
    static MenAudio *sharedAudio = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedAudio = [self new];
        
        sharedAudio.corrctSond =
            [SKAction playSoundFileNamed:@"correct.wav" waitForCompletion:YES];
        
        sharedAudio.incortSond =
            [SKAction playSoundFileNamed:@"incorrect.wav" waitForCompletion:YES];
    });
    
    return sharedAudio;
}

@end
