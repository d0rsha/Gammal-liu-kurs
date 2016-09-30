all: 

clean:
	find . -type f -name "*.o" -exec rm -i {} \;
	find . -type f -name "*.ali" -exec rm -i {} \;
	find . -type f -executable -print -delete 
