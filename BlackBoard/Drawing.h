//
//  Drawing.h
//  BlackBoard
//
//  Created by Boris Chirino on 12/01/14.
//  Copyright (c) 2014 BK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Drawing : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSData * image;

@end
