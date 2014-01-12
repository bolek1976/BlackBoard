//
//  DetailViewController.h
//  BlackBoard
//
//  Created by Boris Chirino on 12/01/14.
//  Copyright (c) 2014 BK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Drawing;
@interface DetailViewController : UIViewController

@property (strong, nonatomic) Drawing *detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *pictureViewer;
@end

