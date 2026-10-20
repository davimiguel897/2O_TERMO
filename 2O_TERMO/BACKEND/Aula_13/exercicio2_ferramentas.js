const fs = require('fs');
const entrada = require('readline-sync');

const ferramentas = []

const quantidade = entrada.questionInt("Quantas ferramentas deseja registrar: ");

for (let i = 0; i < quantidade; i++) {
console.log(`\nItem ${i + 1} de ${quantidade}:`);

const nome = entrada.question("nome: ")
const quantidadeFerramentas = entrada.questionInt("quantidade: ")
const custo = entrada.questionFloat("custo: ")

ferramentas.push({
nome: nome,
quantidade: quantidadeFerramentas,
custoUnitario: custo
})
}

const dadosJSON = JSON.stringify(ferramentas, null, 2);
fs.writeFileSync('ferramentas.json', dadosJSON);
console.log("Arquivo 'ferramentas.json' gerado com sucesso."); 