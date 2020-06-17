//
//  MovieListScreen.swift
//  MovieProject
//
//  Created by אדיר נוימן on 17/06/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class MovieListScreen: UITableViewController {
    
    var movieList = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie List"
        
        let stringUrl = "https://x-mode.co.il/exam/allMovies/allMovies.txt"
        
        if let url = URL(string: stringUrl) {
            
            if let data = try? Data(contentsOf: url) {
                
                parse(json: data)
                return
            }
            
            
        }
        
        showError()

 
    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        
        if let jsonMovies = try? decoder.decode(Movies.self, from: json) {
            
            movieList = jsonMovies.movies
            tableView.reloadData()
        }
        
        
    }
    
    func showError() {
        
        let ac = UIAlertController(title: "Erorr", message: "Sorry, try again later" , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        cell.textLabel?.text = movieList[indexPath.row].name
        cell.detailTextLabel?.text = movieList[indexPath.row].year
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? MovieDetailScreen {
                  
            vc.selectedMovie = movieList[indexPath.row]
                  navigationController?.pushViewController(vc, animated: true)
              }
    }
    

}
