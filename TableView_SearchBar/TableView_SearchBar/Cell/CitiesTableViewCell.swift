//
//  CitiesTableViewCell.swift
//  TableView_SearchBar
//
//  Created by Grazi Berti on 17/10/20.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCities: UILabel!
    
    func setup(cities: Cities){
        labelCities.text = "\(cities.city) - \(cities.states) - \(cities.country)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
