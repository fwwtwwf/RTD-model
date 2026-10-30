# Theory and methods (draft: owners extend their sections)

## Units
Quantum part: eV, nm, fs. Effective mass m* = 0.067 m0, so ħ²/(2m*) = 0.0380998/0.067 ≈ 0.569 eV·nm²; ħ = 0.658212 eV·fs. Circuit: V, A, ohm, H, F, s.

## Task 1 (S1): single electron
`−ħ²/(2m*) ψ'' + V(x) ψ = E ψ`, GaAs well, AlGaAs barriers (start: V_b = 0.3 eV, w_b = 2.5 nm, w_w = 4.5 nm, E_F ≈ 0.05 eV; state the choice).
Quasi-bound level = pole of the transmission at complex energy `E = E_r − iΓ`. Near the peak T(E) is a Lorentzian, so the **half-width at half height is Γ** and FWHM is 2Γ. Three ways to get it:
- **Shooting method**: integrate the equation from one end with an outgoing wave, vary complex E until the other end has an outgoing wave only.
- **Galerkin method**: ψ = Σ cⱼ φⱼ, weighted residuals with weights φᵢ give `H c = E S c`.
- **Complex potential / ideally absorbing layer**: add `−iW(x)` near the ends of the leads, so waves that leave the structure are absorbed; the eigenvalues of H become complex, Γ = −Im E.

## Task 2 (S2): bias and I–V
Potential drop linear across barrier-well-barrier. Tsu-Esaki:
`J(U) = (q m* k_B T)/(2π² ħ³) ∫ T(E,U) ln[(1 + exp((E_F − E)/k_BT)) / (1 + exp((E_F − E − qU)/k_BT))] dE`.
T(E,U) from the shooting method (start with the transmitted wave) and from the Galerkin method (weighted residuals), compared. NDC is the range where dI/dU < 0; the maximum of NDC is the most negative slope.

## Task 3 (S3): time-dependent potential
`φ_AC(x,t) = V(t)·x/L`, e.g. V(t) = V0 sin ωt. **Crank–Nicolson**: `(1 + iHΔt/2ħ) ψⁿ⁺¹ = (1 − iHΔt/2ħ) ψⁿ`. **Z-transform**: with ψⁿ = zⁿψ the scheme gives `z = (1 − iEΔt/2ħ)/(1 + iEΔt/2ħ)`, so |z| = 1 for real E (norm conserved, unconditionally stable) and |z| < 1 for the complex energies of the **absorbing layer**. The same transform applied to the sampled signals I_out[n] and V[n] gives the frequency response `H(z) = I(z)/V(z)` at `z = e^{iωΔt}`.

## Task 4 (S4): circuit
```
L dI/dt = V_in(t) − R I − U
C dU/dt = I − I_RTD(U)
```
f = 1/(2π√(LC)); e.g. f = 1.5 THz, C = 10 fF gives L ≈ 1.1 pH (characteristic impedance √(L/C) ≈ 10.6 Ω).
Linearisation at the bias point (G = dI_RTD/dU < 0) has Jacobian `[[−R/L, −1/L], [1/C, −G/C]]`. Trace = −R/L + |G|/C, determinant = (1 + R·G)/(LC). Small oscillations grow when `|G| > C·R/L` (that is R < |G|·L/C) and `R·|G| < 1`. With the numbers above and |G| ≈ 3 mS from the mock curve the first condition needs R below about 0.3 Ω, so R and C must be chosen with this in mind.
Methods: **Crank–Nicolson** (trapezoidal rule, implicit, Newton for the nonlinear term); **Z-transform**: poles of `uⁿ⁺¹ = (I − hA/2)⁻¹(I + hA/2) uⁿ` outside the unit circle mean growth (compare with the Jacobian criterion); **shooting method** for the limit cycle: find u(0) and period T with u(T) = u(0). Optional: **Galerkin** with a few Fourier modes (harmonic balance) as a cross-check of amplitude.
