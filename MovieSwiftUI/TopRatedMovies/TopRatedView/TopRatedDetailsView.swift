//
//  TopRatedDetails.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 26/02/2023.
//

import SwiftUI

struct TopRatedDetailsView: View {
   // @State var showMore : Bool = false
    let movie : TopRatedMovies
    var body: some View {
        List{
            Section{
                VStack{
                    
                    Text(movie.title)
                        .font(.headline)
                        .padding(.bottom)
                    HStack{
                        Text("Release Date: \(movie.releaseDate)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)

                     Spacer()
                        Text(" ⭐️ \(String(format: "%.1f", movie.voteAverage))")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    
                    HStack{
                        AsyncImage(url: movie.posterURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 400)
                            
                        } placeholder: {
                            ProgressView()
                            
                        }
                        .padding()
                        //   .frame(height: 220)
//                        VStack{
                            Text(movie.overview)
                                .font(.subheadline)
                               // .lineLimit(showMore ? .max : 3)
                            
//                            Text(showMore ? "show less" : "show more")
//                                .onTapGesture {
//                                    showMore.toggle()
//                                }
//                        }
                    }
                }
                }
                
            }
           
           
        }
    }

struct TopRatedDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedDetailsView(movie: .mock)
    }
}
