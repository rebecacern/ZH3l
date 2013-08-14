echo "Running backgrounds"

# higgs mass
for f in 125 150 170 190 ; do
	echo "Higgs mass = $f"
	
	#cem 
	for e in 8 7; do
		echo "Center of mass = $e"
		#final states
		for m in {1..4}; do 
    			echo "mode = ${m}"
    
   	 		root.exe -b -l -q doWZ_cut.C+\($e\,$m\,$f\)
    			root.exe -b -l -q doFakes_cut.C+\($e\,$m\,$f\)
			#normal
    			for i in 0 2 3 4 5 7; do 
    				root.exe -b -l -q chain_cut.C+\($e\,$i\,$f\,$m\)
    			done
			#syst stat   
    			for j in 2 3 4 5 7; do 
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,1\,0\,$m\)
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,1\,1\,$m\)
   			done
			#syst JES   
    			for j in 2 3 4 7; do 
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,2\,0\,$m\)
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,2\,1\,$m\)
   			done
			#syst JES   
    			for j in 2 3 4 7; do 
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,4\,0\,$m\)
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,4\,1\,$m\)
   			done
			#syst LEP 
    			for j in 2 3 4 7; do 
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,5\,0\,$m\)
    				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,5\,1\,$m\)
   			done
			for j in 2 3 4 7; do
				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,6\,0\,$m\)
				root.exe -b -l -q syst_cut.C+\($e\,$j\,$f\,6\,1\,$m\)
			done	

		
			# syst WZ
			root.exe -b -l -q syst_cut.C+\($e\,2\,$f\,7\,0\,$m\)
    			root.exe -b -l -q syst_cut.C+\($e\,2\,$f\,7\,1\,$m\)
			# syst fakes
			root.exe -b -l -q syst_cut.C+\($e\,5\,$f\,8\,0\,$m\)
    			root.exe -b -l -q syst_cut.C+\($e\,5\,$f\,8\,1\,$m\)
    
    
		done
	done
done 

cp 125/*  110/.
cp 125/*  115/.
cp 125/*  120/.
cp 125/*  125.5/.
cp 125/*  130/.
cp 125/*  135/.

cp 150/*  140/.
cp 150/*  160/.

cp 190/*  180/.
cp 190/*  200/.

echo "Backgrounds finished"

