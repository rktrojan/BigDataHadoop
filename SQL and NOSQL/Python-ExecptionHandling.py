

def sum(a,b):
    c=a+b
    print(c)
    
    
    
    
def calc(a,b,ops):

    if ops=="add":
    
        c=a+b
        print(c) 
	else if ops=="div"
        try:
            c=a/b
            print(c)
        except DIVIDEBYZERO:
            print("can not divide by 0, please chanvge your input")
        except NULLPOINTEREXCEPTION:
            print("NULL POINTER ERROR")
        
    
    print("COMPLETE")   

   
        

calc(1,0,"div")