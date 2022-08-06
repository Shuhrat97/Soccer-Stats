//
//  DetailSeasonTableViewCell.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class DetailSeasonTableViewCell: UITableViewCell {
    
    private let rankLbl:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.font = lbl.font.withSize(15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let nameLbl:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = lbl.font.withSize(15)
        lbl.lineBreakMode = .byWordWrapping
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let gamePlayedLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let winsLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let drawsLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let loseLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let ptsLbl:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(rankLbl)
        contentView.addSubview(imgView)
        contentView.addSubview(nameLbl)
        contentView.addSubview(stackView)
        
        rankLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        rankLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
//        rankLbl.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imgView.leftAnchor.constraint(equalTo: rankLbl.rightAnchor, constant: 5).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 5).isActive = true
        nameLbl.rightAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10).isActive = true
        
        stackView.addArrangedSubview(gamePlayedLbl)
        stackView.addArrangedSubview(winsLbl)
        stackView.addArrangedSubview(drawsLbl)
        stackView.addArrangedSubview(loseLbl)
        stackView.addArrangedSubview(ptsLbl)
        
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload(index:Int, standing:Standing){
        self.rankLbl.text = "\(index+1)"
        if let urlString = standing.team.logos.first?.href {
            self.imgView.load(url: URL(string: urlString)!)
        }
        
        self.nameLbl.text = standing.team.name
        
        self.winsLbl.text = standing.stats[0].displayValue
        self.loseLbl.text = standing.stats[1].displayValue
        self.drawsLbl.text = standing.stats[2].displayValue
        self.gamePlayedLbl.text = standing.stats[3].displayValue
        self.ptsLbl.text = standing.stats[6].displayValue
    }

}
