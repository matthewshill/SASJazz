//
//  ViewController.h
//  SASJazz
//
//  Created by Matthew S. Hill on 1/12/15.
//  Copyright (c) 2015 Matthew S. Hill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) UISlider *volControl;
- (IBAction)adjustVol:(id)sender;
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)loop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *drumStickButton;
@property (weak, nonatomic) IBOutlet UIButton *feelButton;

@end

