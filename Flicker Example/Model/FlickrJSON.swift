//
//  FlickrJSON.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 13.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import Foundation
import SwiftyJSON
//import SVProgressHUD

class FlickrJSON {
    
    public static func getUserPPURL(fromJSON json: JSON, withUserId id: String, completion: @escaping (String) -> Void) {
        
        //if let ownerID = id {
            
            FlickrAPI.getUser(withUserId: id) { response in
                //print("GET USER RESPONSE: \(response)")
                
                if let error = response.error {
                    
                    completion(error.localizedDescription)
                    
                    return
                }
                
                if let data = response.data {
                    do {
                        let json = try JSON(data: data)
                        
                        //print("JSON: \(json)")
                        
                        if let person = json["person"].dictionary {
                            print("PERSON: \(person)")
                            
                            if let iconServer = person["iconserver"]?.string, let iconFarm = person["iconfarm"]?.int, let nsID = person["nsid"]?.string {
                                
                                let ownerProfilePictureURLString = "http://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsID).jpg"
                                
                                completion(ownerProfilePictureURLString)
                                
                            }
                        }
                        
                    } catch {
                        completion("No json received!")
                    }
                }
            }
        //}
    }
    
    public static func getPhotosItem(fromJSON json: JSON, completion: @escaping ([Photo]) -> Void) {
        
        FlickrAPI.getRecentPhotos { response in
            
            if let error = response.error {
                print("ERROR: \(error.localizedDescription)")
                return
            }
            
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
        //return photos
    }
}
