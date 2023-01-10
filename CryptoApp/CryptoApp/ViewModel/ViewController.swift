//
//  ViewController.swift
//  CryptoApp
//
//  Created by Fazil P on 4/12/2022.
//

import UIKit

protocol CoinTableViewDelegate: class {
    func didTapRefreshButton()
}

class ViewController: UIViewController {
    
    var CoinArray = [Data]()
    
    weak var delegate : CoinTableViewDelegate?
    var refreshController: UIRefreshControl?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshController()
       
        
        let annnonymousfunc = { (fetchedCoinArray : [Data]) in
            DispatchQueue.main.async {
                self.CoinArray = fetchedCoinArray
                self.tableView.reloadData()
            }
        }

        CurrencyDataFetch.shared.getAPI(onCompletion: annnonymousfunc)
        print(CoinArray)
        
        
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(tableView)
        tableView.addSubview(refreshController!)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.tableView.register(CoinslistTableViewCell.self, forCellReuseIdentifier: CoinslistTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        self.tableView.backgroundColor = UIColor(named: "background")
        
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func setupRefreshController() {
        refreshController = UIRefreshControl()
        refreshController?.tintColor = UIColor(named: "refreash")
        refreshController?.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshController
    }
    
    @objc func handleRefresh(_ sender: Any?) {
        
        tableView.reloadData()
        delegate?.didTapRefreshButton()
        refreshController?.endRefreshing()
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CoinArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinslistTableViewCell.identifier, for: indexPath) as! CoinslistTableViewCell
        
        cell.backgroundColor = UIColor(named: "background")
        
        let data = CoinArray[indexPath.row]
        cell.bindData(data: data)
        
        return cell
        
    }
    
    
}

