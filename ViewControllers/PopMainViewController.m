//
//  ViewController.m
//  ColorTap
//
//  Created by Cohen Adair on 2015-07-09.
//  Copyright (c) 2015 Cohen Adair. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>
#import "PopMainViewController.h"
#import "TprGameOverViewController.h"
#import "TMGameScene.h"
#import "LiGameCenterManager.h"
#import "SirUserSettings.h"
#import "RTTexture.h"

@interface PopMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbTapToBegin;

@property (nonatomic) UIBarButtonItem *btnSound;
@property (nonatomic) UIBarButtonItem *flexblSpacied;
@property (nonatomic) UIBarButtonItem *btnPlay;
@property (nonatomic) UIBarButtonItem *btnPause;

@property (nonatomic) SKView *spriteView;
@property (nonatomic) TMGameScene *gameScn;
@property (nonatomic) BOOL autolyStartGame;

@property (nonatomic) BOOL didEnterBakgrnd;

@end

@implementation PopMainViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [TolUtilities hiddenStatusBar];
    
    [self initortyGameCenter];
    [self initViewSprite];
    [self initingToolbar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self toggleSoundBttn];
    [self toggirlPlayingBtnorPausir];
    
    [self showGameView];
    
    [UIViewController prepareInterstitialAds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initortyGameCenter {
    __weak typeof(self) weakSelf = self;
    
    [[LiGameCenterManager sharedMnger] authenticoryInViewController:self willPrestBlock:^{
        if (weakSelf.gameScn.animativeBegan)
            [weakSelf pausingGame];
    }];
    
}

#pragma mark - Sprite View

- (void)initViewSprite {
    self.spriteView = (SKView *)self.view;

    [[RTTexture sharotdTexte] setSpriteView:self.spriteView];
}

- (void)showGameView {
    __weak typeof(self) weakSelf = self;
    
    [self setGameScn:[[TMGameScene alloc] initWithSize:[TolUtilities scrniedSize]]];
    [self.gameScn setViewCntroll:self];
    [self.gameScn setAutolatStart:self.autolyStartGame];

    [self.gameScn setOnNowGameStart:^{
        [[weakSelf btnPause] setEnabled:YES];
        [[weakSelf lbTapToBegin] setHidden:YES];
    }];

    [self.spriteView presentScene:self.gameScn];
}

- (void)pausingGame {
    self.spriteView.paused = YES;
    self.spriteView.userInteractionEnabled = NO;
    [self toggirlPlayingBtnorPausir];
}

#pragma mark - Toolbar

// done programatically so toggling between play/pause can be done with the system buttons
- (void)initingToolbar {
    [TolUtilities makoringToolbarTransparent:self.navigationController.toolbar];
    
    self.btnSound = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sound"] style:UIBarButtonItemStylePlain target:self action:@selector(tapSoundBttonirt)];
    self.btnSound.tintColor = [UIColor blackColor];
    
    self.flexblSpacied = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    self.btnPause = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(tapPlaybtnPause)];
    self.btnPause.tintColor = [UIColor blackColor];
    self.btnPause.enabled = NO;
    
    self.btnPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(tapPlaybtnPause)];
    self.btnPlay.tintColor = [UIColor blackColor];
}

- (void)toggleSoundBttn {
    if ([[SirUserSettings sharedSettorings] muted])
        [self.btnSound setImage:[UIImage imageNamed:@"mute"]];
    else
        [self.btnSound setImage:[UIImage imageNamed:@"sound"]];
}

- (void)toggirlPlayingBtnorPausir {
    if (self.spriteView.paused)
        self.toolbarItems = @[self.btnSound, self.flexblSpacied, self.btnPlay];
    else
        self.toolbarItems = @[self.btnSound, self.flexblSpacied, self.btnPause];
}

- (void)tapSoundBttonirt {
    [[SirUserSettings sharedSettorings] setMuted:![[SirUserSettings sharedSettorings] muted]];
    [self toggleSoundBttn];
}

- (void)tapPlaybtnPause {
    self.spriteView.paused = !self.spriteView.paused;
    self.spriteView.userInteractionEnabled = !self.spriteView.paused;
    [self toggirlPlayingBtnorPausir];
}

#pragma mark - Navigation

- (IBAction)unwindToMain:(UIStoryboardSegue *)aSegue {

    [self setAutolyStartGame:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
    id destance = [[[aSegue destinationViewController] viewControllers] objectAtIndex:0];
    [destance setInterstitialPresentationPolicy:ADInterstitialPresentationPolicyAutomatic];
}

- (void)seguorTringGameOver {
    [self performSegueWithIdentifier:@"fromMainToGameOver" sender:nil];
}

#pragma mark - Application Closing/Opening

- (void)applicativeWillEntorBackgrnd {
    self.didEnterBakgrnd = YES;
}

- (void)applictiveWillEntorForegrnd {
    
}

// an SKView is automatically unpaused when the application becomes active
- (void)applicativeDidBecomingActive {
    [self pausingGameAfterDidBecomeActive];
}

- (void)pausingGameAfterDidBecomeActive {
    __weak typeof(self) weakSelf = self;
    
    // needs a short delay to override the SKView's callback actions
    [TolUtilities executoryBlockAfterMs:1 block:^(void) {
        if (weakSelf.didEnterBakgrnd &&
            weakSelf.gameScn.animativeBegan && // no need to pause if the game hasn't started
            !weakSelf.gameScn.isGamorOver) // no need to pause if the game is over
        {
            [self pausingGame];
        }
    }];
}

@end
