	program pittaway 
	implicit none
	real*8 :: r_ij, ro_ab, p_ab, A_ab
	real*8 :: ep_ab, q_ab
	real*8 :: rho
	real*8 :: rho_2, rho_3, rho_4, rho_5
	integer ::  k, l,m   

	write(*,*) 'c Theoretical Studies of Palladium-Gold Nanoclusters
     *  : Pd-Au Clusters with up to 50 Atoms'
	write(*,*) 
	write(*,*) 
	
	write(*,*) 2, "Pd"," " , "Au"
	write(*,*) 10000, 0.05, 10000, 0.00065, 6.5

9	format(e24.16,e24.16,e24.16,e24.16,e24.16)

	do l=1, 2

	if ( l==1 ) then ! Pd-Pd
	write(*,*) '      46     106.40 3.8900    fcc'
	do k=1, 10000/5 !! FUNCION DE EMBEDIMIENTO -eps * sqrt (x)  
	!!! Nrho values
	m=k*5
	r_ij=real((m-5))*0.05
	rho=-sqrt(r_ij)
	r_ij=real((m-4))*0.05
	rho_2=-sqrt(r_ij)
	r_ij=real((m-3))*0.05
	rho_3=-sqrt(r_ij)
	r_ij=real((m-2))*0.05
	rho_4=-sqrt(r_ij)
	r_ij=real((m-1))*0.05
	rho_5=-sqrt(r_ij)
	
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
	end do 
	
	!! DENSITY FUNCTION  rho(r) (Nr values) 
	A_ab=0.1715
	ep_ab=1.7019
	p_ab=11.000
	q_ab=3.7940
	ro_ab=2.7485
	
		do k=1, 10000/5 !! DE PD-PD
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0)) ! embeding 
	r_ij=real((m-4))*0.00065
	rho_2=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-3))*0.00065
		rho_3=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-2))*0.00065
	rho_4=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-1))*0.00065
	rho_5=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
	end do
	
	!!!!!!!!!!!!!!! RHO DE PD-AU
	
		A_ab=0.2764
	ep_ab=2.0820
	p_ab=10.569
	q_ab=3.9130
	ro_ab=2.8160
	
	
	       do k=1, 10000/5 !! RHO DE PD-AU
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0)) ! embeding 
		r_ij=real((m-4))*0.00065
	rho_2=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-3))*0.00065
	rho_3=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-2))*0.00065
	rho_4=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-1))*0.00065
	rho_5=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	!write(*,*) real((m-5))*0.05, real((m-4))*0.05, 
	!     *  real((m-3))*0.05, real((m-2))*0.05, real((m-1))*0.05
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
		end do
	
	end if 
	
	if (l == 2) then ! Au-Au
	
	write(*,*) '   79     196.97 4.0800    fcc'
	do k=1, 10000/5 !! FUNCION DE EMBEDIMIENTO AU  
	m=k*5
	
	r_ij=real((m-5))*0.05
	rho=-sqrt(r_ij)
	r_ij=real((m-4))*0.05
	rho_2=-sqrt(r_ij)
	r_ij=real((m-3))*0.05
	rho_3=-sqrt(r_ij)
	r_ij=real((m-2))*0.05
	rho_4=-sqrt(r_ij)
	r_ij=real((m-1))*0.05
	rho_5=-sqrt(r_ij)
	
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
	end do
	
	!!!!!!!!!!!!!!! RHO DE PD-AU
	
	A_ab=0.2764
	ep_ab=2.0820
	p_ab=10.569
	q_ab=3.9130
	ro_ab=2.8160
	
	
	do k=1, 10000/5 !! RHO DE PD-AU
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0)) ! embeding 
	r_ij=real((m-4))*0.00065
	rho_2=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-3))*0.00065
	rho_3=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-2))*0.00065
	rho_4=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-1))*0.00065
	rho_5=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
	end do
	
	!!!! Density funtion rho(r)
	!!!!!!!!!!!!!!! RHO DE AU-AU
	A_ab=0.2096
	ep_ab=1.8153
	p_ab=10.139
	q_ab=4.0330
	ro_ab=2.8840
	
		do k=1, 10000/5 !! RHO DE AU - AU
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0)) ! embeding 
	r_ij=real((m-4))*0.00065
	rho_2=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-3))*0.00065
	rho_3=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-2))*0.00065
	rho_4=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	r_ij=real((m-1))*0.00065
	rho_5=(ep_ab**2)*exp(-2*q_ab*((r_ij/ro_ab)-1.0))
	write(*,9)  rho, rho_2, rho_3, rho_4, rho_5
	end do
		
	end if
	
	end do 
	
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		!!! Pair potential -> r * phi
	!! Orden Pd - Pd
	!! Au - Pd
	!!       Au - Au
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	do k=1, 10000/5  !! PARES Pd - Pd 
	
	A_ab=0.1715
	ep_ab=1.7019
	p_ab=11.000
		q_ab=3.7940
	ro_ab=2.7485
	
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-4))*0.00065
	rho_2=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-3))*0.00065
	rho_3=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-2))*0.00065
	rho_4=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-1))*0.00065
	rho_5=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	write(*,9) 2*rho, 2*rho_2, 2*rho_3, 2*rho_4, 2*rho_5
	end do
	
	
	do k=1, 10000/5  !! PARES Au - Pd 
		
	A_ab=0.2764
	ep_ab=2.0820
	p_ab=10.569
	q_ab=3.9130
	ro_ab=2.8160
	
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-4))*0.00065
	rho_2=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-3))*0.00065
	rho_3=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-2))*0.00065
	rho_4=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-1))*0.00065
	rho_5=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	write(*,9) 2*rho, 2*rho_2, 2*rho_3, 2*rho_4, 2*rho_5
	end do 
	
	do k=1, 10000/5  !! PARES Au - Au
	
	A_ab=0.2096
	ep_ab=1.8153
	p_ab=10.139
	q_ab=4.0330
	ro_ab=2.8840
	
	m=k*5
	r_ij=real((m-5))*0.00065
	rho=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-4))*0.00065
	rho_2=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-3))*0.00065
	rho_3=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	r_ij=real((m-2))*0.00065
	rho_4=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
		r_ij=real((m-1))*0.00065
	rho_5=r_ij*(A_ab*exp(-p_ab*((r_ij/ro_ab) -1.0)))
	write(*,9) 2*rho, 2*rho_2, 2*rho_3, 2*rho_4, 2*rho_5
	end do
	
	end program pittaway
			
