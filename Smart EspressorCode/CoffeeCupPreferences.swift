//
//  CoffeeCupPreferences.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 4/5/23.
//

import SwiftUI

struct CoffeeCupPreferences: View {
    @Binding<CofeePreferences> var preferinte : CofeePreferences
    
    
    
    var body: some View {
        
        ZStack{
            

      
            
            VStack{
                if preferinte.milkFoamAmount >= 10 {
                    Image("foam")
                        .resizable()
                        .frame(width: 190, height: preferinte.milkFoamAmount * 2,alignment: .bottom)
                        .padding(-25)
                        .blur(radius:2)

                }
               

               
                
                
              
                
                if preferinte.coffeeAmount >= 10 {
                    CoffeeView(preferinte: preferinte, coffeeColor: .black)
                            .frame(maxWidth: 190, maxHeight: preferinte.coffeeAmount,alignment: .bottom)
                            .padding(-15)
                            .scaleEffect(x:1, y:preferinte.coffeeAmount/100)
        
                }
                
                if preferinte.milkAmount >= 10 {
                    PartsView(color: Color(red: 255/255, green: 250/255, blue: 240/255), flipp: 1)
                        .frame(maxWidth: 190, maxHeight: preferinte.milkAmount,alignment: .bottom)
                        .padding(-15)
                        .scaleEffect(x:1, y:preferinte.milkAmount/100)
                }
                
                if preferinte.alcoholAmount >= 10 {
                    PartsView(color: Color(red: 235/255, green: 230/255, blue: 230/255), flipp: 1)
                        .frame(maxWidth: 190, maxHeight: preferinte.milkAmount,alignment: .bottom)
                        .padding(-15)
                        .scaleEffect(x:1, y:preferinte.alcoholAmount/100)
                }
                
                if preferinte.aromaAmount >= 10 {
                    PartsView(color: Color(red: 50/255, green: 30/255, blue: 0/255), flipp: 1)
                        .frame(maxWidth: 190, maxHeight: preferinte.milkAmount,alignment: .bottom)
                        .padding(-15)
                        .scaleEffect(x:1, y:preferinte.aromaAmount/100)
                }
                
                
                
            }
            .frame(width: 100,height: 210,alignment: .bottom)
            
            
            
            if (preferinte.milkFoamAmount/2) + preferinte.milkAmount +  preferinte.alcoholAmount + preferinte.aromaAmount  + preferinte.coffeeAmount <= 210 {
                
                Image("glassLittle")
                    .resizable()
                    .frame(width: 220, height: 500)
                    .padding(.bottom,200)
                
            }else{
                Image("glassBig")
                    .resizable()
                    .frame(width: 220, height: 500)
                    .padding(.bottom,200)
                
            }

        }.frame(width: 50, height: 100)
    }
}

struct CoffeeCupPreferences_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCupPreferences(preferinte: .constant(CofeePreferences(coffeeStrongness: 50,coffeeAmount:100,aromaAmount: 70, amount: 100, alcoholAmount: 0,milkAmount: 40,milkFoamAmount: 50)))
            
    }
}
