import h5py
import matplotlib.pyplot as plt
from os import listdir
import matplotlib.gridspec as gridspec
import numpy as np
import re

def plotLine(xValues, yValues, title, xAxisLabel, yAxisLabel, colour='tab:red'):


    #plt.switch_backend('TkAgg')
    plt.figure(figsize = (12,10))



    plt.title(title, pad=30)
    plt.xlabel(xAxisLabel)
    plt.ylabel(yAxisLabel)
    plt.ticklabel_format(axis='y', style='sci', useMathText=True)
    #plt.rcParams["figure.figsize"] = (12,10)
    plt.semilogy()
    plt.plot(xValues, yValues)
    plt.show()    

def main():

    #B = np.arange(24*3).reshape((24,3))
    #print(B)
    #print (B[0:1])

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

        #galaxyKE = np.array(range(48), dtype=float).reshape(24,2)
        redshifts = np.array(range(24), dtype=float)
        kes = np.array(range(24), dtype=float)
        specificKes = np.array(range(24), dtype=float)
        
        for file in files:
            
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

            # Get magnitudes of the vectors
            vel_magnitude = np.linalg.norm(ds_v, axis=1)

            # Calculate kinetic energy for all star particles
            ke = np.sum(0.5 * np.array(ds_m) * np.square(vel_magnitude))
            specificKe = np.sum(0.5 * np.square(vel_magnitude))

            redshifts[count] = redshift
            kes[count] = ke
            specificKes[count] = specificKe

            # Next redshift value
            count = count + 1

            print('file name:   '+ file   +  '\t redshift:   ' + str(redshift) + '\t mass:   ' + str(ds_m[0:1]) + '\t velocity magnitude:   ' + 
                str(vel_magnitude) + '\t KE:   ' + str(ke))

        plotLine(redshifts, kes, 'Galaxy: ' + dataset + ' - Total Kinetic Energy vs. Redshift', 'redshift', 'KE ($M_{\odot}km^2s^{-2}$)')
        plotLine(redshifts, kes * 1.989e30 / 1000, 'Galaxy: ' + dataset + ' - Total Kinetic Energy vs. Redshift', 'redshift', 'KE (J)')
        plotLine(redshifts, kes * 1.989e30 / 1000 * 1e7, 'Galaxy: ' + dataset + ' - Total Kinetic Energy vs. Redshift', 'redshift', 'KE (erg)')

        plotLine(redshifts, specificKes, 'Galaxy: ' + dataset + ' - Total Specific Kinetic Energy vs. Redshift', 'redshift', 'Specific KE ($km^2s^{-2}$)')
        plotLine(redshifts, specificKes * 1.989e30 / 1000, 'Galaxy: ' + dataset + ' - Total Specific Kinetic Energy vs. Redshift', 'redshift', 'Specific KE ($J.kg^{-1}$)')
        plotLine(redshifts, specificKes * 1.989e30 / 1000 * 1e7, 'Galaxy: ' + dataset + ' - Total Specific Kinetic Energy vs. Redshift', 'redshift', 'Specific KE ($erg.g^{-1}$)')

if __name__ == "__main__":
    print ("\n\n")
    main()
    print ("done")