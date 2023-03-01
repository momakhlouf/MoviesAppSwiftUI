//
//  FavoriteViewModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 19/02/2023.
//

import Foundation
import CoreData
import SwiftUI

class FavoriteViewModel : ObservableObject{
 
    let DBManager  = FavoriteDBManager.instance
    
    @Published var savedFavorites : [FavoriteMovie] = []
    
    init() {
        fetchFavorites()
    }
    
    func fetchFavorites(){
        let request = NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
        
        do{
            savedFavorites  = try  DBManager.context.fetch(request)
        }catch let error {
            print("error: \(error) ssss")
        }
        
//saveData()
    }
    
    func addFavorite( id : Int64 , isFav : Bool , overView : String , releaseDate : String ,  title : String ){
      //  let data = image.jpegData(compressionQuality: 1)
        let newFav = FavoriteMovie(context: DBManager.context)
        newFav.id = id
       // newFav.image = data
        newFav.isFavorite = isFav
        newFav.overView = overView
        newFav.releaseDate = releaseDate
        newFav.title = title
        
        saveData()
        
    }
    
    
    func deleteFavorite(indexSet : IndexSet){
        guard let index = indexSet.first else{ return}
            let entity = savedFavorites[index]
        DBManager.context.delete(entity)
        saveData()

        print(savedFavorites.count)
 
    }
    
    func deleteFromFavoriteButton(at index : Int){
        //savedFavorites.remove(at: index)
        DBManager.context.delete(savedFavorites[index])
        saveData()
        
    }
    
    
    func saveData(){
        DBManager.saveData()
        fetchFavorites()
    }
}
