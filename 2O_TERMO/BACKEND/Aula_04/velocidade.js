const entrada = require('readline-sync');
const velocidade = entrada.questionFloat("Qual a velocidade do carro em km/h? ");

if (velocidade <= 80) {
    console.log("Velocidade dentro do limite permitido. Boa viagem!");
} else {
    console.log("Velocidade acima do limite permitido. Multa de R$ 200,00")
}