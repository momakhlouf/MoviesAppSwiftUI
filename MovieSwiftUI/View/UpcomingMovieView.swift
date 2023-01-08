//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import SwiftUI

struct UpcomingMovieView: View {

    @StateObject private var upcomingViewModel = UpcomingMoviesViewModel()
    var body: some View {
        NavigationStack{
            switch upcomingViewModel.state{
            case .loading :
                ProgressView()
                
            case .error(let error) :
                VStack{
                    Text("\(error.localizedDescription)")
                    Button("Retry") {
                        Task{
                         await upcomingViewModel.loadMovies()
                        }
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
                
            case .loaded(let movies) :
                upcomingMovies(of: movies)
            }
            
        }
        .task{
            await upcomingViewModel.loadMovies()
        }
    }
    
    @ViewBuilder
    private func upcomingMovies( of movies : [UpcomingMovie]) -> some View{
        if movies.isEmpty == false {
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
            }
            .listStyle(.inset)
            .navigationTitle("Upcoming Movies")
        }else{
            Text("NO Upcoming Movies")
            
        }
      
    }
}

struct UpcomingMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieView()
    }
}
