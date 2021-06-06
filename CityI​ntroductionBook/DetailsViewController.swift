//
//  DetailsViewController.swift
//  CityI​ntroductionBook
//
//  Created by Harun on 6.06.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityRegionLabel: UILabel!
    @IBOutlet weak var cityDesciptionLabel: UILabel!
    
    var city : City?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImageView.image = UIImage(named: city!.cityImageName)
        cityNameLabel.text = city?.cityName
        cityRegionLabel.text = city?.cityRegion
        cityDesciptionLabel.text = city?.cityDescription
        
    }

}
