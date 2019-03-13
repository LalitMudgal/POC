//
//  UniversityListViewModel.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation

class UniversityListViewModel : ViewModelDelegate {
    
    private var failureBlock : ((String) -> ())?
    private var successBlock : (() -> ())?

    var errorAlert: ((String) -> ())? {
        get {
            return failureBlock
        }
        set {
            failureBlock = newValue
            
        }
    }
    
    var reloadData: (() -> ())? {
        get {
            return successBlock
        }
        set {
            successBlock = newValue
        }
    }
    
    
    var universities: [University] = [University]()

    lazy var apiService: Services = {
        return Services()
    }()
    
    func initData() {
        apiService.fetchUniversitiesFromJsonFile { [weak self] (success, list, error) in

                if success {
                    if let universities = list {
                        self?.universities = universities
                    }
                    
                    self?.successBlock?()

                } else {
                    
                    self?.failureBlock?(error?.localizedDescription ?? "")
                }
        }
    }
    
    func numberOfRows() -> Int {
        return universities.count
    }
    
    func viewModelForCell(index : Int) -> UniversityViewModel {
        let model = universities[index]
        let viewModel = UniversityViewModel(with: model)
        return viewModel
    }
    
}

extension UniversityViewModel {
    
    fileprivate init(with info : University) {
        self.university_name = info.university_name
        self.description = info.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.created_at = dateFormatter.string(from: info.created_at)
        self.university_image = info.university_image
    }
}
