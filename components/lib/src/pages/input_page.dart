import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _pwd = '';
  String _date = '';
  TextEditingController _controllerInputDate =  new TextEditingController();
  String _opcionSeleccionada = 'Solero';
  List<String> _opciones = ['Solero','Casado','Divorciado','Viudo','Union libre'];



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Input data.'),
         centerTitle: true,
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
         children: <Widget>[
           _crearInput(),
          Divider(),
           _inputEmail(),
            Divider(),
          _inputPwd(),
           Divider(),
          _dropDown(),
           Divider(),
           _inputDate( context ),
           ListTile(
             title: Text('Nombre de la persona: $_name'),
           )
         ],
       ),
    );
  }

 _crearInput() {

    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Label ${_name.length}'), // label del elemento html
        hintText: 'Nomnre de la persona',
        labelText: 'Nombre',
        helperText: 'maximo 10 caracteres',
        suffixIcon: Icon ( Icons.accessibility_new),
        icon: Icon (Icons.account_circle)
      ),
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (String valor){
        setState(() {
          _name = valor;
        });
      },
    );
  }

 Widget _inputEmail() {
return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Email de la persona',
        labelText: 'Email',
        helperText: 'example@hotmail.com',
        suffixIcon: Icon ( Icons.alternate_email),
        icon: Icon (Icons.email)
      ),
      autofocus: false,
      onChanged: (String valor){
        setState(() => _email = valor);
      },
    );

  }

 Widget _inputPwd() {
  return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Label ${_pwd.length}'), // label del elemento html
        hintText: 'Password de la persona',
        labelText: 'Password',
        helperText: '12345',
        suffixIcon: Icon ( Icons.lock_open),
        icon: Icon (Icons.lock)
      ),
      autofocus: false,
      onChanged: (String valor){
        setState(() {
          _pwd = valor;
        });
      },
    );

  }

 Widget  _inputDate( BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _controllerInputDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        helperText: '03/05/1997',
        suffixIcon: Icon ( Icons.perm_contact_calendar),
        icon: Icon (Icons.calendar_today)
      ),
      autofocus: false,
      onTap: (  ){
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate( context );
      },
    );

  }

 void _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate:  DateTime.now(), 
      firstDate: new DateTime(DateTime.now().year - 80) , 
      lastDate:  new DateTime.now(),
      locale: Locale('es','ES')
      );
      
      if ( picked != null ){
        setState(() {
          _date =  picked.toString(); 
          _controllerInputDate.text = _date;
        });
      }
  }

 List<DropdownMenuItem<String>> _getListItems(){
    List<DropdownMenuItem<String>> lista = new List();


    _opciones.forEach((element) {

      lista.add(
        DropdownMenuItem(
        child: Text( element ),
        value: element
        )
        ); // lista.add
    });

    return lista;
  }
  
 Widget _dropDown() {


    return Row(
     children: <Widget>[
        Icon (Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
                  child: DropdownButton(
            value: _opcionSeleccionada,
            items: _getListItems(), 
            onChanged: ( opt ) {
              setState((){
                  _opcionSeleccionada =  opt;
              } 
              );
            }),
        ),
      ],
    );

  }
}