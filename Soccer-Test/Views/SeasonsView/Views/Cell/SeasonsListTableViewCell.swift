//
//  DetailSeasonTableViewCell.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class SeasonsListTableViewCell: UITableViewCell {
    
    private let nameLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let abbrLbl:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let startDateLbl:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let endDateLbl:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
    
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .appBackroundColor
        contentView.addSubview(containerView)
        containerView.addSubview(nameLbl)
        containerView.addSubview(abbrLbl)
        containerView.addSubview(startDateLbl)
        containerView.addSubview(endDateLbl)
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        nameLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        nameLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        nameLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        
        abbrLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 10).isActive = true
        abbrLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        abbrLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        
        startDateLbl.topAnchor.constraint(equalTo: abbrLbl.bottomAnchor, constant: 10).isActive = true
        startDateLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        startDateLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        
        endDateLbl.topAnchor.constraint(equalTo: startDateLbl.bottomAnchor, constant: 10).isActive = true
        endDateLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        endDateLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        endDateLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload(season:SeasonType){
        self.nameLbl.text = season.name
        self.abbrLbl.text = season.name != season.abbreviation ? "Abbreviation: " + season.abbreviation : ""
        
        let dateFormatter = DateFormatter()
          dateFormatter.locale = Locale(identifier: "en_US") // set locale to reliable US_POSIX
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        let start = dateFormatter.date(from:season.startDate)!
        let end = dateFormatter.date(from:season.endDate)!
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        let startDate = dateFormatter.string(from:  start)
        let endDate = dateFormatter.string(from: end)
            
        self.startDateLbl.text = "Start date: " + startDate
        self.endDateLbl.text = "End date: " + endDate
    }

}
