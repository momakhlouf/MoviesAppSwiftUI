//
//  UpcomingMovieDetails.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 10/01/2023.
//

import SwiftUI

struct UpcomingMovieDetails: View {
    let movie : UpcomingMovie
    @State var isFavorite : Bool = false
    let DBManager  = FavoriteDBManager.instance
    

    @State var cast : [MovieCastMember] = []
    @ObservedObject var vm = FavoriteViewModel()
    var body: some View {
        NavigationStack{
            List{
                Section{
                    VStack{
                        
                        Text(movie.title)
                            .font(.headline)
                            .padding(.bottom)
                        HStack{
                            Text("Release Date: \(movie.releaseDate)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.gray)

                         Spacer()
                            Text(" ⭐️ \(String(format: "%.1f", movie.voteAverage))")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        Divider()
                        
                        HStack{
                            AsyncImage(url: movie.posterURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 400)
                                
                            } placeholder: {
                                ProgressView()
                                Text("Poster is Loading")
                            }
                            .padding()
                            //   .frame(height: 220)
                            
                            Text(movie.overview)
                                .font(.subheadline)
                        }
                    }
                }
                Section("Cast"){
                    ForEach(cast){ cast in
                        VStack(alignment: .leading){
                            Text(cast.name)
                            Text(cast.character)
                                .font(.caption)
                        }
                    }
                }
            }
            
         //   .navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ShareLink(item: movie.posterURL!)
                    .foregroundColor(.gray)
//                Button {
//                    if vm.savedFavorites.contains(where: { fav in
//                        fav.title == movie.title
//                    }) {
//
//                        print("not added again")
//                    }else {
//                        vm.addFavorite(id: Int64(movie.id), isFav: true, overView: movie.overview, releaseDate: "ff", title: movie.title)
//                    }
//
//
//
//                } label: {
                    favoriteButton
//                    if vm.savedFavorites.contains(where: { fav in
//                        fav.title == movie.title
//                    }) {
//                        Image(systemName:"heart.fill" )
//                                .foregroundColor(.red)
//                                .disabled(true)
//                    } else{
//                        Image(systemName:"heart" )
//                                .foregroundColor(.red)
//                    }


                }
                

            }
            .task {
                do{
                    
                    let service = UpcomingDetailsService()
                    cast = try await service.getDetails(of:movie)
                }catch{
                    
                    print("error")
                }
            }
            
        }
    }
  
//}


struct UpcomingMovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieDetails(movie: .mock)
    }
}


extension UpcomingMovieDetails {
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
