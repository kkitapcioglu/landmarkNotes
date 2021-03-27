//
//  imageViewController.swift
//  landmarkBook
//
//  Created by Kubilay Kitapçıoğlu on 15.01.2020.
//  Copyright © 2020 Kubilay Kitapçıoğlu. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    


}
