# Owner: S4. Run:  julia --project scripts/run.jl 1|2|3|4|all
# Each student implements main_taskN() in their own src file; this script only calls them.
#
# TODO (S4):
#   [ ] check that "all" runs the four tasks in order and every figure appears in results/
using RTD   # S4: make `using RTD` work (exports), or use RTD.main_task1() etc.

arg = isempty(ARGS) ? "all" : ARGS[1]
tasks = Dict("1" => RTD.main_task1, "2" => RTD.main_task2, "3" => RTD.main_task3, "4" => RTD.main_task4)
for k in (arg == "all" ? ["1", "2", "3", "4"] : [arg])
    @info "Running task $k"
    tasks[k]()
end
