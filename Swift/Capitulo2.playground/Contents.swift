//: Playground - noun: a place where people can play

import UIKit






func multiplicadorEDivide ( numero: Int, by valor: Int) ->(multiplicador: Int, divide: Int){

return (numero * valor, numero / valor)

}

let resultado = multiplicadorEDivide(4,  by: 2)

let multiplo =  resultado.multiplicador

let divide = resultado.divide
