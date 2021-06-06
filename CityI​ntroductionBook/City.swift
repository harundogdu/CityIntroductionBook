//
//  City.swift
//  CityI​ntroductionBook
//
//  Created by Harun on 6.06.2021.
//

import Foundation

class City {
    var cityName : String
    var cityRegion : String
    var cityDescription : String
    var cityImageName : String
    
    init(cityName : String , cityRegion : String , cityDescription : String , cityImageName : String) {
        self.cityName = cityName
        self.cityRegion = cityRegion
        self.cityDescription = cityDescription
        self.cityImageName = cityImageName
    }
    
}
