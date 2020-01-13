//
//  Person.h
//  HWSOBJ-C-CHAPTER3
//
//  Created by Alexander Filippov on 8/23/19.
//  Copyright © 2019 Alexander Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)printGreeting;
- (void)printGreeting:(NSString*)greeting;
- (void)printGreetingTo:(NSString*)name;
- (void)printGreetingTo:(NSString*)name atTimeOfDay: (NSString*)time;



@end

NS_ASSUME_NONNULL_END
