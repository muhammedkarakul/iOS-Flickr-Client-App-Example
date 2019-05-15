//
//  Photo.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 11.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo {
    
    // MARK: - Properties
    
    private var farm: Int?
    private var height_q: String?
    private var height_z: String?
    private var id: String?
    private var isfamily: Int?
    private var isfriend: Int?
    private var ispublic: Int?
    private var owner: String?
    private var secret: String?
    private var server: String?
    private var title: String?
    private var url_q: String?
    private var url_z: String?
    private var width_q: String?
    private var width_z: String?
    private var ownername: String?
    private var dateupload: String?
    private var imageData: Data?
    private var ownerProfileImageURL: String?
    private var ownerProfileImageData: Data?
    
    // MARK: - Initialization
    
    init () {
        
        farm = 0
        height_q = ""
        height_z = ""
        id = ""
        isfamily = 0
        isfriend = 0
        ispublic = 0
        owner = ""
        secret = ""
        server = ""
        title = ""
        url_q = ""
        url_z = ""
        width_q = ""
        width_z = ""
        ownername = ""
        dateupload = ""
        imageData = Data()
        ownerProfileImageURL = ""
        ownerProfileImageData = Data()
        
    }
    
    init (
        farm: Int?,
        height_q: String?,
        height_z: String?,
        id: String?,
        isfamily: Int?,
        isfriend: Int?,
        ispublic: Int?,
        owner: String?,
        secret: String?,
        server: String?,
        title: String?,
        url_q: String?,
        url_z: String?,
        width_q: String?,
        width_z: String?,
        ownername: String?,
        dateupload: String?,
        imageData: Data?,
        ownerProfileImageURL: String?,
        ownerProfileImageData: Data?
        ) {
        
        self.farm = farm
        self.height_q = height_q
        self.height_z = height_z
        self.id = id
        self.isfamily = isfamily
        self.isfriend = isfriend
        self.ispublic = ispublic
        self.owner = owner
        self.secret = secret
        self.server = server
        self.title = title
        self.url_q = url_q
        self.url_z = url_z
        self.width_q = width_q
        self.width_z = width_z
        self.ownername = ownername
        self.dateupload = dateupload
        self.imageData = imageData
        self.ownerProfileImageURL = ownerProfileImageURL
        self.ownerProfileImageData = ownerProfileImageData
        
    }
    
    // MARK: - Getter Methods
    
    public func getHighQualityPhotoUrl() -> String? {
        return url_z
    }
    
    public func getLowQualityPhotoUrl() -> String? {
        return url_q
    }
    
    public func getTitle() -> String? {
        return title
    }
    
    public func getOwner() -> String? {
        return owner
    }
    
    public func getOwnerName() -> String? {
        return ownername
    }
    
    public func getDateUpload() -> String? {
        return dateupload
    }
    
    public func getImageData() -> Data? {
        return imageData
    }
    
    public func getOwnerProfileImageURL() -> String? {
        return ownerProfileImageURL
    }
    
    public func getOwnerProfileImageData() -> Data? {
        return ownerProfileImageData
    }
    
    // MARK: - Setter Methods
    
    public func setImageData(_ data: Data?) {
        imageData = data
    }
    
    public func setOwnerProfileImageURL( url: String?) {
        ownerProfileImageURL = url
    }
    
    public func setOwnerProfileImageData( data: Data? ) {
        ownerProfileImageData = data
    }
    
    // MARK: - Utilities
    
    /**
     * Writes photo data to terminal.
     */
    public func printData() {
        
        guard let farm = farm else { return }
        guard let height_q = height_q else { return }
        guard let height_z = height_z else { return }
        
        print("********************")
        print("farm: \(farm)")
        print("height_q: \(height_q)")
        print("height_z: \(height_z)")
    }
    
    /**
     * Get photo data from internet and store with properties.
     */
    public func setData(fromJSON json: JSON) {
        
        farm = json["farm"].int
        height_q = json["height_q"].string
        height_z = json["height_z"].string
        id = json["id"].string
        isfamily = json["isfamily"].int
        isfriend = json["isfriend"].int
        ispublic = json["ispublic"].int
        owner = json["owner"].string
        secret = json["secret"].string
        server = json["server"].string
        title = json["title"].string
        url_q = json["url_q"].string
        url_z = json["url_z"].string
        width_q = json["width_q"].string
        width_z = json["width_z"].string
        ownername = json["ownername"].string
        dateupload = json["dateupload"].string
        
    }
    
}
