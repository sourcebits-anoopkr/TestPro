McKScrollerKit
==============

An iOS Framework dedicated to create a scroller view with dynamic contents (Preferably Images &amp; Virtual Views) having page indicator.

Support Platforms
=================

Works With ARC.

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

2.-(void)addMcKPageControlWithActiveDotImage:(UIImage*)activeImage withInactiveDotImage:(UIImage*)inactiveImage withDotInterspace:(int)gapWidth atPosition:(PageControlPosition)positionValue;

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
    
Use @"Image" & @"View" as keys for Image & Virtual view objects.

Add dictionary with Image and/or view instances.
If image is null,pass the null object([NSNull null]) for Image key.

Method 2
========

Add custom page control with active & inactive dot images.
Allows edit the interspace between the dots.
Position the control to top & bottom - center,left & right.

       Method 1
    NSMutableArray* scrollContentsDictArray = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:<Image>,@"Image",<View Object>,@"View",nil];
    [scrollContentsDictArray addObject:scrollContents];
    
    if(scrollerView == nil)
        scrollerView = [[McKScrollerKit alloc]initWithFrame:self.view.bounds withContentArray:scrollContentsDictArray];
        
        Method 2
    [scroller addMcKPageControlWithActiveDotImage:[UIImage imageNamed:@"active_dot"] withInactiveDotImage:[UIImage imageNamed:@"inactive_dot"] withDotInterspace:5.0 atPosition:PageControlBottomRight];

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
