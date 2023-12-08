const wasm_tester = require("circom_tester").wasm;
const path = require("path");

(async () => {
    try {
        console.log(path.join(__dirname, "circuits", "multiplier2.circom"))
        const circuit = await wasm_tester(path.join(__dirname, "circuits", "multiplier2.circom"));
        const w = await circuit.calculateWitness({a: 2, b: 5});
        await circuit.checkConstraints(w);
        console.log(w)

    } catch (e) {
        // Deal with the fact the chain failed
        console.log(e)
    }
    // `text` is not available here
})();