import numpy as np
import matplotlib.pyplot as plt

#load the data
raw_data =np.loadtxt("python/output_signal.txt")

#convert from Q1.15 backnormal decimal
data = raw_data / 32768.0

#run FFT
total_samples = len(data)
fft_data = np.fft.fft(data)

#take the abdolute value AND only keep the first half (positive frequencies)
half_way =total_samples // 2

magnitude = np.abs(fft_data[:half_way])/ total_samples

#create the real frequency X-axis
fs= 1200000000.0
frequencies = np.fft.fftfreq(total_samples, 1/fs)[:half_way]
frequencies_mhz= frequencies /1e6 #converthz to mhz

plt.plot(magnitude)
plt.title("FFT Output")
plt.xlabel("Frequency Bin")
plt.ylabel("Magnitude")
plt.grid()

plt.show()