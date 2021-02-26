//
//  Header.swift
//  NewsAppProgramatically
//
//  Created by MD Tanvir Alam on 26/2/21.
//

import UIKit

final class HeaderView:UIView{
    private var fontSize: CGFloat
    
    private lazy var headingLabel:UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "News"
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        return v
    }()
    
    private lazy var headingCircleImage:UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        v.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return v
    }()
    
    private lazy var plusImage: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        v.image = UIImage(systemName: "plus", withConfiguration: config)
        return v
    }()
    
    private lazy var headerStackView : UIStackView = {
        let v = UIStackView(arrangedSubviews: [headingCircleImage,headingLabel,plusImage])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        return v
    }()
    
    private lazy var subHeadLineLabel:UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = v.font.withSize(fontSize)
        v.text = "Top Head lines"
        v.textColor = .gray
        return v
    }()
    
    init(fontSize:CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(headerStackView)
        addSubview(subHeadLineLabel)
        setupConstraint()
    }
    
    func setupConstraint(){
        //newsHeadline
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        //subHeadline
        NSLayoutConstraint.activate([
            subHeadLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subHeadLineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subHeadLineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
