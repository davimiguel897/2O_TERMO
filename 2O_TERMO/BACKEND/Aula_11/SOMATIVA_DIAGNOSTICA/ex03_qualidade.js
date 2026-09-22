const entrada = require('readline-sync');

const pesoPeca = entrada.questionFloat("Digite o peso da peca ");

if(pesoPeca >= 95 && pesoPeca <= 105) {
    console.log("=============")
    console.log("PECA APROVADA")
    console.log("=============")
} else {
    console.log("=============")
    console.log("PECA REPROVADA")
    console.log("=============")
}