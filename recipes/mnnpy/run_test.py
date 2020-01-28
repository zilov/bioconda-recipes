import scanpy as sc
import anndata
import numpy as np

a = anndata.AnnData(np.random.poisson(size=(100, 100)))

sc.external.pp.mnn_correct(a, a)
