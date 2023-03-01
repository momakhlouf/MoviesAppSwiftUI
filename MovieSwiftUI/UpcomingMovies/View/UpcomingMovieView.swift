//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import SwiftUI

struct UpcomingMovieView: View {
    @State private var searchMovie = ""
    @StateObject private var upcomingViewModel = UpcomingMoviesViewModel()
    @StateObject private var favoriteVm = FavoriteViewModel()
    
    let DBManager  = FavoriteDBManager.instance
    @State var isFave : Bool = false
    
    var body: some View {
        NavigationStack{
            //   ScrollView{
            
        //    switch upcomingViewModel.state{
          //  case .loading : ProgressView()
                
//            case .error(let error) :
//                VStack{
//                    Text("\(error.localizedDescription)")
//                    Button(" Retry? ") {
//                        Task{
//                            await upcomingViewModel.loadMovies()
//                        }
//                    }
//                    .padding()
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .background(Color(.systemGray))
//                    .clipShape(Capsule())
//                }
                
           // case .loaded(let movies) :
                
                upcomingMovies()
            
           // }
            
        }
        .task{ await upcomingViewModel.loadMovies() }
        .navigationTitle("Upcoming Movies")
        .searchable(text: $searchMovie , placement: .navigationBarDrawer(displayMode: .always))
        
        
    }
    
    
    @ViewBuilder
    private func upcomingMovies() -> some View{
        if !upcomingViewModel.allMovies.isEmpty{
            
                List{
                    ForEach(filteredMovies) { movie in
                        NavigationLink {
                            UpcomingMovieDetails(movie: movie)
                            
                        } label: {
                            UpcomingMovieRowView(movie: movie)
                        }
                    }
                    if searchMovie.isEmpty{
                        ProgressView()
                            .onAppear{ async{
                                await  upcomingViewModel.loadMovies()
                                print("load")
                               
                            }
                            }
                    }
                }
            
            .scrollIndicators(.hidden)
            .listStyle(.inset)
            .navigationTitle("Upcoming Movies")
            .navigationBarTitleDisplayMode(.inline)
        }else{
            Text("NO Upcoming Movies")
        }
    }
    
    
    var filteredMovies : [UpcomingMovie] {
        if searchMovie.isEmpty {
            return upcomingViewModel.allMovies
        }else{
            return upcomingViewModel.allMovies.filter{ $0.title.localizedStandardContains(searchMovie)}
        }
    }
    
}
    struct UpcomingMovieView_Previews: PreviewProvider {
        static var previews: some View {
            UpcomingMovieView()
        }
    }

