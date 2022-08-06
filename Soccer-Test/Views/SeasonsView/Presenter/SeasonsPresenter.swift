//
//  SeasonsViewPresenter.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

protocol SeasonsViewPresenterDelegate: AnyObject {
    func presentSeasons(items:DetailLeague)
}

typealias SeasonsViewDelegate = SeasonsViewPresenterDelegate & UIViewController

class SeasonsViewPresenter {
    
    weak var delegate: SeasonsViewDelegate?
    
    public func setViewDelegate(delegate: SeasonsViewDelegate) {
        self.delegate = delegate
    }
    
    func getSeasonsView(leagueId:String){
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues/\(leagueId)/seasons") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<DetailLeague>.self, from: data)
                self.delegate?.presentSeasons(items: model.data)
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
}
