from scipy.signal import firwin
import numpy as np

# FIR parameters
num_taps = 51
cutoff = 15e6
fs = 120e6

# Generate FIR coefficients
coeff = firwin(num_taps, cutoff/(fs/2))

# Save coefficients
np.savetxt("coeff.txt", coeff)

print("FIR coefficients generated successfully")