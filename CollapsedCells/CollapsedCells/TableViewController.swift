//
//  TableViewController.swift
//  CollapsedCells
//
//  Created by Ary on 16/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataSource = [Avenger]()
    var isCollapsed = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDatasource()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        
        let toggleBarButton = UIBarButtonItem(title: "Expand All", style: .plain, target: self, action: #selector(toggleCells(_:)))
        self.navigationItem.leftBarButtonItem = toggleBarButton
        self.navigationItem.title = "Avengers"
    }
    
    @objc func toggleCells(_ button:UIBarButtonItem) {
        
        let title = isCollapsed ? "Collapse All": "Expand All"
        button.title = title
        isCollapsed.toggle()
        let totalRows = tableView.numberOfRows(inSection: 0)
        
        for index in 0..<totalRows {
            
           let indexPath = IndexPath(row: index, section: 0)
           dataSource[index].isCollapsed = isCollapsed
           tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func configureDatasource() {
        
        let captainAmerica = Avenger(heroName: "Captain America", realName: "Steve Rogers")
        let hawkeye = Avenger(heroName: "Hawkeye", realName: "Clint Barton")
        let warMachine = Avenger(heroName: "War Machine", realName: "James Rhodes")
        let ironMan = Avenger(heroName: "Iron Man", realName: "Tony Stark")
        let spiderMan = Avenger(heroName: "Spider-Man", realName: "Peter Park")
        let hulk = Avenger(heroName: "The Hulk", realName: "Bruce Banner")
        let falcon = Avenger(heroName: "Falcon", realName: " Sam Wilson")
        let thor = Avenger(heroName: "Thor", realName: "Thor Odinson")
        let blackWidow = Avenger(heroName: "Black Widow", realName: "Natasha Romanoff")
        let winterSoldier = Avenger(heroName: "Winter Soldier", realName: "Bucky Barnes")
        let antMan = Avenger(heroName: "Ant-Man", realName: "Scott Lang")
        let captainMarvel = Avenger(heroName: "Captain Marvel", realName: "Carol Danvers")
        let scarletWitch = Avenger(heroName: "Scarlet Witch", realName: "Thor Odinson")
     
        dataSource = [captainAmerica, hawkeye, warMachine, ironMan, spiderMan, hulk, falcon, thor, blackWidow, winterSoldier, antMan, captainMarvel, scarletWitch]
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollapseCell", for: indexPath) as! CollapseTableViewCell
        
        cell.titleLabel.text = dataSource[indexPath.row].heroName
        cell.detailsLabel.text = dataSource[indexPath.row].realName
        cell.isCollapsed = dataSource[indexPath.row].isCollapsed
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dataSource[indexPath.row].isCollapsed.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let isCollapsed =  dataSource[indexPath.row].isCollapsed
        
        if !isCollapsed {
            
            return 100
        }
        
        return 44
    }
}


struct  Avenger {
    
    let heroName: String
    let realName: String
    var isCollapsed: Bool = true
    init(heroName:String, realName:String) {
        self.heroName = heroName
        self.realName = realName
    }
}
