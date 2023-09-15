//
//  CourseCell.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 13.09.2023.
//

import UIKit

final class CourseCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberOfLessonsLabel: UILabel!
    @IBOutlet var numberOfTestsLabel: UILabel!
    
    // MARK: - Public func
    func configure(with course: Course) {
        nameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons \(course.numberOfLessons)"
        numberOfTestsLabel.text = "Number of tests \(course.numberOfTests)"
        
        NetworkManager.shared.fetchData(from: course.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.courseImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
