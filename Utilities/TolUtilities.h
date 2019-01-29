//
//  TolUtilities.h
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//
//  Utility methods used throughout the application.
//

#import <Foundation/Foundation.h>
#import "UtyColor.h"

@interface TolUtilities : NSObject

+ (BOOL)theiPad;
+ (BOOL)orientatvnIsLandscape;
+ (CGRect)scrnyBounds;
+ (CGSize)scrniedSize;
+ (CGFloat)factorOfScrnHeght:(CGFloat)aFactor;
+ (void)showningStatusBar;
+ (void)hiddenStatusBar;
+ (void)makoringToolbarTransparent:(UIToolbar *)aToolbar;
+ (void)makoringNavigationBarTransparent:(UINavigationBar *)aNavigationBar;
+ (void)openingUrl:(NSString *)aUrl;
+ (CFTimeInterval)systemotyTime;
+ (void)executoryBlockAfterMs:(NSInteger)milliseconds block:(void (^)())aBlock;
+ (CGFloat)buttnyRadius;
+ (void)showAlertoryWithMessage:(NSString *)aString view:(UIViewController *)aViewController;

@end
