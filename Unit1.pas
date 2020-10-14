unit Unit1;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls, Menus, ClipBrd;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
   datevm: string;
   namep: string;
   poz: string;
   userpoz:string;
implementation

uses Unit2, Unit3;

{$R *.dfm}

type
  TJJMMAA = record
    JJ, MM, AA: byte;
  end;
{
Le résultat retourné est True si la différence est positive, False dans le cas contraire.
Mais les variables Years, Months et Days sont toudays en valeur absolue.
}

function GetYMDBetween(FromDate, ToDate: TDateTime;
  var Years, Months, Days: Integer): Boolean;
var
  FromY, FromM, FromD,    // from date
  ToY, ToM, ToD: Word;    // to date
  TmpDate: TDateTime;
  PreviousMonth: Byte;
  DaysInMonth: Byte;
begin
  Result := FromDate <= ToDate;
  if not Result then
  begin
    TmpDate := ToDate;
    ToDate := FromDate;
    FromDate := TmpDate;
  end;
  DecodeDate(ToDate, ToY, ToM, ToD);
  DecodeDate(FromDate, FromY, FromM, FromD);
  Years := ToY - FromY;
  Months := ToM - FromM;
  Days := ToD - FromD;
  if Days < 0 then
  begin
    Dec(Months);
    PreviousMonth := ToM + (Byte(ToM = 1) * 12) - 1;
    case PreviousMonth of
      1,3,5,7,8,10,12: DaysInMonth := 31;
      4,6,9,11       : DaysInMonth := 30;
      else
        DaysInMonth := 28 + Byte(IsLeapYear(ToY));
    end;
    Days := DaysInMonth - Abs(Days);
  end;
  if Months < 0 then
  begin
    Dec(Years);
    Months := 12 - Abs(Months);
  end;
end;

{
      Pour calculer l'écart entre 2 dates on incrémente l'année de la 1ère date en incrémentant en parallèle un compteur (AA)
      jusqu'à ce que cette date soit supérieure à la 2ème, on décrémente alors le compteur de 1, on obtient le nombre d'années
      qui sépare les 2 dates.
      On répète cette opération pour les monts et les days (MM et JJ).

      Si la seconde date est antérieure à la première on calcul néanmoins la Deltaérence (non signée), c'est à la partie appelante du programme de traiter
      l'affichage du résultat.

      C'est un peu le marteau-pilon pour écraser un moustique mais au moins ça marche, enfin je crois ;-) et le traitement
          pour un écart de 99 ans, 11 monts et 30 days est de 100 + 12 + 31 soit 143 boucles de 5 lignes alors ...
}

function DeltaDatetoJJMMAA(const CDate1, CDate2 : TDate) : TJJMMAA;

var
  Date1,
  Date2,
  WDate : TDate;

begin
  if CompareDate(CDate1, CDate2) > 0 then begin  // si 2ème date < 1ère on intervertit pour le traitement
    Date1 := CDate2;
    Date2 := CDate1;
  end
  else begin
    Date1 := CDate1;
    Date2 := CDate2;
  end;
  with result do begin
    AA := 0;                                 // initialisation du 'compteur' d'années
    repeat                                   // debut de la boucle d'incrémentation et de comptage
      inc(AA);                               // on incrémente le 'compteur' d'années
      WDate := Date1;                        // on stocke la 1 ère date pour la restituer après dépassement
      Date1 := incyear(Date1);               // on incrémente la 1ère date d'un an
    until comparedate(Date1, Date2) > 0;     // on sort de la boucle quand la 1 ère date est supérieure à la seconde
    dec(AA);                                 // comme il y a eu dépassement on retire 1 an
    Date1 := WDate;                          //     puis on restaure la date avant la dernière incrémentation

    MM := 0;                                 // même traitement que ci-dessu mais pour les monts
    repeat
      inc(MM);
      WDate := Date1;
      Date1 := incmonth(Date1);
    until comparedate(Date1, Date2) > 0;
    dec(MM);
    Date1 := WDate;

    JJ := 0;                                 // même traitement que ci-dessu mais pour les days
    repeat
      inc(JJ);
      Date1 := incday(Date1);
    until comparedate(Date1, Date2) > 0;
    dec(JJ);
  end;
end;

// un click sur le bouton pour lancer le calcul de l'écart entre les 2 dates affichées
procedure TForm1.Button1Click(Sender: TObject);

var
  texte : string;  //  Utilisé pour la construction du resultat
  Delta : TJJMMAA;  //  retourné par la fonction DeltaDatetoJJMMAA

begin
  Delta := DeltaDatetoJJMMAA(DateTimePicker1.date, DateTimePicker2.date); // appel de la fonction
// mise en forme du résultat
  texte := '';
  with Delta do begin
    case JJ of                     // si au moins un day on l'affiche en l'accordant en nombre
      0 : ;
      1 : texte := '1 day';
    else
      texte := format('%2d äíåé', [JJ]);
    end;
    if MM > 0 then                 // si au moins un moins on l'affiche, 'monts' se terminant par un 's' pose moins de problème!
      if texte = '' then
        texte := format('%2d monts', [MM])
      else
        texte := format('%2d ìåñÿöåâ, ', [MM]) + texte;
    if (AA > 0) and
       (Texte <> '') then
      Texte := ', ' + Texte;
    case AA of                    // si au moins un an on l'affiche en l'accordant en nombre
      0 : ;
      1 : texte := '1 ãîä' + Texte;
    else
      texte := format('%2d ãîäà', [AA]) + Texte;
    end;
    if CompareDate(DateTimePicker1.date, DateTimePicker2.date) > 0 then // si la 1ère date est postérieure à la seconde
      Label3.Caption :=  Texte
    else
      Label3.Caption :=  Texte;

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
namep:= edit1.Text;
datevm:= label3.Caption;
if spinedit1.Text='1' then
edit2.text:= namep + ' ìû âìåñòå óæå' + datevm;
if spinedit1.Text='2' then
edit2.text:= namep + ' ß òåáÿ ëşáëş óæå' + datevm;
if spinedit1.Text='3' then
edit2.text:= namep + ' òû ìîé ñëàäêèõ ïèğîæîê óæå' + datevm;
if spinedit1.Text='4' then
edit2.text:= namep + ' Ìû åáåì äğóã äğóãó ìîçã óæå' + datevm;
if spinedit1.Text='5' then
edit2.text:= namep + ' òû âêóğñå, ÷òî ÿ êóñàş òåáÿ çà óøêî óæå' + datevm;
if spinedit1.Text='6' then
edit2.text:= namep + ' êîòåíîê, ìû ğÿäîì óæå' + datevm;
if spinedit1.Text='7' then
edit2.text:= namep + ' ìû äåğæèìñÿ çà ğóêè óæå' + datevm;
if spinedit1.Text='8' then
edit2.text:= namep + ' ìû ëşáèì äğóã äğóãà óæå' + datevm;
if spinedit1.Text='9' then
edit2.text:= namep + userpoz + datevm;



end;

procedure TForm1.Button3Click(Sender: TObject);
begin
userpoz:=edit3.Text;
panel1.Visible:=false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
panel1.Visible:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Clipboard.AsText:=edit2.Text;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
form3.show;
end;

end.



