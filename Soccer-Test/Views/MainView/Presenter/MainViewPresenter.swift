//
//  MainViewPresenter.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

protocol MainViewPresenterDelegate: AnyObject {
    func presentLeagues(leagues:[League])
}

typealias MainPresenterDelegate = MainViewPresenterDelegate & UIViewController

class MainViewPresenter {
    
    weak var delegate: MainPresenterDelegate?
    
    public func setViewDelegate(delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getLeagues(){
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<[League]>.self, from: data)
                self.delegate?.presentLeagues(leagues: model.data)
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
}
