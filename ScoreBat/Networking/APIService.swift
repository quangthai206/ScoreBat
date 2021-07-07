//
//  APIService.swift
//  ScoreBat
//
//  Created by teneocto on 06/07/2021.
//

import Foundation

class APIService {
    private var dataTask: URLSessionTask?
    
    func getVideosData(completion: @escaping (Result<[Video], Error>) -> Void) {
        let videosURL = "https://www.scorebat.com/video-api/v1/"
        
        guard let url = URL(string: videosURL) else {
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Video].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
}
