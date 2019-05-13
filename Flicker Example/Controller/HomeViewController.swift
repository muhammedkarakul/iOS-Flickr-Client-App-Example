//
//  InitialViewController.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 9.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

/*
Flicker
 
Key:
0b255075bbbf70c2f017bb10c4bbdc66
 
Secret:
8eac4175f638ff99
 
 If the icon server is greater than zero, the url takes the following format:
 http://farm{icon-farm}.staticflickr.com/{icon-server}/buddyicons/{nsid}.jpg
 
 else the following url should be used:
 https://www.flickr.com/images/buddyicon.gif
*/
 
import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import SVProgressHUD

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var photosTableView: UITableView!
    
    private var photos = [Photo]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show(withStatus: "Photos are loading...")
        
        Flickr.getRecentPhotos { response in
            print("RESPONSE: \(response)")
            
            SVProgressHUD.dismiss(withDelay: 0.5)
            
            if let photosData = response.data {
                do {
                    
                    let photosJSON = try JSON(data: photosData)
                    
                    if let photos = photosJSON["photos"].dictionary {
                        
                        if let photo = photos["photo"]?.array {
                            
                            for item in photo {
                                
                                let tempPhoto = Photo()
                                
                                tempPhoto.getDataFrom(photoItem: item)
                                
                                self.photos.append(tempPhoto)
                                
                            }
                            
                            self.photosTableView.reloadData()
                            
                        }
                    }
                    
                } catch {
                    // JSON is invalid.
                    SVProgressHUD.showError(withStatus: "There is a problem.")
                }
                
            } else {
                // No data received.
                SVProgressHUD.showError(withStatus: "There is a problem.")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! PhotoTableViewCell
        
        if let ownerID = photos[indexPath.row].getOwner() {
            Flickr.getUser(withUserId: ownerID) { response in
                //print("RESPONSE: \(response)")
            }
        }
        
        cell.ownerNameLabel.text = photos[indexPath.row].getOwnerName()
        
        if let photoURLString = photos[indexPath.row].getHighQualityPhotoUrl() {
            if let photoURL = URL(string: photoURLString) {
                Alamofire.request(photoURL).response { result in
                    if let imageData = result.data {
                        cell.photoImageView.image = UIImage(data: imageData, scale: 1.0)
                    } else {
                        print("No result received.")
                    }
                }
            }
            
        }
        
        cell.photoTitleLabel.text = photos[indexPath.row].getTitle()

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Item Index: \(indexPath.row)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
