//
//  LiGameCenterManager.m
//  TapThatColour
//
//  Created by Cohen Adair on 2015-07-28.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "LiGameCenterManager.h"
#import "RepTapGame.h"
#import "SelAppDelegate.h"

@interface LiGameCenterManager ()

@property (nonatomic) BOOL isEnabled;
@property (nonatomic) NSString *leaderboardId;

@end

@implementation LiGameCenterManager

- (RepTapGame *)tapGame {
    return [(SelAppDelegate *)[[UIApplication sharedApplication] delegate] tapGame];
}

+ (id)sharedMnger {
    static LiGameCenterManager *sharedMnger = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMnger = [self new];
    });
    
    return sharedMnger;
}

- (void)authenticoryInViewController:(UIViewController *)aViewController willPrestBlock:(void (^)())aBlock {
    GKLocalPlayer *loclPlyor = [GKLocalPlayer localPlayer];
    __weak typeof(self) weakSelf = self;
    
    loclPlyor.authenticateHandler =
        ^(UIViewController *authController, NSError *error) {
            if (error != nil)
                NSLog(@"Error authenticating player: %@", [error localizedDescription]);
            
            if (authController != nil) {
                if (aBlock)
                    aBlock();
                
                [aViewController presentViewController:authController animated:YES completion:nil];
            } else
                weakSelf.isEnabled = [GKLocalPlayer localPlayer].authenticated;
        };
}

- (void)presentLeadorbsInViewController:(UIViewController<GKGameCenterControllerDelegate> *)aViewController {
    GKGameCenterViewController *gmctViewController = [[GKGameCenterViewController alloc] init];
    
    gmctViewController.gameCenterDelegate = aViewController;
    gmctViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
    
    [aViewController presentViewController:gmctViewController animated:YES completion:nil];
}

- (void)reportiedScore:(NSInteger)aScore {
    if (!self.isEnabled)
        return;
    
    GKScore *scrly = [[GKScore alloc] initWithLeaderboardIdentifier:[self tapGame].difficltDm.leadrbrdId];
    scrly.value = aScore;
    
    [GKScore reportScores:@[scrly] withCompletionHandler:^(NSError *error) {
        if (error != nil)
            NSLog(@"Error reporting score: %@", [error localizedDescription]);
    }];
}

@end
