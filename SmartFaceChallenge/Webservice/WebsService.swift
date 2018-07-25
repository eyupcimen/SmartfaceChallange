//
//  WebsService.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 22.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Error: Mappable {

    var code: String!
    var error: String!

    init(_ error: NSError) {
        self.code = String(error.code)
        self.error = error.localizedDescription
    }

    init(code: String, error: String) {
        self.code = code
        self.error = error
    }

    required init?(map: Map) {

    }

    public func mapping(map: Map) {
        code        <- map["code"]
        error       <- map["error"]
    }
}

class WebService {
    var baseError: Error?


    private class func request<T: Mappable>(uri: String, methot: HTTPMethod, parameters: [String: Any]?, success: @escaping (T) -> Void, failure: @escaping (Error) -> Void) {


        var encoding: ParameterEncoding!

        switch methot {
        case .get:
            encoding = URLEncoding.default
        case .put:
            encoding = URLEncoding.default
        case .delete:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
            break
        }

        let headers: HTTPHeaders = [:]

        Alamofire.request(uri , method: methot, parameters: parameters, encoding: encoding, headers:headers ).validate().responseJSON { response in

            if response.result.isSuccess {
                var dataString:NSString?
                if let responseData = response.data{
                    dataString = NSString(data: responseData, encoding: String.Encoding.utf8.rawValue)
                }
                print("\n[Response]: \(uri)\n\(dataString ?? response.result.value!)\n")
                if let object = Mapper<T>().map(JSON: response.result.value as! [String: Any]) {
                    success(object)
                    return
                }
            }

            if response.result.isFailure {
                if let value = response.data {
                    let responseData = String.init(data: value, encoding: String.Encoding.utf8)

                    if let errorString = responseData{
                        print("\n[Error]: \(uri)\n\(errorString)\n")
                    }
                    if let error = Mapper<Error>().map(JSONString: responseData!) {
                        failure(error)
                        return
                    }
                }

                if response.result.error != nil {
                    failure(Error(code: "unknown_error", error: NSLocalizedString("Genereic Service Error", comment: "")))
                    return
                }
            }
        }
    }


    class func getNYIGallerys (parameters:[String : Any] , success: @escaping ( ServiceResult<NYModel> )-> Void, failure: @escaping (Error)-> Void){

        let url = parameters["url"] as! String
        WebService.request(uri:url  , methot: .get , parameters: parameters, success: { (response: ServiceResult<NYModel> ) in

            if response.nyiArray != nil {
                success(response)
            }else {
                failure(Error(code: "", error: "Ooops! Birşeyler ters gitti" ))
            }
        }) { (error: Error) in
            failure(Error(code: "", error: "" ))
        }
    }


}





