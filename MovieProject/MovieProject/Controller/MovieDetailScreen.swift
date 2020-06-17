//
//  MovieDetailScreen.swift
//  MovieProject
//
//  Created by אדיר נוימן on 17/06/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class MovieDetailScreen: UIViewController {
    
    var selectedMovie: Movie?
    var movieId: String?
    
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var movieName: UILabel!
    
    @IBOutlet var movieYear: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let movie = selectedMovie {
            
            title = selectedMovie!.name
            movieImage.image = UIImage(named: "Movie")
            movieId = movie.id
            movieName.text = movie.name
            movieYear.text = movie.year
            
        }
        
      
        
       
    }
    

    

}
