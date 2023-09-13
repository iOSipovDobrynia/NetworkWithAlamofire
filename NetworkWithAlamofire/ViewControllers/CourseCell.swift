//
//  CourseCell.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 13.09.2023.
//

import UIKit

class CourseCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberOfLessonsLabel: UILabel!
    @IBOutlet var numberOfTestsLabel: UILabel!
    
    // MARK: - Public func
    func configure(with course: Course) {
        nameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons \(course.numberOfLessons)"
        numberOfTestsLabel.text = "Number of tests\(course.numberOfTests)"
    }
}
