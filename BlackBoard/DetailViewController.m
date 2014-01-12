


#import "DetailViewController.h"
#import "Drawing.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item


-(void)setDetailItem:(Drawing *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
    }
}


- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        UIImage *img = [UIImage imageWithData:self.detailItem.image];
        self.title = self.detailItem.author;
        [self.pictureViewer setImage:img];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
