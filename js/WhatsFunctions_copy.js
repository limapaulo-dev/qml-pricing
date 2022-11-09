.import "functions.js" as BaseFunc
.import "prices.js" as Prices

function hi(nomeCliente,nomeVendedor){
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

    return text
}

function calcularValores(listaIdades,desconto,obs,tipo,planos){

    var preços = []

    for (var x in listaIdades){

        var preçomenor = []

        for (var p in planos){

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

            if (planos[p] === "Apartamento"){
                t += 2
            } else if (planos[p] === "Saúde Premium"){
                t += 4
            }else if (planos[p] === "Pro-Saúde"){
                t += 4
            }else if (planos[p] === "Saúde Perfeita"){
                t += 6
            }

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

        }
        preços.push(preçomenor)

    }
    return preços

}

function fDesconto(idades, tipo){
    if (tipo==="Associação"){
        return 0.8
    } else if (tipo==="Empresarial"){
        return 1
    } else {
        if (idades.length > 3){
            return 0.75
        }else if (idades.length > 2){
            return 0.80
        }else if (idades.length > 1){
            return 0.85
        }else{
            return 1
        }
    }
}

function exportarTexto(nomeCliente,nomeVendedor,planos,tipo,listaPreços,listaIdades,documentos){

    //Saudação
    var date = new Date()
    var hour = (date.toLocaleTimeString(Qt.locale("pt_BR"), "hh"))
    var hello

    nomeCliente = BaseFunc.capitalizeWords(nomeCliente)
    nomeVendedor = BaseFunc.capitalizeWords(nomeVendedor)

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


    //Orçamento
    for (var p in planos){

        if (planos[p] === "Saúde Plena"){
            text += "\n"
            text += "*Plano Saúde Plena*\n"
            text += "Abrange consultas nos Centros Médicos e as Clínicas Credenciadas.\n"
            text += "Sem co-participações nos exames.\n"
            text += "Co-participação de 50% (R$ 31,00) nas consultas a partir da 6ª - 5 primeiras consultas são grátis ao ano.\n"
            text += "\n"
            text += "*Saúde Plena - Enfermaria*\n"
        }

        if (planos[p] === "Apartamento" && planos[0] === "Saúde Plena"){
            text += "\n"
            text += "*Saúde Plena - Apartamento*\n"
        } else if (planos[p] === "Apartamento"){
            text += "\n"
            text += "*Plano Saúde Plena*\n"
            text += "Abrange consultas nos Centros Médicos e as Clínicas Credenciadas.\n"
            text += "Sem co-participações nos exames.\n"
            text += "Co-participação de 50% (R$ 31,00) nas consultas a partir da 6ª - 5 primeiras consultas são grátis ao ano.\n"
            text += "\n"
            text += "*Saúde Plena - Apartamento*\n"
        }

        if (tipo==="Empresarial" ||tipo==="Associação"){
            if (planos[p] === "Pro-Saúde"){
                text += "\n"
                text += "*Plano Pro-Saúde*\n"
                text += "Abrange consultas nos centros médicos e clínicas credenciadas.\n"
                text += "Sem co-participações nos exames!\n"
                text += "Co-participação nas consultas de R$ 18,60/consulta a partir da 1ª consulta.\n"
                text += "\n"
                text += "*Plano Pro-Saúde - Enfermaria*\n"
            }
        }else{
            if (planos[p] === "Saúde Premium"){
                text += "\n"
                text += "*Plano Saúde Premium*\n"
                text += "Abrange consultas nos centros médicos e clínicas credenciadas.\n"
                text += "Co-participação de 25% (R$ 15,50) nas consultas e nos exames (Anexo exemplos).\n"
                text += "\n"
                text += "*Saúde Premium - Enfermaria*\n"
            }
        }

        if (planos[p] === "Saúde Perfeita"){
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
            var preço = Number(listaPreços[y][p]).toLocaleString(Qt.locale("pt_BR"))
            text += BaseFunc.twoDecimals(listaIdades[y]) + " - R$ " + preço + "\n"
            total = Number(listaPreços[y][p]) + Number(total)
        }
        if (listaIdades.length > 1){
            total = Number(total).toLocaleString(Qt.locale("pt_BR"))
            text += ("*Total = R$ " + total + "*" + "\n")
        }

    }

    //Associação - ACIP
    if (tipo==="Associação"){
        text += "\n"
        text += "Esses planos empresariais têm uma taxinha de R$ 20,00 por mês pra empresa.\n"
        text += "Mas se a empresa tiver conta no Sicoob ou for associada a ACIM não têm a taxinha 👍\n"
    }

    //Documentos necessários
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
            text += "Cartão do SUS\n"
        }

        else {
            text += "*Documentos necessários*\n"
            text += "RG e CPF ou CNH (Adultos ou maiores de 16 anos)\n"
            text += "Certidão de Casamento\n"
            text += "Certidão de Nascimento (Menores de 16 anos)\n"
            text += "Cartão do SUS\n"
            text += "Comprovante de Endereço\n"
        }

    }

    //Texto final
    text += "\n"
    text += "Qualquer dúvida só me avisar! 👍\n"

    return text
}

function whatsExportar(celular, texto){

    var url_texto = encodeURIComponent(texto)
    var whats_link = ('http://api.whatsapp.com/send?phone=55' + celular.toString() + '&text=' + url_texto)
    Qt.openUrlExternally(whats_link)
}

function whatsurl(celular, texto){

    var url_texto = encodeURIComponent(texto)
    var whats_link = ('http://api.whatsapp.com/send?phone=55' + celular.toString() + '&text=' + url_texto)
}

function whatsclick(targetURL){
    var a = document.createElement('a')
    a.href = targetURL
    fireClickEvent(a)
}

function helloTexto(nomeVendedor,nomeCliente,tipo){
    var date = new Date()
    var hour = (date.toLocaleTimeString(Qt.locale("pt_BR"), "hh"))
    var hello

    nomeCliente = BaseFunc.capitalizeWords(nomeCliente)
    nomeVendedor = BaseFunc.capitalizeWords(nomeVendedor)

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

    if (tipo === "Site"){
        text += "Verifiquei q vc fez um orçamento pelo nosso site!\n"
        text += "Gostaria de uma proposta melhor?\n"
        text += "Ficou alguma dúvida?\n"

    }else if (tipo === "Telefone"){
        text += "Você deixou um telefone de contato,\n"
        text += "como posso ajudar?\n"

    }else {
        text += "Me passaram seu contato que você gostaria de um plano de saúde,\n"
        text += "como posso ajudar?\n"
    }

    return text
}

function hello(nomeVendedor,listaClientes,tipo){

        for (var e in listaClientes){
            var nomeCliente = listaClientes[e][0]
            var celular = listaClientes[e][1].replace(/\D/g,'')
            var texto = helloTexto(nomeVendedor,nomeCliente,tipo)
            whatsExportar(celular,texto)
        }
}

function pricing(nomeCliente,nomeVendedor,idadesObsLista,tipo,planos,celular,documentos){

    var listaIdades = []
    var obs = []

    for (var i in idadesObsLista){
        listaIdades.push(idadesObsLista[i][0])
        obs.push(idadesObsLista[i][1])
    }

    idadesObsLista = idadesObsLista.sort(BaseFunc.fArrayDecrescente)

    var desconto = fDesconto(listaIdades,tipo)

    var listaPreçosNew = calcularValores(listaIdades,desconto,obs,tipo,planos)

    var texto = exportarTexto(nomeCliente,nomeVendedor,planos,tipo,listaPreçosNew,listaIdades,documentos)

    whatsExportar(celular,texto)

}
