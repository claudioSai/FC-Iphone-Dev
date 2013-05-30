//
//  PolygonShape.h
//  WhatATool
//
//  Created by Chong Fu on 13-5-30.
//  Copyright (c) 2013年 Chong Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject
{
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly)float angleInDegrees;
@property (readonly)float angleInRadians;   
@property (readonly)NSString *name;
@property (readonly)NSString *description;

-(id)init;
-(id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
-(void)dealloc;

@end
