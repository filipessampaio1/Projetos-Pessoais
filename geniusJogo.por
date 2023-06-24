programa
{

	inclua biblioteca Util --> s
	
	inteiro v_numeros[1000], v_respostas
	inteiro cont1 = 0, cont2 = 0, cont3 = 0,fim = 1, pontos = 0
	logico verificar1 = verdadeiro, verificar2

	// cont1 é o contador que irá servir de referência para pecorrer as posições do vetor (v_numeros[1000]) e preenchê-lo com o número sorteado
	// cont2 irá percorrer o vetor para verificar - na LINHA 52 - se os números digitados pelo usuário batem com os que estão sendo armazenados no vetor
	/* cont3 irá percorrer o vetor para verificar quantas posições já foram preenchidas. Sempre que o número digitado pelo usuário bater com os 
	números do vetor, ele será incrementado na LINHA 62; em determinado ponto a posição do vetor irá corresponder a 0 e a condicionante da LINHA 69 não será executada.
	na LINHA 91 ele volta a ser 0 para que na próxima ve que o laço possa recomeçar do início e todo o vetor seja percorrido */
	
	funcao inicio()
	{
		escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-*Vamos jogar GENIUS!*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
		escreva("\t\t\t\t   Fique atento aos números que aparecerão na tela, memorize e repita na ordem correta!\n")
		escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
		s.aguarde(5000)
		limpa()

		enquanto(verificar1){

			// na LINHA 28 os números estão sendo sorteados e armazenados no vetor
			
			v_numeros[cont1] = s.sorteia(1, 4)

			/* no laço de repetição abaixo, para que o vetor seja percorrido apenas nas posições já foram preenchidas, a variável "fim" está sendo incrementada fora do bloco.
			o seu valor sempre irá bater com a última posição preenchida no vetor */

			para(inteiro cont5 = 0; cont5 < fim; cont5++){
				escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-* |           ", v_numeros[cont5], "          | *-*-*-*-*-*-*-*-*-*-*-*-*-*-*")
				s.aguarde(1000)
				limpa()
				escreva(" ")
				s.aguarde(100)
				limpa()
			}
			fim++
			escreva("\t\t\t\t   *-*-*-*-*-*-*-*-* |     Digite o(s) núemro(s) na ordem exibida     | *-*-*-*-*-*-*-*-*\n\n")
			escreva("\t\t\t\t                                             ")
			leia(v_respostas)
			limpa()
			verificar2 = verdadeiro
			enquanto(verificar2){
					
				/* a condição "v_respostas != v_numeros[cont2]" irá checar se os números digitados pelo usuário batem com os que já foram armazenados no vetor;
				caso sejam diferentes, o programa será interrompido */
					
				se(v_respostas != v_numeros[cont2]){

					verificar1 = falso
					verificar2 = falso
					escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
					escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-* Ooh, você errou :/ -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
					escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* Pontuação: ", pontos, " -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
					escreva("\t\t\t\t   *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n")
					pare
				}senao{
					cont3++						
				}

				/* na condicionante seguinte, a condição "v_numeros[cont3] != 0" serve para impedir o programa de excutar novamente os comandos 
				caso a posição no vetor ainda não tenha sido preenchida com um número sorteado. isto impede que o programa fique pedindo para o usuário
				um novo número caso este ainda não tenha sido gerado e armazenado no vetor */
					
				se(v_numeros[cont3] != 0){
					escreva("\t\t\t\t   *-*-*-*-*-*-*-*-* |     Digite o(s) núemro(s) na ordem exibida     | *-*-*-*-*-*-*-*-*\n\n")
					escreva("\t\t\t\t                                             ")
					leia(v_respostas)
					limpa()

				/*este "senao" serve para que na PRIMEIRA rodada - que não entrará na condicionante anterior - os laços que estão pedindo daddos para o usuário interrompido
				uma vez que é apenas nela que o vetor não precisará ser percorrido.*/
						
				}senao{
					verificar2 = falso
				}
				cont2++
					
			}

			/* aqui a pontuação do usuário será armazenado no acumulador "pontos"; cont1 será incrementado para que na LINHA 28 a próxima posição do vetor (v_numeros[1000]) possa 
			 ser preechido com o novo número sorteado; e os cont2 e 3 são resetados para que o laço possa recomeçar do início na LINHA 47 */
								
			pontos++
			cont1++
			cont2 = 0
			cont3 = 0			
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4266; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {v_numeros, 6, 9, 9}-{v_respostas, 6, 26, 11}-{cont1, 7, 9, 5}-{cont2, 7, 20, 5}-{cont3, 7, 31, 5}-{pontos, 7, 50, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */