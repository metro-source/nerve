async function getCoinPrice(coin = 'BCH') {
    let json = await fetch(`https://api.coinbase.com/v2/exchange-rates?currency=${coin}`).then(response => response.json())

    return parseFloat(json.data.rates.USD);
}

async function getCoinEquivalent(usdAmount, coin = 'BCH') {
    let element = document.querySelector(".bch-amount");
    element.innerHTML = 'calculating...';

    let usdRate = await getCoinPrice(coin);

    let amount = parseFloat(usdAmount);

    let equivalent = amount / usdRate;
    console.log(amount, usdRate);
    
    element.innerHTML = `${equivalent.toFixed(2)} ${coin}`;
    element.setAttribute('title', `1 ${coin} = ${usdRate} USD (Coinbase)`);
}


function toggleBCHModal(usdAmount) {
    getCoinEquivalent(usdAmount);
    document.querySelector('.bch-modal').classList.toggle('visible');
}