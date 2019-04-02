class CalcUnit
    def initialize(contas)
        @contas=contas
    end

    def isnumber?(character)
        character=~/[0-9]/
    end

    def busca_operacao(operacao)
        contador=0
        i=0
        while i<@contas.size
            if operacao==@contas[i]
                contador+=1
            end
            i+=1
        end
        contador
    end

    def acha_numero_ant(index)
        i=1
        while isnumber?(@contas[index-i]) or @contas[index-i]=='.'
            i+=1
        end
        i-=1
        @contas[index-i..index-1].to_f
    end

    def acha_numero_post(index)
        i=1
        while isnumber?(@contas[index+i]) or @contas[index+i]=='.' # pontos decimais
            i+=1
        end
        i-=1
        @contas[index+1..index+i].to_f
    end

    def executa_operacao(operacao)
        if operacao=='^'
            primero_op=acha_numero_ant(@contas.index('^'))
            segundo_op=acha_numero_post(@contas.index('^'))
            primero_op**segundo_op
        elsif operacao=='+'
            primero_op=acha_numero_ant(@contas.index('+'))
            segundo_op=acha_numero_post(@contas.index('+'))
            primero_op+segundo_op
        elsif operacao=='-'
            primero_op=acha_numero_ant(@contas.index('-'))
            segundo_op=acha_numero_post(@contas.index('-'))
            primero_op-segundo_op
        elsif operacao=='*'
            primero_op=acha_numero_ant(@contas.index('*'))
            segundo_op=acha_numero_post(@contas.index('*'))
            primero_op*segundo_op
        elsif operacao=='/'
            primero_op=acha_numero_ant(@contas.index('/'))
            segundo_op=acha_numero_post(@contas.index('/'))
            primero_op/segundo_op
        end
    end

    def substituitexto(index, substituto)
        i=1
        while isnumber?(@contas[index+i]) or @contas[index+i]=='.'
            i+=1
        end
        i-=1
        @contas[
            index+1..index+i]=' '
        @contas[index]=substituto.to_s
        i=1
        while isnumber?(@contas[index-i]) or @contas[index-i]=='.'
            i+=1
        end
        i-=1
        @contas[index-i..index-1]=' '
        @contas.delete!(' ')
    end

    def calc
        i=0
        numero_de_contas=busca_operacao('^')
        while i < numero_de_contas
            substituitexto(@contas.index('^'), executa_operacao('^'))
            i+=1
        end
        i=0
        numero_de_contas=busca_operacao('/')
        while i < numero_de_contas
            substituitexto(@contas.index('/'), executa_operacao('/'))
            i+=1
        end
        i=0
        numero_de_contas=busca_operacao('*')
        while i < numero_de_contas
            substituitexto(@contas.index('*'), executa_operacao('*'))
            i+=1
        end
        i=0
        numero_de_contas=busca_operacao('-')
        while i < numero_de_contas
            substituitexto(@contas.index('-'), executa_operacao('-'))
            i+=1
        end
        i=0
        numero_de_contas=busca_operacao('+')
        while i < numero_de_contas
            substituitexto(@contas.index('+'), executa_operacao('+'))
            i+=1
        end
        @contas.delete!('~')
        @contas
    end
end
