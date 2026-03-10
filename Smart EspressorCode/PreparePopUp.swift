//
//  PreparePopUp.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 2/27/23.
//

import SwiftUI


struct PreparePopUp: View {
    @Binding var VectorFavorite : [Bool]
    @Binding var sentJob : Bool
    @State var viewState = CGSize.zero
    @State var fullScreen : Bool = false
    @State var ok : Double = 1.0
    
    @State var coffeeAmount = false
    @State var strongness = false
    @State var sweetness = false
    @State var milkAmount = false
    @State var milkFoamAmount = false
    @State var temperature = false
    @State var alcoholAmount = false
    @State var aromaAmount = false
    @State var name : String
    @State var nameCopy : String = "1"
    @State var vectind = 0
        
    
   
    
    @Binding<CofeePreferences> var preferinte : CofeePreferences
     
   
    var body: some View {
      
       
            ZStack{
               
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity,maxHeight:900)
                            .foregroundColor(Color("VisibleBackground"))
                            .opacity(0.4)
                            .blur(radius: 35)
                            .scaleEffect(1)
                            .padding(.bottom,0)
//                            .background(Color("visibleBackground"))
                         
                        RoundedRectangle(cornerRadius: 38)
                            .frame(maxWidth: .infinity,maxHeight: !fullScreen ?500 : .infinity)
                            .colorInvert()
                            .padding(!fullScreen ?10 : 0)
                            .padding(.bottom,0)


                    }.animation(.spring(response: 0.5,dampingFraction: 0.9))
                   
                    VStack{
                        Spacer()
                        Button(){
                            sentJob.toggle()
                        }label: {
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 27)
                                    .frame(maxWidth: .infinity,maxHeight:70)
                                    .padding(30)
                                    .padding(.horizontal, -3)
                                    .foregroundColor(.gray)
                                    .opacity(0.15)
                                Text("Sent Job")
                                    .font(.title3)
                                    .foregroundColor(.brown)
                            }
                        }
                        
                    }.blur(radius: sweetness || milkFoamAmount || temperature || alcoholAmount || strongness || milkAmount || aromaAmount ?20 : 0)
                    .animation(.spring(response: 0.5,dampingFraction: 0.8))
                
                
                VStack{
                    
                    if !fullScreen {
                        HStack{
                            
                            Button(){
//                                nameCopy = name
//                                nameCopy.remove(at: nameCopy.startIndex)
                                VectorFavorite[ Int(nameCopy)! ].toggle()
                                print(nameCopy)
                                print(VectorFavorite)
                               
                            }label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(.brown)
                                        .frame(maxWidth: 40,maxHeight:40)
                                        .blur(radius: 8)
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(maxWidth: 40,maxHeight:40)
                                     
                                        .foregroundColor(.white)
                                       // .opacity(0.15)
                                    Image(systemName: VectorFavorite[vectind] ?"star.fill" : "star")
                                        .scaleEffect(1.1)
                                        .foregroundColor(.brown)
                                }
                                    
                            } .padding(.top,30)
                              .padding(.leading,-90)
                              
                            
                            Text("Capucino Libra")
                                .padding(.top,!fullScreen ?40 : 60)
                                .font(.title)
                                .blur(radius: sweetness || milkFoamAmount || temperature || alcoholAmount || strongness || milkAmount || coffeeAmount || aromaAmount ?20 : 0)
                                .animation(.spring(response: 0.5,dampingFraction: 0.8))
                            
                        }  .animation(.spring(response: 0.6,dampingFraction: 0.8))
                        
                    }
                    
                    if fullScreen {
                        
                        Text("Capucino Libra")
                            .padding(.top,!fullScreen ?40 : 60)
                            .font(.title)
                            .blur(radius: sweetness || milkFoamAmount || temperature || alcoholAmount || strongness || milkAmount || coffeeAmount || aromaAmount ?20 : 0)
                            .animation(.spring(response: 0.5,dampingFraction: 0.8))
                        
                    }
                    
                    
                    
                    if !fullScreen {
                        Image(name)
                            .scaleEffect(0.8)
                            .frame(width: 20, height: 230)
                            .animation(.spring(response: 0.5,dampingFraction: 0.8))
                    }
                    
                    
                    Spacer()
                    if !fullScreen {
                        Text("swipe up to customize")
                            .padding(.bottom, 20)
                            .animation(.spring(response: 0.5,dampingFraction: 0.8))
                    }else{
                        VStack{
                          
                            
                            
                            CoffeeCupPreferences(preferinte: $preferinte)
                                .scaleEffect( milkAmount || milkFoamAmount || temperature || alcoholAmount || sweetness || strongness || coffeeAmount || aromaAmount ?0.7 : 0.4)
                                .padding(.bottom,130)
                                .padding(.top,  milkAmount || milkFoamAmount || temperature || alcoholAmount || sweetness || strongness || coffeeAmount  || aromaAmount ?(200) : 0)
                                .animation(.spring(response: 1.5,dampingFraction: 0.8))
                            
                            
                            
                            
                            HStack{
                                
                                VStack{
                                    CustomSliderView(value: $preferinte.coffeeAmount, zoomSlider: $coffeeAmount, name: "coffee amount")
                                        .frame(width: coffeeAmount  ?400 : 200,height: 30)
                                        .padding(.bottom,30)
                                        .blur(radius: milkAmount || milkFoamAmount || temperature || alcoholAmount || sweetness || strongness || aromaAmount ?20 : 0)
                                        .padding(.leading,coffeeAmount  ?200 : 0)
                                    
                                    
                                    
                                    CustomSliderView(value: $preferinte.milkAmount, zoomSlider: $milkAmount, name: "milk amount")
                                        .frame(width: milkAmount  ?400 : 200,height: 60)
                                        .padding(.bottom,30)
                                        .blur(radius: sweetness || milkFoamAmount || temperature || alcoholAmount || strongness || coffeeAmount || aromaAmount ?20 : 0)
                                        .padding(.leading,milkAmount  ?200 : 0)
                                    
                                    CustomSliderView(value:$preferinte.milkFoamAmount, zoomSlider: $milkFoamAmount, name: "milk foam amount")
                                        .frame(width: milkFoamAmount  ?400 : 200,height: 60)
                                        .padding(.bottom,30)
                                        .blur(radius: milkAmount || sweetness || temperature || alcoholAmount || strongness || coffeeAmount || aromaAmount ?20 : 0)
                                        .padding(.leading,milkFoamAmount  ?200 : 0)
                                  
                                    
                                    CustomSliderView(value: $preferinte.alcoholAmount, zoomSlider: $alcoholAmount, name: "alcohool amount")
                                        .frame(width: alcoholAmount  ?400 : 200,height: 60)
                                        .padding(.bottom,30)
                                        .blur(radius: milkAmount || milkFoamAmount || temperature || sweetness || strongness || coffeeAmount || aromaAmount ?20 : 0)
                                        .padding(.leading,alcoholAmount  ?200 : 0)
                                }
                                VStack{
                                    CustomSliderView(value:$preferinte.sweetness, zoomSlider: $sweetness, name: "sweetness")
                                        .frame(width: sweetness  ?400 : 200,height: 30)
                                        .padding(.bottom,30)
                                        .blur(radius:  milkAmount || milkFoamAmount || temperature || alcoholAmount || strongness || coffeeAmount || aromaAmount ?20 : 0)
                                        .padding(.trailing,sweetness  ?200 : 0)
                                    
                                    
                                    CustomSliderView(value: $preferinte.temperature, zoomSlider: $temperature, name: "temperature")
                                        .frame(width: temperature  ?400 : 200,height: 60)
                                        .padding(.bottom,30)
                                        .blur(radius: milkAmount || milkFoamAmount || sweetness || alcoholAmount || strongness  || coffeeAmount ?20 : 0)
                                        .padding(.trailing,  temperature || aromaAmount ?200 : 0)
                                    
                                    
                                    CustomSliderView(value: $preferinte.coffeeStrongness, zoomSlider: $strongness, name: "coffee strongness")
                                        .frame(width: strongness  ?400 : 200,height: 60)
                                        .padding(.bottom,30)
                                        .blur(radius: milkAmount || milkFoamAmount || sweetness || alcoholAmount || coffeeAmount || temperature || aromaAmount ?20 : 0)
                                        .padding(.trailing,strongness  ?200 : 0)
                                    
                                    VStack{
                                        CustomSliderView(value: $preferinte.aromaAmount, zoomSlider: $aromaAmount, name: "aroma")
                                            .frame(width: aromaAmount  ?400 : 200,height: 60)
                                            .padding(.bottom,30)
                                            .blur(radius: milkAmount || milkFoamAmount || sweetness || alcoholAmount || strongness  || coffeeAmount  || alcoholAmount ?20 : 0)
                                            .padding(.trailing, temperature || aromaAmount ?200 : 0)
                                        
                                        Text("aroma can be demenuatd by high temperatures")
                                                .font(  aromaAmount || temperature ?.callout : .caption2)
                                                .padding(.trailing, temperature || aromaAmount ?200 : 0)
                                                .multilineTextAlignment(.center)
                                                .opacity( temperature || aromaAmount ?20 : 0)
                                                .blur(radius: !temperature && !aromaAmount ?20 : 0)
                                                
                                        
                                        
                                    }.padding(.bottom,-30)
                                       
                                }
                            }
                            
                            
                            
                    }//vs
                        .padding(.bottom,100)
                }//else
                }.frame(maxWidth:.infinity,maxHeight: .infinity)
                    .padding(.bottom,100)
                    .onAppear{
                        nameCopy = name
                        nameCopy.remove(at: nameCopy.startIndex)
                        vectind = Int(nameCopy)!
                    }
                
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: !fullScreen ?500 : .infinity)
            .padding(.top, !sentJob ?2000 : 0)
            .transition(.push(from: .bottom))
         //   .animation(.spring(response: 0.5,dampingFraction: 0.8))
            .offset(x: viewState.width, y: viewState.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring(response: 0.5,dampingFraction: 0.8)){
                            if fullScreen {
                                if value.translation.height > 10 {
                                    viewState = value.translation
                                }
                            }else{
                                viewState = value.translation

                            }
                        }
                        
                    }
                    .onEnded { value in
                        if value.translation.height < 0{
                            withAnimation(.spring(response: 0.5,dampingFraction: 0.8)){ fullScreen = true }
                        }
                        if value.translation.height > 30{
                            withAnimation(.spring(response: 0.5,dampingFraction: 0.8)){
                                sentJob.toggle()
                               
                            }
                        }
                        withAnimation(.spring(response: 0.5,dampingFraction: 0.8)) {
                            viewState = .zero
                        }
                    }
            )
        
        
        
        
        
        if !sentJob {
            CoffeeCupPreferences(preferinte: $preferinte)
                .frame(width: 500, height: 500)
            
        }
        
    }
   
}





struct PreparePopUp_Previews: PreviewProvider {
    static var previews: some View {
        PreparePopUp(VectorFavorite: .constant([true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false]), sentJob: .constant(true),name: "c9" ,preferinte:.constant(CofeePreferences(coffeeStrongness: 50,coffeeAmount: 50,aromaAmount: 30, amount: 50, alcoholAmount: 70,milkAmount: 30,milkFoamAmount: 50)))
    }
}
