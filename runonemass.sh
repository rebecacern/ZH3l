echo "Running backgrounds"

# higgs mass
for f in 125.7; do
	echo "Higgs mass = $f"
	
	#cem 
	for e in 8 7; do
		echo "Center of mass = $e"
		#final states
		for m in {1..4}; do 
    			echo "mode = ${m}"
    
    			root.exe -b -l -q chain_cut.C+\($e\,1\,$f\,$m\)
    			root.exe -b -l -q chain.C+\($e\,1\,$f\,$m\)
    		
			#syst stat   
    			for j in {1..6}; do 
    				root.exe -b -l -q syst_cut.C+\($e\,1\,$f\,$j\,0\,$m\)
    				root.exe -b -l -q syst_cut.C+\($e\,1\,$f\,$j\,1\,$m\)
    				root.exe -b -l -q syst.C+\($e\,1\,$f\,$j\,0\,$m\)
    				root.exe -b -l -q syst.C+\($e\,1\,$f\,$j\,1\,$m\)
   		
			done
			if [ $e == 8 ]; then
				root.exe -b -l -q datacardmaker8_cut.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker8_hsm_cut.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker8.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker8_hsm.C+\($f\,$m\)
			elif [ $e == 7 ]; then 
				root.exe -b -l -q datacardmaker7_cut.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker7_hsm_cut.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker7.C+\($f\,$m\)
				root.exe -b -l -q datacardmaker7_hsm.C+\($f\,$m\)
			fi
    
    
		done
	done
done 


echo "finished"

