//
//  ViewController.m
//  TrashApp
//
//  Created by Hitesh Kumar on 06/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *trashButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    
    [self.imgView setUserInteractionEnabled:YES];
    [self.imgView addGestureRecognizer:panGesture];
}
-(void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    
//    CGPoint translation = [recognizer translationInView:self.imgView];
//    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
//                                         recognizer.view.center.y + translation.y);
//    [recognizer setTranslation:CGPointMake(0, 0) inView:self.imgView];
    
    
    CGPoint translate = [recognizer translationInView:self.imgView];
    
    CGRect newFrame = self.imgView.frame;
    
    //sender.view.frame = newFrame; // comment this it don't want faster move

    if(recognizer.state == UIGestureRecognizerStateChanged){
        newFrame.origin.x += translate.x;
        newFrame.origin.y += translate.y;
        self.imgView.frame = newFrame;
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
//    for hide when image will touch the button
    if (self.imgView.frame.origin.y + self.imgView.frame.size.height > self.trashButton.frame.origin.y) {
        [self.imgView setHidden:YES];
        NSLog(@"Hidden");
    }

}
- (IBAction)myButton:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    CGPoint loc = [[[touches allObjects] firstObject] locationInView:self.view];
//    CGPoint previousLocation = [[[touches allObjects] firstObject] previousLocationInView:self.view];
//    self.imgView.frame = CGRectOffset(self.imgView.frame, (loc.x - previousLocation.x), ((loc.y - previousLocation.y)));
//    
//}


@end
