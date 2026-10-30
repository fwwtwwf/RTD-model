# Owner: S2: Task 2. Bias potential, current-voltage characteristic, maximum of negative differential conductivity.
# Methods: method of weighted residuals (Galerkin) for the scattering problem, shooting method for T(E).
#
# TODO (S2)
# Setup
#   [ ] `mock_I_rtd(U)` is already below; check that it looks like an RTD and tell S4 it is ready
#   [ ] `bias_potential(x, p, U)`: linear drop across barrier-well-barrier, flat leads (agree the shape with S1)
#   [ ] decide and document where the emitter Fermi level sits at each bias
# Transmission under bias
#   [ ] T(E, U) by the shooting method: start with a pure transmitted wave on the right, integrate to the left, T = 1/|incident amplitude|²
#   [ ] T(E, U) by the Galerkin method (weighted residuals with hat functions and open boundary conditions); compare with shooting
#   [ ] check against S1's `transmission` at U = 0
# Current
#   [ ] Tsu-Esaki formula: derive the supply function and check the units
#   [ ] `current_density(U, p)`: integral over energy; the resonance is narrow, so refine the energy grid around the peak (use S1's E_r and Γ)
#   [ ] `iv_curve(p, U_grid)`: loop over bias, save CSV to results/task2/
# NDC
#   [ ] `find_ndc(U, I)`: dI/dU by finite differences, peak, valley, most negative slope (maximum of NDC), peak-to-valley ratio
#   [ ] compare the peak voltage with the 2·E_r/q estimate from S1
#   [ ] `I_rtd_interp(p)`: smooth spline for S4 (cover the full range used by the circuit), multiply by the device area (agree it with S4), report the recommended bias point in the NDC region and G_min
#   [ ] figures: I(U), dI/dU with the NDC window and maximum marked → results/task2/
# Tests and report
#   [ ] testset S2 in test/runtests.jl (I(0) = 0, I ≥ 0 for U > 0, NDC found on the mock curve at the known place)
#   [ ] report section 3 in report/report.md

# Mock N-shaped curve: peak 1 mA at 0.15 V, valley about 0.6 mA at 0.35 V (cubic, I' = 0 at 0.15 and 0.35 V)
function mock_I_rtd(U)
    c = 1e-3 / 0.010125
    return c * (0.1575 * U - 0.75 * U^2 + U^3)
end

bias_potential(x, p, U)           = error("TODO S2")
transmission_shooting(E, p, U)    = error("TODO S2")
transmission_galerkin(E, p, U)    = error("TODO S2")
current_density(U, p)             = error("TODO S2")
iv_curve(p, U_grid)               = error("TODO S2")
find_ndc(U, I)                    = error("TODO S2")   # -> (U_peak, U_valley, U_ndc, G_min)
I_rtd_interp(p)                   = error("TODO S2")

main_task2() = error("TODO S2")
