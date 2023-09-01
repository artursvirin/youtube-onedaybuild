//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Artur Svirin on 9/1/23.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        return cache[url]
    }
}
