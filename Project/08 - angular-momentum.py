import h5py
import matplotlib.pyplot as plt
from os import listdir
from mpl_toolkits import mplot3d
import matplotlib.gridspec as gridspec
import numpy as np
import re

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
        #print('redshift = ' + s + ' converted: ' + str(redshift))
        
        # load data for a particular galaxy at a particular redshift
        f = h5py.File('data/' + dataset + '/' + file,'r')

        ds_c = f['Coordinates']
        ds_v = f['Velocity']
        ds_m = f['Mass']
        
        #print ('length: ' + str(np.shape(ds_c)[0]))
        #for pv in ds_c:
        #    print ('x:' + str(pv[0]) + '\t y:' + str(pv[1]) + '\t z:' + str(pv[2]))
        

        # Calculate angular momentum vector for each particle and sum into rTot
        rTot = [0, 0, 0]
        # Swap this for test mode to stop it taking forever
        #for n in range(0, 10):
        #for n in range(0, np.shape(ds_c)[0]):
        #    pv = ds_c[n]
        #    linMv = ds_m[n] * ds_v[n]
        #    
        #    r = np.cross(pv, linMv)
        #    #print ('x:' + str(r[0]) + '\t y:' + str(r[1]) + '\t z:' + str(r[2]))
        #    rTot = rTot + r
            
        r = np.cross(ds_c, ds_v)
        r1 = np.transpose(np.multiply(ds_m, np.transpose(r)))
        #r = np.multiply(ds_m, r)
        angMomTot = np.linalg.norm(r1, axis=1)
        #print (angMomTot)
        #rTot = rTot + r

        # Store totals of all particles for each redshift in the current galaxy
        galaxyAm[count, 0] = redshift
        galaxyAm[count, 1] = np.sum(angMomTot)
              
        count = count + 1
    
    # print each angular momentum component's total per redshift
    for n in range(24):
        print('Galaxy "' + dataset + '" redshift: ' + str(galaxyAm[n][3]) + '\t total:  x:' + str(galaxyAm[n][0]) + '\t y:' + str(galaxyAm[n][1]) + '\t z:' + str(galaxyAm[n][2]))
    
    #print ('length: ' + str(np.shape(galaxyAm)[0]))
    #plt.plot(galaxyAm[0:,3], galaxyAm[0:,2])
    plt.plot(galaxyAm[0:,0], galaxyAm[0:,1])

    plt.title('Galaxy: ' + dataset + ' - Magnitude of Angular Momentum vs. Redshift', pad=30)
    plt.xlabel('Redshift')
    plt.ylabel(r'L Magnitude ($M_\odot\ Mpc km s^{-1})$')
    plt.ticklabel_format(axis='y', style='sci', useMathText=True)
    plt.rcParams["figure.figsize"] = (12,10)
    plt.semilogy()
    plt.show()    