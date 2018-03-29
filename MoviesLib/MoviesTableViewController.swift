//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 28/03/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    //MARK: - Lets and Vars
    var movies: [Movie] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocalJSON()
        self.tableView.tableFooterView = UIView()
    }
    
    //MARK: - Custom Methods
    func loadLocalJSON() {
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json"),
            let data = try? Data(contentsOf: jsonURL) else {return}
        
        do {
            movies = try JSONDecoder().decode([Movie].self, from: data)
            self.tableView.reloadData()
        }
        catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieVC = segue.destination as? MovieViewController {
            guard let row = self.tableView.indexPathForSelectedRow?.row else {return}
            let movie = self.movies[row]
            movieVC.movie = movie
        }
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
