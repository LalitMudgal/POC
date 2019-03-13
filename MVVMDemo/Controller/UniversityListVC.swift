//
//  UniversityListVC.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import UIKit

protocol ViewModelDelegate {
    
    func initData()
    func numberOfRows() -> Int
    func viewModelForCell(index : Int) -> UniversityViewModel
    
    
    var reloadData : (()->())? {
        get set
    }
    
    
    var errorAlert : ((String)->())? {
        get set
    }
}

extension ViewModelDelegate {
    
}

class UniversityListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dataSource : ViewModelDelegate!
    var selectedIndexPath: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init the static view
        initView()
        
        dataSource = UniversityListViewModel()
        
        dataSource.reloadData = { [weak self] in
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }
        
        dataSource.errorAlert = { error in
            CommonMethods.showAlertOnWindow( message: error)
        }
        
        dataSource.initData()
        
    }
    
    func initView() {
        self.navigationItem.title = "Popular"
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension UniversityListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as? UniversityTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        
        let model = dataSource.viewModelForCell(index: indexPath.row)
        cell.dataModel = model
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.numberOfRows()
    }
}


class UniversityTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var dataModel : UniversityViewModel! {
        didSet {
            self.nameLabel.text = dataModel.university_name
            self.descriptionLabel.text = dataModel.description
            self.dateLabel.text = dataModel.created_at
            self.imgView.setImageWithUrl(urlstring: dataModel.university_image)
        }
    }
}
