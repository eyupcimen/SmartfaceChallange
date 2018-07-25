//
//  ServiceResult.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 22.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import ObjectMapper


class ServiceResult<T: Mappable>: NSObject, Mappable {

    var nyiArray : [NYModel]?

    required init?(map: Map) { }

    public func mapping(map: Map) {

        nyiArray <- map["results"]
    }
}

