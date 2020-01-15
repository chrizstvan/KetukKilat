//
//  ViewController.h
//  KetukKilat
//
//  Created by Christian Stevanus on 15/01/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    
    int timerInt;
    int scoreInt;
    int gameMode;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;


@end

