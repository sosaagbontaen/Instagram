//
//  PostCell.m
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/29/22.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    self.postDescription.text = post.caption;
    self.postImage.image = [UIImage imageWithData:[post.image getData]];
}

@end
