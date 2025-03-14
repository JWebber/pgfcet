rawdata = dir('raw');

fID = fopen('maps.txt','w');
fprintf(fID, "\\usepackage{xstring}\n \\newcommand{\\pgfcetloadcmap}[1]{\\IfEqCase{#1}{")

for i = 3 : size(rawdata, 1)
    src = strcat('raw\', rawdata(i).name);
    identifier = rawdata(i).name;
    identifier = identifier(5:end-4);

    cmap = load(src);
    
    string_cmap = strcat("{", identifier, "}{\\pgfplotsset{colormap={cet-", identifier, "}{");
    for j = 1 : size(cmap, 1)-1
        string_cmap = strcat(string_cmap, "rgb=(", num2str(cmap(j, 1)), ",", num2str(cmap(j, 2)), ",", num2str(cmap(j, 3)), ") ");
    end

    string_cmap = strcat(string_cmap, "rgb=(", num2str(cmap(size(cmap, 1), 1)), ",", num2str(cmap(size(cmap, 1), 2)), ",", num2str(cmap(size(cmap, 1), 3)), ")}\n");

    fprintf(fID, strcat(string_cmap, '}}\n'));
end
fprintf(fID, '}[\\PackageError{pgfcet}{Undefined colour map: #1. All valid maps are listed at https://colorcet.com/gallery.html, and can be loaded by typing the map name minus the CET- prefix}{}]}\n');

fclose(fID);