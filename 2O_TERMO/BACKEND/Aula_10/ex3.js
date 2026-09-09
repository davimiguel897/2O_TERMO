const alunos =["Ana", "Bruno", "Carlos", "Daniela", "Eduardo", "Fernanda" ];

console.log(`O primeiro aluno da lista é ${alunos[0]}`);
console.log(`Quantidade de alunos: ${alunos.length}`);

alunos.push("Gabriel");
alunos.push("Heloísa");
alunos.splice(3, 1); // Remove o aluno na posição 2 (Carlos)

console.log("Lista de alunos:");
console.log(alunos);
