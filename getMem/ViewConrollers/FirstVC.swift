//
//  ViewController.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//

import UIKit
import CoreData

class FirstVC: UIViewController {
    let mainView: FirstView = .init()
    var memes: [Meme] = []
    var memesForQuestion: [Meme] = []
    var curentIndex: Int = 0
    lazy var context: NSManagedObjectContext = {
        return CoreDataManager.shared.context
    }()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        mainView.badButton.addTarget(self, action: #selector(badButtonTapped), for: .touchUpInside)
        mainView.takeMemeButton.addTarget(self, action: #selector(takeMemeButtonTapped), for: .touchUpInside)
        mainView.niceButton.addTarget(self, action: #selector(niceButtonTapped), for: .touchUpInside)
        mainView.historyButton.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        mainView.memeImageView.isHidden = true
        mainView.buttonStackView.isHidden = true
               

    }
    func makeMemes(completion: @escaping () -> Void) {
        NetworkService.shared.fetchMemes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let memes):
                    self.memes = memes.data.memes
                    print("success")
                    self.makeMemesForQuestion()
                    completion()
                case .failure(let error):
                    print(error)
                    completion()
                }
            }
        }
    }
    
    func makeMemesForQuestion() {
        guard !memes.isEmpty else { return print ("empty array")}
        while memesForQuestion.count < 3 {
            guard let randomElement = memes.randomElement() else { return }
            memesForQuestion.append(randomElement)
        }
    }
    func loadImage() {
        guard memesForQuestion.count == 3 else { return print ("Массив стой")}
        guard let url = URL(string: memesForQuestion[curentIndex].url) else { return print("Фигня") }
        print ("Присутпаем к загурзке изображения")
        let task = URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print("Ошибка загрузки изображения: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return print("Нет данных")}
            let loadImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.mainView.memeImageView.image = loadImage
            }
        }
        task.resume()
    }
    
    @objc func takeMemeButtonTapped() {
        mainView.memeImageView.isHidden = false
        mainView.buttonStackView.isHidden = false
        memesForQuestion.removeAll()
        mainView.memeImageView.image = nil
        curentIndex = 0
        self.makeMemes{
            self.loadImage()
        }
    }
    
    @objc func badButtonTapped() {
        if curentIndex < 2 {
            curentIndex += 1
            print(curentIndex)
            self.loadImage()
        } else {
            curentIndex = 0
            print(curentIndex)
            self.loadImage()
        }
    }
    @objc func niceButtonTapped() {
        guard let txt = mainView.questionTextField.text, !txt.isEmpty else {
                print("Введите вопрос")
                return
            }

        let newMeme = Memas(context: context)
        newMeme.question = txt
        newMeme.imageUrl = memes[curentIndex].url
        do {
            try context.save()
            print("Данные успешно сохранены!")
        } catch {
            print("Ошибка сохранения: \(error.localizedDescription)")
        }
    }
    @objc func historyButtonTapped() {
        let vc = SavedQuestionVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}


