from ovito.io import *
from ovito.modifiers import *
from ovito.pipeline import *

import matplotlib
# Activate 'agg' backend for off-screen plotting
matplotlib.use('Agg')
import matplotlib.pyplot as pp
import numpy as np
import pandas as pd

frame_deseado = np.loadtxt("frame.dat")
frame_deseado= int(frame_deseado)

# Data import:
pipeline = import_file('dump-termo.lammpstrj',
 multiple_frames = True)

# Polyhedral template matching:
pipeline.modifiers.append(
PolyhedralTemplateMatchingModifier(output_orientation = True))


for frame_index in range(pipeline.source.num_frames) :
    data = pipeline.compute(frame_index)
    CURRENT_TIMESTEP = data.attributes['Timestep']
    if CURRENT_TIMESTEP == frame_deseado:
        orientation = data.particles['Orientation']
        particle_type = data.particles['Particle Identifier']
        # FCC = 1 ; HCP = 2
        hcp = data.particles['Structure Type'] 
        arr = [hcp[i] for i in range(data.particles.count)] 
        w = []
        for i in orientation:
            w.append(i[3])
        par = []
        for i in particle_type:
            par.append(i)
        d1 = pd.DataFrame(arr) # hcp 
        d2 = pd.DataFrame(w) # orientation
        d3 = pd.DataFrame(par) # particle type
        df = pd.concat([d1, d2, d3], axis=1)
        df.columns=["hcp","orien","part-typ"]
    
        g1 = df[(df["hcp"]==1)] # atomos FCC
        g2 = df[~(df["hcp"]==1)] # atomos no FCC

###################################################
        aux=0

        for ori in orientation:
            if ori[3] < 0.65 and ori[3] > 0.1:
                aux=aux+1

        if aux == 0:
            pp.figure()
            pp.grid(True)
            pp.scatter(  g1["part-typ"], g1["orien"],
             marker='.',s = 4.5,color='b', label='FCC atom' )
            pp.scatter(  g2["part-typ"], g2["orien"], 
            marker='.',s = 4.5, color='r', label='No FCC atom' )
            pp.xlabel('Particle Identifier ', fontsize=12)
            pp.ylabel('W Orientation', fontsize=12)
            pp.ylim(0.65,1)
            pp.legend(loc='best')
            pp.savefig("twin.png", dpi=200)
        else:
            pp.figure()
            pp.grid(True)
            pp.scatter(  g1["part-typ"], g1["orien"], 
            marker='.',s = 4.5,color='b',label='FCC atom' )
            pp.scatter(  g2["part-typ"], g2["orien"], 
            marker='.',s = 4.5, color='r',label='No FCC atom' )
            pp.xlabel('Particle Identifier ', fontsize=12)
            pp.ylabel('W Orientation', fontsize=12)
            pp.legend(loc='best')
            pp.savefig("twin.png", dpi=200)
