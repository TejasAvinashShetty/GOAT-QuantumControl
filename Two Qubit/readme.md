GOAT based Implementation of Controlled NOT gate in Spin systems


https://link.aps.org/doi/10.1103/PhysRevLett.120.150401


email : bilalriaz at live dot com

Gradients are computed analytically, whereas Hessians are approximated using MATLAB' builtin BFGS type optimization

Structure of Code is described below:

1.  main.m is the main script, which initilizes global stucture self, which holds all the variables of optimization, it acts as base for
    all the calculations carried out in the process.
    
2.  Evolution.m is the vectorized dynamical evolution of system, which is to be solved using some integrator, it is called from 
    Computations.m
    
3.  Computations.m converts vectorized evolution to matrices and returns unitary evolution operator along with its derivatives with
    respect to control parameters

4.  Cost.m uses outputs from computations.m to compute cost and gradients 


5.  Remaining functions are used to plot and analyze results.