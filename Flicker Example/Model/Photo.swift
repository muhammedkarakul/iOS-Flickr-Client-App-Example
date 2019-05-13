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
        dateupload: String?
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
    
    // MARK: - Setter Methods
    
    
    
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
    public func getDataFrom(photoItem item: JSON) {
        
        farm = item["farm"].int
        height_q = item["height_q"].string
        height_z = item["height_z"].string
        id = item["id"].string
        isfamily = item["isfamily"].int
        isfriend = item["isfriend"].int
        ispublic = item["ispublic"].int
        owner = item["owner"].string
        secret = item["secret"].string
        server = item["server"].string
        title = item["title"].string
        url_q = item["url_q"].string
        url_z = item["url_z"].string
        width_q = item["width_q"].string
        width_z = item["width_z"].string
        ownername = item["ownername"].string
        dateupload = item["dateupload"].string
        
    }
    
}
