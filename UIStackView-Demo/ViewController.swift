//
//  ViewController.swift
//  UIStackView-Demo
//
//  Created by yesdgq on 2020/9/18.
//  Copyright © 2020 yesdgq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 使用UIStackView构建横竖嵌套视图时，对各stackView及其中的子View的各约束条件要求非常严格，某一个视图的某个约束不正确就可能得到完全不同的效果。
        
        // 垂直方向ScrollView
        let scrollView : UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.backgroundColor = .cyan
            return scroll
        }()
        self.view.addSubview(scrollView)
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0))
        
        // 垂直方向主StackView
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 10
            stackView.alignment = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0).isActive = true
        
        // 添加一些垂直方向的子视图
        for _ in 0...5 {
            let view1: UIView = {
                let view = UIView()
                view.backgroundColor = .lightGray
                return view
            }()
            stackView.addArrangedSubview(view1)
            view1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        // 横向的scrollView
        let scrollView2 : UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.backgroundColor = .purple
            return scroll
        }()
        stackView.addArrangedSubview(scrollView2)
        scrollView2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        scrollView2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        scrollView2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        // 横向的stackView
        // 子stackView和其中的子视图各约束条件尤为关键
        
        let stackView2: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 10
            stackView.alignment = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        scrollView2.addSubview(stackView2)
        stackView2.leadingAnchor.constraint(equalTo: scrollView2.leadingAnchor, constant: 0).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: scrollView2.trailingAnchor, constant: 0).isActive = true
        stackView2.topAnchor.constraint(equalTo: scrollView2.topAnchor, constant: 0).isActive = true
        stackView2.bottomAnchor.constraint(equalTo: scrollView2.bottomAnchor, constant: 0).isActive = true
        stackView2.heightAnchor.constraint(equalTo: scrollView2.heightAnchor, constant: 0).isActive = true //如果未加本条约束，下面View的heightAnchor就无效

        for _ in 0...8 {
            let view: UIView = {
                let view = UIView()
                view.backgroundColor = .yellow
                return view
            }()
            stackView2.addArrangedSubview(view)
            view.widthAnchor.constraint(equalToConstant: 100).isActive = true
            view.heightAnchor.constraint(equalTo: stackView2.heightAnchor, constant: 0).isActive = true
        }
    }


}

