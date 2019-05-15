//
//  DetailViewController.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 13.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DetailViewController: UIViewController {
    
    public var photo = Photo()

    // MARK: - Properties
    
    @IBOutlet var ownerProfilePicture: UIImageView!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var timeIntervalLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ownerNameLabel.text = photo.getOwner()
        
        guard let url = photo.getHighQualityPhotoUrl() else { return }
        
        SVProgressHUD.show()
        
        Alamofire.request(url).response { response in
            
            SVProgressHUD.dismiss(withDelay: 0.5)
            
            guard let data = response.data else { return }
            self.photoImageView.image = UIImage(data: data)
        }
        
        photoTitleLabel.text = photo.getTitle()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        SVProgressHUD.dismiss()
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
