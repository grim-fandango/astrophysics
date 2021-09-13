import h5py
import matplotlib.pyplot as plt
from os import listdir
import matplotlib.gridspec as gridspec
import numpy as np
import re

def plotLine(datasrc, title, xAxisLabel, yAxisLabel, colour='tab:red'):
    #plt.switch_backend('TkAgg')
    plt.figure(figsize = (12,10))


    plt.title(title, pad=30)
    plt.xlabel(xAxisLabel)
    plt.ylabel(yAxisLabel)
    #plt.ticklabel_format(axis='y', style='sci', useMathText=True)
    #plt.rcParams["figure.figsize"] = (12,10)
    plt.semilogy()
    plt.plot(datasrc[0:,0], datasrc[0:,1])
    plt.show()    

def main():
    # axis scale sets the maximum value on the axes
    axisScale = 0.03

    datasets = ['organic', 'gm_late', 'gm_early']
    #datasets = ['organic']

    for dataset in datasets:
        print('-----------------------------------------')
        print(dataset)
        print('-----------------------------------------')
        
        files = listdir('data/' + dataset)

        count = 0

        galaxyKE = np.array(range(48), dtype=float).reshape(24,2)
        
        for file in files:
        #if 1==1:


            #file = 'star_particles_005_z007p050.hdf5'
            #file = 'star_particles_015_z002p012.hdf5'
            #file = 'star_particles_028_z000p000.hdf5'
            #file = 'star_particles_014_z002p237.hdf5'
            
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

            # Calculate kinetic energy for all star particles
            #vel_tot = np.sum(ds_v, axis=1)
            #vel = np.array(ds_v[0:1])

            #print ('vel_tot', vel_tot)
            vel_tot_magnitude = np.linalg.norm(ds_v)
            print ('vel_tot_magnitude: ', vel_tot_magnitude)

            ke0 = np.sum(ds_m) * np.square(vel_tot_magnitude)
            #ke1 = np.transpose(ke0)
            #print (ke1)
            ke = 0.5 * ke0
            #print (ke)
            #print (np.shape(ke))
            # ke_sum = np.sum(ke)
            print ("\nKE sum:")
            print (ke)
            print (np.shape(ke))
            print ('-------------------------------------------------')

            galaxyKE[count, 0] = redshift
            galaxyKE[count, 1] = ke

            count = count + 1
        plotLine(galaxyKE, 'Galaxy: ' + dataset + ' - Total Kinetic Energy vs. Redshift', 'redshift', 'KE')

if __name__ == "__main__":
    print ("\n\n")
    main()
    print ("done")