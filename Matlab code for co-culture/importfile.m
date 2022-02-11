function importdata = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DAY16OPCDRGF800PNV500HZ = IMPORTFILE(FILENAME) reads data from text
%  file FILENAME for the default selection.  Returns the data as a table.
%
%  DAY16OPCDRGF800PNV500HZ = IMPORTFILE(FILE, DATALINES) reads data for
%  the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  importdata = importfile("C:\Users\ME System 3\Documents\projects\OL DRG coculture\AFM\110420 day 16 myelin\Area1\export curve text-2\day16_OPC_DRG_F800pN_v500Hz.pfc-C31F_ForceCurveIndex_41.spm.txt", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 04-Dec-2020 09:17:47

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Calc_Ramp_Ex_nm", "Calc_Ramp_Rt_nm", "Defl_nm_Ex", "Defl_nm_Rt", "Defl_pN_Ex", "Defl_pN_Rt", "VarName7"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "string"];


% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "VarName7", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "VarName7", "EmptyFieldRule", "auto");

% Import the data
importdata = readtable(filename, opts);

end