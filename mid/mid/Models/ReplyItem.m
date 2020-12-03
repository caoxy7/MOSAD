//
//  ReplyItem.m
//  mid
//
//  Created by itlab on 12/2/20.
//

#import "ReplyItem.h"

@implementation ReplyItem
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    self.replyID = dict[@"ID"];
    self.contentID = dict[@"ContentID"];
    self.fatherID = dict[@"FatherID"];
    self.userID = dict[@"UserID"];
<<<<<<< HEAD
    self.publishDate = [dict[@"Date"] longValue]/1000;
=======
    self.publishDate = [dict[@"Date"] longValue] / 1000;
>>>>>>> 76d5ad1d6625334b12b8b990b89a1a0081eaa43c
    self.replyContent = dict[@"Content"];
    self.likeNum = [dict[@"LikeNum"] intValue];
    
    return self;
}
@end
