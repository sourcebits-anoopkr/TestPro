//
//  ViewController.m
//  TestPro
//
//  Created by Sourcebits on 23/12/14.
//  Copyright (c) 2014 McKinsey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    McKScrollerKit* scroller;

}
@property (weak, nonatomic) IBOutlet UIView *superView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIView *virtualView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSMutableArray* contentsArr = [[NSMutableArray alloc]init];
    NSMutableDictionary *scrollContents;
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"2.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"5.png"],@"Image",_virtualView ,@"View",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"6.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];

    
    if(scroller == nil)
        scroller = [[McKScrollerKit alloc]initWithFrame:self.view.bounds withContentArray:contentsArr];
    [scroller addPageControl:pageControlEnabled withFramePosition:PageControlBottom];
    [self.view addSubview:scroller];

}


-(void)viewDidLayoutSubviews{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        [scroller willAnimateToFrame:self.view.bounds];
    else
        [scroller willAnimateToFrame:self.view.bounds];

}

- (IBAction)buttonAction:(id)sender {
    
    [UIView animateWithDuration:2.0 animations:^{
        _btn1.layer.backgroundColor = [UIColor redColor].CGColor;
    } completion:NULL];
    
}

@end
