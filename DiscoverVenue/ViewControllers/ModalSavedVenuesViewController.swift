//
//  ModalSavedVenuesViewController.swift
//  DiscoverVenue
//
//  Created by Richard Crichlow on 1/20/18.
//  Copyright © 2018 Luis Calle. All rights reserved.
//

import UIKit

class ModalSavedVenuesViewController: UIViewController {

    //Func to set up modalSavedVenuesVC when called
    func configureSavedVenueVC(testArray: [Int]) {
        self.sampleCityArray = testArray
    }
    
    let modalSavedVenuesView = ModalSavedVenuesView()
    
    var sampleCityArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(modalSavedVenuesView)
        modalSavedVenuesView.venueTableView.delegate = self
        modalSavedVenuesView.venueTableView.dataSource = self
        setupView()
        animateTable()

        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        animateTable()
//    }
    
    func animateTable() {
        modalSavedVenuesView.venueTableView.reloadData()
        let cells = modalSavedVenuesView.venueTableView.visibleCells
        let tableViewHeight = modalSavedVenuesView.venueTableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }

    func setupView() {
        view.backgroundColor = .purple
        
        // Left Bar Button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "◀ Back", style: .done, target: self, action: #selector(backButton))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .done, target: self, action: #selector(backButton))
        
    }
    
    @ objc func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
extension ModalSavedVenuesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected IndexPath: \(indexPath)")
        //Segue to venueView here 
    }
    
}

extension ModalSavedVenuesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleCityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueTableViewCell", for: indexPath) as? VenueTableViewCell else {return UITableViewCell()}
        
        let aInt = sampleCityArray[indexPath.row]
        
        cell.textLabel?.text = "Int: \(aInt)"
        cell.imageView?.image = #imageLiteral(resourceName: "placeholder")
        
        return cell
        
        
    }
    
    
}
