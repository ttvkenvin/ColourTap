//
//  TapAlertController.m
//  TapThatColour
//
//  Created by Cohen Adair on 2015-04-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import "TapAlertController.h"

@interface TapAlertController ()

@end

@implementation TapAlertController

- (TapAlertController *)initWithTitleString:(NSString *)aTile
                                      messg:(NSString *)aMssg
                             actionBtnTitle:(NSString *)aBtnTitle
                                activeBlock:(void (^)())anActiveBlock
                            cancelBtunBlock:(void (^)())acancelBtunBlock
                             preferredStyle:(UIAlertControllerStyle)aStyle
                             iPadSourceView:(UIView *)aSourceView {
    
    if ((self = (TapAlertController *)[UIAlertController alertControllerWithTitle:aTile message:aMssg preferredStyle:aStyle])) {
        UIAlertAction *actiny =
            [UIAlertAction actionWithTitle:aBtnTitle
                                     style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *a) {
                                       if (anActiveBlock)
                                           anActiveBlock();
                                   }];
        
        UIAlertAction *canclActn =
            [UIAlertAction actionWithTitle:@"Cancel"
                                     style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *a) {
                                       if (acancelBtunBlock)
                                           acancelBtunBlock();
                                   }];
        
        [self addAction:actiny];
        [self addAction:canclActn];
    }
    
    // for iPads
    if ([self respondsToSelector:@selector(popoverPresentationController)]) {
        UIView *vewly = aSourceView;
        CGRect viwFrm = vewly.frame;
        CGRect oldFrm = self.popoverPresentationController.frameOfPresentedViewInContainerView;
        
        self.popoverPresentationController.sourceView = vewly;
        self.popoverPresentationController.sourceRect =
        CGRectMake(CGRectGetMaxX(viwFrm), CGRectGetMinY(viwFrm), oldFrm.size
                   .width, oldFrm.size.height);
    }
    
    return self;
}

@end
