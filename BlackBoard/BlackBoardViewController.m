//
//  BlackBoardViewController.m
//  ElephantTalkTest
//
//  Created by Boris Chirino on 25/12/13.
//  Copyright (c) 2013 BK. All rights reserved.
//

#import "BlackBoardViewController.h"
#import "BlackBoard.h"

@interface BlackBoardViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBtnOutlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBtnOutlet;
@property (nonatomic, strong) UIAlertView *authorDialog;

- (IBAction)cancelAction:(id)sender;
- (IBAction)saveAction:(id)sender;

@end

@implementation BlackBoardViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    // custom
    }
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark UI Actions
- (IBAction)cancelAction:(id)sender
{
    if (self.blackboard.havePaint) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Lost your masterpiece ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        av.tag = 1000;
        [av show];
    }else
        [self.delegate BlackBoardViewController:self didCancelWithObject:nil];
}

- (IBAction)saveAction:(id)sender
{
    if (self.blackboard.havePaint)
        [self.authorDialog show];
}


#pragma mark-
#pragma mark alertView delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1000) {

            if (buttonIndex==1) {
                [self.delegate BlackBoardViewController:self didCancelWithObject:nil];
            }
    }
    else
    {
        if (buttonIndex==1)
        {
            NSString *authorText;
            if ([alertView textFieldAtIndex:0].text.length>0)
                authorText = [alertView textFieldAtIndex:0].text;
            else
                authorText = @"Noname";

                UIImage * captured = [self takeSnapShoot];
                [self.delegate BlackBoardViewController:self
                                     didSaveWithDrawing:@{@"author":authorText, @"image":captured}];
        }
    }
}

#pragma mark -
#pragma mark private properties init
-(UIAlertView*)authorDialog
{
    if (!_authorDialog) {
        _authorDialog = [[UIAlertView alloc] initWithTitle:@"Author" message:@"Please type the name of the author" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        _authorDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    }
    return _authorDialog;
}

#pragma mark -
#pragma mark private methods
-(UIImage*)takeSnapShoot{
	float scale = 1.0;
	CGSize imageSize = self.blackboard.frame.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, scale);
	CGContextRef context		= UIGraphicsGetCurrentContext();
	[self.blackboard.layer renderInContext:context];
	// Retrieve the screenshot image
	UIImage   *snapShoot		= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapShoot;
}
@end
