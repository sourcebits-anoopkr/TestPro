McKScrollerKit
==============

An iOS Framework dedicated to create a scroller view with dynamic contents (Preferably Images &amp; Virtual Views) having page indicator.

Support Platforms
=================

Both ARC & NON_ARC ENABLED Projects.

Deployment Target - iOS 7.0 or later.

Installation
============

Download the repo from github

Drag McKScrollerKit.framework to your project.

In the Build Phases tab of your app's Target, under the "Link Binary With Libraries" section, hit the add button and add: UIKit.framework, Foundation.framework,If not added

That's it. You are now ready to integrate!


Integration
===========

Import McKScrollerKit file (i.e,#import <McKScrollerKit/McKScrollerKit.h>) to the controller class which requires McKScroller view to be presented.

Basically,McKScrollerKit provides you three methods as listed below.

1.-(id)initWithFrame:(CGRect)frame withContentArray:(NSMutableArray*)array;

2.-(void)addPageControl:(PageControl)pageControl withFramePosition:(PageControlPosition)pageControlPos;

3.-(void)willAnimateToFrame:(CGRect)frame;

Method 1 
========

Instantiate McKScrollerKit instance with this custom -init method.

It takes frame & scroller content array(Array Of Dictionaries) as arguments.

frame - Scroll View rect
array - Array of dictionaries with two key-value 

    NSMutableArray* scrollContentsDictArray = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:<Image>,@"Image",<View Object>,@"View",nil];
    [scrollContentsDictArray addObject:scrollContents];
    
@"Image" & @"View" are the keys for image & virtual view objects.

Method 2
========

Add page control & takes two enum values -  First to opt Page indicator to be displayed/not. Latter for positioning the indicator to top or bottom of McKScroller View.

       Method 1
    NSMutableArray* scrollContentsDictArray = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:<Image>,@"Image",<View Object>,@"View",nil];
    [scrollContentsDictArray addObject:scrollContents];
    
    if(scrollerView == nil)
        scrollerView = [[McKScrollerKit alloc]initWithFrame:self.view.bounds withContentArray:scrollContentsDictArray];
        
        Method 2
    [scrollerView addPageControl:pageControlEnabled withFramePosition:PageControlBottom];

Method 3
========

Helps you to animate the scroller view frame in required orientations.

Integrate this method in your viewcontroller class.

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
 
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        [scrollerView willAnimateToFrame:self.view.bounds];
    else
        [scrollerView willAnimateToFrame:CGRectMake(100,100,824,568)];
        
}


HAPPY CODING!!!
