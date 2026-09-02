const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONTROLE DE QUALIDADE ===\n")

pesos = [];
somaTotal = 0;

const quantidade = entrada.questionInt("Quantas pecas deseja avaliar? \n");

for (let i = 0; i < quantidade; i++) {
    let peso = entrada.questionFloat("Digite o peso da peca: ")
    pesos.push(peso)
    peso = pesos[i]
    somaTotal += peso
}
const media = somaTotal / quantidade

console.log("\n--- RELATÓRIO DA AUDITORIA --- \n");
console.log(`Pecas registradas: ${pesos.join (" | ")} kg \n`);
console.log(`Média do lote: ${media} kg \n`)

if (media >= 4.8 && media <= 5.2) {
    console.log("STATUS FINAL: LOTE APROVADO! \n");
} else {
    console.log("STATUS FINAL: LOTE REPROVADO! \n");
} 
console.log(`Maior peso registrado: ${Math.max(...pesos)} kg \n`);
console.log(`Menor peso registrado: ${Math.min(...pesos)} kg \n`);
console.log(`Quantidade de pecas registradas: ${pesos.length} \n`);

if (media < 5) {
    console.log(`O lote ficou ${(5 - media).toFixed(2)} kg abaixo do peso ideal \n`)
} else if (media > 5) {
    console.log(`O lote ficou ${(media - 5).toFixed(2)} kg acima do peso ideal \n`)
}
