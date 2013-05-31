//
//  MyViewController.m
//  HelloPoly
//
//  Created by Chong Fu on 13-5-30.
//  Copyright (c) 2013年 Chong Fu. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad
{
    [self updateInterface];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_increaseButton release];
    [_decreaseButton release];
    [_initPoly release];
    [_numberOfSidesLabel release];
    [_polyganName release];
    [_angleInDegreesLabel release];
    [_angleInRadiansLabel release];
    [_minNumOfSidesLabel release];
    [_maxNumOfSidesLabel release];
    [_initPoly release];
    [super dealloc];
}
- (IBAction)increase:(id)sender {
    [_initPoly setNumberOfSides:[_initPoly numberOfSides] + 1];
    [self updateInterface];
}
- (IBAction)decrease:(id)sender {
    [_initPoly setNumberOfSides:[_initPoly numberOfSides] - 1];
    [self updateInterface];
}

- (void)updateInterface {
    
    // update each label
    [_numberOfSidesLabel setText:[NSString stringWithFormat:@"%d", [_initPoly numberOfSides]]];
    [_polyganName setText:[NSString stringWithFormat:@"%@",[_initPoly name]]];
    [_angleInDegreesLabel setText:[NSString stringWithFormat:@"%.0f",[_initPoly angleInDegrees]]];
    [_angleInRadiansLabel setText:[NSString stringWithFormat:@"%f",[_initPoly angleInRadians]]];
    [_minNumOfSidesLabel setText:[NSString stringWithFormat:@"%d",[_initPoly minimumNumberOfSides]]];
    [_maxNumOfSidesLabel setText:[NSString stringWithFormat:@"%d",[_initPoly maximumNumberOfSides]]];
    
    // when reaching max or min
    switch ([_initPoly numberOfSides]) {
        case 3:
            [_decreaseButton setEnabled:NO];
            NSLog(@"Reach the min number of sides!");
            break;
        case 12:
            [_increaseButton setEnabled:NO];
            NSLog(@"Reach the max number of sides!");
            break;
        default:
            [_decreaseButton setEnabled:YES];
            [_increaseButton setEnabled:YES];
            break;
    }
    
    NSLog(@"My Polygon: %@", _initPoly);
}

- (void)awakeFromNib{
//    not sure why cannot get the value for label
//    int numOfSides = [[_numberOfSidesLabel text]intValue];
//    NSString *numOS = [_numberOfSidesLabel text];
//    NSLog(@"Number of Sides: %@", numOS);
    _initPoly = [[PolygonShape alloc] initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:12];
    
    NSLog(@"My Polygon: %@", _initPoly);

}
@end
