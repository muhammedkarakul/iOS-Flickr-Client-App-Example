//
//  FlickrJSON.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 13.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import Foundation
import SwiftyJSON

class FlickrJSON {
    
    public static func getUserPPURL(fromJSON json: JSON, withUserId id: String, completion: @escaping (String) -> Void) {
        
        if let person = json["person"].dictionary {
            print("PERSON: \(person)")
            
            if let iconServer = person["iconserver"]?.string, let iconFarm = person["iconfarm"]?.int, let nsID = person["nsid"]?.string {
                
                let ownerProfilePictureURLString = "http://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsID).jpg"
                
                completion(ownerProfilePictureURLString)
                
            }
        }

    }
    
    public static func getPhotosItem(fromJSON json: JSON, completion: @escaping ([Photo]) -> Void) {
        
        if let photosDictionary = json["photos"].dictionary {
            
            if let photosArray = photosDictionary["photo"]?.array {
                
                var photos = [Photo]()
                
                for photoJSON in photosArray {
                    
                    let tempPhoto = Photo()
                    
                    tempPhoto.setData(fromJSON: photoJSON)
                    
                    photos.append(tempPhoto)
                    
                }
                
                completion(photos)
            }
        }
    }
}
