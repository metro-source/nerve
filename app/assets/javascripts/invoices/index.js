async function getBCHPrice() {
    let json = await fetch(`https://api.coinbase.com/v2/exchange-rates?currency=BCH`).then(response => response.json())

    return parseFloat(json.data.rates.USD);
}

async function getBCHEquivalent(usdAmount) {
    let element = document.querySelector(".bch-amount");
    element.innerHTML = 'calculating...';

    let usdRate = await getBCHPrice();

    let amount = parseFloat(usdAmount);

    let equivalent = amount / usdRate;
    console.log(amount, usdRate);
    
    element.innerHTML = `${equivalent.toFixed(2)} BCH`;
    element.setAttribute('title', `1 BCH = ${usdRate} USD`);
}


function toggleBCHModal(usdAmount) {
    getBCHEquivalent(usdAmount);
    document.querySelector('.bch-modal').classList.toggle('visible');
}