const fs = require('fs');

console.log("==== SISTEMA DE PERSISTÊNCIA: REGISTRO DE MÁQUINAS ====");

const maquinasIndustriais = [
    {id: 101, nome: "Torno Mecânico Universal", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Fresadora Ferramenteira", setor: "Usinagem", operacional: false},
    {id: 103, nome: "Prensa Hidráulica 50T", setor: "Estampagem", operacional: true},
    {id: 104, nome: "Compressor", setor: "Utilidades", operacional: true}
]
const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2);

const nomeDoArquivo = "maquinas.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);

console.log(`\nGravacao concluida com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo} gerado`);