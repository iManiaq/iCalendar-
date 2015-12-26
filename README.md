# iCalendar-
ios  Custom Calendar : iCalender  #ios #objectiveC #calendar #custom
ios  Custom Calendar : iCalender 
#ios #objectiveC #calendar #custom 
- Events count for the day :
-  Call back on the day clicked ( scroll to get monthView )
- WeekDays included 
![alt tag](http://i.imgur.com/D7m1A8w.png)
![alt tag](http://i.imgur.com/BwDhq6R.png)

This is a Extended version to SACalendar created by nopshusang
Original post : https://github.com/nopshusang/SACalendar
==============
Newly added features :
- Events count for the day :
-  Call back on the day clicked ( scroll to get monthView )
- WeekDays included 

delegate in your view controller.
```objective-c
@interface ViewController () <SACalendarDelegate>
```
Then implement the optional delegate functions
```objective-c
// Prints out the selected date
-(void) SACalendar:(SACalendar*)calendar didSelectDate:(int)day month:(int)month year:(int)year
{
    NSLog(@"%02i/%02/%i",month,year);
}

// Prints out the month and year displaying on the calendar
-(void) SACalendar:(SACalendar *)calendar didDisplayCalendarForMonth:(int)month year:(int)year{
    NSLog(@"%02/%i",month,year);
}
//Delegate takes input for the number of events on that particular day
     : In the example if you all the dates are assigned to "●4" 

-//(NSString *) SACalendar:(SACalendar *)calendar subTitleForDate:(int)day month:(int)month year:(int)year {
    
    if (day) {
      
        return @"●4"; 
   
    } else {
       
        return @"";
    }
    
}

```
