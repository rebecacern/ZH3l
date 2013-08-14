echo "Running backgrounds"

#cem 
for e in 8 7; do
	echo "Center of mass = $e"
	
	#final states
	for m in {1..4}; do 
    		echo "mode = ${m}"
    
    		root.exe -b -l -q doWZ.C+\($e\,$m\)
    		root.exe -b -l -q doFakes.C+\($e\,$m\)
    		
		#normal
    		for i in 0 2 3 4 5 7; do 
    			root.exe -b -l -q chain.C+\($e\,$i\,125\,$m\)
    		done
		#syst stat   
    		for j in 2 3 4 5 7; do 
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,1\,0\,$m\)
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,1\,1\,$m\)
   		done
		#syst JES   
    		for j in 2 3 4 7; do 
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,2\,0\,$m\)
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,2\,1\,$m\)
   		done
		#syst JES   
    		for j in 2 3 4 7; do 
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,4\,0\,$m\)
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,4\,1\,$m\)
   		done
		#syst LEP 
    		for j in 2 3 4 7; do 
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,5\,0\,$m\)
    			root.exe -b -l -q syst.C+\($e\,$j\,125\,5\,1\,$m\)
   		done
		
		for j in 2 3 4 7; do
			root.exe -b -l -q syst.C+\($e\,$j\,125\,6\,0\,$m\)
			root.exe -b -l -q syst.C+\($e\,$j\,125\,6\,1\,$m\)
		done	
		
		# syst WZ
		root.exe -b -l -q syst.C+\($e\,2\,125\,7\,0\,$m\)
    		root.exe -b -l -q syst.C+\($e\,2\,125\,7\,1\,$m\)
		# syst fakes
		root.exe -b -l -q syst.C+\($e\,5\,125\,8\,0\,$m\)
    		root.exe -b -l -q syst.C+\($e\,5\,125\,8\,1\,$m\)
    
    
	done
done

for f in 110 115 120 125.7 130 135 140 150 160 170 180 190 200; do
	cp 125/* $f/.
done

cp 125/* aux/.

echo "Backgrounds finished"
