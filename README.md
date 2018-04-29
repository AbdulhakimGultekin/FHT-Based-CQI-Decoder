# FHT Based CQI Decoder
## Description
In this repository a **4.5G/LTE CQI decoding** algorithm has been simulated. The code can be followed regarding the standart **3GPP TS 36.212 version 12.2.0 Release 12 (5.2.2.6.4 section)**, which is mentioned in the comments of the **"test_src.m"** file, and the article. At constructing the decoded block a process which is different from the 9th step of the article is performed. If you want to completely follow the article, yes, you can, but then compare the results you get to understand why this difference has been preferred. If you have any questions, you can contact me with: hkmgltkn@gmail.com
## Usage
Download and extract the content in your desktop, then run **"test_src.m"**. It is not needed for third part users to change any content of functions. So if you only want to see the results of the algorithm, set the *CQI bit number value*, which is *O* in the code, and just wait for the simulation to be completed.
