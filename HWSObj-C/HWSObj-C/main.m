//
//  main.m
//  HWSObj-C
//
//  Created by Alexander Filippov on 8/17/19.
//  Copyright © 2019 Alexander Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i = 10;
        if (i == 10) {
            NSLog(@"Hello, World!");
        }
        
        // MARK: - CHAPTER 1: OVERVIEW
        // MARK: switch/case
        i = 20;
        switch (i) {
            case 20:
                NSLog(@"It's 20!");
                break;
            case 40:
                NSLog(@"It's 40!");
                break;
            case 60:
                NSLog(@"It's 60!");
                break;
            default:
                NSLog(@"It's something else.");
        }
        
        switch (i) {
            case 1 ... 30:
                NSLog(@"It's between 1 and 30!");
                break;
            default:
                NSLog(@"It's something else.");
        }
        
        switch (i) {
            case 10: {
                //                int foo = 1;
                NSLog(@"It's something else.");
            }
        }
        
        switch (i) {
            case 10:
                NSLog(@"It's something else.");
                //                int foo = 1;
        }
        
        //        NSString *str = @"Reject common sense and make the impossible possible!";
        
        
        // MARK: - LOOPS
        // MARK: fast enumeration loop
        NSArray *names = @[@"Laura", @"Janet", @"Kim"];
        for (NSString *name in names) {
            NSLog(@"Hello, %@!", name);
        }
        
        // MARK: C-style for loop
        for (int i = 1; i <= 5; ++i)
            NSLog(@"%d * %d is %d", i, i, i * i);
        
        // MARK: while just like in Swift
        i = 1;
        while (i <= 5) {
            NSLog(@"%d * %d is %d", i, i, i * i);
            ++i;
        }
        
        // MARK: do/while is identical to Swift’s repeat/while
        i =1;
        do {
            NSLog(@"%d * %d is %d", i, i, i * i);
            ++i;
        } while (i <= 5);
        
        // MARK: - Calling methods - is “sending a message”
        //    let myObject = new MyObject() // in Swift ?
        //    MyObject *myObject = [MyObject new]; // in Obj-C
        //    new method, which allocates memory for an object and initializes it with some default information
        //    can also run those two parts individually: allocate some memory with one method, then initialize a value with a second,like this:
        //    MyObject *myObject = [[MyObject alloc] init];
        //    alloc is run first to set aside enough RAM to store the object, then init is run to place a default value into the object
        
        //    In Swift you might write something like this:
        //    myObject.method1().method2()
        //    In Objective-C, you need to balance the brackets on the outermost left-hand side, like this:
        //    [[myobject method1] method2]
        
        //    example in both Swift and Objective-C:
        //    myObject.executeMethod(hello, param2: world)
        //    [myObject executeMethod:hello param2:world];
        
        // MARK: - Nil coalescing
        NSString *name = nil;
        NSLog(@"Hello, %@!", name ?: @"Anonymous");
        
        // MARK: - POINTERS
        //        all Objective-C objects must be pointers
        // MARK: Constant pointers
        //        code will not compile:
        //        const a = 10;
        //        a = 20;
        
        const NSString *first = @"Hello";
        first = @"World";
        
        NSString const *first1 = @"Hello";
        first1 = @"World";
        //        both of those lines mean “I want to ensure the string doesn’t change, but I don’t mind if the pointer does.”
        
        //        %p format specifier for NSLog(), which means “print the pointer of this object.”
        NSString *first2 = @"Hello";
        NSLog(@"%p", first2);
        first2 = @"World";
        NSLog(@"%p", first2);
        
        //        If we want to create a string that can’t be changed, what we need is a constant pointer.
        //        need to move the const keyword after the pointer’s asterisk, like this:
        //        NSString * const first3 = @"Hello";
        
        // MARK: Format specifiers
        //        %@ to mean “contents of object”,
        //        %d to mean “int”, and
        //        %p to print the pointer of an object
        //        %f to printvfloating-point numbers and
        //        %ld to print long integers
        //        %.2f means “print a floating-point number up to two decimal places.”
        NSLog(@"%.2f", M_PI);
#define M_PI 3.14159265358979323846264338327950288
        
        //        %ld format specifier, then add a typecast to force the parameter to be a long integer, like this:
        NSInteger i1 = 10;
        NSLog(@"%ld", (long)i1);
        
        NSInteger i2 = 10;
        NSLog(@"%ld", (long)i2);
        
        
        // MARK: - CHAPTER 2: DATA TYPES
        // MARK: - STRINGS
        //        NSString is a class not a struct, which means it’s a reference type.
        //        It works with Unicode (UTF-16, specifically)
        //        You can bridge it to and from Swift’s String using an as typecast in Swift.
        //        • It comes with built-in methods to convert strings to other data types, such as integers and floats.
        //        • Strings are immutable by default, but they aren’t constant.
        
        // MARK: Creating Strings
        //        NSString *foo = @"Hello, world!";
        
        NSInteger number = 42;
        NSString *output = [NSString stringWithFormat:@"You picked %ld", (long)number];
        NSLog(@"%@", output);
        
        //        NSString *output1 = [[NSString alloc] initWithFormat:@"You picked %ld", (long)number];
        
        //        NSString *output2 = [[NSString alloc] initWithContentsOfFile:@"hello.txt" usedEncoding:nil error:nil];
        
        // MARK: Manipulating and evaluating strings
        /*
         NSString has a huge collection of methods for manipulating strings; I’ve listed some below so
         you can get a taste:
         • stringByReplacingOccurrencesofString: replaces one substring with another.
         • stringByAppendingString: adds a new string to the existing one, making a new string.
         • stringByAppendingFormat: add a new string with formatting specifiers to the existing
         one, making a new string.
         • substringFromIndex: create a new string using part of the existing one.
         • componentsSeparatedByString: create an array by splitting a string.
         • integerValue: convert a string into an integer, or 0 if it’s an invalid integer. (Also, doubleValue, floatValue.)
         • boolValue: convert a string to a boolean. Returns true if the string starts with Y, y, T, t, or the digits 1 to 9.
         */
        
        //        methods for comparing strings:
        //        containsString returns true if string A contains string B, and
        //        isEqualToString is used to compare two strings.
        //!       This is important: you need to compare strings using the isEqualToString method, and not ==.
        
        // MARK: Mutable strings
        //        NSString is immutable, whereas NSMutableString is mutable.
        
        //        NSMutableString *mutable = @"Hello";
        //        this means if “create a variable that can hold a mutable string, then place an immutable string in there.” Remember, @"..." creates an NSString, so you’re trying to place an immutable object inside a mutable container.
        
        //        If you want to create a mutable string, you can either create a mutable copy of an existing string, or use one of the NSMutableString initializers.
        
        
        //        NSMutableString *hello = [@"Hello" mutableCopy];
        //        NSMutableString *hello = [NSMutableString
        //                                  stringWithFormat:@"..."];
        
        //        one bonus initializer: stringWithCapacity lets you tell the system how big you expect the string to grow, which allows the system to avoid reallocating RAM if your string grows larger.
        
        NSMutableString *longString = [NSMutableString
                                       stringWithCapacity:4096];
        NSLog(@"%@", longString);
        
        //        Once you have a mutable string, you can modify its contents by using setString to modify its contents entirely
        
        NSMutableString *first3 = [@"My string" mutableCopy];
        [first3 setString:@"Something else"];
        NSLog(@"%@", first3);
        
        NSMutableString *first4 = [@"My string" mutableCopy];
        NSString *second = first4;
        [first4 setString:@"Something else"];
        NSLog(@"%@", second);
        
        NSMutableString *first5 = [@"My string" mutableCopy];
        NSString *second1 = [first5 copy];
        [first5 setString:@"Something else"];
        NSLog(@"%@", second1);
        
        
        // MARK: Useful functions
        //        There are several global functions that create an NSString from various types of input data. This is mainly useful when using NSLog(), because it lets you neatly print out structures like CGRect.
        /*
         • NSStringFromClass(): Give it a class name, e.g. [myObject class], and it will return
         “MyObject”.
         • NSStringFromRect(): Give it a CGRect and get back the origin and size in one string.
         • NSStringFromSize(): Give it a CGSize and get back the width and height values.
         • NSStringFromPoint(): Give it a CGPoint and get back the X and Y coordinates.
         */
        
        
        // MARK: - NUMBERS
        //        int is a series of 1s and 0s that represent 32-bit numbers. NSInteger is a series of 1s and 0s that can be either a 32-bit integer or a 64-bit integer depending on the CPU. There are also specific data types like int64_t for integers that are always 64-bit, NSUInteger for unsigned 32- and 64-bit integers, and so on.
        
        //        All of those types are called "primitive types": they are raw numbers that can be manipulated directly by the CPU.
        
        //MARK: NSNumber
        //        NSNumber can hold int, NSInteger, floats, doubles, and even booleans
        //        This means you can create it from an integer, and read it back as a double, or create it as a boolean and read it back as a float.
        //        you can’t even do mathematics using NSNumbers – even if you created two of them called first and second, this kind of code wouldn’t work:
        //            NSNumber *third = first + second;
        
        //        Instead, NSNumber is designed to be a storage device, because Objective-C has one dramatic shortcoming that may well shock you: arrays and dictionaries can only hold objects. This means you can’t place integers into arrays, nor floats, doubles, or booleans.
        //        so Objective-C gives us NSNumber: a class that serves to wrap each of those number types in an object so that we can put them into arrays, dictionaries, sets, and other places that require objects.
        
        //        You can create NSNumber instances using one of its many initializers, for example numberWithInteger accepts an NSInteger and returns an NSNumber instance that wraps it. You can then read back the number in the same or different data type, using methods like floatValue, intValue, and integerValue. For example:
        NSNumber *ten = [NSNumber numberWithInteger:10];
        float floatTen = [ten floatValue];
        NSLog(@"%1f", floatTen);
        
        //        NSNumber *integerTen = @10;
        //        NSNumber *booleanTrue = @YES;
        //        NSNumber *doublePi = @M_PI;
        
        // MARK: - ARRAYS
        NSArray *villains = @[@"Weeping Angels", @"Cybermen",
                              @"Daleks", @"Vashta Nerada"];
        for (NSString *villain in villains) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!",
                  villain);
        }
        
        for (NSString *villain in [villains reverseObjectEnumerator]) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!", villain);
        }
        
        NSLog(@"The %@ are my favorite villains.", villains[2]);
        
        //        Older code written before subscripting was introduced (anything not rewritten since 2012 or earlier) will use the objectAtIndex method instead, like this:
        NSLog(@"The %@ are my favorite villains.", [villains
                                                    objectAtIndex:2]);
        
        NSArray *villains1 = [NSArray arrayWithObjects:@"Weeping Angels", @"Cybermen", @"Daleks", @"Vashta Nerada", nil];
        NSLog(@"Can the Doctor defeat the %@? Yes he can!",
              villains1);
        
        // MARK: Basic array usage
        //        • count: return the number of items in an array.
        //        • indexOfObject: returns the location of an item in an array.
        //        • objectAtIndex: returns the object at a location in an array. (The counterpart of
        //                                                                        indexOfObject)
        //        • componentsJoinedByString: converts an array into a string, using another string as glue.
        
        NSLog(@"The Doctor faced %ld villains in that episode.", (long)
              [villains count]);
        NSLog(@"Daleks are villain number %ld.", (long)[villains indexOfObject:@"Daleks"]);
        NSLog(@"The second villain was the %@.", [villains
                                                  objectAtIndex:1]);
        NSLog(@"The Doctor conquered these villains: %@.", [villains
                                                            componentsJoinedByString:@", "]);
        
        
        // MARK: Mutable arrays
        NSMutableArray *villains2 = [@[@"Weeping Angels", @"Cybermen",
                                       @"Daleks", @"Vashta Nerada"] mutableCopy];
        [villains2 insertObject:@"The Silence" atIndex:1];
        NSLog(@"%@", villains2);
        [villains2 removeObjectAtIndex:3];
        NSLog(@"%@", villains2);
        [villains2 removeAllObjects];
        NSLog(@"%@", villains2);
        [villains2 addObjectsFromArray: villains];
        NSLog(@"%@", villains2);
        
        // MARK: Sorting
        //        Our villains array contains several strings, so in Swift you would be given a sort() method to call to provide that same array in alphabetical order. Unlike Swift, Objective-C doesn’t provide built-in sorting for any data types, but it does provide some hooks where you can write your own – more or less equivalent to using sort() with a closure in Swift.
        //        NSString has a built-in method called compare, which compares one string against another and returns whether string A comes before or after string B, or should be sorted the same. Again, this is almost the same as the closure you use with Swift’s sort().
        //            We can use compare to sort an array by using it with the sortedArrayUsingSelector method.
        //            You provide this with the name of a method to call (in our case, that’s compare), and it will use the result of that method to sort the array.
        
        NSArray *sorted = [villains
                           sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", sorted);
        
        //        @selector is almost identical to Swift’s #selector syntax, but it’s less forgiving: if you call a method that accepts a parameter you always need to include the colon, i.e. compare: rather than compare.
        
        // MARK: Functional techniques
//        Objective-C is a bit thin on the ground, but you can sort of come close with three useful methods: makeObjectsPerformSelector, enumerateObjectsUsingBlock, and filteredArrayUsingPredicate
        
        // [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                               BOOL *stop) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!", obj);
        }];
        
        [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqualToString:@"Weeping Angels"]) {
                NSLog(@"Can the Doctor defeat the %@? Oh, apparently not.", obj);
                *stop = true;
            } else {
                NSLog(@"Can the Doctor defeat the %@? Yes he can!", obj);
            }
        }];
        
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bindings) {
            return [[obj componentsSeparatedByString:@" "] count] == 2;
        }];
        NSArray *twoWordVillains = [villains filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", twoWordVillains);
        
        // MARK: Key paths
//        rarely used even in old Objective-CC, so you don’t need to know how to write this, you just need to know that it exists.
//        Key paths exist in Swift and are used for key-value observing.
//        In Objective-C, arrays have a method called valueForKeyPath where you can use collection operators to calculate information about your array. For example, you can use @sum.self on an integer array to have the sum of all items returned as an NSNumber.
        
        NSArray *numbers = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
        NSNumber *sum = [numbers valueForKeyPath:@"@sum.self"];
        NSNumber *avg = [numbers valueForKeyPath:@"@avg.self"];
        NSNumber *min = [numbers valueForKeyPath:@"@min.self"];
        NSNumber *max = [numbers valueForKeyPath:@"@max.self"];
        NSLog(@"Total: %ld", (long)[sum integerValue]);
        NSLog(@"Avg: %ld", (long)[avg integerValue]);
        NSLog(@"Min: %ld", (long)[min integerValue]);
        NSLog(@"Max: %ld", (long)[max integerValue]);
        
        // MARK: - DICTIONARIES
//    Note: As with Swift’s dictionaries, NSDictionary is unordered. You can loop over the items as you’ll see in a moment, but the order is unlikely to be what you expect.
        
//        To create a dictionary using literal syntax, use @{ to start your dictionary, } to end it, then a comma-separated list of key/values. Each key and value should be separated by a colon. Here’san example:
        NSDictionary *ships = @{
                                @"Serenity": @"Firefly",
                                @"Enterprise": @"Star Trek",
                                @"Executor": @"Star Wars"
                                };
        NSLog(@"%@", ships);
        
//        Before dictionary literals were introduced, you created them using dictionaryWithObjectsAndKeys, which – hurray! – accepts its parameters in the opposite order to Swift and every other sensible language. That means you specify the value first, then key.
//        To add to the confusion, you use commas to separate key/value pairs and each key and value. You also need to add the same “nil” at the end that you used when creating arrays. Yes, that is a lethal combination of potential screw ups, so if you see this syntax being used you need to read it very carefully.
//        Putting all that together, the older syntax looks like this:
        
        NSDictionary *ships1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Firefly", @"Serenity",
                                @"Star Trek", @"Enterprise",
                                @"Star Wars", @"Executor", nil
                                ];
        NSLog(@"%@", ships1);
        
//        Old and new syntax is also available when reading values back from arrays. To demonstrate this, here are two ways to print out the values in an array, new first then old:
        
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, ships[key]);
        }
        
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, [ships objectForKey:key]);
        }
        
        // MARK: NSMutableDictionary
        NSMutableDictionary *shipsMutable = [ships mutableCopy];
        NSLog(@"%@", shipsMutable);
        
        // MARK: Useful methods
        /*
         count
         allKeys
         allValues
         enumerateKeysAndObjectsUsingBlocks
         */
        NSLog(@"%ld", (long)[ships count]);
        NSLog(@"%@", [ships allKeys]);
        
        [ships enumerateKeysAndObjectsUsingBlock:^(id obj, id obj1,
                                               BOOL *stop) {
            NSLog(@"%@: %@", obj, obj1);
        }];
        
      // MARK: - SETS
//        Objective-C has two ways of creating sets: NSSet and NSCountedSet. Cunningly, NSSet has a mutable counterpart in NSMutableSet, but NSCountedSet is automatically mutable.
//        There isn’t much to say about NSSet because it’s similar in nature to Swift’s set, although a little less powerful. You can use the count method to count how many items are in the set, use containsObject to determine if an object is in the set, use intersectsSet to determine if one set overlaps another, and so on.
        
        NSSet *odd = [NSSet setWithObjects:@1, @3, @5, @7, @9, nil];
        NSSet *even = [NSSet setWithObjects:@2, @4, @6, @8, @10, nil];
        NSSet *combined = [odd setByAddingObjectsFromSet:even];
        NSMutableSet *mutable = [combined mutableCopy];
        [mutable addObject:@0];
        [mutable removeAllObjects];
        
        NSSet *new = [NSSet setWithArray:(villains)];
        NSLog(@"%@", new);
        
        // MARK: NSCountedSet
//        Sets are faster than arrays for determining whether they contain an object a) because they are unordered, so objects are accessed using a hash, and b) because objects must appear only once.
//            NSCountedSet bends the rule a little: objects can only appear once inside it, but each time you add or remove an item it keeps track of how many times it would have appeared. This makes it an extremely fast way to count the number of times objects appear in a collection.
        
        NSCountedSet *numbers5 = [NSCountedSet setWithObjects: @1, @3, @2, @8, @3, @6, @8, @8, @5, @1, @6, @3, nil];
        for (NSString *value in [numbers5 allObjects]) {
            NSLog(@"%@ appears %ld times", value, [numbers5 countForObject:value]);
        }
        
        // MARK: - GENERICS
        NSArray *names3 = @[@"Sophie", @"Alexandra", @"Charlotte",
                           @"Isabella"];
        for (NSString *name in names3) {
            NSLog(@"%@ is %ld letters.", name, [name length]);
        }
        
//        NSArray *numbers6 = @[@42, @556, @69, @3.141];
//        for (NSString *number in numbers6) {
//            NSLog(@"%@ is %ld letters.", number, [number length]);
        //        } error due to the numbers array was created using NSNumber literal syntax, not NSString - that code is wrong!
        
//    generics: specialized forms of arrays, dictionaries, and sets that can accept only one type of data. (Swift)
        
//        Objective-C Generics aren’t very good – certainly nothing like Swift’s generics.
//        They use a technique called type erasure, which is a fancy way of saying that they are implemented as syntactic sugar: the compiler sees them and can sometimes warn you if you use them incorrectly, but when the code is built the generics are effectively discarded.
        
        NSMutableArray<NSString *> *names7 = [NSMutableArray
                                             arrayWithCapacity:4];
        [names7 addObject:@"Sophie"];
//        [names7 addObject:@42];
       // NSNumber *number1 = names[0];
        
//        NSArray<NSNumber *> *numbers1 = @[@42, @556, @69, @3.141];
//        for (NSNumber *number in numbers1) {
//            NSLog(@"%@ is %ld letters.", number, [number length]);
//        }
        
       // NSDictionary<NSString *, NSNumber *> *villains5 = @{ @"Daleks": @100, @"Cybermen": @80 };
        
//    So: generics exist in Objective-C, but a) they aren’t anywhere like as beneficial as they are in Swift, and b) they are so new that most projects don’t use them.
        
        
        // MARK: - NSValue
//        arrays of CGRect, CGSize, CGPoint, or something else? Yep: those don’t work either – they are all structs in Objective-C (one of the few things that are!), and so can’t be in collections
        
        /*
         we wrote some code to handle resizing a text view when the keyboard was shown. It involved this line of Swift code:
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
         The method we wrote received a userInfo dictionary when the keyboard was shown or hidden, and inside that was a NSValue for the frame of the keyboard, and inside that was a CGRect containing the actual values.
                  */
        
//        iOS projects you’ll be able to work with different types:
       /*
        NSValue *rect = [NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)];
        NSValue *point = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        NSValue *size = [NSValue valueWithCGSize:CGSizeMake(10, 10)];
        NSValue *transform = [NSValue valueWithCGAffineTransform:CGAffineTransformIdentity];
        NSValue *insets = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        So, that’s NSValue: it’s a gigantic hack, to be honest, but it’s one we’re all stuck with and one you’ll eventually face when you read real Objective-C code.
        */
        
        
        // MARK: - NSData
//        NSData is one of the few Objective-C classes that has for all intents and purposes been imported wholesale into Swift: the Swift version is called Data, but it’s effectively identical to the NSData class that Objective-C provides, at least in terms of its functionality. So: if you’ve used Data in Swift, you can use it in Objective-C too.
        
//        Data and NSData are types used to interact with raw binary data. They’re commonly used to hold raw data more complex than single strings, integers, bools, and so on. Images for instance. Why raw? In order to write to and read from files, databases, memory, etc.
        
//            For example, on iOS, it’s widely used in data persistence frameworks like Core Data and Realm. Without Data, a data persistence framework would need hundreds of additional types to satisfy most use cases, which would be a sisyphean task to program and even worse, make the framework bloatware; with Data, the framework only has to persist that type and the developer is responsible for encoding and decoding it, allowing for all possible use cases.
        
        
        // MARK: - NSObject
//        Objective-C has a universal base class called NSObject, which is where almost every other class inherits from. For example, if you create a UIViewController, it inherits from UIResponder, which in turn inherits from NSObject. Swift classes don’t have this concept because it isn’t needed any more, but occasionally you might have needed to make a Swift class inherit from NSObject to use things like NSCoding.
        
//        Behind the scenes, NSObject is actually implemented as both a class and a protocol, but it provides some really core functionality that is used extensively in Objective-C. You’ve already seen copy and mutableCopy, both of which come from NSObject, but here are some other useful methods it provides:
//        • isKindOfClass returns true if an object is a specific type, or a subclass of that type. Use [SomeClass class] for the parameter.
//        • conformsToProtocol returns true if an object declares itself as conforming to a protocol.
//        • respondsToSelector checks whether an object is able to run a method.
//        • performSelector runs a method on an object.
        
        NSMutableArray *people = [@[@"Taylor Swift", @"Adele Adkins"] mutableCopy];
        if ([people isKindOfClass: [NSArray class]]) {
            if ([people respondsToSelector:@selector(removeAllObjects)] ) {
                [people performSelector:@selector(removeAllObjects)];
            }
        }
        
//        However, there are a variety of performSelector counterparts that are more useful, such as performSelector:withObject:afterDelay:. These work just the same as in Swift.
  
        
        // MARK: - id and instancetype
//        At the root of Objective’s lack of safety is a data type called id, which means “any Objective-C object.” More specifically, it means a pointer to any Objective-C object, which means you don’t need to add a * to it.
//        This might seem like a perfectly normal data type, and indeed Any from Swift might seem like a good comparison. However, there is a significant difference: because Objective-C lived without generics for so long, id was the data type used for items in arrays and dictionaries, which in turn meant that the Objective-C compiler is written not to warn you when you convert between id and any other data type. Back in the old days, this was helpful behavior because you didn’t constantly need to typecast things coming out of arrays, but such behavior is unthinkable in Swift.
//         Rather than id meaning any object, it in fact means every object – you can call array methods  on it, string methods, number methods, and more, and the compiler won’t care. Sure, it will crash at runtime if those methods don’t actually exist, but as far as the compiler is concerned it’s all good.
        
        NSArray *foo = [NSArray new];
        id bar = foo;
        NSArray *baz = bar;
        NSLog(@"%@", baz);
//        That creates foo as an array, places it into the id type bar, effectively losing its type information, then puts the untyped bar into a new NSArray pointer called baz. That code  compiles cleanly – no warnings or errors – which is effectively the compiler giving me the dubious choice to opt out of type safety.
        
//        As of 2012, coders were able to replace id in their initializers with instancetype, which is a special keyword that means “an instance of this class will be returned.” This information can then be used by the compiler to ensure that new objects are used correctly. Apple took a couple of years to update its own APIs to use instancetype fully, but that has been done now. I doubt  many existing codebases were upgraded, but you might find that old classes use id and newer ones instancetype.
        
        // MARK: - NSError
        NSError *error;
        NSString *contents = [NSString stringWithContentsOfFile:@"hello.txt" usedEncoding:nil
                                                        error:&error];
        NSLog(@"%@", contents);
//        That starts relatively simply: it creates a new NSError variable called error. However, it gets created to nil because this is where we want an error to be placed if something went wrong in the following call. Then, in the code, I pass &error to the error parameter, which is new. If an error is produced by the method call, an NSError object is created and placed inside the error variable.
//            This syntax is necessary because we’re actually dealing with pointer pointers – i.e. a pointer to a pointer. If we had created an NSError and passed it into the method where it was modified we might have only needed a regular pointer, but in cases where no error is produced it’s  wasteful to create an NSError object when it isn’t needed. Instead, we pass a pointer to a pointer: rather than modifying an object being passed, the method can modify the pointer itself so that it points to a new object.
        
        // MARK: - Blocks
//        Blocks are the Objective-C equivalent of Swift’s closures, but if you thought closure syntax was bad you ain’t seen nothing yet. Don’t believe me? Here’s a simple closure in Swift:
        
//        let printUniversalGreeting = {
//            print("Bah-weep-graaaaagnah wheep nini bong")
//        }
//        printUniversalGreeting()
        
//        And here is that same code translated into Objective-C:
//        void (^printUniversalGreeting)(void) = ^{
//            NSLog(@"Bah-weep-graaaaagnah wheep nini bong");
//        };
//        printUniversalGreeting();
        
//        • void: The block returns nothing.
//        • (^printUniversalGreeting): Put the block into a variable called “printUniversalGreeting”.
//        • (void): The block accepts no parameters.
//        • = ^{ ... }: The contents of the block.
        
//        So, the whole code looks is this:
        
//        NSString* (^printUniversalGreeting)(NSString *) = ^(NSString *name) {
//            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
//                    };
//            NSLog(@"%@", printUniversalGreeting(@"Jim"));
//                    Again, let’s break down that first line:
//                    • NSString*: The block will return a string.
//                    • (^printUniversalGreeting): It’s called “printUniversalGreeting”.
//                    • (NSString *): It must accept a string parameter.
//                    • = ^: Assign the following block to the variable.
//                    • (NSString *name): This block accepts a string parameter.
        
        // declare the variable
        NSString* (^printUniversalGreeting)(NSString *);
        // assign it a block to run
        printUniversalGreeting = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
                    };
                    // now run it and print the result
                    NSLog(@"%@", printUniversalGreeting(@"Jim"));
        
                    // assign a different block to run
                    printUniversalGreeting = ^(NSString *name) {
                        return [NSString stringWithFormat:@"Nanu Nanu, %@!", name];
                    };
                    // now run it again
                    NSLog(@"%@", printUniversalGreeting(@"Jim"));
        
        
//        You might find it useful to use typedef to create an alias for your block type. For example:
            typedef NSString* (^MyBlock)(NSString*);
        
//        That means, “create the data type MyBlock as an alias for a block that accepts a string and returns a string.” With that in place, you can now write this:
        
        MyBlock printUniversalGreeting1 = ^(NSString *name) {
                return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
                        };
        NSLog(@"%@", printUniversalGreeting1(@"Jim"));
        
        // MARK: Capturing values
        
//        Objective-C blocks capture values similarly to Swift closures. For example:
        NSString *name2 = @"Zaphod";
        NSString* (^printUniversalGreeting2)(void) = ^{
            return [NSString stringWithFormat:@"Don't panic, %@!", name2];
        };
        NSLog(@"%@", printUniversalGreeting2());
        
//        to modify a value inside your block, you should use the __block qualifier, like this:
        NSInteger __block number5 = 0;
        NSLog(@"%ld", (long)number5);
        
        NSString* (^printMeaningOfLife)(void) = ^{
            number5 = 42;
            return [NSString stringWithFormat:@"How many roads must a man walk down? %ld.", number5];
        };
        NSLog(@"%@", printMeaningOfLife());
        
        // MARK: Strong reference cycles
//        Blocks can sometimes cause memory problems, just like closures in Swift.
//        The problem is identical: if a block is owned by object A, and has a strong reference to object A, then you have a strong reference cycle. That is, object A can’t be freed because its block exists, and its  block can’t be freed because object A exists. Fortunately, the solution is identical too, at least in theory: make the block have a weak reference to its owner
        
//        In practice, Swift has the edge because they added capture lists to make strong reference cycles less likely – that’s the name for those things in brackets you write in closures, e.g. [unowned self]. Objective-C doesn’t have these, and instead requires you to use a __weak qualifier, like this:
//        MyViewController * __weak weakSelf = self;
//        
//        NSString* (^myBlock)(void) = ^{
//            return [weakSelf runSomeMethod];
//        };
            
        
        
        
        
        return 0;
    }
}



