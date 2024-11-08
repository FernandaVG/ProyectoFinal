//
//  EstiloCellViewCntrollerCelular.swift
//  boceto_2_CellView
//
//  Created by alumno on 10/11/24.
//

import UIKit


extension ControladorPantallaPrincipalDeColeccion: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var largo = self.collectionView.frame.height
        var ancho = self.collectionView.frame.width
        ancho = ancho / 2.1
        largo = ancho * 0.5
        
        return CGSize(width: ancho, height: largo)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        var margin = CGFloat (25)
        return UIEdgeInsets(top: margin, left: margin, bottom: margin ,right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        var ancho = self.collectionView.frame.width
        //ancho = ancho % 3.5
        return ancho
    }
    
    
}
