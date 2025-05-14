//
//  CrazyView.swift
//  ScratchBook
//
//  Created by Maria Clara Albuquerque Moura on 08/04/25.
//

import UIKit

class TutorialView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
                imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = UIColor.systemPurple
        imageView.isAccessibilityElement = false
        return imageView
    } ()

    lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemPurple
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "1/3"
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemPurple
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.text = "00:00"
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progress = 0.0
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.transform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        view.progressTintColor = UIColor.systemPurple
        view.trackTintColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var timerProgressContainer: UIView = {
        let view = UIView()
        view.layer.borderColor = (UIColor.systemPurple).cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemPurple.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var timerProgressStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [progressView, timerLabel])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    private func setupView() {
        backgroundColor = UIColor(red: 1.0, green: 0.95, blue: 0.97, alpha: 1.0)

        timerProgressContainer.addSubview(timerProgressStack)
        [stepLabel, timerProgressContainer, imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            stepLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            stepLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            timerProgressContainer.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: 16),
            timerProgressContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            timerProgressContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            timerProgressStack.centerYAnchor.constraint(equalTo: timerProgressContainer.centerYAnchor),
            timerProgressStack.leadingAnchor.constraint(equalTo: timerProgressContainer.leadingAnchor, constant: 16),
            timerProgressStack.trailingAnchor.constraint(equalTo: timerProgressContainer.trailingAnchor, constant: -16),
            timerProgressStack.topAnchor.constraint(equalTo: timerProgressContainer.topAnchor, constant: 12),
            timerProgressStack.bottomAnchor.constraint(equalTo: timerProgressContainer.bottomAnchor, constant: -12),
        ])
    }

}

#Preview {
    TutorialViewController()
}
