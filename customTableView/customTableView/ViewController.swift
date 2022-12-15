//
//  ViewController.swift
//  customTableView
//
//  Created by Emre Özbağdatlı on 11.12.2022.
//

import UIKit

class ViewController: UIViewController{
 
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupView()
    }
}

// MARK: SETUP UI
extension ViewController{
    func setupView(){
        view.backgroundColor = .green
    }
}

// MARK: SETUP TABLE VIEW
extension ViewController{

    private func setupDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        self.registerTableViewCell()
    }
    private func registerTableViewCell(){
        let textFieldCell = UINib(nibName: "EmreTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "cell")
    }
}
// MARK: DATA SOURCE AND DELEGATES
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? EmreTableViewCell{
            return cell
        }
        
        return UITableViewCell()
            
    }
}
