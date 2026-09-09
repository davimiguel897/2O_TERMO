const entrada = require('readline-sync');

console.log("=== REGISTRO DE TEMPERATURAS ===");

const temperaturas = [];

const quantidade = entrada.questionInt("Quantas temperaturas você deseja registrar? ");

for (let i = 0; i < quantidade; i++) {
    let temperatura = entrada.questionFloat(`Temperatura ${i + 1}: `);
    temperaturas.push(temperatura);
}
console.log("\n--- RELATÓRIO ---");
console.log(`Temperaturas registradas: ${temperaturas.join (" °C | ")} °C`);
console.log(`Quantidade de temperaturas registradas: ${temperaturas.length}`);
console.log(`Primeira temperatura registrada: ${temperaturas[0]} `);
console.log(`Última temperatura registrada: ${temperaturas[temperaturas.length - 1]} `);