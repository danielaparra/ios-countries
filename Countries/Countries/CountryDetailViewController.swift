//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Daniela Parra on 12/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
    
        flagImageView.image = country.flag
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = country.capital
        populationLabel.text = String(country.population)
        languagesLabel.text = country.languages.joined(separator: ", ")
        currenciesLabel.text = country.currencies.joined(separator: ", ")
    }
    
    var country: Country? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    
}
