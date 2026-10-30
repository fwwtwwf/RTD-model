# Owner: S3: Task 3. Time-dependent potential φ_AC = V(t)·x/L, wave-packet propagation, output current.
# Methods: Crank-Nicolson scheme, ideally absorbing layer, complex potential, Z-transform.
#
# TODO (S3)
# Potential
#   [ ] V(t) generators: sine, step, ramp, smooth switch-on
#   [ ] `phi_ac(x, t, p, Vfun) = Vfun(t)·x/L_total`; fix the x origin and write it in docs/theory.md
#   [ ] clarify with the supervisor what "I_out is the parameter" means (output current amplitude or measured current) and write the decision at the top of this file
# Crank-Nicolson solver
#   [ ] `propagate(psi0, p, Vfun, t)`: (1 + iHΔt/2ħ) ψⁿ⁺¹ = (1 − iHΔt/2ħ) ψⁿ with sparse tridiagonal solves, H(t) = H0 + diag(φ_AC) at the midpoint time
#   [ ] ideally absorbing layer: complex potential −iW(x) at the lead ends; check that reflected norm stays below 1e-3 for the chosen W and thickness
#   [ ] initial state: wave packet at k_F (E = E_F) coming from the left
#   [ ] analysis by Z-transform: put ψⁿ = zⁿ ψ into the scheme, show |z| = 1 for real H (unitary, unconditionally stable) and |z| < 1 inside the absorbing layer; compare with numerical decay
#   [ ] tests: norm conservation without absorber, packet speed ħk/m*, static limit (constant V) agrees with S2's bias potential
#   [ ] convergence in Δt and dx
# Output current
#   [ ] `probability_current(psi, x, p)`: j = (ħ/m*) Im(ψ* ψ')
#   [ ] `current_out(psi_t, x, p)`: current at the right contact versus time; sum over several energies of the Fermi sea if needed
#   [ ] compare I_out(t) with the quasi-static I(V(t)) from S2 for slow driving
# Frequency response
#   [ ] `response_z(I_out, V, dt, omegas)`: Z-transform of the sampled signals, H(z) = I(z)/V(z) at z = exp(iωΔt), amplitude and phase versus frequency (0.1 to 5 THz)
#   [ ] short summary for S4: does the RTD follow the voltage instantly at 1-2 THz, which delay time (about ħ/Γ from S1)?
#   [ ] figures and CSV → results/task3/
# Tests and report
#   [ ] testset S3 in test/runtests.jl
#   [ ] report section 4 in report/report.md

phi_ac(x, t, p, Vfun) = error("TODO S3")
propagate(psi0, p, Vfun, t)     = error("TODO S3")
probability_current(psi, x, p)  = error("TODO S3")
current_out(psi_t, x, p)        = error("TODO S3")

# Z-transform of a sampled signal f[n] at the point z = exp(iωΔt)
ztransform(f, z) = sum(f[n+1] * z^(-n) for n in 0:length(f)-1)
response_z(I_out, V, dt, omegas) = [ztransform(I_out, exp(im*ω*dt)) / ztransform(V, exp(im*ω*dt)) for ω in omegas]

main_task3() = error("TODO S3")
