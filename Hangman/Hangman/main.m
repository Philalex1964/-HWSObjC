//
//  main.m
//  Hangman
//
//  Created by Alexander Filippov on 8/21/19.
//  Copyright © 2019 Alexander Filippov. All rights reserved.
//
//Working with strings
//We’ve been using NSString so far, and it’s so similar to Swift’s String that I hope you felt at
//home straight away. C has simple character arrays rather than NSString, which means we need
//to convert C strings to NSString and back again.
//Reading a C string from the command line is done using the scanf() function. You tell it what you expect to receive (in our case, any string) and give it a variable to write into it, and it does the rest. So, you write code like this:
//char cstring[256];
//scanf("%s", cstring);
//That allocates a char (character) array big enough to hold 255 letters plus a null byte at the end, then reads string input (%s) from the command line into that character array. This is not the same as using readLine() in Swift. Specifically, readLine() is written for safety and security, whereas the C scanf() function is subject to buffer overflows if someone enters more data than we allocated space for. Fortunately for us, this is a trivial game – if someone wants to hack it, they aren’t exactly going to achieve much.
//Once you have a C string, you can convert it to an NSString using a dedicated initializer:
//    NSString *input = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
//You can do the opposite – create a C string out of an NSString using the cStringUsingEncoding method. You call this on an NSString instance and tell it what string encoding to use (usually NSUTF8StringEncoding), and you get back a C string you can use elsewhere. For example:
//  [word cStringUsingEncoding:NSUTF8StringEncoding]
//We need to work with unichar because a hangman game is all about guessing individual letters. So, to pull a letter out from a string, you use this:
//    [someString characterAtIndex:position];

//Then to create an NSString out of that individual character, you can use stringWithFormatand specify the %C formatter. Remember, unichar isn’t an object, so when we want to keeptrack of which letters have been used we need to convert it into an NSString. For example:
//NSString *newString = [NSString stringWithFormat:@"%C", letter];

//The last thing you need to know is printf(), which is the equivalent of print() in Swift. We’ve been using NSLog() so far, which is great for printing debug messages to the console, but less useful for app and game output a) because it places the current time at the beginning of each message, and b) because it always adds a line break after each message. We’ll be using printf(), which only prints the line breaks you specify.

// readLine() in Swift:
/*
print("Please enter your name:");

if let name = readLine() {
    print("Hello, \(name)!")
} else {
    print("Why are you being so coy?")
}

print("TTFN!")
*/


#import <Foundation/Foundation.h>

void printWord(NSString *word, NSMutableArray<NSString*>
               *usedLetters) {
    printf("\nWord: ");
    // this will be used to track missing letters
    BOOL missingLetters = NO;
    // loop over every letter
    for (NSInteger i = 0; i < [word length]; ++i) {
        // convert the unichar into an NSString for arrays
        unichar letter = [word characterAtIndex:i];
        NSString *letterString = [NSString stringWithFormat:@"%C",
                                  letter];
        // if we already guessed this letter, print it out
        if ([usedLetters containsObject:letterString]) {
            printf("%C", letter);
        } else {
            // letter not guessed; mark with a placeholder
            printf("_");
            // we haven't won yet!
            missingLetters = YES;
        }
    }
    
    // notice careful use of \n to control line breaks
    printf("\nGuesses: %ld/8\n", [usedLetters count]);
    if (missingLetters == NO) {
        // no missing letters - a winner!
        printf("It looks like you live on… for now.\n");
        exit(0);
    } else {
        if ([usedLetters count] == 8) {
            // they guessed eight times; game over
            printf("Oops – you died! The word was %s.\n", [word cStringUsingEncoding:NSUTF8StringEncoding]);
            exit(0);
        } else {
            // game is still active
            printf("Enter a guess: ");
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *word = @"RHYTHM";
        NSMutableArray<NSString*> *usedLetters = [NSMutableArray
                                                  arrayWithCapacity:8];
        printf("Welcome to Hangman!\n");
        printf("Press a letter to guess, or Ctrl+C to quit.\n");
        printWord(word, usedLetters);
        
        while (1) {
            // read a string from the user
            char cstring[256];
            scanf("%s", cstring);
            // convert it to an NSString
            NSString *input = [NSString stringWithCString:cstring
                                                 encoding:NSUTF8StringEncoding];
            if ([input length] != 1) {
                printf("Please type exactly one letter, or Ctrl+C to quit.");
                       } else {
                           // pull out the first letter from the input
                           unichar letter = [input characterAtIndex:0];
                           // convert it to an uppercase NSString
                           NSString *letterString = [[NSString stringWithFormat:@"%C",
                                                      letter] uppercaseString];
                           if ([usedLetters containsObject:letterString]) {
                               printf("You used that letter already!\n");
                           } else {
                               [usedLetters addObject:letterString];
                           }
                       }
                       // no matter what, print the game state again
                       printWord(word, usedLetters);
                       }
        
        
        
        
        
        
        
    }
    return 0;
}
