//
//  main.m
//  WhatATool Assignment 2A
//
//  Created by Chong Fu on 13-5-27.
//  Copyright (c) 2013年 Chong Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolygonShape.h"

// Section 1
void PrintPathInfo(){
 
    NSLog(@"Print path info");
    NSString *fullPath = @"~";
    // Get the full path of the tilde
    fullPath = [fullPath stringByExpandingTildeInPath];
    NSLog(@"My home folder is at %@",fullPath); // when to use '%@'? stringwithformat?

    // get the components of the path
    NSArray *pathArray = [fullPath pathComponents];
    NSLog(@"The path looks like:");
    for(NSString *component in pathArray){
        NSLog(@"%@", component);
    }
}

// Section 2
void PrintProcessInfo(){
    NSLog(@"Print process info");
    
    NSString *processname = [[NSProcessInfo processInfo] processName];
    int processID = [[NSProcessInfo processInfo] processIdentifier];
    
    NSLog(@"Process Name: %@\t Process ID: %u", processname, processID);
}

// Section 3
void PrintBookmarkInfo(){
    NSLog(@"Print bookmark info");
    
    // declaration
    NSMutableDictionary *bookmarks = [NSMutableDictionary dictionary];
    
    // set objects
    [bookmarks setObject:@"http://www.stanford.edu" forKey:@"Stanford University"];
    [bookmarks setObject:@"http://www.apple.com" forKey:@"Apple"];
    [bookmarks setObject:@"http://cs193p.stanford.edu" forKey:@"CS193P"];
    [bookmarks setObject:@"http://itunes.stanford.edu" forKey:@"Stanford on iTunes U "];
    [bookmarks setObject:@"http://stanfordshop.com" forKey:@"Stanford Mall"];

    for(NSString *element in bookmarks){
        NSString *key = element;
        NSURL *value = [bookmarks objectForKey:key];
        
        if([key hasPrefix:@"Stanford"])
            NSLog(@"Key: '%@' URL: '%@", key, value);
    }
    
}

// Section 4
void PrintIntrospectionInfo(){
    NSLog(@"Print introspection info");
    
    NSMutableArray *introSpec = [NSMutableArray arrayWithCapacity:10];
    
    // set elements :NSString, NSURL, NSProcessInfo, NSDictionary, etc.
    NSString *processName = [[NSProcessInfo processInfo] processName];
    NSMutableDictionary *bookmarks = [NSMutableDictionary dictionary];
    [bookmarks setObject:@"blueelysion@vip.qq.com" forKey:@"EMAIL"];
    
    NSString *path = [@"~" stringByExpandingTildeInPath];
    NSMutableString *qq = [NSMutableString string];
    [qq appendString:@"MY QQ IS: "];
    [qq appendFormat:@"65835661"];
    
    NSURL *qzone = [NSURL URLWithString:@"http://65835661.qzone.qq.com"];
    
    [introSpec addObject:processName];
    [introSpec addObject:bookmarks];
    [introSpec addObject:path];
    [introSpec addObject:qq];
    [introSpec addObject:qzone];
    
    for(NSObject *object in introSpec){
        NSLog(@"Class Name: %@", [object className]);
        if([object isMemberOfClass:[NSString class]]){
            NSLog(@"Is Member of NSString: YES");
        }else{
            NSLog(@"Is Member of NSString: NO");
        }
        
        if([object isKindOfClass:[NSString class]]){
            NSLog(@"Is Kind of NSString: YES");
        }else{
            NSLog(@"Is Kind of NSString: NO");
        }
        
        // SEL sel = @selector(lowercaseString);
        if([object respondsToSelector:@selector(lowercaseString)]){
            NSLog(@"Responds to lowercaseString: YES");
            NSLog(@"LowercaseString is : %@", [object lowercaseString]);
        }else{
            NSLog(@"Responds to lowercaseString:: NO");
        }
    }
    
}

// Section 6
void PrintPolygonInfo(){
    NSLog(@"Print polygon info");
    
    NSMutableArray *polygons = [[NSMutableArray alloc] init];
    PolygonShape *poly1 = [[PolygonShape alloc] init];
    PolygonShape *poly2 = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
    PolygonShape *poly3 = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
    PolygonShape *poly4 = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
//    [poly1 setNumberOfSides:12];
//    [poly1 setMinimumNumberOfSides:9];
//    [poly1 setMaximumNumberOfSides:12];
    
    [polygons addObject:poly1];
    [polygons addObject:poly2];
    [polygons addObject:poly3];
    [polygons addObject:poly4];
    
    for(id poly in polygons){
        NSLog(@"%@",[poly description]);
    }
    
    for(id poly in polygons){
        [poly setNumberOfSides:10];
    }
    
    for(id poly in polygons){
        NSLog(@"Releasing %@", [poly name]);
        [poly release];
    }
    
    [polygons release];
}

int main(int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    
    PrintPathInfo();            // Section 1
    PrintProcessInfo();         // Section 2
    PrintBookmarkInfo();        // Section 3
    PrintIntrospectionInfo();   // Section 4
    PrintPolygonInfo();          // Section 6
    [pool release];
    return 0;
}


