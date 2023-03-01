//
//  TopRatedViewModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/01/2023.
//

import Foundation

@MainActor
class  TopRatedViewModel : ObservableObject {
   
   
    var page = 1
//    enum State {
//        case loading
//        case loaded(TopRated : [TopRatedMovies])
//        case error(Error)
//    }
   
    @Published var topMovies : [TopRatedMovies] = []
   
  //  @Published var state : State = .loading
    
    
    let service = TopRatedService()
    
    func loadTopRated() async {
       // self.state = .loading
       
            do{
              
                    let topMovie = try await service.getTopRatedMovies(page: page)
                    topMovies.append(contentsOf: topMovie )
                
                if page < service.totalPages{
                    self.page += 1
                }
              //  state = .loaded(TopRated: topMovies)
                print("page : \(page)")
            }catch{
                print(error)
            }
        }
}
