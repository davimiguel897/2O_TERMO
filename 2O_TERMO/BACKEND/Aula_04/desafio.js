const entrada = require('readline-sync');

console.log("Verificador de Votação");

const idade = entrada.question("Qual a sua idade? ")

if (idade >= 16) {
    console.log("Você possui a idade minima para votar. APROVADO")
} else {
    console.log("Você não possui a idade minima para votar. RECUSADO")
}
