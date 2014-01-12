//
//  BlackBoardViewController.h
//  ElephantTalkTest
//
//  Created by Boris Chirino on 25/12/13.
//  Copyright (c) 2013 BK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlackBoardViewController,BlackBoard;

@protocol BlackBoardViewControllerDelegate <NSObject>

-(void)BlackBoardViewController:(BlackBoardViewController*)controller didCancelWithObject:(id)object;
-(void)BlackBoardViewController:(BlackBoardViewController*)controller didSaveWithDrawing:(id)drawing;

@end

@interface BlackBoardViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet BlackBoard *blackboard;
@property (nonatomic, weak) id<BlackBoardViewControllerDelegate> delegate;

@end
