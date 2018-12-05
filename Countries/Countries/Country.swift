//
//  Country.swift
//  Countries
//
//  Created by Daniela Parra on 12/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

struct Country {
    let name: String
    let region: String
    let capital: String
    let population: Int
    let currencies: [String]
    let languages: [String]
    let flag: UIImage
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case capital
        case population
        case currencies
        case languages
        case alpha3Code
        
        enum CurrencyCodingKeys: String, CodingKey {
            case name
        }
        
        enum LanguageCodingKeys: String, CodingKey {
            case name
        }
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let region = try container.decode(String.self, forKey: .region)
        let capital = try container.decode(String.self, forKey: .capital)
        let population = try container.decode(Int.self, forKey: .population)
        let flagImageName = try container.decode(String.self, forKey: .alpha3Code)
        
        var currenciesContainer = try container.nestedUnkeyedContainer(forKey: .currencies)
        var currenciesArray = [String]()
        
        while !currenciesContainer.isAtEnd {
            let currencyContainer = try currenciesContainer.nestedContainer(keyedBy: CodingKeys.CurrencyCodingKeys.self)
            let currencyName = try currencyContainer.decode(String.self, forKey: .name)
            currenciesArray.append(currencyName)
        }
        
        var languagesContainer = try container.nestedUnkeyedContainer(forKey: .languages)
        var languagesArray = [String]()
        
        while !languagesContainer.isAtEnd {
            let languageContainer = try languagesContainer.nestedContainer(keyedBy: CodingKeys.LanguageCodingKeys.self)
            let languageName = try languageContainer.decode(String.self, forKey: .name)
            languagesArray.append(languageName)
        }
        
        self.name = name
        self.region = region
        self.capital = capital
        self.population = population
        self.currencies = currenciesArray
        self.languages = languagesArray
        self.flag = UIImage(named: flagImageName.lowercased())!
        
    }
}
