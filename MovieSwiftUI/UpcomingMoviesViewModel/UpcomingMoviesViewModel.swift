//
//  UpcomingMoviesViewModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import Foundation

@MainActor
class UpcomingMoviesViewModel : ObservableObject {
    
    enum State {
        case loading
        case loaded(movies : [UpcomingMovie])
        case error(Error)
    }
    @Published var state : State = .loading
    let service = MovieService()
    
    func loadMovies() async {
        // this is for the retry button action because while click the func state will be on .error 
        state = .loading
        
        do{
            let movies = try await service.getMovieFromApi()
            state = .loaded(movies: movies)
        }catch{
            state = .error(error)
        }
    }
 //   var state : State = .loading
    
    
}
