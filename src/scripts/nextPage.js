let pgActualElem = document.getElementById("pagActual");
let pgTotalElem = document.getElementById("pagTotales");

let pgActual = Number(pgActualElem.innerText);
let pgTotal = Number(pgTotalElem.innerText);

function nextPage() {
    if (pgActual < pgTotal) {
        pgActual += 1; 
        pgActualElem.innerText = pgActual; 
    }
}

function prevPage() {
    if (pgActual > 1) {
        pgActual -= 1; 
        pgActualElem.innerText = pgActual; 
    }
}