//
//  Post.h
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/29/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN
@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic) int likeCount;
@property (nonatomic) int commentCount;
@property (nonatomic, strong) NSDate *datePosted;
@property BOOL likedByUser;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;


@end

NS_ASSUME_NONNULL_END
