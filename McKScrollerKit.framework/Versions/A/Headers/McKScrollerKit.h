//
//  McKScroller.h
//  scrollerFun
//
//  Created by Sourcebits on 02/01/15.
//  Copyright (c) 2015 McKinsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum{
    PageControlTopCenter = 1,
    PageControlTopLeft,
    PageControlTopRight,
    PageControlBottomCenter,
    PageControlBottomLeft,
    PageControlBottomRight
}PageControlPosition;

@interface McKScrollerKit : UIView
/*Set the MckScroller frame & array of content items*/
-(id)initWithFrame:(CGRect)frame withContentArray:(NSMutableArray*)array;
/*Add custom Page Control with active & inactive images for dots,insterpace between dots & dynamically place it on the screen*/
-(void)addMcKPageControlWithActiveDotImage:(UIImage*)activeImage withInactiveDotImage:(UIImage*)inactiveImage withDotInterspace:(int)gapWidth atPosition:(PageControlPosition)positionValue;
/*Manage the McKScroller orientations*/
-(void)willAnimateToFrame:(CGRect)frame;

@end
