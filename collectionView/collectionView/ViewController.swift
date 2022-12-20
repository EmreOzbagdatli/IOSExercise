//
//  ViewController.swift
//  collectionView
//
//  Created by Emre Özbağdatlı on 20.12.2022.
//

import UIKit

struct PhotoAlbum{
    var image: String
    var text: String
}




class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Doğa", "Manzara", "İnsan", "Bilgisayar", "Kültür", "Ekonomi"]
    var photoAlbum = [PhotoAlbum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        for photo in 1...37 {
                  photoAlbum.append(PhotoAlbum(image: "\(photo)", text: categories.randomElement()!))
              }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        
        
    }
    
}
    
 

    
    



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        let photo = photoAlbum[indexPath.row]
    
        cell.image.image = UIImage(named: "\(photo.image)")
    
        cell.label.text = photo.text
        
        return cell
    }
    

}
