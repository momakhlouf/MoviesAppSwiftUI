//
//  UpcomingMovieRowView.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/02/2023.
//

import SwiftUI

struct UpcomingMovieRowView: View {
    let movie : UpcomingMovie
    @State var isFave : Bool = false
    @ObservedObject var vm = FavoriteViewModel()

    var body: some View {
        HStack{
            AsyncImage(url: movie.posterURL){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }placeholder: {
                ProgressView()
            }
            .frame(width: 80)
            
            VStack(alignment: .leading){
                HStack{
                    Text(movie.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                  favoriteButton
                }
                
                Text(movie.overview)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .lineLimit(2)
    
                Text(" ⭐️ \(String(format: "%.1f", movie.voteAverage))")
                    .font(.subheadline)
                    .fontWeight(.medium)
    
            }
        }
    }
}

struct UpcomingMovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieRowView(movie: UpcomingMovie(id: 1, title: "e", overview: "e", posterPath: "e", voteAverage: 5, releaseDate: "e"))
    }
}


extension UpcomingMovieRowView {
    var favoriteButton : some View {
        VStack{
            
         
            if vm.savedFavorites.contains(where: { fav in
                fav.title == movie.title}){
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 25 , height: 25)
                    .foregroundColor(.red)
                    .onTapGesture {
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
