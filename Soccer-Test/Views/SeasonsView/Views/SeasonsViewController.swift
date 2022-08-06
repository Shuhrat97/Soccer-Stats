//
//  SeasonsViewViewController.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class SeasonsViewController: UIViewController {
    
    private var details:DetailLeague?
    
    var league:League
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .appBackroundColor
        table.register(SeasonsListTableViewCell.self, forCellReuseIdentifier: "SeasonsListTableViewCell")
        return table
    }()
    
    private let presenter = SeasonsViewPresenter()
    
    init(league:League) {
        
        self.league = league
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = league.abbr
        
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getSeasonsView(leagueId: league.id)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension SeasonsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return details?.seasons.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()

        containerView.backgroundColor = .appBackroundColor

        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false

        lbl.text = details?.seasons[section].displayName

        containerView.addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lbl.leftAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        lbl.rightAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        lbl.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

        return containerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let year:Int = details?.seasons[indexPath.section].year else { return }
        var years:[Int] = []
        details?.seasons.forEach({ season in
            years.append(season.year)
        })
        let vc = StandingsViewController(abbr: league.id, seasonYear: String(describing: year), years: years)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details?.seasons[section].types.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonsListTableViewCell", for: indexPath) as! SeasonsListTableViewCell
        
        guard let item = details?.seasons[indexPath.section].types[indexPath.row] else { return UITableViewCell() }
        cell.reload(season: item)
        cell.selectionStyle = .none
        return cell
    }
}

extension SeasonsViewController:SeasonsViewPresenterDelegate{
    func presentSeasons(items: DetailLeague) {
        self.details = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


