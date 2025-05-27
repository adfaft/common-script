// require and process need type definitions from @types/node
// npm i --save-dev @types/node

const readline = require('node:readline');

const rp = (n: number) => new Intl.NumberFormat("id-ID", { style: "currency", currency: "IDR" }).format(n)

const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
});

function ask(question:string): Promise<string> {
	return new Promise((resolve, reject) => {
		rl.question(question, (input:string) => resolve(input))
	});

}

(async() => {
	let totalBudget = Number(await ask("Total Budget in a month? "))
	let totalDays = Number(await ask("How many days in a month? "))
	
	let budgetPerDay = Number(totalBudget) / totalDays

	console.log(`Budget for ${rp(totalBudget)} will have a daily budget of ${rp(budgetPerDay)} !`)

})()