
//
//  FFMineHeaderView.m
//  ZPFProject
//
//  Created by zhou on 2019/9/30.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import "FFMineHeaderView.h"

@implementation FFMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"FFMineHeaderView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

@end
