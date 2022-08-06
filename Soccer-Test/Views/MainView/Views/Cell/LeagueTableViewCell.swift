//
//  LeagueTableViewCell.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    private let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let nameLbl:UILabel = {
        let lbl = UILabel()
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
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .appBackroundColor
        contentView.addSubview(containerView)
        containerView.addSubview(imgView)
        containerView.addSubview(nameLbl)
        containerView.addSubview(abbrLbl)
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true


        imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        imgView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        imgView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        nameLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        nameLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 20).isActive = true
        nameLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true

        abbrLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 20).isActive = true
        abbrLbl.leftAnchor.constraint(equalTo: nameLbl.leftAnchor).isActive = true
        abbrLbl.rightAnchor.constraint(equalTo: nameLbl.rightAnchor).isActive = true
        abbrLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload(item: League){
        imgView.load(url: URL(string: item.logos.light)!)
        nameLbl.text = item.name
        abbrLbl.text = item.abbr
    }
    
}
