# Owner: S1: Task 1. Single electron in the double barrier, resonance energy and half-width at half height.
# Methods: shooting method, Galerkin method, complex potential / ideally absorbing layer.
#
# TODO (S1)
# Setup
#   [ ] constants and `RTDParams` / `default_params()` as in README.md (stable early: everybody uses them)
#   [ ] `potential_profile(x, p; U_bias)`: flat leads, barrier, well, barrier; document the literature source of the parameters
#   [ ] `transmission_mock(E)`: Lorentzian peak, so S2 can start right away
# Resonance by three independent methods
#   [ ] Shooting method: integrate ψ'' = (2m*/ħ²)(V − E)ψ from the right with an outgoing wave; adjust complex E until the left condition (only outgoing wave) holds, giving E = E_r − iΓ
#   [ ] Galerkin method: expand ψ in a basis (sine functions or hat functions) inside the structure, weighted-residual integrals give a generalized eigenproblem H c = E S c
#   [ ] Complex potential / ideally absorbing layer: add −iW(x) at the ends of the leads (W smooth, grows towards the boundary), solve the eigenproblem for the sparse H, take the eigenvalue closest to the expected level
#   [ ] Transfer-matrix T(E) (piecewise-constant potential) as a reference; resonance is the maximum of T(E)
# Results
#   [ ] `find_resonance(p)` returns (E_r, Γ_hwhm); report FWHM = 2Γ_hwhm and HWHM = Γ_hwhm explicitly (the task says half-width at half height)
#   [ ] check that the methods agree: E_r and Γ within 1 %
#   [ ] `transmission(E, p; U_bias)` with bias support (S2 needs it) and a vectorised version for fast integration
#   [ ] absorbing layer tuning: show that results do not depend on W_abs and layer thickness
#   [ ] convergence in dx and in L_lead; E_r and Γ versus barrier width
#   [ ] figure T(E) with E_r and Γ marked, table of results → results/task1/
# Tests and report
#   [ ] testset S1 in test/runtests.jl (infinite-well limit, T ≤ 1, T → 1 without barriers, Γ > 0)
#   [ ] report section 2 in report/report.md

# ─── Constants and parameters ──────────────────────────────────────────────────
const ħ2_over_2m0 = 0.0380998      # eV·nm²   (ħ²/2m0)
const ħ_eVfs      = 0.658212       # eV·fs
const k_B         = 8.617333e-5    # eV/K

Base.@kwdef struct RTDParams
    m_eff::Float64  = 0.067   # in m0
    V_b::Float64    = 0.3     # eV
    w_b::Float64    = 2.5     # nm
    w_w::Float64    = 4.5     # nm
    L_lead::Float64 = 50.0    # nm
    E_F::Float64    = 0.05    # eV
    T::Float64      = 300.0   # K
    dx::Float64     = 0.05    # nm
    W_abs::Float64  = 0.05    # eV, strength of the absorbing layer
end

default_params() = RTDParams()

# ─── Potential and Hamiltonian ─────────────────────────────────────────────────
potential_profile(x, p::RTDParams; U_bias=0.0) = error("TODO S1")
build_hamiltonian(p::RTDParams; U_bias=0.0)    = error("TODO S1")

# ─── Methods for the resonance ─────────────────────────────────────────────────
shooting_resonance(p::RTDParams)        = error("TODO S1")
galerkin_resonance(p::RTDParams)        = error("TODO S1")
absorbing_layer_resonance(p::RTDParams) = error("TODO S1")

# ─── Transmission and resonance parameters ─────────────────────────────────────
transmission_mock(E; E0=0.1, Γ=1e-3) = Γ^2 / ((E - E0)^2 + Γ^2)
transmission(E, p::RTDParams; U_bias=0.0) = error("TODO S1")
find_resonance(p::RTDParams) = error("TODO S1")   # -> (E_r, Γ_hwhm)

main_task1() = error("TODO S1")
