ZH3l  code
====
s
To reproduce the mass points I have already, from a clean project, there must be
a folder for each mass ready and then:

sh runbackground.sh  -> will produce the shape based backgrounds (and files)
sh runbackground_cut.sh -> will produce the cut-based backgrounds (takes longer)

Then:

sh runsignals.sh -> finishes the files and datacards for the shape
sh runsignals_cut.sh -> finishes the cut-based 

If a new mass point is needed (artisanal mechanism!), first, make the folder of
the mass, then modify syst.C syst_cut.C, chain.C and chain_cut.C in two places
(for both 7 and 8 TeV!):
- file to read at the start
- factor to reweight (after "if (!isData && sample.dstype_ != SmurfTree::data)
weight =
lumi*sample.scale1fb_*puweight*sample.sfWeightEff_*sample.sfWeightTrig_;  ")
-> use the closest mass point to do the reweighting!

For this, use the values in:

https://ceballos.web.cern.ch/ceballos/hwwlnln/xs_br_hww_ecm7tev.txt
https://ceballos.web.cern.ch/ceballos/hwwlnln/xs_br_hww_ecm8tev.txt

Then, modify runonemass.sh and run it!

  
   


