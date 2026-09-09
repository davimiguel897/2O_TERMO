const entrada = require('readline-sync');

console.log("--- SISTEMA DE ANALISE DE CREDITO ---")

// Coleta de dados
const nome = entrada.question("Qual o nome do cliente? ");
const idade = entrada.questionInt("Qual a idade do cliente? ");
const renda = entrada.questionFloat("Qual a renda mensal do cliente? ");
const temImovel = entrada.question("Possui imovel proprio? "); // Essa função lê Y para true e N para false

// A Lógica Combinada
// (idade >= 18) é obrigatório
// (renda >= 2500 || temImovel === true) um dos dois tem que ser verdade
if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
    console.log(`\nParabéns ${nome}, seu crédito foi APROVADO!`);
} else {
    console.log(`\nInfelizmente ${nome}, Seu crédito foi NEGADO.`);
}