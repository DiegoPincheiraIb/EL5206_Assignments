function Matriz_Final = Estiramiento_Contraste(Input)
    Nombre_Variable = inputname(1); % Nombre de Input
    Matriz_double = double(Input);
    [row, column] = size(Matriz_double);
    New_Matriz = zeros(size(Matriz_double));
    Valor_Max = max(max(Matriz_double));
    Valor_Min = min(min(Matriz_double));
    Maxbit = 2^8 -1;
    Minbit = 0;
    for i=1:row
        for j=1:column
            Valor_Auxiliar = (Matriz_double(i,j)-Valor_Min)*(Maxbit - Minbit)/(Valor_Max-Valor_Min) + Minbit;
            Valor_Auxiliar = uint8(Valor_Auxiliar);
            New_Matriz(i,j) = Valor_Auxiliar;
        end
    end
    Matriz_Final = uint8(New_Matriz);
    Cell = {};
    Cell{1} = Input;
    Cell{2} = Matriz_Final;
    for i=1:2
        figure
        imshow(Cell{i})
        if i==1
            title(strcat('Imagen ''', Nombre_Variable,''' sin procesar'));
        else
            title(strcat('Imagen ''', Nombre_Variable,''' procesada'));
        end
        figure
        imhist(Cell{i})
        ylabel('Frecuencia de aparición')
        if i==1
            title(strcat('Histograma de Imagen ''', Nombre_Variable,''' sin procesar'));
        else
            title(strcat('Histograma de Imagen ''', Nombre_Variable,''' procesada'));
        end
    end
end