//
//  MainViewController.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class MainViewController: UIViewController{
    
    private var leagues:[League] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .appBackroundColor
        table.register(LeagueTableViewCell.self, forCellReuseIdentifier: "LeagueTableViewCell")
        return table
    }()
    
    private let presenter = MainViewPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getLeagues()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension MainViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = SeasonsViewController(league: leagues[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell", for: indexPath) as! LeagueTableViewCell
        let item = leagues[indexPath.row]
        cell.reload(item: item)
        cell.selectionStyle = .none
        return cell
    }
}

extension MainViewController:MainViewPresenterDelegate{
    func presentLeagues(leagues: [League]) {
        self.leagues = leagues
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
