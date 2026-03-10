//
//  CoffeePartsView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 4/9/23.
//

import SwiftUI

struct CoffeeView: View {
   @State var preferinte : CofeePreferences
    let coffeeColor : Color
    
    init(preferinte: CofeePreferences, coffeeColor: Color) {
        self.preferinte = preferinte
        self.coffeeColor = Color(red: ( 90 - preferinte.coffeeStrongness )/255, green: ( 50 - preferinte.coffeeStrongness )/255, blue: (0)/255)    }
   
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 90,height: 85)
                .padding(.bottom,-15)
                .padding(.trailing,60)
                .rotationEffect(Angle(degrees: 25))
                .foregroundColor(coffeeColor)
            
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .padding(.bottom,-7)
                .padding(.leading,60)
                .rotationEffect(Angle(degrees: -10))
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .padding(.bottom,24)
                .padding(.leading,100)
                .rotationEffect(Angle(degrees: 8))
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 70,height: 80)
                .padding(.bottom,2)
                .padding(.leading,120)
                .rotationEffect(Angle(degrees: 0))
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 70,height: 80)
                .padding(.bottom,0)
                .padding(.trailing,120)
                .rotationEffect(Angle(degrees: 0))
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 80,height: 80)
                .padding(.bottom,29)
                .padding(.trailing,105)
                .rotationEffect(Angle(degrees: -13))
                .frame(width: 80,height: 80)
                .foregroundColor(coffeeColor)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 190,height: 30)
                .padding(.top,50)
                .foregroundColor(coffeeColor)
            
        }.blur(radius: 5)
           
        
      
        
    }
   
}






struct PartsView: View {
    let color : Color
    var flipp : Int 
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 90,height: 85)
                .padding(.bottom,-15)
                .padding(.trailing,60)
                .rotationEffect(Angle(degrees: 25))
                .foregroundColor(color)
            
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .padding(.bottom,-7)
                .padding(.leading,60)
                .rotationEffect(Angle(degrees: -10))
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 80,height: 80)
                .padding(.bottom,24)
                .padding(.leading,100)
                .rotationEffect(Angle(degrees: 8))
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 70,height: 80)
                .padding(.bottom,2)
                .padding(.leading,120)
                .rotationEffect(Angle(degrees: 0))
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 70,height: 80)
                .padding(.bottom,0)
                .padding(.trailing,120)
                .rotationEffect(Angle(degrees: 0))
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 80,height: 80)
                .padding(.bottom,29)
                .padding(.trailing,105)
                .rotationEffect(Angle(degrees: -13))
                .frame(width: 80,height: 80)
                .foregroundColor(color)
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 190,height: 30)
                .padding(.top,50)
                .foregroundColor(color)
            
        }.blur(radius: 5)
            .rotation3DEffect(Angle(degrees: 180),  axis: (x:0,y:1,z:0))
           
        
      
        
    }
   
}








struct Coffee_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView(preferinte: CofeePreferences(coffeeStrongness: 0,coffeeAmount: 50,aromaAmount: 30, amount: 210, alcoholAmount: 40,milkAmount: 30,milkFoamAmount: 50), coffeeColor: Color(.red))
            .frame(width: 500,height: 5)
    }
}


struct Parts_Previews: PreviewProvider {
    static var previews: some View {
        PartsView(color: .red, flipp: 1)
    }
}
