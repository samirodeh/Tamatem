//
//  ControlBarView.swift
//  Tamatem
//
//  Created by samir odeh on 18/06/2023.
//
// A Genaric UI View the us to controlling web view actions

import UIKit

// MARK: - delegate functions
protocol ControlDelegate:NSObject {
    func didEnterBackward()
    func didEnterForward()
    func didEnterRefresh()
}

final class ControlBarView: UIView {
    // MARK: - @IBOutlet
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Vars
    weak var delegate:ControlDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    private func commonInit() {
        self.backgroundColor = .black
        loadFromNib()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
    
    // MARK: - functions
        // calling the view from nib file
    private func loadFromNib() {
        let superView = Bundle.main.loadNibNamed("ControlBarView", owner: self , options: nil)
            
        guard let view = superView?.first  as? UIView else {
            fatalError("hello i can't open")
        }
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    // MARK: - @IBAction
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.didEnterBackward()
    }
    @IBAction func refeshAction(_ sender: Any) {
        self.delegate?.didEnterRefresh()
    }
    @IBAction func forwordAction(_ sender: Any) {
        self.delegate?.didEnterForward()
    }
    
}


