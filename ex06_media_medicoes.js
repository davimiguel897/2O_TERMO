const entrada = require('readline-sync')

valores = [];
acumuladora = 0;
quantidade = 5;

for (let i = 0; i < quantidade; i++) {
    let valor = entrada.questionInt("Digite um valor: ");
    valores.push(valor)
    valor = valores[i]
    acumuladora += valor
    media = acumuladora / quantidade
}


console.log(`A soma dos valores é: ${acumuladora}`)
console.log(`A media dos valores é: ${media}`)
