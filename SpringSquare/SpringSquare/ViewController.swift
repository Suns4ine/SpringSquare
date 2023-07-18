//
//  ViewController.swift
//  SpringSquare
//
//  Created by Vyacheslav Pronin on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var squareView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: Int(view.center.x - Constant.height/2),
                                             y: Int(view.center.y - Constant.height/2),
                                             width: Int(Constant.height),
                                             height: Int(Constant.height)))
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "yea")
        
        return view
    }()
    
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    private var snap: UISnapBehavior?
    
    override func loadView() {
        view = GradientView(gradient: Gradient(colors: [UIColor.systemIndigo.cgColor,
                                                        UIColor.systemMint.cgColor],
                                               coordinat: (start: CGPoint(x: 0, y: 0),
                                                           end: CGPoint(x: 1, y: 1)),
                                               type: .axial))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(squareView)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        squareView.center.x = view.center.x
        squareView.center.y = view.center.y
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        
        let tapPoint = gesture.location(in: view)
        
        if let snap {
            animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: squareView, snapTo: tapPoint)
        
        if let snap {
            animator.addBehavior(snap)
        }
    }
}

private extension ViewController {
    
    enum Constant {
        static let height: CGFloat = 100
    }
}

