//
//  ServiceResult.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 22.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import ObjectMapper


class ServiceResult<T: Mappable>: NSObject, Mappable {

    //var serviceArray           :   ResponseData<T>!

    var nyiArray : [NYModel]?

    required init?(map: Map) { }
    public func mapping(map: Map) {

//        switch T.self {
//        case is NYModel.Type:
//            serviceArray               <- map["results"]
//        default:
//            break
//        }

        nyiArray <- map["results"]
    }
}


class ResponseData<T: Mappable>: Mappable {

    var Data : [T]?

    required init(map:Map) {}

    func mapping(map: Map) {
        Data                    <- map["Data"]
    }
}

