//
//  MultimediaModel.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 22.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import Foundation
import ObjectMapper


class MultimediaModel : NSObject, Mappable {

    var caption: String?
    var copyright: String?
    var format: String?
    var height: String?
    var subtype: String?
    var type: String?
    var url: String?
    var width: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        caption     <- map["caption"]
        copyright     <- map["copyright"]
        format     <- map["format"]
        height     <- map["height"]
        subtype     <- map["subtype"]
        type     <- map["type"]
        url     <- map["url"]
        width     <- map["width"]
    }

}



