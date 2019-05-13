//
//  FlickrAPIHelper.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 13.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class Flickr {
    
    private static let baseUrl = "https://api.flickr.com/services/rest/"
    
    private static let api_key = "0b255075bbbf70c2f017bb10c4bbdc66"
    
    private static let format = "json"
    
    private static let secret = "8eac4175f638ff99"
    
    public static func getRecentPhotos(completion: @escaping (DataResponse<Any>) -> Void) {
        let parameters = [
            "method" : "flickr.photos.getRecent",
            "api_key" : api_key,
            "per_page" : "99",
            "format" : format,
            "nojsoncallback" : "1",
            "extras" : "url_q,url_z,owner_name,date_upload"
        ]
        
        request(withParameters: parameters, completion: completion)
    }
    
    public static func getUser(withUserId id: String, completion: @escaping (DataResponse<Any>) -> Void) {
        let parameters = [
            "method" : "flickr.people.getInfo",
            "api_key" : api_key,
            "user_id" : id,
            "format" : format,
            "nojsoncallback" : "1"
        ]
        
        request(withParameters: parameters, completion: completion)
    }
    
    private static func request(withParameters parameters: [String : String], completion: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(
            baseUrl,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: nil
            ).responseJSON(completionHandler: completion)
    }
}
