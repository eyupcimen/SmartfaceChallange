//
//  NYModel.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 22.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import Foundation
import ObjectMapper



class NYModel : NSObject, Mappable {

    var accessToken: String?
    var abstract: String?
    var byline: String?
    var created_date: String?
    var des_facet: String?
    var geo_facet: String?
    var item_type: String?
    var kicker: String?
    var material_type_facet: String?
    var org_facet: String?
    var per_facet: String?
    var published_date: String? /// "2018-07-20T11:39:25-04:00"
    var section: String?
    var short_url: String?
    var subsection: String?
    var title: String?
    var updated_date: String?
    var url: String?
    var multimedia: [MultimediaModel]?

    required init?(map: Map){

    }

    func mapping(map: Map) {

        accessToken     <- map["accessToken"]
        abstract     <- map["abstract"]
        byline     <- map["byline"]
        created_date      <- map["created_date"]
        des_facet     <- map["des_facet"]
        geo_facet      <- map["geo_facet"]
        item_type     <- map["item_type"]
        kicker     <- map["kicker"]
        material_type_facet     <- map["material_type_facet"]
        multimedia     <- map["multimedia"]
        org_facet     <- map["org_facet"]
        per_facet     <- map["per_facet"]
        published_date     <- map["published_date"] /// "2018-07-20T11:39:25-04:00"
        section     <- map["section"]
        short_url     <- map["short_url"]
        subsection     <- map["subsection"]
        title     <- map["title"]
        updated_date     <- map["updated_date"]
        url     <- map["url"]

    }
}
