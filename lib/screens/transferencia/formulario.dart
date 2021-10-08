import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia_principal.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(buildContext, context) {
    final int? numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: _dicaCampoNumeroConta,
                  rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  dica: _dicaCampoValor,
                  rotulo: _rotuloCampoValor,
                  icone: Icons.monetization_on,
              ),
              ElevatedButton(
                  onPressed: () {
                    _criaTransferencia(BuildContext, context);
                  },
                  child: Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ));
  }
}
