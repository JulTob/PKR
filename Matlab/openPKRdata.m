function PKRdata = openPKRdata()
%Busca, y abre o crea, el archivo de datos para el procesado de la información

existe= exist('PKRdata.csv', 'file');
if existe
    PKRdata=readtable('PKRdata.csv');
else
   PKRdata=table;
end
