import h5py
import matplotlib.pyplot as plt
from os import listdir
from mpl_toolkits import mplot3d
import matplotlib.gridspec as gridspec
import numpy as np
import re

def LShapedPlot(coords, axisScale, dataset, file):
    plt.figure(figsize = (14,14.39))
    
    gs = gridspec.GridSpec(2,2)
    gs.update(wspace=0, hspace=0)

    ax1 = plt.subplot(gs[0])
    ax1.xaxis.set_visible(False)
    ax1.set_ylabel('y (Mpc)', rotation=0, labelpad=15)
    ax1.set_aspect('equal')
    ax1.spines['right'].set_visible(False)
    ax1.spines['bottom'].set_visible(False)
    ax1.set_xlim(left=-axisScale, right=axisScale)
    ax1.set_ylim(bottom=-axisScale, top=axisScale)
    ax1.plot(coords[0:,0], coords[0:,1], '.', color='blue', markersize=1)
    ax1.set_title = dataset + ' ' + file

    ax2 = plt.subplot(gs[1])
    ax2.yaxis.set_visible(False)
    ax2.set_xlabel('z (Mpc)', rotation=0)
    ax2.set_aspect('equal')
    ax2.spines['left'].set_visible(False)
    ax2.set_xlim(left=-axisScale, right=axisScale)
    ax2.set_ylim(bottom=-axisScale, top=axisScale)
    ax2.plot(coords[0:,2], coords[0:,1], '.', color='orange', markersize=1)

    ax3 = plt.subplot(gs[2])
    ax3.set_ylabel('z (Mpc)', rotation=0, labelpad=15)
    ax3.set_xlabel('x (Mpc)')
    ax3.set_aspect('equal')
    ax3.spines['top'].set_visible(False)
    ax3.set_xlim(left=-axisScale, right=axisScale)
    ax3.set_ylim(bottom=-axisScale, top=axisScale)
    ax3.plot(coords[0:,0], coords[0:,2], '.', color='red', markersize=1)

    ax4 = plt.subplot(gs[3], visible=False)
    ax4.set_aspect('equal')


    #plt.savefig('l-shaped\\' + dataset + '\\plot' + str(count) + '.png', dpi=300)
    plt.show()


def main():
    axisScale = 0.03
    datasets = ['organic', 'gm_late', 'gm_early']

    for dataset in datasets:
        print('-----------------------------------------')
        print(dataset)
        print('-----------------------------------------')
        
        files = listdir('data/' + dataset)

        count = 0

        galaxyAm = np.array(range(96), dtype=float).reshape(24,4)
        
        for file in files:
        #if 1==1:



            #file = 'star_particles_015_z002p012.hdf5'
            #file = 'star_particles_028_z000p000.hdf5'
            
            # get redshift from the filename
            m = re.search('(z[0-9])\w+', file)
            s = m.group(0).replace('z', '')
            s = s.replace('p', '.')
            redshift = float(s)
            
            # load data for a particular galaxy at a particular redshift
            f = h5py.File('data/' + dataset + '/' + file,'r')

            # extract data from the file
            ds_c = f['Coordinates']
            ds_v = f['Velocity']
            ds_m = f['Mass']
        

            # Calculate the resultant angular momentum vectors r
            # r contains the AM vectors for each particle per redshift era
            r0 = np.cross(ds_c, ds_v)
            r = np.transpose(np.multiply(ds_m, np.transpose(r0)))
            print ("shape r", np.shape(r))
            
            # Calculate the total angular momentum vector by summing the vectors (per redshift epoch)
            angMomTot = np.sum(r, axis=0)
            print ("shape angMomTot", np.shape(angMomTot)) 
            
            # Calculate the magnitude of the total angular momentum vector for each redshift epoch
            # We use this to normalise the angular momentum to a unit vector for scaling during the transform
            magnitude = np.linalg.norm(angMomTot)
            
            # Alternative way of calculating the magnitude
            # magnitude2 = np.sqrt(angMomTot[0]**2 + angMomTot[1]**2 + angMomTot[2]**2)
            
            # Calculate the scale factor by working out the angular momentum 
            unitVect_z = angMomTot / magnitude
            #print ("unitVect_z", unitVect_z)
            #print ("np.linalg.norm(unitVect_z)", np.linalg.norm(unitVect_z))
            
            
            # the angular momentum's vector's (unitVect_z) direction is directly out of the plane of the galaxy
            # unitVect_z = k, but j = [-k2/k1, 1, 0], so
            
            k = unitVect_z
            #print ("k: ", k)
            
            j = [k[1]/k[0], 1, 0]
            #print ("j: ", j)
            
            i = np.cross(j, unitVect_z)
            #print ("i: ", i)
    
            dsc_x_trsfrm = np.dot(ds_c, i)
            #print ("dsc_x_trsfrm", dsc_x_trsfrm)
            #print ("dsc_x_trsfrm shape", np.shape(dsc_x_trsfrm))
            
            dsc_y_trsfrm = np.dot(ds_c, j)
            #print ("dsc_y_trsfrm", dsc_y_trsfrm)
            #print ("dsc_y_trsfrm shape", np.shape(dsc_y_trsfrm))
            
            dsc_z_trsfrm = np.dot(ds_c, k)
            #print ("dsc_z_trsfrm", dsc_z_trsfrm)
            #print ("dsc_z_trsfrm shape", np.shape(dsc_z_trsfrm))
            
            # Combine the separate x, y and z arrays into a single 3-vector array.  Transpose for ease of visualisation
            #dsc_trans = list(zip(dsc_x_trsfrm, dsc_y_trsfrm, dsc_z_trsfrm))
            dsc_trans = np.transpose(np.array([dsc_x_trsfrm, dsc_y_trsfrm, dsc_z_trsfrm]))
            
            print ("dsc_trans", dsc_trans)
            print ("dsc_trans shape", np.shape(dsc_trans))
            
            print ("dsc_trans[0,x]")
            print (dsc_trans[0,0])
            print ("dsc_trans[0,y]")
            print (dsc_trans[0,1])
            print ("dsc_trans[0,z]")
            print (dsc_trans[0,2])        

            # Store totals of all particles for each redshift in the current galaxy
            #galaxyAm[count, 0] = redshift
            #galaxyAm[count, 1] = r[]
            
            LShapedPlot(dsc_trans, axisScale, "dataset", file)

            count = count + 1
            print ('-------------------------------------------------')

if __name__ == "__main__":
    print ("\n\n")
    main()
    print ("done")