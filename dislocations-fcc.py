from ovito.io import *
from ovito.modifiers import *
from ovito.pipeline import *

# Data import:
pipeline = import_file('dump-inden.lammpstrj', multiple_frames = True)

# Dislocation analysis (DXA):
pipeline.modifiers.append(DislocationAnalysisModifier())

# Construct surface mesh:
pipeline.modifiers.append(
ConstructSurfaceModifier(identify_regions = True))

# Polyhedral template matching (PTM):
pipeline.modifiers.append(PolyhedralTemplateMatchingModifier())


header = "TIMESTEP OTHER 1/2<110> 1/6<112> 1/6<110> 
1/3<100> 1/3<111> TOTAL_LINE_LENGTH DISLOCATION_DENSITY
NP_Volumen C_FFF C_HCP"
print(header)
for frame_index in range(pipeline.source.num_frames) :
##    longSegments = 0
    data = pipeline.compute(frame_index)
    CURRENT_TIMESTEP = data.attributes['Timestep']

#   DISLOCATIONS 
#   Other type
disloc_other = data.attributes[
    'DislocationAnalysis.length.other']
#   1/2<110>
disloc_1_2b110k = data.attributes[
    'DislocationAnalysis.length.1/2<110>']
#   1/6<112>
disloc_1_6b112k = data.attributes[
    'DislocationAnalysis.length.1/6<112>']
#   1/6<110>
disloc_1_6b110k = data.attributes[
    'DislocationAnalysis.length.1/6<110>']
#   1/3<111>
disloc_1_3b100k = data.attributes[
    'DislocationAnalysis.length.1/3<100>']
disloc_1_3b111k = data.attributes[
    'DislocationAnalysis.length.1/3<111>']
#   TOTAL LINE LENGTH
total_line_length = data.attributes[
    'DislocationAnalysis.total_line_length']

#   Contador FCC
count_FCC = data.attributes[
    'PolyhedralTemplateMatching.counts.FCC']


#   Contador HCP
count_HCP = data.attributes[
    'PolyhedralTemplateMatching.counts.HCP']

#Volúmen de la NP
NP_volume = data.attributes[
    'ConstructSurfaceMesh.filled_volume']
    
    print(CURRENT_TIMESTEP, end = " ")
    print(disloc_other, end = " ")
    print(disloc_1_2b110k, end = " ")
    print(disloc_1_6b112k, end = " ")
    print(disloc_1_6b110k, end = " ")
    print(disloc_1_3b100k, end = " ")
    print(disloc_1_3b111k, end = " ")
    print(total_line_length, end = " ")
    print((total_line_length / NP_volume), end = " ")
    print(NP_volume, end = " ")
    print(count_FCC, end = " ")
    print(count_HCP)

