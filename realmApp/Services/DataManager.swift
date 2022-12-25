//
//  DataManager.swift
//  realmApp
//
//  Created by Anton Vassel on 25.12.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData(_ completion: @escaping() -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            UserDefaults.standard.set(true, forKey: "done")
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping list"
            
            let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "Must have", Date(), true]]])
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2 L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apples", "note": "2 kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [bread, apples], at: 1)
            
            DispatchQueue.main.async {
                StorageManager.shared.save([shoppingList, moviesList])
                completion()
            }
        }
    }
}
