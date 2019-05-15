//
//  InitialViewController.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 9.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//
 
import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var photosTableView: UITableView!
    
    private var photos: [Photo] = [Photo]() {
        didSet {
            photosTableView.reloadData()
        }
    }
    
    //private var availableCells = [IndexPath]()
    
    private var selectedPhotoIndex = 0
    
    private var images = [UIImage]() {
        didSet {
            photosTableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.setDefaultStyle(.dark)
        //SVProgressHUD.setDefaultMaskType(.black)
        
        getPhotosFromFlickr()
    }
    
    private func getPhotosFromFlickr() {
        
        SVProgressHUD.show()
        
        FlickrAPI.getRecentPhotos { response in
            
            if let data = response.data {
                
                do {
                    let json = try JSON(data: data)
                    
                    //print("JSON: \(json)")
                    
                    FlickrJSON.getPhotosItem(fromJSON: json, completion: { photos in
                        
                        self.photos = photos
                        
                        SVProgressHUD.dismiss(withDelay: 0.5)
                        
                    })
                    
                } catch {
                    
                    SVProgressHUD.showError(withStatus: error.localizedDescription)
                    //print("ERROR: No json recived!")
                    
                }
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! PhotoTableViewCell
        
        guard let profileImage = photos[indexPath.row].getOwnerProfileImageData() else { return cell}
        
        if profileImage.count > 0 {
            cell.ownerProfilePicture.image = UIImage(data: profileImage)
        }
        
        cell.ownerNameLabel.text = photos[indexPath.row].getOwnerName()
        
        if let imageData = photos[indexPath.row].getImageData() {
            cell.photoImageView.image = UIImage(data: imageData, scale: 1.0)
        }
        
        cell.photoTitleLabel.text = photos[indexPath.row].getTitle()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPhotoIndex = indexPath.row
        
        performSegue(withIdentifier: "showDetailViewSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let currentPhoto = photos[indexPath.row]
        
        guard let imageData = currentPhoto.getImageData() else { return }
        
        if imageData.count == 0 {
            if let url = currentPhoto.getLowQualityPhotoUrl() {
                
                if let photoURL = URL(string: url) {
                    
                    SVProgressHUD.show()
                    
                    Alamofire.request(photoURL).response(completionHandler: { result in
                        
                        SVProgressHUD.dismiss(withDelay: 0.5)
                        
                        guard let data = result.data else { return }
                        
                        currentPhoto.setImageData(data)
                        
                        guard let image = UIImage(data: data) else { return }
                        
                        self.images.append(image)
                        
                    })
                    
                }
                
            }

        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? DetailViewController {
            detailViewController.photo = photos[selectedPhotoIndex]
        }
    }
 

}
