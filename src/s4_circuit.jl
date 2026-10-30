# Owner: S4: Task 4. RTD ‖ C in series with R, L and the source; THz choice of L and C; I(t) and U(t).
# Also owner of module, tests, report, setup.
# Methods: Crank-Nicolson (trapezoidal rule) for the ODEs, Z-transform stability analysis, shooting method for the limit cycle.
#
# TODO (S4)
# Circuit
#   [ ] equations: L dI/dt = Vin(t) − R·I − U ;  C dU/dt = I − I_RTD(U)
#   [ ] `thz_design(f, C)`: L = 1/((2πf)²C); table for f = 1, 1.5, 2 THz and C = 1 to 50 fF; justify C from device area (agree area with S2)
#   [ ] linearised model around the bias point: Jacobian [[−R/L, −1/L], [1/C, −G/C]], G = dI_RTD/dU < 0; criteria in docs/theory.md; choose R, L, C so that the circuit oscillates (note: R must be small, R < |G|·L/C)
#   [ ] bias point: solve I_RTD(U0) = (Vdc − U0)/R inside the NDC region (Roots.jl)
# Solvers
#   [ ] own Crank-Nicolson solver (implicit trapezoidal rule, Newton iteration for the nonlinear I_RTD); compare with a library solver (OrdinaryDiffEq, Tsit5 / Rodas5)
#   [ ] Z-transform analysis: discrete map uⁿ⁺¹ = (I − hA/2)⁻¹(I + hA/2) uⁿ; poles z of the linearised system, |z| > 1 means growth; compare with the Jacobian criterion
#   [ ] shooting method for the limit cycle: find u(0) and period T with u(T) = u(0); compare the frequency with 1/(2π√(LC))
#   [ ] optional: Galerkin (harmonic balance) with a few Fourier modes for the cycle amplitude, compare with shooting
# Results
#   [ ] first run with S2's `mock_I_rtd`, then with the real `I_rtd_interp`
#   [ ] I(t) and U(t) at f_target = 1.5 THz (also 1 and 2 THz): wave forms, phase portrait, FFT peak
#   [ ] scan R and source amplitude, find the oscillation threshold
#   [ ] figures and CSV → results/task4/
# Project
#   [ ] `scripts/run.jl`, `test/runtests.jl`: all testsets pass, `julia --project scripts/run.jl all` reproduces every figure
#   [ ] report section 5; merge sections 1 to 6 in report/report.md; commit Manifest.toml
#   [ ] check that the interface section in README.md stays correct

# L from the target resonance frequency f (Hz) and capacitance C (F)
thz_design(f, C) = 1 / ((2π * f)^2 * C)

rtd_circuit!(du, u, par, t)         = error("TODO S4")   # u = [I, U]
solve_circuit(par, u0, tspan)       = error("TODO S4")
cn_solve(par, u0, tspan, h)         = error("TODO S4")
limit_cycle_shooting(par, u0, T0)   = error("TODO S4")

main_task4() = error("TODO S4")
