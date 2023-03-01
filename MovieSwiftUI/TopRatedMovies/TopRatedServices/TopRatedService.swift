//
//  TopRatedService.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/01/2023.
//

import Foundation

class TopRatedService : ObservableObject{
  //  var page : Int = 1
    var totalResults : Int = 1
    var totalPages : Int = 1
    @Published var topMovies : [TopRatedMovies] = []
    func getTopRatedMovies(page : Int) async throws -> [TopRatedMovies]{
         
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=15fe946886608e9b2315244355fb5b94&language=en-US&page=\(page)")!
        
      
        let (data , _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(TopRatedResponse.self, from: data)
        
     //   DispatchQueue.main.async {
          //  self.topMovies.append(contentsOf: decodedData.results)
           // print("jjjj\(self.topMovies.count)")

            self.totalResults = decodedData.totalResults
            self.totalPages = decodedData.totalPages

            print(self.totalPages)

       // }
     
        return decodedData.results
    }
}

