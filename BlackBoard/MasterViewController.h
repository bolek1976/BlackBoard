//
//  MasterViewController.h
//  BlackBoard
//
//  Created by Boris Chirino on 12/01/14.
//  Copyright (c) 2014 BK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlackBoardViewController.h"
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, BlackBoardViewControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
