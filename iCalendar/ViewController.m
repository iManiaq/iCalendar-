

#import "ViewController.h"
#import "SACalendar.h"
#import "DateUtil.h"

@interface ViewController () <SACalendarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    /*
     * Smooth scrolling in vertical direction
     * - to change to horizontal, change the scrollDirection to ScrollDirectionHorizontal
     * - to use paging scrolling, change pagingEnabled to YES
     * - to change the looks, please see documentation on Github
     * - the calendar works with any size
     */
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    SACalendar *calendar = [[SACalendar alloc]initWithFrame:CGRectMake(0, 20, screenBounds.size.width, screenBounds.size.height - 20)
                                            scrollDirection:ScrollDirectionVertical
                                              pagingEnabled:NO];
    

    
    calendar.delegate = self;
    
    [self.view addSubview:calendar];
}

/**
 *  Delegate method : get called when a date is selected
 */
-(void) SACalendar:(SACalendar*)calendar didSelectDate:(int)day month:(int)month year:(int)year
{
    NSLog(@"Date Selected : %02i/%02i/%04i",day,month,year);
}

/**
 *  Delegate method : get called user has scroll to a new month
 */
-(void) SACalendar:(SACalendar *)calendar didDisplayCalendarForMonth:(int)month year:(int)year{
    //NSLog(@"Displaying : %@ %04i",[DateUtil getMonthString:month],year);
}

-(NSString *) SACalendar:(SACalendar *)calendar subTitleForDate:(int)day month:(int)month year:(int)year {
    
    if (day != nil) {
      
        return @"●4";
   
    } else {
       
        return @"";
    }
    
}

@end
