const fs = require('fs');

const amostrasColetadas = [12.3, 12.2, 12.0, 12.1];

let aprovado = true
for(i = 0; 1 < amostrasColetadas.length; i++) {
if (amostrasColetadas[i] < 12.00){
    aprovado = false
    break
}
}

const relatorioInspecao = {
    data: "2026-09-23",
    inspetor: "Carlos Eduardo",
    amostras: amostrasColetadas,
    loteAprovado: aprovado
}

const dadosJSON = JSON.stringify(inspecao, null, 2);
fs.writeFileSync('inspecao.json', dadosJSON);
console.log("Arquivo 'inspecao.json' gerado com sucesso."); 