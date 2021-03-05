//
//  CustomTableCell.m
//  avia-tickets
//
//  Created by Artur Igberdin on 05.03.2021.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    _leftLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview: _leftLabel];
    
    _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leftLabel.frame.size.width, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    _rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview: _rightLabel];
    
    
    return self;
}

@end
