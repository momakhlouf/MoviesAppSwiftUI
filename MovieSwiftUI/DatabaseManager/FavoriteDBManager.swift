//
//  favoriteDBManager.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/02/2023.
//

import Foundation
import CoreData

class FavoriteDBManager : ObservableObject {
    
    static let instance = FavoriteDBManager()
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    
    init(){
        container = NSPersistentContainer(name: "FavoriteMovies")
        container.loadPersistentStores { description, error in
            if let error = error{
                print("error : sss\(error.localizedDescription)")
            }
        }
        
        context = container.viewContext
    }
    
    func saveData(){
        do {
            try context.save()
        } catch let error {
            print("error sss\(error.localizedDescription)")
        }
    }
}
