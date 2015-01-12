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

    [_virtualView setFrame:CGRectMake(0, 0, [ViewController screenSize].width, [ViewController screenSize].height)];
    
    NSMutableArray* contentsArr = [[NSMutableArray alloc]init];
    NSMutableDictionary *scrollContents;
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"2.png"],@"Image",_virtualView ,@"View",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"5.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];
    
    scrollContents = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"6.png"],@"Image",nil];
    [contentsArr addObject:scrollContents];

    [_virtualView setFrame:CGRectMake(0, 0, [ViewController screenSize].width, [ViewController screenSize].height)];

    if(scroller == nil)
        scroller = [[McKScrollerKit alloc]initWithFrame:CGRectMake(0, 0, [ViewController screenSize].width, [ViewController screenSize].height) withContentArray:contentsArr];
    [scroller addPageControl:pageControlEnabled withFramePosition:PageControlBottomLeft];
    [self.view addSubview:scroller];
}


-(void)viewWillLayoutSubviews{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [_virtualView setFrame:CGRectMake(100, 0, [ViewController screenSize].width, [ViewController screenSize].height)];
    [scroller willAnimateToFrame:CGRectMake(0, 0, [ViewController screenSize].width, [ViewController screenSize].height)];
}

- (IBAction)buttonAction:(id)sender {
    
    [UIView animateWithDuration:2.0 animations:^{
            _btn1.layer.backgroundColor = [UIColor orangeColor].CGColor;
    } completion:^(BOOL finished)
    {
        if(finished) {
            [UIView animateWithDuration:2.0 animations:^{
                _btn1.layer.backgroundColor = [UIColor redColor].CGColor;
            } completion:^(BOOL finished)
            {
                if(finished)
                {
                    [UIView animateWithDuration:2.0 animations:^{
                        _btn1.layer.backgroundColor = [UIColor greenColor].CGColor;
                    } completion:NULL];
                }
            }];
        }
    }];
    
}

+ (CGSize)screenSize {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

@end
