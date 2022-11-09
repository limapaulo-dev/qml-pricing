.import "prices.js" as Prices

function valores(listaIdades,desconto,obs,tipo){

    var preços = []

    for (var x in listaIdades){

        if ((tipo==="Empresarial" ||tipo==="Associação")){
            if (obs[x] === "C/ Obs"){
                var t = 0
            }else {
                t = 1
            }
        }else{
            if (obs[0] === "C/ Obs"){
                t = 0
            }else{
                t = 1
            }
        }

        var tabelas = 0
        var preçomenor = []

        while (tabelas < 8){
            var preço
            var i = 19
            var faixas = true
            var f = 0

            while (faixas){
                if (tipo==="Empresarial" ||tipo==="Associação"){
                    preço = (Prices.juridica[t][f]) * (desconto)
                } else {
                    preço = (Prices.fisica[t][f]) * (desconto)
                }
                if (listaIdades[x] < i){
                    preçomenor.push(preço.toFixed(2))
                    faixas = false
                } else if (listaIdades[x] > 58){
                    f = 9
                    if (tipo==="Empresarial" ||tipo==="Associação"){
                        preço = (Prices.juridica[t][f]) * (desconto)
                    } else {
                        preço = (Prices.fisica[t][f]) * (desconto)
                    }
                    preçomenor.push(preço.toFixed(2))
                    faixas = false
                } else {
                    i += 5
                    f += 1
                }
            }
            t += 2
            tabelas += 2
        }
        preços.push(preçomenor)
    }
    return preços
}

function exportarTexto(nomeCliente, nomeVendedor,planos,tipo,listaPreços,listaIdades,documentos){
    var date = new Date()
    var hour = (date.toLocaleTimeString(Qt.locale("pt_BR"), "hh"))
    var hello

    nomeCliente = nomeCliente.charAt(0).toUpperCase() + nomeCliente.slice(1)
    nomeVendedor = nomeVendedor.charAt(0).toUpperCase() + nomeVendedor.slice(1)

    if (hour < 12){
        hello="Bom dia "
    } else if (hour < 18){
        hello="Boa tarde "
    } else{
        hello="Boa noite "
    }

    var text=hello + nomeCliente + "!\n"

    text += nomeVendedor + " do Santa Rita Saúde,\n"
    text += "tudo joia?\n"
    text += "\n"
    text += "Conforme conversamos segue abaixo os planos do Santa Rita Saúde e os valores:\n"
    text += "\n"

    var orçamento = 0
    var p = 0

    while (orçamento < 4){

        if (orçamento === 0){
            text += "*Plano Saúde Plena*\n"
            text += "Abrange consultas nos Centros Médicos e as Clínicas Credenciadas.\n"
            text += "Sem co-participações nos exames.\n"
            text += "Co-participação de 50% (R$ 31,00) nas consultas a partir da 6ª - 5 primeiras consultas são grátis ao ano.\n"
            text += "\n"
            text += "*Saúde Plena - Enfermaria*\n"
        }

        if (orçamento === 1){
            text += "\n"
            text += "*Saúde Plena - Apartamento*\n"
        }

        if (tipo==="Empresarial" ||tipo==="Associação"){
            if (orçamento === 2){
                text += "\n"
                text += "*Plano Pro-Saúde*\n"
                text += "Abrange consultas nos centros médicos e clínicas credenciadas.\n"
                text += "Sem co-participações nos exames!\n"
                text += "Co-participação nas consultas de R$ 18,60/consulta a partir da 1ª consulta.\n"
                text += "\n"
                text += "*Plano Pro-Saúde - Enfermaria*\n"
            }
        }else{
            if (orçamento === 2){
                text += "\n"
                text += "*Plano Saúde Premium*\n"
                text += "Abrange consultas nos centros médicos e clínicas credenciadas.\n"
                text += "Co-participação de 25% (R$ 15,50) nas consultas e nos exames (Anexo exemplos).\n"
                text += "\n"
                text += "*Saúde Premium - Enfermaria*\n"
            }
        }

        if (orçamento === 3){
            text += "\n"
            text += "*Plano Saúde Perfeita*\n"
            text += "Abrange consultas nos centros médicos e rede própria.\n"
            text += "Co-participação de 25% (R$ 15,50) nas consultas e nos exames (Anexo exemplos)\n"
            text += "\n"
            text += "*Saúde Perfeita - Enfermaria*\n"
        }

        var i = 0
        var total = 0

        for (var y in listaIdades){
            var preço = Number(listaPreços[i][p]).toLocaleString(Qt.locale("pt_BR"))
            text += twoDecimals(listaIdades[i]) + " - R$ " + preço + "\n"
            total = Number(listaPreços[i][p]) + Number(total)
            i ++
        }
        if (listaIdades.length > 1){
            total = Number(total).toLocaleString(Qt.locale("pt_BR"))
            text += ("*Total = R$ " + total + "*" + "\n")
        }

        orçamento ++
        p ++
    }

    if (tipo==="Associação"){
        text += "\n"
        text += "Esses planos empresariais têm uma taxinha de R$ 20,00 por mês pra empresa.\n"
        text += "Mas se a empresa tiver conta no Sicoob ou for associada a ACIM não têm a taxinha 👍\n"
    }

    if (documentos === true){

        text += "\n"

        if (tipo==="Empresarial" || tipo==="Associação"){
            text += "*Documentos necessários*\n"
            text += "\n"
            text += "*Documentos da Empresa:*\n"
            text += "Numero de CNPJ\n"
            text += "Cópia do Contrato Social - Ultima Alteração ou Inscrição MEI\n"
            text += "Comprovante de Endereço da Empresa para envio do Boleto.\n"
            text += "Cópia do CPF e RG ou CNH do Representante Legal da Empresa.\n"
            text += "\n"
            text += "*Documentos dos Funcionários e Dependentes:*\n"
            text += "RG e CPF ou CNH (Adultos ou maiores de 16 anos)\n"
            text += "Certidão de Casamento\n"
            text += "Certidão de Nascimento (Menores de 16 anos)\n"
        }

        else {
            text += "*Documentos necessários*\n"
            text += "RG e CPF ou CNH (Adultos ou maiores de 16 anos)\n"
            text += "Certidão de Casamento\n"
            text += "Certidão de Nascimento (Menores de 16 anos)\n"
            text += "Comprovante de Endereço\n"
        }

        text += "\n"
        text += "Qualquer dúvida só me avisar! 👍\n"

    }

    return text
}
