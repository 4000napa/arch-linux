#!/usr/bin/ruby
require_relative 'CalcUnit'

contas = '~' # serve para impedir um loop na hora de achar os operandos das opercaoes
for string in ARGV do
    contas += string
end
contas+='~' # serve para impedir um loop na hora de achar os operandos das operacoes
i=0
if contas.include?('(')
    while contas.include?('(') do
        index=contas.index('(')
        while contas[index+i]!=')' do
            if contas[index+i]=='('        ## implementar reconhecimento de numeros nao inteiros por meio da virgula
                index+=i
            end
            i+=1
        end
        calculoParanteses=CalcUnit.new('~'+contas[index+1..index+i-1]+'~')
        contas[index]=' '
        contas[index+i]=' '
        contas[index+1..index+i-1]=calculoParanteses.calc
        contas.delete!(' ')
    end
    calculo=CalcUnit.new(contas)
    puts calculo.calc
else
    calculo=CalcUnit.new(contas)
    puts calculo.calc
end 