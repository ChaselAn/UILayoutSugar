//
//  ViewController.swift
//  LayoutSugar
//
//  Created by ancheng on 01/01/2021.
//  Copyright (c) 2021 ancheng. All rights reserved.
//

import UIKit
import LayoutSugar

class ViewController: UIViewController {

    private let redView = UIView()
    private let redButton = UIButton()
    private let greenLabel = UILabel()
    private let redLabel = UILabel()

    private let yellowView = UIView()
    private let blueView = UIView()
    private let blackView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        addRedView()
        addRedButton()
        addGreenView()
        addRedLabel()
        addYellowView()
        addBlueView()
        addBlackView()
    }

    private func addRedView() {
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.leadingAnchor <> view.leadingAnchor
        redView.topAnchor <> view.topAnchor + 50
        redView.widthAnchor <> 100
        redView.heightAnchor <> redView.widthAnchor
    }

    private func addRedButton() {
        redButton.setTitle("redButton", for: .normal)
        view.addSubview(redButton)
        redButton <> redView
    }

    private func addGreenView() {
        greenLabel.textColor = .green
        greenLabel.text = "Layout Sugar！ Layout Sugar！ Layout Sugar！ Layout Sugar！ Layout Sugar！ Layout Sugar！ "
        view.addSubview(greenLabel)
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.leadingAnchor <>> redView.trailingAnchor + 10
        greenLabel.centerYAnchor <> redView.centerYAnchor
        greenLabel.trailingAnchor <> view.trailingAnchor - 10
    }

    private func addRedLabel() {
        redLabel.textColor = .red
        redLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        redLabel.text = "Layout Sugar！more text... hey boy"
        view.addSubview(redLabel)
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.centerXAnchor <> view.centerXAnchor
        redLabel.centerYAnchor <> (view.centerYAnchor, .defaultHigh)
        redLabel.widthAnchor <<> 170
    }

    private func addYellowView() {
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        yellowView <> (redView, [.top, .leading(20), .height, .lhsWidth(30)])
        yellowView.topAnchor <> redView.bottomAnchor + 10
    }

    private func addBlueView() {
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        blueView <> [.leading, .safeBottom, .trailing(-20), .lhsHeight(150)]
    }

    private func addBlackView() {
        blackView.backgroundColor = .black
        view.addSubview(blackView)
        blackView <> (blueView, UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
}

