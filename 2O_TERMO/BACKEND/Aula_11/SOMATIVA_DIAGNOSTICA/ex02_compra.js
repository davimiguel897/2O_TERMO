const entrada = require('readline-sync')

const nomeMaterial = entrada.question("Qual o material comprado? ")
const quantidadeComprada = entrada.questionInt("Qual a quantidade comprada? ")
const precoUnitario = entrada.questionFloat("Qual o preco do material? ")
const valorTotal = quantidadeComprada * precoUnitario

console.log("======RESUMO======")
console.log(`Nome do material: ${nomeMaterial}`)
console.log(`Quantidade comprada: ${quantidadeComprada}`)
console.log(`Preco unitario: ${precoUnitario.toFixed(2)}`)
console.log(`Valor da compra: ${valorTotal.toFixed(2)}`)