//
//  BlackBoard.m
//  ElephantTalkTest
//
//  Created by Boris Chirino on 25/12/13.
//  Copyright (c) 2013 BK. All rights reserved.
//

#import "BlackBoard.h"

@interface BlackBoard ()
    @property (nonatomic, strong) UIBezierPath *drawingPath;
@end

@implementation BlackBoard


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    _lineWith = 5;
    self.drawingPath.lineWidth = self.lineWith;
}

#pragma mark private properties
//lazy initialization
-(UIBezierPath*)drawingPath
{
    if (!_drawingPath) {
        _drawingPath = [[UIBezierPath alloc]init];
    }
   return  _drawingPath;
}

-(UIColor*)brushPattern
{
    if (!_brushPattern) {
        _brushPattern = [UIColor redColor];
    }
    return _brushPattern;
}

#pragma mark - touches
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   _havePaint = YES;
   UITouch *touch = [[touches allObjects] objectAtIndex:0];
    [self.drawingPath moveToPoint: [touch locationInView:self]];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    [self.drawingPath addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    [self.brushPattern setStroke];
    [self.drawingPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
}


/*-()
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
