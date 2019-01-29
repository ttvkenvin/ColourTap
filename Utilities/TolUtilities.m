//
//  TolUtilities.m
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TolUtilities.h"
#import "TapAlertController.h"
#import "SirUserSettings.h"

@interface TolUtilities ()

@end

@implementation TolUtilities

+ (BOOL)theiPad {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)orientatvnIsLandscape {
    return UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation);
}

+ (CGRect)scrnyBounds {
    return [UIScreen mainScreen].bounds;
}

+ (CGSize)scrniedSize {
    return [self scrnyBounds].size;
}

+ (CGFloat)factorOfScrnHeght:(CGFloat)aFactor {
    return [self scrniedSize].height * aFactor;
}

+ (void)showningStatusBar {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

+ (void)hiddenStatusBar {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

+ (void)makoringToolbarTransparent:(UIToolbar *)aToolbar {
    [aToolbar setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [aToolbar setShadowImage:[UIImage new] forToolbarPosition:UIToolbarPositionAny];
}

+ (void)makoringNavigationBarTransparent:(UINavigationBar *)aNavigationBar {
    [aNavigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [aNavigationBar setShadowImage:[UIImage new]];
    [aNavigationBar setTranslucent:YES];
    [aNavigationBar setBackgroundColor:[UIColor clearColor]];
}

+ (void)openingUrl:(NSString *)aUrl {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:aUrl]];
}

+ (CFTimeInterval)systemotyTime {
    return CACurrentMediaTime();
}

+ (void)executoryBlockAfterMs:(NSInteger)milliseconds block:(void (^)())aBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, milliseconds * USEC_PER_SEC), dispatch_get_main_queue(), ^{
        aBlock();
    });
}

+ (CGFloat)buttnyRadius {
    NSInteger buttonsPerRow = ([TolUtilities theiPad] ? 4 : 3);
    
    if ([[SirUserSettings sharedSettorings] kidsMode])
        buttonsPerRow = 2;
    else
        // an extra 1 dot per row per level of difficulty
        buttonsPerRow += [[SirUserSettings sharedSettorings] difficultyIndex];
    
    // "-1" to add some spacing between buttons
    return ([TolUtilities scrniedSize].width / (buttonsPerRow * 2)) - 1;
}

+ (void)showAlertoryWithMessage:(NSString *)aString view:(UIViewController *)aViewController {
    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:nil message:aString preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction =
        [UIAlertAction actionWithTitle:@"Ok"
                                 style:UIAlertActionStyleDefault
                               handler:nil];
    
    [alert addAction:okAction];
    [aViewController presentViewController:alert animated:YES completion:nil];
}

@end
