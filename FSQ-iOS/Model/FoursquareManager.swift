//
//  FoursquareManager.swift
//  FSQ-iOS
//
//  Created by Kyle Wiltshire on 11/14/19.
//  Copyright © 2019 Kyle Wiltshire. All rights reserved.
//

import Foundation

struct FoursquareManager {
    let baseUrl = "https://api.foursquare.com/v2/venues/search";
    
    func getVenues() {
        let url = "\(baseUrl)?client_id=\(K.fsqKey)&client_secret=\(K.fsqSecret)&v=\(K.v)&near=london&intent=checkin"
        
        fetchData(from: url)
    }
    
    func fetchData(from urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default);
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error: \(error)")
                } else {
                    if let safeData = data {
                        print(safeData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(from data: Data) -> VenueData? {
        let decoder = JSONDecoder();
        
        do {
            let decodedData = try decoder.decode(VenueData.self, from: data)
            return decodedData;
        } catch {
            return nil
        }
    }
    
}
