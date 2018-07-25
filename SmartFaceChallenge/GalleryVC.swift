//
//  GalleryVC.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 21.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage


class GalleryVC: UIViewController
, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {


    var galleryCollView : UICollectionView?
    var baseUrl = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=596c3fdc497a4ad0a6793ed5a0eb5d79"
    var nyData : [NYModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Gallery"
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0 , left: 0 , bottom: 0, right: 0)
        galleryCollView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        galleryCollView!.delegate   = self
        galleryCollView!.dataSource = self
        galleryCollView!.register(GalleryCell.self, forCellWithReuseIdentifier: "Cell")
        galleryCollView!.backgroundColor = UIColor.white
        nyApiGallery()
        self.view.addSubview(galleryCollView!)

    }

    func nyApiGallery(){
        let param = ["url": baseUrl]
        self.nyData = []
        WebService.getNYIGallerys(parameters: param , success: { (response ) in
            self.nyData = response.nyiArray!
            self.galleryCollView?.reloadData()
        }) { (error) in

        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  nyData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! GalleryCell
        let model = self.nyData[indexPath.row]
        cell.getModel(model: model)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let cellSize = CGSize(width: (width - 3)  / 3 , height: (width - 3)  / 3)
        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0 , left: 0 , bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

}

class GalleryCell : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    let imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.white
        return imgView
    }()

    func getModel (model : NYModel )  {
        self.imageView.backgroundColor = .red
        if let modl = model.multimedia {
            if modl.count > 0  {
                let multimedia : MultimediaModel  = modl[1]
                if let multiUrl = multimedia.url {
                    self.imageView.sd_setImage(with: URL(string: multiUrl ), placeholderImage: UIImage(named: "ec.png"))
                }
            } else {
                self.imageView.image = UIImage(named: "ec.png")
            }
        }

    }

    func setUpView()  {
        backgroundColor = .clear
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width , height: self.contentView.frame.size.height )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Hata oluştu")
    }
}


