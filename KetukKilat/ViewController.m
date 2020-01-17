//
//  ViewController.m
//  KetukKilat
//
//  Created by Christian Stevanus on 15/01/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    timerInt = 10;
    scoreInt = 0;
    gameMode = 0; //game state
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}


- (IBAction)startGame:(id)sender {
    
    if(timerInt == 10) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        
        //disable button to avoid spam
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
    }
    
    //start tap
    if(gameMode == 1)
    {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    }
    else {
        
        timerInt = 10;
        scoreInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}

-(void)startCounter {
    
    timerInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    
    //change state
    gameMode = 1;
    
    //when state changing -> enable button
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    
    //Change button title
    [self.startButton setTitle:@"Tap" forState:UIControlStateNormal];
    
    if(timerInt == 0)
    {
        [timer invalidate];
        
        ////stop tap & disable button here
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
        
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        
        [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(resart) userInfo:nil repeats:NO];
    }
}

-(void)resart {
    
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    
    gameMode = 0;
}

@end
