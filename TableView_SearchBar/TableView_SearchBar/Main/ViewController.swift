//
//  ViewController.swift
//  TableView_SearchBar
//
//  Created by Grazi Berti on 17/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewCities: UITableView!
    
    var arrayCities = [Cities] ()
    var arrayCitiesFiltered = [Cities] ()
    
    var arrayStates = [String] ()
    var arrayContries = [String] ()
    
    var filterQuery = ""
    var filterState = "Todos"
    var filterContry = "Todos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCities.delegate = self
        tableViewCities.dataSource = self
        
        searchBar.delegate = self
        
        loadAllData()
    }
    
    private func loadAllData() {
        
        arrayCities = [Cities] () //Limpando
        
        arrayCities.append(Cities(city: "Sao Paulo", states: "SP", country: "Brasil"))
        arrayCities.append(Cities(city: "Londrina", states: "PR", country: "Brasil"))
        arrayCities.append(Cities(city: "Monte Seão", states: "MG", country: "Brasil"))
        arrayCities.append(Cities(city: "Blumenau", states: "SC", country: "Brasil"))
        
        arrayCities.append(Cities(city: "West Haven", states: "CT", country: "EUA"))
        arrayCities.append(Cities(city: "New Haven", states: "CT", country: "EUA"))
        arrayCities.append(Cities(city: "New York", states: "NY", country: "EUA"))
        arrayCities.append(Cities(city: "Orlando", states: "FL", country: "EUA"))
        
        arrayCitiesFiltered.append(contentsOf: arrayCities)
        
    }
    
    private func loadData() {
        arrayCitiesFiltered = [Cities] ()
        
        if !filterQuery.isEmpty {
            arrayCitiesFiltered = arrayCities.filter {(cities) -> Bool in
                cities.getTeam().contains(filterQuery.lowercased())
            }
        } else {
            arrayCitiesFiltered.append(contentsOf: arrayCities)
        }
        
        if filterState != "Todos"{
            arrayCitiesFiltered = arrayCitiesFiltered.filter({(cities) -> Bool in
                return cities.states == filterState
            })
        }
        //loadFilters()
        tableViewCities.reloadData()
        
    }
}

extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCitiesFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell
        cell.setup(cities: arrayCitiesFiltered[indexPath.row])
        
        return cell
    }
    
}
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterQuery = searchText
        loadData()
    }
}
