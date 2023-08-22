	program insert
	implicit none
	real :: dist, mini, maxi, cx_prom, cy_prom,cz_prom 
	real :: dist_p_1, dist_p_2, lat, tmp
	integer :: N, ind, i, j, Nd, cont
	real, dimension (:,:), allocatable :: Coor, Tad
	integer, dimension (:), allocatable :: Vec, Va
	character(len=3) :: inti 

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C 	LECTURA DE LAS DIMENSIONES DE LA CAJA
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

	open(unit=23,file="media_caja.dat",status="unknown")
		read(23,*) lat

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C 	LECTURA DE CLUSTER 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
	
	open(unit=1,file='ajuntar.xyz',status='unknown')

	read(1,*)  N
	read(1,*) 

	allocate (Coor(N,3)) 
	allocate (Vec(N))

	cx_prom=0
	cy_prom=0 
	cz_prom=0

	Vec=0
	do i=1,N 
		read(1,*) ind, Coor(i,1), Coor(i,2), Coor(i,3)  
		cx_prom=cx_prom+Coor(i,1)
		cy_prom=cy_prom+Coor(i,2)
		cz_prom=cz_prom+Coor(i,3)
	end do 
	
C Centro de la Nanoparticula de Au      
	
		cx_prom=cx_prom/N
	cy_prom=cy_prom/N
	cz_prom=cz_prom/N
		
	close(1)
	
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C 	CENTRADO DEL CLUSTER
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

	open(unit=1,file='ajuntar.xyz',status='unknown')
	
	read(1,*)  N
	read(1,*) 

	cont=0
	do i=1,N 
		read(1,*) ind, Coor(i,1), Coor(i,2), Coor(i,3)  
		Coor(i,1)=Coor(i,1)-cx_prom
		Coor(i,2)=Coor(i,2)-cy_prom
		Coor(i,3)=Coor(i,3)-cz_prom	
		cont=cont+1
	end do 

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C 	LECTURA DEL CUBO 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

	open(unit=2,file="Cubo.xyz", status="unknown")

	cx_prom=0
	cy_prom=0
	cz_prom=0

	read(2,*) Nd
	read(2,*) 

	allocate (Va(Nd))
	allocate (Tad(Nd,3))

	do i=1, Nd
		read(2,*) inti, Tad(i,1), Tad(i,2), Tad(i,3)
		cx_prom=cx_prom+Tad(i,1)
		cy_prom=cy_prom+Tad(i,2)
		cz_prom=cz_prom+Tad(i,3)
	end do

C Centro del cubo 
	cx_prom=cx_prom/Nd
	cy_prom=cy_prom/Nd
	cz_prom=cz_prom/Nd
	close(2)
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C 	CENTRADO DEL CUBO
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
		
	open(unit=2,file="Cubo.xyz", status="unknown")
	read(2,*) Nd
	read(2,*) 
	
	do i=1, Nd
		read(2,*) inti, Tad(i,1), Tad(i,2), Tad(i,3)
		Tad(i,1)=Tad(i,1)-cx_prom
		Tad(i,2)=Tad(i,2)-cy_prom
		Tad(i,3)=Tad(i,3)-cz_prom
	end do

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c CRITERIO DE VECINOS
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
	Va=0

	do j=1, Nd
		do i=1, N 
			dist=(Coor(i,1)-Tad(j,1))**2
			dist=dist+(Coor(i,2)-Tad(j,2))**2
			dist=dist+(Coor(i,3)-Tad(j,3))**2
			dist=sqrt(dist)
		if ( dist < 1.3) then 
			Va(j)=Va(j)+1 
		end if 		   	
		end do 
	end do 	

	do i=1, Nd
		if ( Va(i) == 0) then 
			cont=cont+1
		end if  
	end do 


	open(unit=5,file="ini.xyz",status="unknown")
	open(unit=7,file="ini.dat", status="unknown")

	write(5,*) cont
	write(5,*)

	write(7,*)
	write(7,*)
	write(7,*) cont, 'atoms'
	write(7,*) '2 atom types'
	write(7,*) -lat, lat, 'xlo xhi'
	write(7,*) -lat, lat, 'ylo yhi'
	write(7,*) -lat, lat, 'zlo zhi'
	write(7,*)
	write(7,*) 'Atoms'
	write(7,*)

	write(*,*) lat

	do i=1, N
		write(5,*) 'Au', Coor(i,1), Coor(i,2), Coor(i,3)
		write(7,*) i, 1, Coor(i,1), Coor(i,2), Coor(i,3)
	end do

	cont=0

	do i=1, Nd
		if (Va(i) == 0 ) then
			cont=cont+1
			write(5,*) 'Pd',Tad(i,1),Tad(i,2),Tad(i,3)
			write(7,*) N+cont,2,Tad(i,1),Tad(i,2),Tad(i,3)
		end if
	end do	

	end program insert

