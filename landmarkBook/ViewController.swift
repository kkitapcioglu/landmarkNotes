//
//  ViewController.swift
//  landmarkBook
//
//  Created by Kubilay Kitapçıoğlu on 15.01.2020.
//  Copyright © 2020 Kubilay Kitapçıoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var landmarkImages = [UIImage]()
    var landmarkNames = [String]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //landmark data
        landmarkNames.append("Colosseum - ITALY")
        landmarkNames.append("Great Wall - CHINA")
        landmarkNames.append("Kremlin Palace - RUSSIA")
        landmarkNames.append("Stonehenge - ENGLAND")
        landmarkNames.append("Taj Mahal - INDIA")

        landmarkImages.append(UIImage(named: "colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlinpalace.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
        
        
        
        
        
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete // sola çekip silme
        {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell //zorunlu functions
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]  //sırayla rowlara landmark nameleri verir.
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int //zorunlu function
    {
        return landmarkNames.count //row sayısı
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
         chosenLandmarkName = landmarkNames[indexPath.row]
         chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toImageViewController"
        {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
            
        }
    }

}

