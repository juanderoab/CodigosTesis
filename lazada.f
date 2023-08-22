	program gauss
	implicit none 
	real, allocatable,dimension(:,:) :: coord, aux
	real :: dx,dy,x_cm,y_cm,tmp_a
	real :: tmp_x, tmp_y, sum_pos
	integer ::i,j,k,Natoms,cont_aux, cont_aux2
        
	open(unit=25,file='ParAreadeGauss.xyz',status='unknown') 

	read(25,*) Natoms 	
	allocate(aux(Natoms,3))
	allocate(coord(Natoms,2))	
	read(25,*) 
	
	aux=0.
	coord=0.
	sum_pos=0
        
	do i=1, Natoms			 
	read(25,*) coord(i,1),coord(i,2) 
	end do
	
	cont_aux2=1

	x_cm=0				
	y_cm=0        		
	aux=0.
              
	do i=1,Natoms			
	cont_aux=0			
	do j=1,Natoms		
    	if (i .ne. j) then 
        	dx=coord(j,1)-coord(i,1)
            dy=coord(j,2)-coord(i,2)
			if (sqrt(dx**2+dy**2)<4.5) then
            cont_aux=cont_aux+1 
            end if 
        end if 
	end do 
             
             if (cont_aux < 7 ) then  
             aux(cont_aux2,1)=coord(i,1)
             aux(cont_aux2,2)=coord(i,2)
             aux(cont_aux2,3)=cont_aux           
             cont_aux2=cont_aux2+1	 
             end if 
	end do 
                
	cont_aux2=cont_aux2-1 

	do k=1, cont_aux2	
		x_cm=x_cm+aux(k,1)	
	    y_cm=y_cm+aux(k,2)
	end do 
	
	x_cm=x_cm/cont_aux2
	y_cm=y_cm/cont_aux2
                
	do k=1, cont_aux2
	aux(k,3)=(atan(((aux(k,2)-y_cm)/(aux(k,1)-x_cm))))*
     *      (57.2958)
	if (aux(k,1)-x_cm > 0 ) then  
		if (aux(k,2)-y_cm > 0 ) then 
			aux(k,3)=aux(k,3)
		else 
			aux(k,3)=360+aux(k,3) 
		end if
	    else
		if (aux(k,2)-y_cm > 0 ) then 
			aux(k,3)=180+aux(k,3)
        else 
			aux(k,3)=180+aux(k,3)
        end if
	    end if 
	end do

	do j=1, cont_aux2 
	do k=1, cont_aux2
		if ( j .ne. k ) then 
        	if (aux(k,3) > aux(j,3) ) then 
        		tmp_a=aux(j,3)
        		aux(j,3)=aux(k,3)
        		aux(k,3)=tmp_a

		        tmp_x=aux(j,1)
				aux(j,1)=aux(k,1)
        		aux(k,1)=tmp_x

       			tmp_y=aux(j,2)
        		aux(j,2)=aux(k,2)
        		aux(k,2)=tmp_y
	        end if
        end if 
	end do 
	end do 
        
	do j=1, cont_aux2     
		if ( j .ne. cont_aux2 ) then
	sum_pos=sum_pos+aux(j,1)*aux(j+1,2)-aux(j,2)*aux(j+1,1) 
	    else
	sum_pos=sum_pos+aux(j,1)*aux(1,2)-aux(j,2)*aux(1,1)
	end if 
	end do 

	sum_pos=sum_pos/2 	
	write(*,*) sum_pos     

	end program

