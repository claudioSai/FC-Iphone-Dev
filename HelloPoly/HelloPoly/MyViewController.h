//
//  MyViewController.h
//  HelloPoly
//
//  Created by Chong Fu on 13-5-30.
//  Copyright (c) 2013年 Chong Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"

@interface MyViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *increaseButton;
@property (retain, nonatomic) IBOutlet UIButton *decreaseButton;
@property (retain, nonatomic) IBOutlet PolygonShape *initPoly;
@property (retain, nonatomic) IBOutlet UILabel *numberOfSidesLabel;

@property (retain, nonatomic) IBOutlet UILabel *polyganName;
@property (retain, nonatomic) IBOutlet UILabel *angleInDegreesLabel;
@property (retain, nonatomic) IBOutlet UILabel *angleInRadiansLabel;
@property (retain, nonatomic) IBOutlet UILabel *minNumOfSidesLabel;
@property (retain, nonatomic) IBOutlet UILabel *maxNumOfSidesLabel;

- (IBAction)increase:(id)sender;
- (IBAction)decrease:(id)sender;
- (void)updateInterface;
@end
