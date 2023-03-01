//
//  TopRatedView.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/01/2023.
//

import SwiftUI

struct TopRatedView: View {
    @StateObject private var topRatedModel = TopRatedViewModel()
    @StateObject private var vm = FavoriteViewModel()
    @State var searchText = ""
    @State var isFavorite : Bool = false
    var body: some View {
        NavigationStack{
           
//                switch topRatedModel.state {
//                case .loading : ProgressView()
//                case .error(let error) : Text("error\(error.localizedDescription)")
//                case.loaded(let movies) :
//                    topRated()
//                }
          
                topRated()

         

            
                .navigationTitle("Top Rated Movies")
                .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $searchText)
//        .task {
//            await topRatedModel.loadTopRated()
//        }
    }
    
    
    @ViewBuilder
    func topRated() -> some View{
       // if topRatedModel.topMovies.isEmpty{
            List{
                ForEach(filteredMovies) { top in
                    
                    NavigationLink {
                       TopRatedDetailsView(movie: top) // UpcomingMovieDetails(movie: top)
                    } label: {
                        TopRatedViewRow(movie: top)
//                        HStack{
//                            AsyncImage(url:  top.posterURL) { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                            }placeholder: {
//                                ProgressView()
//                            }
//                            .frame(width: 80)
//                            .cornerRadius(10)
//                            VStack(alignment: .leading){
//                                HStack{
//                                    Text(top.title)
//                                        .fontWeight(.semibold)
//                                    Spacer()
//                                }
//
//                                //  .fontWeight(.regular)
//                                Text(top.overview)
//                                    .font(.subheadline)
//                                    .fontWeight(.light)
//                                    .lineLimit(2)
//                                    .foregroundColor(.gray)
//                                Text("⭐️\(String(format: "%.1f", top.voteAverage))")
//                                    .font(.subheadline)
//                                    .fontWeight(.medium)
//                            }
//                        }

                    }
                }
                ProgressView()
                    .onAppear{ async{
                        print("wwwww")
                        await topRatedModel.loadTopRated()
                    }
                    }
            }
            .listStyle(.plain)
      //  }else{
        //    Text("TOP MOVIES NOT FOUNDED")
        //}
        
    }
    
    var filteredMovies : [TopRatedMovies] {
        if searchText.isEmpty{
            return topRatedModel.topMovies
        }else{
            return topRatedModel.topMovies.filter{ $0.title.localizedStandardContains(searchText)}
        }
    }
}

struct TopRatedView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedView()
    }
}

