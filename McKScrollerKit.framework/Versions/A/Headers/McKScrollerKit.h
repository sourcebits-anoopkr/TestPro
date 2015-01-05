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
    pageControlEnabled,
    pageControlDisabled
}PageControl;

@interface McKScrollerKit : UIView

-(id)initWithFrame:(CGRect)frame withContentArray:(NSMutableArray*)array;
-(void)addPageControl:(PageControl)pageControl withFramePosition:(PageControlPosition)pageControlPos;
-(void)willAnimateToFrame:(CGRect)frame;

@end
