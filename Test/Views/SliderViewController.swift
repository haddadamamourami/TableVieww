//
//  SliderViewController.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-20.
//

import UIKit

class SliderViewController: UIViewController {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var slides: [Slide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       slides = [
        
        Slide(title: "The best rantig app", description: "Rent anywhere you want with good price", image: #imageLiteral(resourceName: "rent")),
        Slide(title: "The best rantig app", description: "Rent anywhere you want with good price", image: #imageLiteral(resourceName: "rent")),
        Slide(title: "The best rantig app", description: "Rent anywhere you want with good price", image: #imageLiteral(resourceName: "slider5"))

        
       ]
        pageControl.numberOfPages = slides.count
        
        registerCells()

    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeSC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
       
        
    }
    }
    

extension SliderViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func registerCells()
        {
            let sliderCollectionViewCell = UINib(nibName: SliderCollectionViewCell.reuseIdentifier, bundle: nil)
            collectionView.register(sliderCollectionViewCell, forCellWithReuseIdentifier: SliderCollectionViewCell.reuseIdentifier)
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            indexPath.row < 3,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.reuseIdentifier, for: indexPath) as? SliderCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
