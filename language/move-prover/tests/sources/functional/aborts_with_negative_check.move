// flag: --negative
module TestAbortsWithCheck {
    fun aborts_with_check_too_many_incorrect(x: u64, y: u64): u64 {
        if (x == 1) {
            abort 2
        };
        if (y == 2) {
            abort 3
        };
        x
    }
    spec fun aborts_with_check_too_many_incorrect {
        aborts_if x == 1 with 2;
        aborts_if y == 2 with 3;
        aborts_with [check] 2, 3, 4;
        ensures result == x;
    }
}
