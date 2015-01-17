//
//  ViewController.m
//  SASJazz
//
//  Created by Matthew S. Hill on 1/12/15.
//  Copyright (c) 2015 Matthew S. Hill. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    UIButton *playButton;
    UIButton *stopButton;
    UIButton *pauseButton;
    UIButton *slowRateButton;
    UIButton *ogRateButton;
    UIButton *loopButton;
    UIButton *medRateButton;
    UIButton *fastRateButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [NSString stringWithFormat:@"%@/DRUM_LOOP_FOR_MATTHEW.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
    
    if (error) {
        NSLog(@"Error in audioPlayer: %@", [error localizedDescription]);
    }
    else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
        _audioPlayer.enableRate = YES;
    }
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup{
    _volControl = [[UISlider alloc] initWithFrame:CGRectMake(20, 60, 320, 10)];
    [_volControl addTarget:self action:@selector(adjustVol:) forControlEvents:UIControlEventTouchUpInside];
    _volControl.value = _audioPlayer.volume;
    [self.view addSubview:_volControl];
    
    playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame = CGRectMake(145, 90, 60, 40);
    playButton.layer.borderWidth = 1.0f;
    [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    playButton.userInteractionEnabled = YES;
    [self.view addSubview:playButton];

    pauseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pauseButton.frame = CGRectMake(212, 90, 60, 40);
    pauseButton.layer.borderWidth = 1.0f;
    [pauseButton addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchUpInside];
    [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    pauseButton.userInteractionEnabled = YES;
    [self.view addSubview:pauseButton];
    
    stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(278, 90, 60, 40);
    stopButton.layer.borderWidth = 1.0f;
    [stopButton addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    stopButton.userInteractionEnabled = YES;
    [self.view addSubview:stopButton];
    
    slowRateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    slowRateButton.frame = CGRectMake(65, 269, 60, 40);
    [slowRateButton addTarget:self action:@selector(slowRate:) forControlEvents:UIControlEventTouchUpInside];
    [slowRateButton setTitle:@"Slow" forState:UIControlStateNormal];
    slowRateButton.userInteractionEnabled = YES;
    [self.view addSubview:slowRateButton];
    
    ogRateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ogRateButton.frame = CGRectMake(145, 135, 60, 40);
    ogRateButton.layer.borderWidth = 1.0f;
    [ogRateButton addTarget:self action:@selector(ogRate:) forControlEvents:UIControlEventTouchUpInside];
    [ogRateButton setTitle:@"Slow" forState:UIControlStateNormal];
    [self.view addSubview:ogRateButton];
    
    medRateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    medRateButton.frame = CGRectMake(212, 135, 60, 40);
    medRateButton.layer.borderWidth = 1.0f;
    [medRateButton addTarget:self action:@selector(medRate:) forControlEvents:UIControlEventTouchUpInside];
    [medRateButton setTitle:@"Medium" forState:UIControlStateNormal];
    [self.view addSubview:medRateButton];
    
    fastRateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fastRateButton.frame = CGRectMake(278, 135, 60, 40);
    fastRateButton.layer.borderWidth = 1.0f;
    [fastRateButton addTarget:self action:@selector(fastRate:) forControlEvents:UIControlEventTouchUpInside];
    [fastRateButton setTitle:@"Fast" forState:UIControlStateNormal];
    [self.view addSubview:fastRateButton];
    
    loopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loopButton.frame = CGRectMake(75, 90, 60, 40);
    loopButton.layer.borderWidth = 1.0f;
    [loopButton addTarget:self action:@selector(loop:) forControlEvents:UIControlEventTouchUpInside];
    [loopButton setTitle:@"Loop" forState:UIControlStateNormal];
    loopButton.userInteractionEnabled = YES;
    [self.view addSubview:loopButton];
    
}
#pragma mark AVAudioPlayerDelegate Protocol Methods

#pragma UI instance methods
- (IBAction)adjustVol:(id)sender {
    if (_audioPlayer != nil) {
        _audioPlayer.volume = _volControl.value;
    }
}
- (IBAction)slowRate:(id)sender{
    _audioPlayer.rate = 0.5f;
}
-(IBAction)ogRate:(id)sender{
    _audioPlayer.rate = 1.0f;
    //_audioPlayer.currentTime = 0.0;
    _audioPlayer.numberOfLoops = 0;
}
-(IBAction)medRate:(id)sender{
    _audioPlayer.rate = 1.396f;
}
-(IBAction)fastRate:(id)sender{
    _audioPlayer.rate = 1.792f;
}
- (IBAction)play:(id)sender{
    if (![_audioPlayer play]) {
        [_audioPlayer play];
    }
}
- (IBAction)stop:(id)sender{
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0.0;
}
- (IBAction)loop:(id)sender{
    _audioPlayer.numberOfLoops = -1;
    NSLog(@"loop");
}
- (IBAction)pause:(id)sender{
    [_audioPlayer pause];
}

@end