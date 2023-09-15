//
//  NetworkManager.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 12.09.2023.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

enum Link: String {
    case coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses(from url: String, completion: @escaping(Result<[Course], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = Course.getCourses(from: value)
                    completion(.success(courses))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func sendCourseWithPostRequest(to url: String, with data: Course, completion: @escaping(Result<Course, AFError>) -> Void) {
        AF.request(url, method: .post, parameters: data)
            .validate()
            .responseDecodable(of: CourseJP.self) { dataResponse in
                switch dataResponse.result {
                case .success(let courseJP):
                    let course = Course(courseJP: courseJP)
                    completion(.success(course))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
