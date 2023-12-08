import UIKit



class ViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Employe id/Email"
        view.font = .systemFont(ofSize: 12)
        view.textColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter a name"
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("login", for: .normal)
        view.layer.cornerRadius = 8
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    private func setupUI() {
        view.backgroundColor = .white
        configureBgView()
        configureNameLabel()
        configureNameTF()
        configureLoginButton()
    }
    
    private func configureBgView() {
        view.addSubview(bgView)
        
        NSLayoutConstraint.activate([
            bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgView.heightAnchor.constraint(equalToConstant: height / 2)
        ])
    }
    
    private func configureNameLabel() {
        bgView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 42),
            nameLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -24),
        ])
    }
    
    private func configureNameTF() {
        bgView.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 12),
            nameTextField.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
        ])
    }
    
    private func configureLoginButton() {
        bgView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 168),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        loginButton.addTarget(self, action: #selector(validateUserData), for: .touchUpInside)
    }

    @objc func validateUserData(_ sender: UIButton) {
        print("hello")
        
        if nameTextField.hasText {
            print("yes reg")
        }
        else {
            nameTextField.placeholder = "Data is null"
            nameTextField.layer.borderWidth = 2
            nameTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
}

