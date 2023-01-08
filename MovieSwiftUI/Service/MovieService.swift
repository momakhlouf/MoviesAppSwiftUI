//
//  MovieService.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import Foundation

class MovieService : ObservableObject{
  //  @Published var movies = [Movie]()
    let apiKey = "15fe946886608e9b2315244355fb5b94"
    func getMovieFromApi() async throws -> [UpcomingMovie]{
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        let (data , _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(MovieResponse.self, from: data)
        
        return decodedData.results
    }
    
    //        if let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)") {
    //            let session = URLSession(configuration: .default)
    //            let task = session.dataTask(with: url) { data, response, error in
    //                if error == nil {
    //                    let decoder = JSONDecoder()
    //                    if let safeData = data {
    //                        do{
    //                            let results = try decoder.decode(MovieResponse.self, from: safeData)
    //                            DispatchQueue.main.async {
    //                                self.movies = results.results
    //                                print(results)
    //                                print(self.movies)
    //                            }
    //                        }catch{
    //                            print("dddd\(error)")
    //                        }
    //                    }
    //                }
    //            }
    //            task.resume()
    //        }
}
