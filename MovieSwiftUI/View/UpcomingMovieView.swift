//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import SwiftUI

struct UpcomingMovieView: View {
  //  @ObservedObject var movieService = MovieService()
    @State var movies : [UpcomingMovie] = []
    var body: some View {
        
        NavigationStack{
            List(movies) { movie in
                HStack{
                    AsyncImage(url: movie.posterURL){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80)
                    
                    VStack(alignment: .leading){
                        Text(movie.title)
                            .font(.title2)
                        Text(movie.overview)
                            .lineLimit(4)
                    }
                }
                .padding()
            }
            .listStyle(.inset)
            .task{
                do{
                    let service = MovieService()
                    movies = try await service.getMovieFromApi()
                }catch{
                    print(error)
                }
            }
            .navigationTitle("Upcomming Movies")
        }
    }
}

struct UpcomingMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieView()
    }
}
