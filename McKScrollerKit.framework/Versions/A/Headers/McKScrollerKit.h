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
    PageControlTop = 1,
    PageControlBottom,
    PageControlBottomLeft,
    PageControlBottomRight
}PageControlPosition;

typedef enum {
    pageControlEnabled = 1,
    pageControlDisabled
}PageControl;

@interface McKScrollerKit : UIView
/*Set the MckScroller frame & array of content items*/
-(id)initWithFrame:(CGRect)frame withContentArray:(NSMutableArray*)array;
/*Add Page Control to the McKScroller  & place it either top,bottom,bottom-left or bottom-right the view*/
/*Default PageControl = pageControlDisabled*/
-(void)addPageControl:(PageControl)pageControl withFramePosition:(PageControlPosition)pageControlPos;
/*Manage the McKScroller orientations*/
-(void)willAnimateToFrame:(CGRect)frame;

@end
