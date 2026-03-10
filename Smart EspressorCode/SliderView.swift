//
//  SliderView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 3/4/23.
//

import SwiftUI






struct CustomSliderView: View {
    @Binding<Double> var value: Double
    @Binding var zoomSlider : Bool
    @State var name : String
    
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 1...100
    var thumbColor: Color = .yellow
    var minTrackColor: Color = .brown
    var maxTrackColor: Color = Color(.gray)
    
    var body: some View {
        ZStack{
            
            
            VStack{
                
                Text(name)
                    .font(zoomSlider ?.title : .title3)
                    .padding(.bottom, -2)
                
                GeometryReader { gr in
                    var thumbHeight = gr.size.height * 0.9
                    let thumbWidth = gr.size.width * 0.38
                    let radius = gr.size.height * 0.5
                    let minValue = gr.size.width * 0
                    let maxValue = (gr.size.width * 1.4) - thumbWidth
                    
                    let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
                    let lower = sliderRange.lowerBound
                    let sliderVal = (self.value - lower) * scaleFactor + minValue
                    
                    
                    
                    
                    
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(maxTrackColor)
                            .opacity(0.4)
                            .frame(width: gr.size.width, height: gr.size.height * 0.95)
                            .clipShape(RoundedRectangle(cornerRadius: radius))
                        
                        HStack {
                            Rectangle()
                                .foregroundColor(minTrackColor)
                                .frame(width: sliderVal, height: gr.size.height * 0.95)
                                .cornerRadius(gr.size.height * 0.49)
                            Spacer()
                        }.clipShape(RoundedRectangle(cornerRadius: radius))
                        
                        HStack {
                            RoundedRectangle(cornerRadius: radius)
                                .frame(width: gr.size.width * 0.98, height: thumbHeight)
                                .padding(.leading,-5)
                                .opacity(0.0001)
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { v in
                                          
                                            
                                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)){
                                                zoomSlider = true
                                            }
                                            
                                            if (abs(v.translation.width) < 0.1) {
                                                self.lastCoordinateValue = sliderVal
                                            }
                                            
                                            if v.translation.width > 0.1 {
                                                if value == maxValue {
                                                    thumbHeight = gr.size.height * 0.9 - v.translation.width
                                                }
                                                let NextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                                self.value = ((NextCoordinateValue - minValue) / scaleFactor)  + lower
                                            } else {
                                                
                                                let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                                self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                            }
                                        }.onEnded {_ in
                                           
                                            withAnimation(.spring(response: 2, dampingFraction: 0.8)){
                                                zoomSlider = false
                                               
                                            }
                                        }
                                )
                            Spacer()
                        }
                    }
                    
                    
                    
                    
                }
                .frame(/*width:zoomSlider ?400  : 560,*/ height: zoomSlider ?100 : 33)
                .scaleEffect(zoomSlider ?1 : 0.7)
                .padding(.trailing,5)
            }
        }
    }
}



struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(2.5), zoomSlider: .constant(true), name: "name")
    }
}
