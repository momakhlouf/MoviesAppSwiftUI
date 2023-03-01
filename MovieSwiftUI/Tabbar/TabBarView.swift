//
//  Tabbar.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/01/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            UpcomingMovieView()
                .tabItem {
                    Label("Upcoming", systemImage: "list.dash")
                        
                }
            TopRatedView()
                .tabItem {
                    Label("Top Rated", systemImage: "star.fill")
            }
//
            FavoriteMovies()
                .tabItem {
                    Label("fav", systemImage: "heart.fill")
            }

                

        }.accentColor(.black)
            
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
