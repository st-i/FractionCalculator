//
//  AppDelegate.h
//  Fraction_Calculator
//
//  Created by iStef on 05.11.16.
//  Copyright © 2016 St. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

