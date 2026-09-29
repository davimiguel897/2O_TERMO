const entrada = require('readline-sync')

const temperatura = entrada.questionInt("Digite a temperatura atual: ")

if(temperatura < 60) {
    console.log("NORMAL");
} else if(temperatura > 3 && temperatura <= 6) {
    console.log("ATENCAO");
} else {
    console.log("CRITICA");
}