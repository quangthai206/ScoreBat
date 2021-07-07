//
//  VideoViewModel.swift
//  ScoreBat
//
//  Created by teneocto on 06/07/2021.
//

import Foundation

class VideoViewModel {
    private var apiService = APIService()
    
    private var videos = [Video]()
    
    func fetchVideosData(completion: @escaping () -> ()) {
        apiService.getVideosData { [weak self] (result) in
            switch result {
            case .success(let videos):
                self?.videos = videos
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return videos.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Video {
        return videos[indexPath.row]
    }
}
