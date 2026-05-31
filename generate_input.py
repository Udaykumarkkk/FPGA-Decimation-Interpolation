
import numpy as np

# Parameters
Fs = 120e6        # Sampling frequency
f = 1e6           # Signal frequency
A = 0.999         # Amplitude
N = 4096          # Number of samples

# Generate sample index
n = np.arange(N)

# Generate sine wave
x = A * np.sin(2 * np.pi * f * n / Fs)

# Convert to Q1.15
x_q15 = np.int16(x * 32767)

# Save into text file
np.savetxt("input_signal.txt", x_q15, fmt='%d')

print("Input signal generated successfully")