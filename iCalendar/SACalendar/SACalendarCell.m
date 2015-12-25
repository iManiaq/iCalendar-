

#import "SACalendarCell.h"
#import "SACalendarConstants.h"

@implementation SACalendarCell

/**
 *  Draw the basic components of the cell, including the top grey line, the red current date circle,
 *  the black selected circle and the date label. Customized the cell apperance by editing this function.
 *
 *  @param frame - size of the cell
 *
 *  @return initialized cell
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = cellBackgroundColor;
        
        self.topLineView = [[UIView alloc]initWithFrame:CGRectMake(-1, 0, frame.size.width + 2, 1)];
        self.topLineView.backgroundColor = cellTopLineColor;
        
        self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * labelToCellRatio)];
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        
        self.subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _dateLabel.frame.size.height + 10,  _dateLabel.frame.size.width, _dateLabel.frame.size.height -frame.size.height)];
        self.subLabel.textAlignment = NSTextAlignmentCenter;
        self.subLabel.text = @"";
        self.subLabel.font = [UIFont fontWithName:self.subLabel.font.fontName size: (self.subLabel.font.pointSize * 0.7)];
        self.subLabel.textColor = [UIColor redColor];
        
        CGRect labelFrame = self.dateLabel.frame;
        CGSize labelSize = labelFrame.size;
        
        
        CGPoint origin;
        int length;
        if (labelSize.width > labelSize.height) {
            origin.x = (labelSize.width - labelSize.height * circleToCellRatio) / 2;
            origin.y = (labelSize.height * (1 - circleToCellRatio)) / 2;
            length = labelSize.height * circleToCellRatio;
        }
        else{
            origin.x = (labelSize.width * (1 - circleToCellRatio)) / 2;
            origin.y = (labelSize.height - labelSize.width * circleToCellRatio) / 2;
            length = labelSize.width * circleToCellRatio;
        }
        
        self.circleView = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, length, length)];
        
        self.circleView.layer.cornerRadius = length / 2;
        self.circleView.backgroundColor = currentDateCircleColor;
        
        self.selectedView = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, length, length)];
        
        self.selectedView.layer.cornerRadius = length / 2;
        self.selectedView.backgroundColor = selectedDateCircleColor;
        
        [self.viewForBaselineLayout addSubview:self.topLineView];
        [self.viewForBaselineLayout addSubview:self.circleView];
        [self.viewForBaselineLayout addSubview:self.selectedView];
        [self.viewForBaselineLayout addSubview:self.dateLabel];
        [self.viewForBaselineLayout addSubview:self.subLabel];
        
    }
    return self;
}

-(void)prepareForReuse{
    
    _subLabel.text = @"";
}


@end
