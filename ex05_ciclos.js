const entrada = require('readline-sync');

const pecaCiclo = entrada.questionInt("Quantidade de pecas por ciclo: ");
const totalPecas = [];

for(let ciclos = 0; ciclos <= 10; ciclos++) {
    let total = pecaCiclo * ciclos
    totalPecas.push(total)
}

console.log(`Pecas registradas: ${totalPecas}`);
