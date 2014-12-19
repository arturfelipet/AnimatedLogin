//
//  AnimatedLoginViewController.m
//  AnimatedLogin
//
//  Created by Artur Felipe on 7/18/13.
//  Copyright (c) 2013 own. All rights reserved.
//

#import "AnimatedLoginViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface AnimatedLoginViewController (){
	MPMoviePlayerController *player;
}

@property (nonatomic, strong) MPMoviePlayerController *player;

@end

@implementation AnimatedLoginViewController

@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	CGRect screen = [[UIScreen mainScreen] bounds];
	
	NSURL *movieUrl = [[NSBundle mainBundle] URLForResource:@"background"  withExtension:@"mp4"];
	
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:movieUrl];
	
	player.view.frame = screen;
	player.scalingMode = MPMovieScalingModeFill;
	[self.player setControlStyle:MPMovieControlStyleNone];
	[self.view addSubview:player.view];
	[player prepareToPlay];
	
	
	UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(90, 60, 150, 70)];
	logo.backgroundColor = [UIColor clearColor];
	[logo setImage:[UIImage imageNamed:@"VineLogo.png"]];
	
	[self.view addSubview:logo];
	
	
	UIFont *boldFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
	UIFont *defaultFont = [UIFont fontWithName:@"HelveticaNeue" size:16.0];
	
	
	NSDictionary * attributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], defaultFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	NSDictionary * attributesBold = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], boldFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	
	UIButton *twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [twitterButton setFrame:CGRectMake(10, screen.size.height==568?400:310, 300, 43)];
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Sign in with " attributes:attributes]];
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Twitter" attributes:attributesBold]];
	[twitterButton setAttributedTitle:attributedString forState:UIControlStateNormal];
    [twitterButton setBackgroundImage:[UIImage imageNamed:@"SignInTwitterButton.png"] forState:UIControlStateNormal];
	[twitterButton setBackgroundImage:[UIImage imageNamed:@"SignInTwitterButtonTap.png"] forState:UIControlStateHighlighted];
	[twitterButton setBackgroundImage:[UIImage imageNamed:@"SignInTwitterButtonTap.png"] forState:UIControlStateSelected];
    [twitterButton setEnabled:YES];
    [self.view addSubview:twitterButton];
	
	
	attributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], defaultFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	attributesBold = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], boldFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	UIButton *emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [emailButton setFrame:CGRectMake(10, screen.size.height==568?455:370, 300, 43)];
	
	attributedString = [[NSMutableAttributedString alloc] init];
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Sign up with " attributes:attributes]];
	
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Email" attributes:attributesBold]];
	[emailButton setAttributedTitle:attributedString forState:UIControlStateNormal];

    [emailButton setBackgroundImage:[UIImage imageNamed:@"SignInMailButton.png"] forState:UIControlStateNormal];
	[emailButton setBackgroundImage:[UIImage imageNamed:@"SignInMailButtonTap.png"] forState:UIControlStateHighlighted];
	[emailButton setBackgroundImage:[UIImage imageNamed:@"SignInMailButtonTap.png"] forState:UIControlStateSelected];
    [emailButton setEnabled:YES];
    [self.view addSubview:emailButton];
	
	
	boldFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
	defaultFont = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
	
	attributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor grayColor], defaultFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	attributesBold = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], boldFont, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
	
	UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [signInButton setFrame:CGRectMake(10, screen.size.height==568?500:410, 300, 43)];
	
	attributedString = [[NSMutableAttributedString alloc] init];
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Already have an account? " attributes:attributes]];
	
	[attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Sign in now" attributes:attributesBold]];
	[signInButton setAttributedTitle:attributedString forState:UIControlStateNormal];
    [signInButton setEnabled:YES];
    [self.view addSubview:signInButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playVideo)
                                                 name:MPMoviePlayerReadyForDisplayDidChangeNotification
                                               object:player];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playVideo)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:player];
	
	[player play];
}

-(void)playVideo{
	[player play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
