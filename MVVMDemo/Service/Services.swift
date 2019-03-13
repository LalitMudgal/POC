//
//  Services.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation

class Services {
    // Simulate a long waiting for fetching
    func fetchUniversitiesFromJsonFile( completionHandler: @escaping ( _ success: Bool, _ photos: [University]?, _ error: Error? )->() ) {
        DispatchQueue.global().async {
            

            if let path = Bundle.main.path(forResource: "content", ofType: "json") {
                do {
                    
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let list = try decoder.decode(Universities.self, from: data)
                    completionHandler( true, list.records, nil )
                    
                } catch let error {
                    completionHandler( false, nil, error )
                }
            } else {
                let error = getErrorObj("JSON file not found")
                completionHandler( false, nil, error )
            }
        }
    }
}

func getErrorObj(_ withString: String?, code: Int32 = 8888) -> NSError {
    let userInfo: [AnyHashable: Any] = [
        NSLocalizedDescriptionKey: NSLocalizedString("Error", value: withString ?? Constant.kSomethingWentWrong, comment: "")
    ]
    let errorFinal: NSError  = NSError.init(domain: "", code: 8888, userInfo: userInfo as? [String: Any])
    return errorFinal
}
