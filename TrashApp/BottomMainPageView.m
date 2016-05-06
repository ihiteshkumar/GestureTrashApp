
//#import "BottomMainPageView.h"
//#import "MainPageViewController.h"
//
//
//@implementation BottomMainPageView
//{
//    NSUserDefaults * userDeafults ;
//    int parked;
//    int fixed;
//    NSTimer * timer;
//    CGPoint newPosition;
//    NSTimeInterval duration ;
//    UIPanGestureRecognizer * mainRecognizer;
//}
//
//+(BottomMainPageView *) createInstance
//{
//    BottomMainPageView* xibView = [[[NSBundle mainBundle] loadNibNamed:@"BottomMainPageView" owner:self options:nil] objectAtIndex:0];
//    //    xibView.frame = xibView.bounds;
//    
//    return xibView;
//}
//
//-(void) didMoveToSuperview
//{
//    [self dragFunctionImpl];
//    [self storageFunction];
//    [self.finalCarBound.layer setCornerRadius:40.0f];
//    [self.finalCarBound.layer setShadowColor:[UIColor blackColor].CGColor];
//    [self.finalCarBound.layer setShadowOpacity:0.8];
//    [self.finalCarBound.layer setShadowRadius:3.0];
//    [self.finalCarBound.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
//    
//    [self.initialCarBound.layer setCornerRadius:40.0f];
//    [self.initialCarBound.layer setShadowColor:[UIColor blackColor].CGColor];
//    [self.initialCarBound.layer setShadowOpacity:0.8];
//    [self.initialCarBound.layer setShadowRadius:3.0];
//    [self.initialCarBound.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
//    
//}
//
//-(void) didMoveToWindow
//{
//    if([userDeafults objectForKey:@"carPositionX"] != nil)
//    {
//        CGFloat x = [userDeafults floatForKey:@"carPositionX"];
//        CGFloat y = [userDeafults floatForKey:@"carPositionY"];
//        
//        [self.carImage setFrame:CGRectMake(x-50, y-43, self.carImage.frame.size.width, self.carImage.frame.size.height)];
//        
//        self.carImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin   |
//        UIViewAutoresizingFlexibleRightMargin  |
//        UIViewAutoresizingFlexibleTopMargin    |
//        UIViewAutoresizingFlexibleBottomMargin |
//        UIViewAutoresizingFlexibleWidth        |
//        UIViewAutoresizingFlexibleHeight;
//        
//        self.carImage.contentMode = UIViewContentModeScaleAspectFit;
//        self.carImage.translatesAutoresizingMaskIntoConstraints = YES;
//        
//        
//    }
//}
//
//-(void) storageFunction
//{
//    userDeafults = [NSUserDefaults standardUserDefaults];
//    if([userDeafults objectForKey:@"carPositionX"] != nil)
//    {
//        CGFloat x = [userDeafults floatForKey:@"carPositionX"];
//        CGFloat y = [userDeafults floatForKey:@"carPositionY"];
//        
//        [self.carImage setFrame:CGRectMake(x-50, y-43, self.carImage.frame.size.width, self.carImage.frame.size.height)];
//        
//    }
//    if([userDeafults objectForKey:@"parked"] != nil)
//    parked = (int)[userDeafults integerForKey:@"parked"];
//    
//}
//
//
//-(void) dragFunctionImpl
//{
//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveObject:)];
//    [panRecognizer setMinimumNumberOfTouches:1];
//    [panRecognizer setMaximumNumberOfTouches:1];
//    [self.carImage addGestureRecognizer:panRecognizer];
//    fixed = 0;
//}
//
//-(void) timerInvoked
//{
//    if([self.delegate getWaitingForAvailabilityResponse] == 0 && parked == 0)
//    {
//        newPosition = self.finalCarBound.center;
//        if(CGRectGetMaxX( mainRecognizer.view.frame ) > CGRectGetMinX( self.finalCarBound.frame) )
//        {
//            [UIView animateWithDuration:duration
//                             animations:^{
//                                 mainRecognizer.view.center = newPosition;
//                                 parked = 1;
//                                 fixed = 1;
//                             }
//             
//                             completion:^(BOOL finished) {
//                                 
//                                 UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Welcome To Snapdeal !!!" message:@"Come freely. Go safely. And leave something of the happiness you bring." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                                 [alert show];
//                                 fixed = 0;
//                                 [self carAnimationFinished:mainRecognizer];
//                                 [self.delegate carAddSendRequest];
//                             }
//             ];
//            
//            [timer invalidate];
//            [self.initialCarBound setBackgroundColor:[UIColor clearColor]];
//            [self.finalCarBound setBackgroundColor:[UIColor clearColor]];
//        }
//    }
//    else if([self.delegate getWaitingForAvailabilityResponse] == -1)
//    {
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Car Parking Full !!!" message:@"Sorry there is no space for your car." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        newPosition = self.initialCarBound.center;
//        [UIView animateWithDuration:duration animations:^{
//            mainRecognizer.view.center = newPosition;
//            parked = 0;
//            fixed = 1;
//        }];
//        [timer invalidate];
//        [self.initialCarBound setBackgroundColor:[UIColor clearColor]];
//        [self.finalCarBound setBackgroundColor:[UIColor clearColor]];
//
//    }
//    else if([self.delegate getWaitingForAvailabilityResponse] == 2)
//    {
//        newPosition = self.initialCarBound.center;
//        [UIView animateWithDuration:duration animations:^{
//            mainRecognizer.view.center = newPosition;
//            parked = 0;
//            fixed = 1;
//        }];
//        [timer invalidate];
//        [self.initialCarBound setBackgroundColor:[UIColor clearColor]];
//        [self.finalCarBound setBackgroundColor:[UIColor clearColor]];
//    }
//}
//
//-(void)moveObject:(UIPanGestureRecognizer *)recognizer
//{
//    
//    mainRecognizer = recognizer;
//    CGPoint translation = [recognizer translationInView:self.carImage];
//    
//    CGPoint currCarPosition = CGPointMake(recognizer.view.center.x + translation.x,
//                                         recognizer.view.center.y );
//    
//    if(currCarPosition.x < CGRectGetMaxX(self.frame) && currCarPosition.x > 0 && fixed == 0)
//    {
//        recognizer.view.center = currCarPosition;
//    }
//
//    [recognizer setTranslation:CGPointMake(0, 0) inView:self.carImage.superview];
//    duration = 0.5;
//    
//    
//    //animations for the car to come at its desired place.
//    
//    if(parked == 1)
//    {
//        newPosition = self.initialCarBound.center;
//        if( CGRectGetMinX(recognizer.view.frame) < CGRectGetMaxX(self.initialCarBound.frame) )
//        {
//            [UIView animateWithDuration:duration animations:^{
//                recognizer.view.center = newPosition;
//                parked = 0;
//                fixed = 1;
//                
//            } completion:^(BOOL finished) {
//                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"We Will Meet Again !!!" message:@"History never really says goodbye. History says, 'See you later.'" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [alert show];
//                fixed = 0;
//               // [self carAnimationFinished:recognizer];
//                [self.delegate carRemoveSendRequest];
//            }];
//        }
//    }
//    
//    if(recognizer.state == UIGestureRecognizerStateEnded)
//    {
//        [self carAnimationFinished:recognizer];
//    }
//    
//    if(recognizer.state == UIGestureRecognizerStateBegan)
//    {
//        if(parked == 0)
//        {
//            [self.delegate requestForParkingAvailability];
//            timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerInvoked) userInfo:nil repeats:YES];
//        }
//    }
//    
//}
//
//-(void) carAnimationFinished : (UIPanGestureRecognizer *)recognizer
//{
//    [userDeafults setFloat:recognizer.view.center.x forKey:@"carPositionX"];
//    [userDeafults setFloat:recognizer.view.center.y forKey:@"carPositionY"];
//    [userDeafults setInteger:parked forKey:@"parked"];
//    
//    [userDeafults synchronize];
//    
//    
//    [self.initialCarBound setBackgroundColor:[UIColor clearColor]];
//    [self.finalCarBound setBackgroundColor:[UIColor clearColor]];
//}
//
//-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if(parked == 0)
//    {
//        [self.finalCarBound setBackgroundColor:[UIColor grayColor]];
//    }
//    else
//    {
//        [self.initialCarBound setBackgroundColor:[UIColor grayColor]];
//
//    }
//}
//
//-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self.initialCarBound setBackgroundColor:[UIColor clearColor]];
//    [self.finalCarBound setBackgroundColor:[UIColor clearColor]];
//}
//
////- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
////{
////    NSArray * temp = [touches allObjects];
////    UITouch *aTouch = [temp objectAtIndex:0];
////    CGPoint location = [aTouch locationInView:self];
////    CGPoint previousLocation = [aTouch previousLocationInView:self];
////    self.carImage.frame = CGRectOffset(self.frame, (location.x - previousLocation.x), (0));
////}
//
////-(CGPoint) translationInView:(UIView *)view
////{
////    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Translation In View" message:@"hey" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
////    [alert show];
////    
////    
////}
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}
//*/
//
//@end
