programa
{	
	inclua biblioteca Util --> sorteio

	//"máximo" é igual ao número de linhas da matriz - 1
	//"fim" é iagual  ao número de linhas da matriz
	//"fim_sorteio" é igual a metade do número de posições da matriz
	//"fim_espelho" = "máximo"

	inteiro v_linha, v_coluna, mtrz_tabuleiro[4][4], mtrz_numeros[4][4], v_duplica[8], v_linha1, v_coluna1
	inteiro cont = 0, cont4, linha, coluna, minimo = 0, maximo = 3, numero_sorteio[8], numero_linha = 0, numero_coluna = 0, numero_linha1 = 0, numero_coluna1 = 0, numero_sorteio1[8]
	inteiro fim = 4, igual, jogada = 1, verificar = 0, fim_sorteio = 8, fim_espelho = 3, nivel_jogo, numeros_linhas
	logico verifica = verdadeiro, verificar1 = verdadeiro
	
	funcao inicio()
	{
		gerar_tabuleiro()
		
		/*o programa está rodando com duas matrizes, uma que irá receber os valores aleatórios 
		gerados pelo próprio programa; e outra irá esconder a primeira matriz para que, na medida em que o usuário for digitando 
		as posições da matriz, o números sejam revelados*/
		// INÍCIO DO PROGRAMA: ele inicia gerando a matriz com os números aleatórios e exibindo para o usuário a matriz que "esconde" os números
		
		escreva("Vamos jogar o Jogo da Memória!\n\n")
		sorteio.aguarde(3500)
		limpa()

		para(cont = 1; cont <= 4; cont++){
			escreva("    |", cont, "|", "\t")
		}
		escreva("\n\n")
		
		para(linha = 0; linha < fim; linha++){
			numeros_linhas = linha + 1
			escreva("|", numeros_linhas, "|")
			para(coluna = 0; coluna < fim; coluna++){
				escreva("  ")
				escreva(mtrz_tabuleiro[linha][coluna] + "     ")
			}
			escreva("\n\n")
		}			

		/* ENTRADA DE DADOS(USUÁRIO): aqui o usuário irá digitar um valor para a linha e uma 
		valor para a coluna para que a posição seja reconhecida na matriz e o valor seja revelado*/
				
		enquanto(verifica){
			escreva("      Qual linha você quer? ")
			leia(v_linha)
			escreva("\n")
			escreva("      Qual coluna você quer? ")
			leia(v_coluna)
			escreva("\n")
			limpa()
			v_linha--
			v_coluna--
			
		/* CHECAGEM DE DADOS: aqui o programa irá fazer as validações para revelar o número da 
		primeira posição que o usuário escolheu, e checar se é igual ao número da segunda posição escolhida.*/
			
			se(mtrz_tabuleiro[v_linha][v_coluna] == 0){
				se(jogada == 1){
					v_linha1 = v_linha
					v_coluna1 = v_coluna
	
					mtrz_tabuleiro[v_linha1][v_coluna1] = mtrz_numeros[v_linha1][v_coluna1]
	
					jogada += 1
	
					para(cont = 1; cont <= 4; cont++){
						escreva("    |", cont, "|", "\t")
					}
					escreva("\n\n")
		
					para(linha = 0; linha < fim; linha++){
						numeros_linhas = linha + 1
						escreva("|", numeros_linhas, "|")
						para(coluna = 0; coluna < fim; coluna++){
							escreva("  ")
							escreva(mtrz_tabuleiro[linha][coluna] + "     ")
						}
						escreva("\n\n")
						}
						
				}senao se(jogada == 2){
					mtrz_tabuleiro[v_linha][v_coluna] = mtrz_numeros[v_linha][v_coluna]
					
					para(cont = 1; cont <= 4; cont++){
						escreva("    |", cont, "|", "\t")
					}
					escreva("\n\n")
		
					para(linha = 0; linha < fim; linha++){
						numeros_linhas = linha + 1
						escreva("|", numeros_linhas, "|")
						para(coluna = 0; coluna < fim; coluna++){
							escreva("  ")
							escreva(mtrz_tabuleiro[linha][coluna] + "     ")
						}
						escreva("\n\n")
					}
										
					se(mtrz_tabuleiro[v_linha][v_coluna] != mtrz_tabuleiro[v_linha1][v_coluna1]){
						mtrz_tabuleiro[v_linha][v_coluna] = 0
						mtrz_tabuleiro[v_linha1][v_coluna1] = 0
						escreva("\t    ERRADO!")
	
						sorteio.aguarde(3000)
						limpa()
						jogada = 1
						
						para(cont = 1; cont <= 4; cont++){
							escreva("    |", cont, "|", "\t")
						}
						escreva("\n\n")
		
						para(linha = 0; linha < fim; linha++){
							numeros_linhas = linha + 1
							escreva("|", numeros_linhas, "|")
							para(coluna = 0; coluna < fim; coluna++){
								escreva("  ")
								escreva(mtrz_tabuleiro[linha][coluna] + "     ")
							}
							escreva("\n\n")
						}
											
					}senao{
						escreva("\t    CORRETO!\n")
						para(linha = 0; linha < fim; linha++){
							para(coluna = 0; coluna < fim; coluna++){
								se(mtrz_tabuleiro[linha][coluna] == mtrz_numeros[linha][coluna]){
									verificar++
								}
							}

		/* FIM DO PROGRAMA: essa parte do código será iniciada quando o variável "verificar" (presente no bloco acima) somar 16. 
		Isso irá acontecer assim que o usuário encontrar o último par de números, um vez que a variável "verificar" só é incrementada quando o usuário acerta o par de números.*/
							
							se(verificar == 16){							
							escreva("\nPARABÉNS!! Você acertou todos os números!!")
							verifica = falso																
							}
							}						
						jogada = 1				
					}
					verificar = 0
			}
			
			}senao{
				para(cont = 1; cont <= 4; cont++){
					escreva("    |", cont, "|", "\t")
				}
				escreva("\n\n")
		
				para(linha = 0; linha < fim; linha++){
					numeros_linhas = linha + 1
					escreva("|", numeros_linhas, "|")
					para(coluna = 0; coluna < fim; coluna++){
						escreva("  ")
						escreva(mtrz_tabuleiro[linha][coluna] + "     ")
					}
					escreva("\n\n")
				}
				escreva("Posição já foi escolhida. Escolha outra!\n\n")
			}		
	}
	}
	
	// função criada para gerar os números na matriz que ficara escondida no início do jogo.
	
	funcao gerar_tabuleiro(){

	// PRIMEIRO BLOCO: povoar metade da matriz com os números que serão duplicados.
					
		para(cont = 0; cont < fim_sorteio; cont++){			
			numero_sorteio[cont] = sorteio.sorteia(1, 8)
			numero_linha = sorteio.sorteia(minimo, maximo)
			numero_coluna = sorteio.sorteia(minimo, maximo)
				
			para(cont4 = 0; cont4 < 8; cont4++){
				se(numero_sorteio[cont] == numero_sorteio1[cont4] ou mtrz_numeros[numero_linha][numero_coluna] != 0){					
				cont--
				cont4 = 10
															
				}
			}
			
			se(cont4 == 8){
				numero_linha1 = numero_linha
				numero_coluna1 = numero_coluna
				numero_sorteio1[cont] = numero_sorteio[cont]
			
					se(mtrz_numeros[numero_linha1][numero_coluna1] == 0){						
						mtrz_numeros[numero_linha1][numero_coluna1] = numero_sorteio1[cont]
						cont4 = 7 
					}
			}						
		}
			
	// SEGUNDO BLOCO: passar os valores gerados no bloco anterior para um vetor em posições aleatórias.

			inteiro cont1, cont3
			para(linha = 0; linha < fim; linha++){
				para(coluna = 0; coluna < fim; coluna++){
					se(mtrz_numeros[linha][coluna] != 0){
						cont1 = sorteio.sorteia(0, 7)
							se(v_duplica[cont1] == 0){
								v_duplica[cont1] = mtrz_numeros[linha][coluna]
							}senao{
								coluna--
							}						
					}	
				}
			}

	// TERCEIRO BLOCO: retornar os valores que estão no vetor para a matriz, de modo este fiquem duplicados em posições aleatórias.
			
			inteiro cont2 = 0
			para(linha = 0; linha < fim; linha++){
				para(coluna = 0; coluna < fim; coluna++){
					se(mtrz_numeros[linha][coluna] == 0){
						mtrz_numeros[linha][coluna] = v_duplica[cont2]
						cont2++		
					}
				}
			}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4051; 
 * @DOBRAMENTO-CODIGO = [169];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {mtrz_numeros, 10, 50, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */