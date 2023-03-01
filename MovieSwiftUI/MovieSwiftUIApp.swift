//
//  MovieSwiftUIApp.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import SwiftUI

@main
struct MovieSwiftUIApp: App {
    @StateObject private var vm = FavoriteViewModel()

    var body: some Scene {
        WindowGroup {
            
            TabBarView()
           //     .environment(\.managedObjectContext, vm.container.viewContext)

          //  FavoriteMovies()

        }
    }
}
