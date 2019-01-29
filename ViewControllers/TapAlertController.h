//
//  TapAlertController.h
//  AnglersLog
//
//  Created by Cohen Adair on 2015-04-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapAlertController : UIAlertController

@property (strong, nonatomic)NSString *myTitleStr;
@property (strong, nonatomic)NSString *myMssg;
@property (strong, nonatomic)NSString *btnMyActionTitle;

@property (strong, nonatomic)void (^actionBtnBlock)();
@property (strong, nonatomic)void (^cancelBtunBlock)();
@property (strong, nonatomic)void (^completiveBlock)();

- (TapAlertController *)initWithTitleString:(NSString *)aTile
                             messg:(NSString *)aMssg
                   actionBtnTitle:(NSString *)aBtnTitle
                         activeBlock:(void (^)())anActiveBlock
                         cancelBtunBlock:(void (^)())acancelBtunBlock
                      preferredStyle:(UIAlertControllerStyle)aStyle
                      iPadSourceView:(UIView *)aSourceView;

@end
