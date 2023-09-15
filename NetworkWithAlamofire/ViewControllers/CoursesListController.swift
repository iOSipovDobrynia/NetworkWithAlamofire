//
//  CoursesListController.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 12.09.2023.
//

import UIKit

final class CoursesListController: UITableViewController {
    
    // MARK: - Public properties
    var courses: [Course] = []

    // MARK: - View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: "course")
        fetchCourses()
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
        cell.configure(with: courses[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let newCourseVC = navigationVC.topViewController as? NewCourseViewController else { return }
        newCourseVC.delegate = self
    }
    
    private func fetchCourses() {
        NetworkManager.shared.fetchCourses(from: Link.coursesURL.rawValue) { [weak self] result in
            switch result {
            case .success(let courses):
                self?.courses = courses
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension CoursesListController: NewCourseViewControllerDelegate {
    func sendPostRequest(with data: Course) {
        NetworkManager.shared.sendCourseWithPostRequest(
            to: Link.postRequest.rawValue,
            with: data
        ) { [weak self] result in
                switch result {
                case .success(let course):
                    self?.courses.append(course)
                    self?.tableView.insertRows(
                        at: [IndexPath(row: (self?.courses.count ?? 0) - 1, section: 0)],
                        with: .automatic
                    )
                case .failure(let error):
                    print(error)
                }
            }
    }
}
