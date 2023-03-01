//
//  UpcomingMovieDetailsViewModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 10/01/2023.
//

import Foundation

@MainActor
class UpcomingMoviesDetailsViewModel : ObservableObject {
    enum State {
        case loading
        case loaded (cast : [MovieCastMember])
        case error(Error)
    }
    
    
  //  let movie : UpcomingMovie
    @Published var state : State = .loading
  

    let service = UpcomingDetailsService()
    
    func loadDetails(movie : UpcomingMovie) async{
        state = .loading
        do{
            let movieDetails = try await service.getDetails(of: movie)
            state = .loaded(cast: movieDetails)
        }catch{
            state = .error(error)
        }
        
    }
}
