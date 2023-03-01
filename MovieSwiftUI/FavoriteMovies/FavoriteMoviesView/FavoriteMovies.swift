//
//  FavoriteMovies.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 19/02/2023.
//

import SwiftUI

struct FavoriteMovies: View {
    @StateObject var vm = FavoriteViewModel()
    var body: some View {
        
        
        NavigationStack{
            if vm.savedFavorites.isEmpty {
                withAnimation(.spring()){
                    VStack{
                        Image(systemName: "heart.slash")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            //.frame(maxWidth: .infinity)
                            .frame(height: 200)
                        Text("NO MOVIES ADDED")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                }
            }else{
                    List{
                        ForEach(vm.savedFavorites) { entity in
                            FavoriteMoviesView(entity: entity)
                        }
                        .onDelete(perform: vm.deleteFavorite)
                    }
//                    .onTapGesture {
//                        print(vm.savedFavorites.count)
//                    }
    
                    .listStyle(.plain)
                    .navigationTitle("Favorite Movies")
                }
         }
        .task {
            vm.fetchFavorites()
        }
  }
}

struct FavoriteMovies_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovies()
    }
}


struct FavoriteMoviesView  : View{
    let entity : FavoriteMovie
    
    var body: some View {
        
        VStack{
            HStack{
                let url = URL(string: "www.google.com")
                AsyncImage(url: url){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 80)
                
                VStack(alignment: .leading){
                    Text(entity.title ?? "")
                    Text(entity.overView ?? "")
                    
                    //   Image(systemName: entity.isFavorite ? "heart.fill" : "heart")
                }
            }
        }
    }
}
