# Each student fills in their own testset. S4 checks that `] test` passes before every merge.
using Test
using RTD

@testset "S1 quantum" begin
    # TODO (S1): infinite-well limit, T ≤ 1, T → 1 without barriers, Γ > 0, methods agree
end

@testset "S2 transport" begin
    # TODO (S2): I(0) = 0, I ≥ 0 for U > 0, NDC found on RTD.mock_I_rtd at the known place
    @test RTD.mock_I_rtd(0.0) == 0.0
end

@testset "S3 time dependence" begin
    # TODO (S3): norm conservation without absorber, free-packet speed, static limit, |z| = 1
end

@testset "S4 circuit" begin
    # TODO (S4): linear RLC against the analytic solution, CN against library solver, thz_design round trip
    f = 1.5e12; C = 10e-15
    @test 1 / (2π * sqrt(RTD.thz_design(f, C) * C)) ≈ f
end
