//
//  ViewController.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import UIKit

class MovieListVC: UIViewController {
    @IBOutlet weak var movieListTableView: UITableView!
    
    var movieListVM = MovieListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.largeTitleNavBarSetup()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.title = "Movie List"
        
        movieListTableView.register(UINib(nibName: MovieCell.identifier, bundle: nil), forCellReuseIdentifier: MovieCell.identifier)
        movieListTableView.register(UINib(nibName: FooterCell.identifier, bundle: nil), forCellReuseIdentifier: FooterCell.identifier)
        
        self.view.activityStartAnimating()
        movieListVM.getMovieList {[weak self] message, error in
            self?.view.activityStopAnimating()
            if message != nil {
                print("success message: \(String(describing: message))")
                self?.movieListTableView.reloadData()
            } else {
                print("error message: \(String(describing: error))")
                self?.showAlert(withTitle: "Error!", message: error ?? "default error")
            }
        }
    }

}

extension MovieListVC: UITableViewDelegate {

}

extension MovieListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVM.movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (movieListVM.movieList?.count ?? 0) - 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FooterCell.identifier, for: indexPath) as? FooterCell else {
                fatalError("FooterCell is not initialized")
            }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            fatalError("MovieCell is not initialized")
        }
        cell.movieModel = movieListVM.movieList?[indexPath.row]
        cell.setupCell(for: indexPath)
        return cell
    }
}

