//
//  main.m
//  HWSOBJ-C-CHAPTER3
//
//  Created by Alexander Filippov on 8/23/19.
//  Copyright © 2019 Alexander Filippov. All rights reserved.
// MARK: - CAPTER 3: CLASSES
// New > File, then select macOS > Source > Cocoa Class. Give it the name Person, have it be a subclass of NSObject, then click Next then Finish. This will create two files, Person.h and Person.m. You’ll see @interface Person : NSObject in Person.h, which is where the external interface for the class is defined – the bits that other parts of your code need to use. The Person.m file contains @implementation Person, which is where you’ll put the implementation of your interface, i.e. the source code to perform the methods you create.
 //So, in theory you define your methods and properties in the header file, then you implement the methods in the implementation file. In practice things are a little more muddled, as you’ll soon see.
//Pro tip: Press Ctrl+Cmd+Up to toggle between the header and implementation files for a class.


#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        [person printGreeting];
//        [person performSelector:@selector(printGreeting)];
        [person printGreeting:@"Welcome!"];
//        [person printGreetingTo: (NSString*) name];

        [person printGreetingTo:@"Taylor!" atTimeOfDay:@"evening"];
        
        
        
        
        
        
    }
    return 0;
}
