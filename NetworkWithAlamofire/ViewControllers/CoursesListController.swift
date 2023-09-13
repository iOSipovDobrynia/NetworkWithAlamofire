//
//  CoursesListController.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 12.09.2023.
//

import UIKit

class CoursesListController: UITableViewController {
    
    // MARK: - Public properties
    var courses: [Course] = []

    // MARK: - View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Course", bundle: nil), forCellReuseIdentifier: "course")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath)
        guard let cell = cell as? CourseCell else {
            return UITableViewCell()
        }
        return cell
    }

}
