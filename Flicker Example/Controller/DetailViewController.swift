//
//  DetailViewController.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 13.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var ownerProfilePicture: UIImageView!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var timeIntervalLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
