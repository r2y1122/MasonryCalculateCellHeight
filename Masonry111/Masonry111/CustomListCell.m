//
//  CustomListCell.m
//  Masonry111
//
//  Created by shavekevin on 16/1/26.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "CustomListCell.h"
#import "Masonry.h"

@interface CustomListCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *line;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, assign) BOOL isFirstVisit;

@end

@implementation CustomListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //这个加上是为了解决约束冲突
        self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        self.contentView.frame = self.frame;
        _isFirstVisit = NO;
    }
    return self;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
        if ([_contentLabel isDescendantOfView:self.contentView] == NO) {
            [self.contentView addSubview:_contentLabel];
        }
    }
    return _contentLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.numberOfLines = 0;
        if ([_nameLabel isDescendantOfView:self.contentView] == NO) {
            [self.contentView addSubview:_nameLabel];
        }
    }
    return _nameLabel;
}
- (UILabel *)line {
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor redColor];
        if ([_line isDescendantOfView:self.contentView] == NO) {
            [self.contentView addSubview:_line];
        }
    }
    return _line;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView ) {
        _iconImageView = [[UIImageView alloc]init];
        if ([_iconImageView isDescendantOfView:self.contentView] == NO) {
            [self.contentView addSubview:self.iconImageView];
        }
        
    }
    return _iconImageView;
}
- (void)layoutSubviews {
    
    //这个得写上 不写高度 出不来啊 因为自适应的高度的话宽度是要固定的。所以这里要给上最大的宽度
    _nameLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 10;
    _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 10;
    [super layoutSubviews];
    
}

- (void)customListBlindCell:(id)dataSource {
    
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.nameLabel.backgroundColor = [UIColor orangeColor];
    self.contentLabel.backgroundColor = [UIColor redColor];
    self.iconImageView.image = [UIImage imageNamed:@"11"];
    self.nameLabel.text = dataSource;
    self.contentLabel.text = dataSource;
}


- (void)updateConstraints {
    
    //第一次进来的话走的是make  再次进来走的是update
    
    if (!_isFirstVisit) {
        
        [self.contentLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.equalTo(self.line.mas_bottom).offset(10);
            make.right.mas_equalTo(-5);
            //            make.bottom.equalTo(self.iconImageView.mas_top).offset(-10);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(30);
            make.right.mas_equalTo(-5);
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(0.5);
        }];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(-5);
            //如果图片不固定高度的话会计算会根据图片本身高度来计算  如果想固定图片高度就把下面的高度注释打开就好了
            // make.height.mas_equalTo(100);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            
        }];
        _isFirstVisit = YES;
    }
    
    [super updateConstraints];
    
}
@end
