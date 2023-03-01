//
//  FavoriteMovie+CoreDataProperties.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 25/02/2023.
//
//

import Foundation
import CoreData


extension FavoriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovie> {
        return NSFetchRequest<FavoriteMovie>(entityName: K.favoriteEntity)
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var overView: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var id: Int64

}

extension FavoriteMovie : Identifiable {

}
