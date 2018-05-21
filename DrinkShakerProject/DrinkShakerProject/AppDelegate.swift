//
//  AppDelegate.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 4/17/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let realm = try! Realm()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let drinkItems: Results<Drinks>?
        drinkItems = realm.objects(Drinks.self)
        if drinkItems!.count <= 0 {
      
        do {
            try self.realm.write {
                let newDrink = Drinks()
                newDrink.name = "Manhattan"
                newDrink.location = "Sand Bar"
                newDrink.ingredients = "2 oz Bourbon \n2 dash of bitters\nStir with cold ice\nStrain"
                newDrink.notes = "Favorite drink!"
                newDrink.liquorType = "Whiskey"
                newDrink.rating = 5
                realm.add(newDrink)
                
                let newDrink2 = Drinks()
                newDrink2.name = "Margaritta"
                newDrink2.location = "Anywhere"
                newDrink2.ingredients = "2 oz Tequila \n1 oz lime juice\n1 oz agave syrup\nShake with ice\nStrain"
                newDrink2.notes = "Everyones doing it"
                newDrink2.liquorType = "Tequila"
                newDrink2.rating = 4
                realm.add(newDrink2)
                
                let newDrink3 = Drinks()
                newDrink3.name = "Mojito"
                newDrink3.location = "Beach Bars"
                newDrink3.ingredients = "1 1/2 oz Rum\n1/4 oz lime juice\n4 muddled mint sprigs,1/2 oz syrup\nShake with ice\nDouble Strain"
                newDrink3.notes = "Perfect for hot days"
                newDrink3.liquorType = "Rum"
                newDrink3.rating = 5
                realm.add(newDrink3)
                
                let newDrink4 = Drinks()
                newDrink4.name = "Cosmopolitan"
                newDrink4.location = "upscale Bars"
                newDrink4.ingredients = "1 1/2 oz Vodka\n1/4 oz lime juice\nSplash of cranberry juice\n1/2 oz tripel sec\n Shake with ice\nStrain"
                newDrink4.notes = "For when you're feeling fancy"
                newDrink4.liquorType = "Vodka"
                newDrink4.rating = 3
                realm.add(newDrink4)
                
                let newDrink5 = Drinks()
                newDrink5.name = "Kiwi Gimlet"
                newDrink5.location = "Butterfly Restaurant"
                newDrink5.ingredients = "2 oz Gin\nMuddled kiwi slice\n1/2 oz lime juice\n1/4 oz simple syrup\nShake with ice\nDouble strain"
                newDrink5.notes = "Delicious but hard to find a bar that will make it"
                newDrink5.liquorType = "Gin"
                newDrink5.rating = 5
                realm.add(newDrink5)
            }
        } catch {
            print("Error initiating new realm, \(error)")
        }
            
        }
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }


}

