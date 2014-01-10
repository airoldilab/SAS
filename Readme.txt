================================================
Sort and Smooth (SAS) Algorithm for Consistent Graphon Estimation


================================================
This MATLAB package is a supplement to the paper 

S. H. Chan and E. M. Airoldi, "A Consistent Histogram Estimator for Exchangeable Graph Models", in Proceedings of International Conference on Machine Learning, 2014.


================================================
Content:

1. Construct Graphs from a Graphon
	Method 1: [G P u] = construct_a_graph(w,n,T)
		Input:  w - a Graphon 
			n - number of nodes
			T - number of observations
		Output: G - graph (size nxnxT)
			P - probability of each node
			u - label indices

	Method 2: G = construct_a_graph_from_P(P,n,T)
		Input:  P - probability of each node
			n - number of nodes
			T - number of observations
		Output: G - graph (size nxnxT)

2. Sorting and Smoothing (sort_and_smooth.m)
	Input:  G    - a graph
	Output: west - estimated graphon
	
	Algorithm dependency: ./deconvtv_v1/


3. Results reported in the paper
	Figure1.m - plot a twin graphon
	Figure2.m - display an example of the SAS algorithm
	Figure3.m - results of SAS, USVT and SBA for graphons no. 5 and no. 10
	Figure4.m - runtime plot
	Figure5.m - graphon estimation of soc-Epinion1 and ca-astroph network
	Table2.m  - mean squared error (average and standard deviation) of SAS, USVT and SBA.

4. Compared Methods
	(i)   stochastic_block.m (Stochastic Blockmodel Approximation, Airoldi et al. 2013)
	(ii)  usvt.m             (Universal Singular Value Thresholding, Chatterjee 2012)


	
References
[1] E. M. Airoldi, T. B. Costa, and S. H. Chan, "Stochastic blockmodel approximation of a graphon: Theory and consistent estimation", Advances in Neural Information Processing Systems. ArXiv: 1311.1731. 2013.

[2] S. Chatterjee. Matrix estimation by universal singular value thresholding. ArXiv:1212.1247. 2012.


================================================
COPYRIGHT (C) 2014 Stanley Chan and Edoardo Airoldi

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.




================================================
Please report bugs to Stanley Chan schan@seas.harvard.edu

Last update: January 10, 2014
