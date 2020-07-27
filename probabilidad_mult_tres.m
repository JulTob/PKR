function Valor= probabilidad_mult_tres (veces)

registro= probabilidad_cualquier (veces);
    Valor=0;

for i=3:3:12
    columna= registro(:,i);
   Valor= Valor+ sum(columna);
end
end