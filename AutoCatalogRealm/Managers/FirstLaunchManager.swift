//
//  FirstLaunchManager.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 17.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class FirstLaunchManager {
    
    static let shared = FirstLaunchManager()
    
    var firstLaunch: Bool!
    
    func detectFirstLaunch() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "firstLaunch")
        if launchedBefore {
            firstLaunch = false
        } else {
            put3cars()
            
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            firstLaunch = true
        }
    }
    
    func put3cars() {
        guard let pathTofile = Bundle.main.path(forResource: "Data", ofType: "plist") else { return }
        print(pathTofile)
        guard let dataArray = NSArray(contentsOfFile: pathTofile) else { return }
        
        for dictionary in dataArray {
            let carDictionary = dictionary as! [String : AnyObject]
            
            let car = Car(brand: (carDictionary["brand"] as? String)!,
                          model: (carDictionary["model"] as? String)!,
                          body: (carDictionary["body"] as? String)!,
                          year: (carDictionary["year"] as? String)!)
            
            StorageManager.saveObject(car)
        }
    }
}
