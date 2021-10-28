//
//  ViewController.swift
//  multiProgress
//
//  Created by Baiaman Apsamatov on 14/10/21.
//

import UIKit

class ViewController: UIViewController {
    private lazy var collectionView = self.makeCollectionView()
    private lazy var generateAgainButton = self.makeGenerateAgainButton()
    
    private var colorGenerate: ColorGenerator!
    
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        
        self.colorGenerate = ColorGenerator()
        self.colorGenerate.generatingColors(count: 41)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeConstraints()
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: " ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func makeConstraints() {
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.generateAgainButton)
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 5.0).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5.0).isActive = true
        self.collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        self.collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        self.generateAgainButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.generateAgainButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        self.generateAgainButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        self.generateAgainButton.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor,constant: 30.0).isActive = true
    }
}

//MARK: - extensions for proprerties
extension ViewController {
    
    func makeCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0.0
//        layout.minimumInteritemSpacing = 0.0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        return view
    }
    func makeGenerateAgainButton() -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(self.generate), for: .touchDown)
        view.setTitle("GENERATE AGAIN", for: .normal)
        view.backgroundColor = UIColor.black
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }
    
    @objc func generate() {
        self.colorGenerate.colors = []
        self.colorGenerate.generatingColors(count: 41)
        self.collectionView.reloadData()
    }
}

//MARK: - Data source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colorGenerate.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: " ", for: indexPath)
        cell.backgroundColor = self.colorGenerate.colors[indexPath.row]
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0, right: 15.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
