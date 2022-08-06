//
//  StandingsPresenter.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

protocol StandingsPresenterDelegate: AnyObject {
    func presentSeasons(seasons:DetailSeason)
}

typealias StandingsDelegate = StandingsPresenterDelegate & UIViewController

class StandingsPresenter{
    
    weak var delegate:StandingsDelegate?
    
    public func setViewDelegate(delegate: StandingsDelegate) {
        self.delegate = delegate
    }
    
    func getStandings(abbr:String, seasonYear:String){
        guard var urlComponents = URLComponents(string: "https://api-football-standings.azharimm.site/leagues/\(abbr)/standings") else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: seasonYear),
            URLQueryItem(name: "sort", value: "asc")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<DetailSeason>.self, from: data)
                self.delegate?.presentSeasons(seasons: model.data)
            } catch {
                print("Error: \(error)")
            }
        }

        task.resume()
    }
}
