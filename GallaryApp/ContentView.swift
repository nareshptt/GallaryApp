//
//  ContentView.swift
//  GallaryApp
//
//  Created by student on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var picsViewModel: PicsviewModel
    
    var body: some View {
        
        NavigationView{
            
            List(picsViewModel.picsModel) { image in
                
                NavigationLink(
                    
                    destination: PicsImageView(url: image.downloadurl!, isDetailView: true).ignoresSafeArea()) {
                        
                        VStack{
                            
                            
                            PicsImageView(url: image.downloadurl!, isDetailView: false)
                            
                            
                            Text(image.author!)
                                .padding()
                            
                            
                        }
                        
                    }
                
                
            }
            .onAppear(perform: {
                picsViewModel.loaddata()
            })
            .navigationTitle("Gallary App")
        }
      
    }
}

#Preview {
    ContentView(picsViewModel: PicsviewModel())
}

struct  PicsImageView: View {
    
    var url : String
    var  isDetailView: Bool
    var body: some View {
        AsyncImage(url: URL(string: url)){
            
            AsyncImagePhase in
             
            switch AsyncImagePhase {
                
            case .empty :
                
                ProgressView()
                
            case .success(let image):
                
                image.resizable()
                    .aspectRatio(contentMode: isDetailView ? .fill :  .fit)
                    .cornerRadius( isDetailView ? 0 : 20)
                
            case .failure:
                
                Image(systemName: "photo")
                
            default:
                
                EmptyView()
                
            }
        }
    }
}
