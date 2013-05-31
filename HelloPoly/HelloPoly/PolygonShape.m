//
//  PolygonShape.m
//  WhatATool
//
//  Created by Chong Fu on 13-5-30.
//  Copyright (c) 2013年 Chong Fu. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

-(void)dealloc{
    NSLog(@"Deallocating!");
    [super dealloc];
}

-(id)init{
    if(self = [super init]){
        // !!!Set sequence is important!
        [self setMinimumNumberOfSides:3];
        [self setMaximumNumberOfSides:10];
        [self setNumberOfSides:5];
    }
    return self;
}

-(id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max{
    // !!!Set sequence is important!
    if(self = [super init]){
        [self setMinimumNumberOfSides:min];
        [self setMaximumNumberOfSides:max];
        [self setNumberOfSides:sides];
    }
    return self;
}

-(void)setNumberOfSides:(int)sides{
    if(sides < minimumNumberOfSides || sides > maximumNumberOfSides){
        if(sides < minimumNumberOfSides){
            NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", sides, minimumNumberOfSides);
        }else{
            NSLog(@"Invalid number of sides: %d is more than the maximum of %d allowed", sides, maximumNumberOfSides);
        }
    }else{
        numberOfSides = sides;
    }
}

-(void)setMinimumNumberOfSides:(int)min{
    if(min < 3){
        NSLog(@"Too low!");
    }else{
        minimumNumberOfSides = min;
    }
}

-(void)setMaximumNumberOfSides:(int)max{
    if(max > 12){
        NSLog(@"Too high!");
    }else{
        maximumNumberOfSides = max;
    }
}

-(float)angleInDegrees{
    return (180 * (numberOfSides - 2) / numberOfSides);
}

-(float)angleInRadians{
    return(M_PI * (numberOfSides - 2) / numberOfSides);
}

-(NSString *)name{
    NSMutableDictionary *names = [NSMutableDictionary dictionary];
    [names setObject:@"Tiangle" forKey:[NSNumber numberWithInt:3]];
    [names setObject:@"Square" forKey:[NSNumber numberWithInt:4]];
    [names setObject:@"Pentagon" forKey:[NSNumber numberWithInt:5]];
    [names setObject:@"Hexagon" forKey:[NSNumber numberWithInt:6]];
    [names setObject:@"Heptagon" forKey:[NSNumber numberWithInt:7]];
    [names setObject:@"Octagon" forKey:[NSNumber numberWithInt:8]];
    [names setObject:@"Nonagon" forKey:[NSNumber numberWithInt:9]];
    [names setObject:@"Decagon" forKey:[NSNumber numberWithInt:10]];
    [names setObject:@"Hendecagon" forKey:[NSNumber numberWithInt:11]];
    [names setObject:@"Dodecagon" forKey:[NSNumber numberWithInt:12]];
    
    return [names objectForKey:[NSNumber numberWithInt:[self numberOfSides]]];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %.0f degrees(%f radians).", [self numberOfSides], [self name], [self angleInDegrees], [self angleInRadians]];
}

@end
