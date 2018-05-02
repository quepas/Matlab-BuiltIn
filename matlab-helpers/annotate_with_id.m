builtInTable = readtable('data/built-in-names.txt', 'ReadVariableNames',false);
builtInCell = table2cell(builtInTable);

for i = 1:length(builtInCell)
    builtInCell(i, 2) =  {exist(builtInCell{i, 1})};
end

writetable(cell2table(builtInCell), 'data/built-in-names-id.txt', 'WriteVariableNames',false);
