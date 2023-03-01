//
//  TopRatedViewRow.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 26/02/2023.
//

import SwiftUI

struct TopRatedViewRow: View {
    @StateObject var vm = FavoriteViewModel()
    let movie : TopRatedMovies
    var body: some View {
      
        HStack{
            AsyncImage(url:  movie.posterURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }placeholder: {
                ProgressView()
            }
            .frame(width: 80)
            .cornerRadius(10)
            VStack(alignment: .leading){
                HStack{
                    Text(movie.title)
                        .fontWeight(.semibold)
                    Spacer()
                    favoriteButton
                }
                
                //  .fontWeight(.regular)
                Text(movie.overview)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                Text("⭐️\(String(format: "%.1f", movie.voteAverage))")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }

    }
    }


struct TopRatedViewRow_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedViewRow(movie: TopRatedMovies(id: 1, originalTitle: "22", overview: "22", posterPath: "2", releaseDate: "22", title: "22", voteAverage: 1))
    }
}


extension TopRatedViewRow {
    var favoriteButton : some View {
        VStack{
            if vm.savedFavorites.contains(where: { fav in
                fav.title == movie.title}){
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 25 , height: 25)
                    .foregroundColor(.red)
                    .onTapGesture {
                //        #error("find error here")
                        vm.deleteFromFavoriteButton(at: vm.savedFavorites.firstIndex(where: {$0.id == movie.id})!)
                        print(vm.savedFavorites.count)
                    }
            }else{
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 24 , height: 24)
                    .foregroundColor(.red)
                    .onTapGesture {
                        vm.addFavorite(id : Int64(movie.id) , isFav: true, overView: movie.overview, releaseDate: "ff", title: movie.title)
                        print("add")
                }
            }
        }
    }
}
