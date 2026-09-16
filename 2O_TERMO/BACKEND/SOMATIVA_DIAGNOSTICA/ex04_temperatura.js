const entrada = require('readline-sync')

const temperatura = entrada.questionInt("Digite a temperatura atual: ")

if(temperatura < 60) {
    console.log("NORMAL");
} else if(temperatura >= 60 && temperatura <= 80) {
    console.log("ATENCAO");
} else {
    console.log("CRITICA");
}