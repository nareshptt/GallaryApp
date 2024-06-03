//
//  PicsviewModel.swift
//  GallaryApp
//
//  Created by student on 27/05/24.
//

import Foundation

import SwiftUI


class PicsviewModel : ObservableObject {
    
    @Published var picsModel = [PicsModel]()
    
    func loaddata(){
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            let modeldata = try? JSONDecoder().decode([PicsModel].self, from: data!)
            
            DispatchQueue.main.async {
                if let model = modeldata{
                    self.picsModel = model
                }
            }
            
        }.resume()
    }
}
