//
//  CoinslistTableViewCell.swift
//  CryptoApp
//
//  Created by Fazil P on 04/01/2023.
//

import UIKit

class CoinslistTableViewCell: UITableViewCell, CoinTableViewDelegate {
   
    static let identifier = "CoinslistTableViewCell"
    
    
     private let Iconlabel: UILabel = {
         let label = UILabel()
         label.text = ""
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 18)
         label.textAlignment = .left
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
       
        
    }()
    
    private let Namelabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
       
        
    }()
    
    private let Dollar_rate: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
       
        
    }()
    
    private let Per_hour: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
       
        
    }()
    
    let containerView: UIView = {
      let view = UIView()
      view.backgroundColor = UIColor.brown
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()


    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "cellColor")
        contentView.layer.cornerRadius = 8

        contentView.addSubview(Iconlabel)
        contentView.addSubview(Namelabel)
        contentView.addSubview(Dollar_rate)
        contentView.addSubview(Per_hour)
        
        Namelabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        Namelabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        Namelabel.widthAnchor.constraint(equalToConstant:200).isActive = true
        Namelabel.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        Iconlabel.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        Iconlabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 10).isActive = true
        Iconlabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
        
        Dollar_rate.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        Dollar_rate.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -20).isActive = true
        Dollar_rate.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
        
        Per_hour.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
        Per_hour.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        Per_hour.topAnchor.constraint(equalTo:self.Dollar_rate.bottomAnchor).isActive = true

        
        
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func bindData(data: Data) {
        
        self.Iconlabel.text = data.symbol
        self.Namelabel.text = data.name
        self.Dollar_rate.text = String(format: "%.2f", data.quote?.usd?.price ?? 0.0)
        self.Per_hour.text = String(format: "%.2f", data.quote?.usd?.percentChange1H ?? 0.0)

    }
    
    func didTapRefreshButton() {
        refreshDate()
    }
    
    func refreshDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        Namelabel.text = dateString
        Iconlabel.text = dateString
        Dollar_rate.text = dateString
        Per_hour.text = dateString
        
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7))
        
    }
    
}
