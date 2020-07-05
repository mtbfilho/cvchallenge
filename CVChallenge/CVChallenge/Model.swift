//
//  Model.swift
//  CVChallenge
//
//  Created by Marco Tullio Braga Filho on 05/07/20.
//  Copyright © 2020 mtbfilho. All rights reserved.
//

import Foundation
import ObjectMapper

class CatsResponse: Mappable {
    var data: [CatsAlbum]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class CatsAlbum: Mappable {
    var images: [CatsImage]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        images <- map["images"]
    }
}

class CatsImage: Mappable {
    var type: String?
    var link: String?
    var width: Int?
    var height: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        link <- map["link"]
        width <- map["width"]
        height <- map["height"]
    }
}
