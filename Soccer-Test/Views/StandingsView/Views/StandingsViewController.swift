//
//  StandingsViewController.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class StandingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var seasonYear:String
    
    private var detailSeason:DetailSeason?
    
    var abbr:String
    
    var years:[Int]
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(DetailSeasonTableViewCell.self, forCellReuseIdentifier: "DetailSeasonTableViewCell")
        return table
    }()
    
    private let presenter = StandingsPresenter()
    
    init(abbr:String, seasonYear:String, years:[Int]) {
        
        self.abbr = abbr
        self.seasonYear = seasonYear
        self.years = years
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standing"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(seasonYear)", style: .plain, target: self, action: #selector(changeYear))
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getStandings(abbr: abbr, seasonYear: seasonYear)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func changeYear(){
        let alert = UIAlertController(title: "Season Choices", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 0, y: 50, width: 270, height: 162))
        
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        
        pickerFrame.selectRow(years.firstIndex(of: Int(seasonYear)!)!, inComponent: 0, animated: true)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.presenter.getStandings(abbr: self.abbr, seasonYear: self.seasonYear)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(self.seasonYear)", style: .plain, target: self, action: #selector(self.changeYear))
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
}

extension StandingsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()
        
        containerView.backgroundColor = .white
        
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let arr = ["GP","W","D","L","Pts"]
        for item in arr {
            let label = UILabel()
            label.textAlignment = .center
            label.text = item
            stackView.addArrangedSubview(label)
        }
        
        containerView.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        
        lbl.text = "Team"
        containerView.addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        lbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        lbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        return containerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailSeason?.standings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSeasonTableViewCell", for: indexPath) as! DetailSeasonTableViewCell
        guard let item = detailSeason?.standings[indexPath.row] else {
            return UITableViewCell()
        }
        cell.reload(index: indexPath.row, standing: item)
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension StandingsViewController{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(years[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seasonYear = String(describing: years[row])
    }
}

extension StandingsViewController:StandingsPresenterDelegate{
    func presentSeasons(seasons: DetailSeason) {
        self.detailSeason = seasons
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
