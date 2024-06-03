//
//  PicsModel.swift
//  GallaryApp
//
//  Created by student on 27/05/24.
//

import Foundation

struct PicsModel : Codable, Identifiable{
    
    var id : String?
    var author: String?
    var downloadurl: String?
    
    
    enum CodingKeys: String, CodingKey{
        case id , author
        case downloadurl = "download_url"
    }
    
}
