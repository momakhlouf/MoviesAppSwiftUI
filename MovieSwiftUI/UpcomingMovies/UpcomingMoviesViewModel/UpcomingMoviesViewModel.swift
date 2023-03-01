//
//  UpcomingMoviesViewModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import Foundation

@MainActor
class UpcomingMoviesViewModel : ObservableObject {
//    @Published var heart = "heart"
//    let movie : UpcomingMovie

//    init(heart: String = "heart", movie: UpcomingMovie) {
//        self.heart = heart
//        self.movie = movie
//    }
//    enum State {
//        case loading
//        case loaded(movies : [UpcomingMovie])
//        case error(Error)
//    }
    
    @Published var allMovies = [UpcomingMovie]()
     var page = 1
    
   // @Published var state : State = .loading
    
    let service = MovieService()
    
    func loadMovies() async {
        // this is for the retry button action because while click the func state will be on .error 
       // self.state = .loading
        do{
            let movies =  try await service.getMovieFromApi(page: page)
            allMovies.append(contentsOf: movies)
         
            //print(allMovies.count)
            if page < service.totalPages{
                page += 1
            }
            print("page : \(page)")
            print(service.totalPages)
            print(" vmodel :: \(Thread.current)")

         //   state = .loaded(movies: allMovies)
        }catch{
            print(error)
           // self.state = .error(error)
        }
    }
    
    
//    func changeFavorite(){
//        
//        if allMovies.contains(where: { fav in
//            fav.title == movie.title
//        }) {
//            heart = "heart.fill"
//        }else{
//            heart = "heart"
//        }
//        
//    }
   
 //   var state : State = .loading
}
