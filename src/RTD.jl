# Owner: S4
#
# TODO (S4):
#   [ ] add `using` lines for the packages that the four files need (Plots, CSV, DataFrames, OrdinaryDiffEq, Interpolations, Optim, Roots)
#   [ ] export the public API listed in README.md
#   [ ] check that `using RTD` works in a fresh `julia --project` session after every merge

module RTD

using LinearAlgebra, SparseArrays

include("s1_quantum.jl")
include("s2_transport.jl")
include("s3_timedep.jl")
include("s4_circuit.jl")

end # module
