%% capacity_ex1()
%
% LRFR Resistance for steel composite section 
% 
% jdv 06/22/2016

%% get lrfr capacity - positive region - flexure 

% create instance of composite section class
% note: comp class is a subclass of the section class so it inherets all of
% its properties and methods. all of a classes files are stored in the
% class folder marked by @<classname>, feel free to explore them
c = comp();

% read inputs from file with dot notation. 
% note: section class is a subclass of filio which handles all of the
% read/write functionality for it. the composite class then inherets the
% functionality from section. 
% note2: the file is located in loadrating/data/ and assumed to
% be added to matlab's search path. run the init.m file or function to do
% this if you haven't already.
% note3: if/when using your own .csv file, either ensure it is on matlab's
% search path or use a full, absolute path name
c.read_csv('sectionprops_pos.csv');

% get single line girder [SLG] demands w/ section method
d = c.getSLGdemands();

% create instance of lrfr rating structure
r = lrfr()

% positive flexure resistance
r.getPosFlex(c,d)


%% get lrfr capacity - negative region - flexure and shear

% load data
c = comp();
c.read_csv('sectionprops_neg.csv');

% rating
r = lrfr();
r.region = 'neg'; % change from 'pos' default
r.getShear(c) % shear
r.getNegFlex(c) % negative flexure 