//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Artur Svirin on 8/30/23.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                //dump(response)
                
            } catch {
                
                
            }
        }
        
        dataTask.resume()
    }
}
