//
//  StoreView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 5/9/23.
//

import SwiftUI

struct StoreView: View {
    
    @State var active = false
    @State var bind = false
    @State var bind2 = false
    @State var bind3 = false
    @State var bind4 = false
    var body: some View {
        VStack{
           
                StoreSliderView(first: 1, last: 5, text: "Vertuo", lit: "a", bind: $bind )
                .padding(.top,bind ?400 : 250)
                .padding(.bottom, !bind ?(-30) : 0)
                
            
            if !bind  {
                StoreSliderView(first: 5, last: 14, text: "Original", lit: "a", bind: $bind2)
                    .padding(.bottom, bind2 ?50: -50)
            }
            if !bind && !bind2  {
                StoreSliderView(first: 14, last: 22, text: "Special Edition", lit: "a", bind: $bind3)
                .padding(.bottom, bind3 ?(240): -50)
                
            }
                
            if !bind && !bind2  && !bind3{
                StoreSliderView(first: 1, last: 8, text: "Grounds", lit: "k", bind: $bind4)
                    .padding(.bottom, bind4 ?430 : 200)
            }
                        
        }
                
            
            
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
