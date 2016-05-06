# GestureTrashApp

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    
    [self.imgView setUserInteractionEnabled:YES];
    [self.imgView addGestureRecognizer:panGesture];
}
-(void)handlePanGesture:(UIPanGestureRecognizer *)sender
{
    CGPoint translate = [sender translationInView:self.imgView];
    
    CGRect newFrame = self.imgView.frame;

    newFrame.origin.x += translate.x;
    newFrame.origin.y += translate.y;
    
    sender.view.frame = newFrame; // comment this it don't want faster move

    if(sender.state == UIGestureRecognizerStateEnded){
        self.imgView.frame = newFrame;
    }
    //for hide when image will touch the button
    if (self.imgView.frame.origin.y + self.imgView.frame.size.height > self.trashButton.frame.origin.y) {
        [self.imgView setHidden:YES];
        NSLog(@"Hidden");
    }
