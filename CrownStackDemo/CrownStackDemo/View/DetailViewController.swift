//
//  DetailViewController.swift
//  CrownStackDemo
//
//  Created by Gurwinder singh on 08/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK:- View all properties.

    @IBOutlet weak var detailTable: UITableView!
    var dataObj : Result?
    
    //MARK:- View life cycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }
    
    //MARK:- View all functions.

    func initTable(){
        detailTable.register(UINib(nibName: Constant.Cells.wrapperCell, bundle: nil), forCellReuseIdentifier:Constant.Cells.wrapperCell)
        
        self.detailTable.separatorColor = UIColor.clear

        detailTable.delegate = self
        detailTable.dataSource = self
        detailTable.reloadData()
        
    }
}

//MARK:- View TableView delegates and datasources.

extension DetailViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cells.wrapperCell, for: indexPath) as! CellWrapper
        cell.homeVC = false
        cell.data = dataObj
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
