# RTD modelling project (Julia), team of 4

Model a resonant tunnelling diode (RTD): resonance of a single electron, I–V curve with negative differential conductance (NDC), time-dependent potential, and the RTD inside a THz circuit (RTD ‖ C, in series with R, L and a source). Final result: I(t) and U(t) in the circuit.

## Structure

```
rtd_project/
├── README.md             this file: roles, interfaces, rules
├── Project.toml
├── src/
│   ├── RTD.jl            module, includes the four files below (S4)
│   ├── s1_quantum.jl     Task 1 (S1)
│   ├── s2_transport.jl   Task 2 (S2)
│   ├── s3_timedep.jl     Task 3 (S3)
│   └── s4_circuit.jl     Task 4 (S4)
├── scripts/run.jl        julia --project scripts/run.jl 1|2|3|4|all
├── test/runtests.jl      one testset per student
├── docs/theory.md        equations, units, which course method is used where
├── report/report.md      one section per student
└── results/              figures and data, one subfolder per task
```

Each `src/sN_*.jl` file has the same layout: a TODO list for that student at the top, then the code sections. Each student also writes the `main_taskN()` function called by `scripts/run.jl`, their testset, and their report section.

## Who does what

| | Task | Course methods used |
|---|---|---|
| S1 | 1. Single electron: resonance energy E_r and half-width at half height | shooting method, Galerkin method, complex potential / ideally absorbing layer |
| S2 | 2. Bias potential, I–V curve, maximum of NDC | method of weighted residuals (Galerkin) for the scattering problem, shooting method for T(E) |
| S3 | 3. Time-dependent potential φ_AC = V(t)·x/L and output current | Crank–Nicolson scheme, ideally absorbing layer, complex potential, Z-transform |
| S4 | 4. Circuit, THz choice of L and C, I(t), U(t); also module, tests, report | Crank–Nicolson (trapezoidal) for ODEs, Z-transform stability, shooting method for the limit cycle |

## Interfaces (what the other students may rely on)

Units: eV, nm, fs for the quantum part; V, A, ohm, H, F, s for the circuit (see `docs/theory.md`).

```julia
# S1 -> all
struct RTDParams ... end                     # m_eff, V_b, w_b, w_w, L_lead, E_F, T, dx, W_abs
default_params() -> RTDParams
potential_profile(x, p; U_bias=0.0)          # real part of the potential
transmission(E, p; U_bias=0.0) -> T in [0,1]
find_resonance(p) -> (E_r, Γ_hwhm)           # eV; FWHM = 2Γ_hwhm
build_hamiltonian(p; U_bias=0.0)             # sparse; complex if the absorbing layer is on

# S2 -> S3, S4
iv_curve(p, U_grid) -> (U, I)                # A
find_ndc(U, I) -> (U_peak, U_valley, U_ndc, G_min)
I_rtd_interp(p) -> (U -> I)                  # smooth callable for the circuit
mock_I_rtd(U)                                # N-shaped mock, available from the start

# S3 -> S4 (information, optional)
propagate(psi0, p, Vfun, t) -> psi_t
current_out(psi_t, x, p) -> I_out(t)
response_z(I_out, V, dt, omegas)             # Z-transform based frequency response

# S4
thz_design(f, C) -> L
solve_circuit(par, u0, tspan) -> sol         # par: R, L, C, Vin(t), I_rtd(U)
```

Until a part is ready, the next person uses its mock (`transmission_mock`, `mock_I_rtd`), so nobody is blocked.

## Rules

- One owner per file. Change someone else's file only after telling them.
- Change a signature in the Interfaces section only after telling everyone.
- Setup (S4): `julia --project -e 'using Pkg; Pkg.add(["Plots","CSV","DataFrames","OrdinaryDiffEq","Interpolations","Optim","Roots"]); Pkg.instantiate()'`, then commit `Project.toml` and `Manifest.toml`.
- "Ideally absorbing layer" in this plan is the course's "ideally consuming layer"; if the course means something else, tell S1, S3 and S4 before they start coding.
