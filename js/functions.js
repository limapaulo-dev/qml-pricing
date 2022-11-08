//.pragma library
.import "prices.js" as Prices

function hi() {

    var date = new Date()
    var hour = (date.toLocaleTimeString(Qt.locale("pt_BR"), "hh"))

    var nome = "John"

    if (hour < 12){
        console.log("Bom dia " + nome + "!")
    } if (hour < 18){
        console.log("Boa tarde " + nome + "!")
    } else{
        console.log("Boa noite " + nome + "!")
    }

}

function log() {
    console.log(Prices.fisica[0][2])

}

function func() {
    console.log("hello world")

}
