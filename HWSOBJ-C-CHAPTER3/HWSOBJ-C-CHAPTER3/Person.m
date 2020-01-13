//
//  Person.m
//  HWSOBJ-C-CHAPTER3
//
//  Created by Alexander Filippov on 8/23/19.
//  Copyright © 2019 Alexander Filippov. All rights reserved.
// // MARK: - CAPTER 3: CLASSES

#import "Person.h"

@implementation Person
// MARK: - Methods
//1. The '-' marks the start of a normal method. If we had used + instead it would be a static method, i.e. one that belongs to the class rather than instances.
//2. The return type is placed in parentheses before the method name. void means “nothing is returned.”
//3. Conventionally, a space is placed after the '-' but not before the method name. So, don’t place a space after the closing parenthesis of (void).

// MARK: Naming parameters

- (void)printGreeting {
    NSLog(@"Hello!");
}

/*
 If you’ve done iOS coding, you’ll realize that this structure of methods can sometimes give very different method names for the same object. For example, here are some methods from the UITableViewDataSource protocol:
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
The first four are all structured the same: a table view first, followed by a long parameter name that defines what the method actually does – cellForRowAtIndexPath, and so on. titleForHeaderInSection and titleForFooterInSection are identical apart from the name of the second parameter, which shows you how important these labels are in distinguishing a selector.
 */
//But the last one is an exception: numberOfSectionsInTableView is completely different to the others. This is because the important parts of the other selectors – cellForRowAtIndexPath, for example – are names for the following parameter, and numberOfSectionsInTableView doesn’t have any other parameters. Objective-C’s method syntax forces this method to be written very differently to the others.

- (void)printGreeting:(NSString*)greeting {
    NSLog(@"%@", greeting);
}

- (void)printGreetingTo:(NSString*)name {
    NSLog(@"Hello, %@", name);
}

- (void)printGreetingTo:(NSString*)name atTimeOfDay:
(NSString*)time {
    if ([time isEqualToString:@"morning"]) {
        NSLog(@"Good morning, %@", name);
    } else {
        NSLog(@"Good evening, %@", name);
    }
    
    
}

@end
