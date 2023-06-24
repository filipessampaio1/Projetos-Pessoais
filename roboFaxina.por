programa
{

	inclua biblioteca Util --> u

	// as variáveis "l" e "c" (acompanhadas, ou não) por números servirão para manpular o rastreio das posições na matriz, e para declarar as posilções que receberão o caracter "@"
	// as funções 'verifica" e "verifica1" servirão para manter os laços rodando constantemente. uma possível atualização para o progrmaa pode ser a adição de um fim quando o caractere '
	// ' "@" passar por todas as posições da matriz. 
	
	caracter m[10][10]
	inteiro l, c, l1, c1, l2 = 0, c2 = 0, l3 = 0, c3 = 0, fim = 10, fim1 = 9, jogada = 1
	logico verifica = verdadeiro, verifica1
	
	funcao inicio()
	{		
		// o código começa com o povoamento da matriz com a letra "c", ela é quem será apagado na medida em que o caracter "@" percorrer a matriz
		
		para(l = 0; l < fim; l++){
			para(c = 0; c < fim; c++){
				m[l][c] = 'c'
			}
		}
		enquanto(verifica){

			// esse laço de repetição começa com o sorteio dos números (de 1 a 3) para as variáveis "l1" e "c1". esses resultados serão usados para incrementar, decrementar ou manter igual '
			// ' as variáveis "l2" e "c2"

			l1 = u.sorteia(1, 3)
			c1 = u.sorteia(1, 3)

			// nessa parte atribuo "verdadeiro" para a variável "verifica1" para que, deste modo, o laço da linha 39 sempre seja iniciado nesse ponto do código. se faz necessário conta da linha 74.

			verifica1 = verdadeiro
			enquanto(verifica1){

				// aqui nota-se que crio dois blocos de caso, o primeiro na linha 39 para a linha (variáveis "l"); e outro na linha 56 para a coluna (variáveis "c"). a depender do número "l1" '
				// ' as variáveis "l2" e "c2" vão ser, ou não, alterados pelos contadores.
				
				escolha(l1){
					caso 1:
					se(l2 < 9){	// essa condicionante serve para que, o "l2" não seja incrementado se ele for menor que 10 (uma vez que a última linha da matriz é a "9" '
						l2++		// ' (por alguma razão o operador "<" está sendo lido como "<=". por isso que está escrito "9", ao invés de "10".
					}
					pare

					caso 2:
					se(l2 > 0){	// essa condicionante serve para o mesmo propósito da anterior, no entando esta se refere ao decremento.
						l2--
					}
					pare

					caso 3:	// esse caso é que não irá nem incrementar, nem decrementar a linha
					pare
				}

				escolha(c1){
					caso 1:
					se(c2 < 9){	// a mesma coisa que comentei nas linhas 40 e 41 servem para essa linha aqui. no entanto esta se refere à coluna.
						c2++
					}
					pare

					caso 2:
					se(c2 > 0){	// // essa condicionante serve para o mesmo propósito da anterior, no entando esta se refere ao decremento.
						c2--
					}
					pare
	
					caso 3:	// esse caso é que não irá nem incrementar, nem decrementar a coluna
					pare
				}

				se(l2 != l3 ou c2 != c3){	// essa condicionante serve para não permitir que a posição na matriz seja igual a anterior. deste modo o caracter "@" sempre estrá se movimentando. 
					verifica1 = falso	// se uma das condições for verdadeiro o comando "verifica1 = falso" é executado e o laço da linha 34 é interrompido.
				}senao{	// caso as duas condições sejam falsas, isso quer dizer que a nova posição na matriz seria igual a anterior. neste caso a variável "verifica1" continua como verdadeira '
						// ' e são sorteados novos números para as variáveis "l1" e "c1" e o laço da linha 34 se repetirá.
					l1 = u.sorteia(1, 3)
					c1 = u.sorteia(1, 3)
				}
			}

			// nas próximas duas linhas (após o encerramento do laço da linha 34), eu declaro "l3" e "c3" como iguais a "l2" e "c2", deste modo eu guardo os valores dessas duas últimas '
			// ' variáveis em novas variáveis e consigo, na linha 73 fazer a verificação de se os novos valores atribuídos a "l2" e "c2" são iguais aos anteriores, que agora estão em "l3" e "c3".
			
			l3 = l2 
			c3 = c2					
			u.aguarde(100)
			limpa()

			// essa condicionante serve apenas para a primeira repetição do laço da linha 23, que termina na linha 109. ela serve para que o caracter "@" comece '
			// ' numa posção aleatória na matriz. declaro "jogada = 1" nas variáveis globais para que esse laço seja iniciado na primeira repetição '
			// ' no entanto, na linha 98, eu declaro "jogada = 2" e essa variável não é mais alterada ao longo do código, de modo que essa condicionante jamais será verdadeira novamente.
			
			se(jogada == 1){	
				l2 = u.sorteia(0, 9)	
				c2 = u.sorteia(0, 9)	
				m[l2][c2] = '@'
				jogada = 2 	// aqui declaro pela última vez o valor de "jogada"
			}senao{
				m[l2][c2] = '@'
			}
			para(l = 0; l < fim; l++){	//	laço para escrever a matriz com o caracter "@" armazenado nela
				para(c = 0; c < fim; c++){
					escreva(m[l][c], " ")
				}
				escreva("\n")
			}
			m[l2][c2] = ' '	// ao final do laço da linha 102, declaro a posição que a matriz armazenou o "@" como um espaço vazio, deste modo o caracter "c" declarado na linha 20 '					
		}					// 1 será apagado assim que o caracter "@" passar por ele, e este não será repetido, deixando apenas um espaço vazio por onde passa.
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4438; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */