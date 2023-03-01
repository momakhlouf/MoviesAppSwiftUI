//
//  MovieService.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import Foundation

class MovieService : ObservableObject{
    
  
    var totalPages : Int = 1
//     var page = 1
   // let apiKey = "15fe946886608e9b2315244355fb5b94"
    func getMovieFromApi(page : Int) async throws -> [UpcomingMovie]{
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=15fe946886608e9b2315244355fb5b94&page=\(page)")!
        let (data , _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(MovieResponse.self, from: data)
       // DispatchQueue.main.async {
            self.totalPages = decodedData.totalPages
            print(self.totalPages)
        print(" service :: \(Thread.current)") 
        
        
       // }
        return decodedData.results
    }
}
