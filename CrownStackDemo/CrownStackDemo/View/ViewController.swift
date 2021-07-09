//
//  ViewController.swift
//  CrownStackDemo
//
//  Created by Gurwinder singh on 08/07/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    //MARK:- View all properties.
    
    var modelArray : Wrapper?
    @IBOutlet weak var WrapperTable: UITableView!
    
    //MARK:- View life cycle.

    
    override func viewDidLoad() {
        super.viewDidLoad()
        triggerResponse()
        layoutView()
    }
    
    //MARK:- View all functions.

    func layoutView(){
        self.title = "Songs collection"
    }
    
    func triggerResponse(){
        
        WrappperViewModel.shared.onClickAPI("API_Data", "json") { success, error, response in
            if let _ = success{
                self.modelArray = response
                self.relaodTable()
            }else{
                print(error ?? "")
            }
        }
    }
    
    func relaodTable (){
        
        WrapperTable.register(UINib(nibName: Constant.Cells.wrapperCell, bundle: nil), forCellReuseIdentifier:Constant.Cells.wrapperCell)
        self.WrapperTable.separatorColor = UIColor.clear

        WrapperTable.delegate = self
        WrapperTable.dataSource = self
        WrapperTable.reloadData()
    }
}
//MARK:- View TableView delegates and datasources.

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cells.wrapperCell, for: indexPath) as! CellWrapper
        cell.data = modelArray?.results?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var  mainView = UIStoryboard(name:"Main", bundle: nil)
        let detailVC : DetailViewController = mainView.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.dataObj = modelArray?.results?[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
}

