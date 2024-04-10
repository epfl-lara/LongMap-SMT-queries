; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61690 () Bool)

(assert start!61690)

(declare-fun b!690177 () Bool)

(declare-fun e!393003 () Bool)

(declare-datatypes ((List!13083 0))(
  ( (Nil!13080) (Cons!13079 (h!14124 (_ BitVec 64)) (t!19350 List!13083)) )
))
(declare-fun acc!681 () List!13083)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3660 (List!13083 (_ BitVec 64)) Bool)

(assert (=> b!690177 (= e!393003 (contains!3660 acc!681 k0!2843))))

(declare-fun b!690178 () Bool)

(declare-fun res!454587 () Bool)

(declare-fun e!393006 () Bool)

(assert (=> b!690178 (=> (not res!454587) (not e!393006))))

(assert (=> b!690178 (= res!454587 (not (contains!3660 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!454583 () Bool)

(assert (=> start!61690 (=> (not res!454583) (not e!393006))))

(declare-datatypes ((array!39744 0))(
  ( (array!39745 (arr!19042 (Array (_ BitVec 32) (_ BitVec 64))) (size!19427 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39744)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61690 (= res!454583 (and (bvslt (size!19427 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19427 a!3626))))))

(assert (=> start!61690 e!393006))

(assert (=> start!61690 true))

(declare-fun array_inv!14838 (array!39744) Bool)

(assert (=> start!61690 (array_inv!14838 a!3626)))

(declare-fun b!690179 () Bool)

(declare-fun e!393004 () Bool)

(declare-fun e!393005 () Bool)

(assert (=> b!690179 (= e!393004 e!393005)))

(declare-fun res!454589 () Bool)

(assert (=> b!690179 (=> (not res!454589) (not e!393005))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690179 (= res!454589 (bvsle from!3004 i!1382))))

(declare-fun b!690180 () Bool)

(declare-fun res!454584 () Bool)

(assert (=> b!690180 (=> (not res!454584) (not e!393006))))

(declare-fun noDuplicate!907 (List!13083) Bool)

(assert (=> b!690180 (= res!454584 (noDuplicate!907 acc!681))))

(declare-fun b!690181 () Bool)

(assert (=> b!690181 (= e!393006 false)))

(declare-fun lt!316411 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39744 (_ BitVec 32) List!13083) Bool)

(assert (=> b!690181 (= lt!316411 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690182 () Bool)

(declare-fun res!454582 () Bool)

(assert (=> b!690182 (=> (not res!454582) (not e!393006))))

(assert (=> b!690182 (= res!454582 e!393004)))

(declare-fun res!454586 () Bool)

(assert (=> b!690182 (=> res!454586 e!393004)))

(assert (=> b!690182 (= res!454586 e!393003)))

(declare-fun res!454585 () Bool)

(assert (=> b!690182 (=> (not res!454585) (not e!393003))))

(assert (=> b!690182 (= res!454585 (bvsgt from!3004 i!1382))))

(declare-fun b!690183 () Bool)

(assert (=> b!690183 (= e!393005 (not (contains!3660 acc!681 k0!2843)))))

(declare-fun b!690184 () Bool)

(declare-fun res!454581 () Bool)

(assert (=> b!690184 (=> (not res!454581) (not e!393006))))

(assert (=> b!690184 (= res!454581 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13080))))

(declare-fun b!690185 () Bool)

(declare-fun res!454588 () Bool)

(assert (=> b!690185 (=> (not res!454588) (not e!393006))))

(assert (=> b!690185 (= res!454588 (not (contains!3660 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61690 res!454583) b!690180))

(assert (= (and b!690180 res!454584) b!690178))

(assert (= (and b!690178 res!454587) b!690185))

(assert (= (and b!690185 res!454588) b!690182))

(assert (= (and b!690182 res!454585) b!690177))

(assert (= (and b!690182 (not res!454586)) b!690179))

(assert (= (and b!690179 res!454589) b!690183))

(assert (= (and b!690182 res!454582) b!690184))

(assert (= (and b!690184 res!454581) b!690181))

(declare-fun m!653797 () Bool)

(assert (=> b!690183 m!653797))

(assert (=> b!690177 m!653797))

(declare-fun m!653799 () Bool)

(assert (=> start!61690 m!653799))

(declare-fun m!653801 () Bool)

(assert (=> b!690184 m!653801))

(declare-fun m!653803 () Bool)

(assert (=> b!690185 m!653803))

(declare-fun m!653805 () Bool)

(assert (=> b!690178 m!653805))

(declare-fun m!653807 () Bool)

(assert (=> b!690180 m!653807))

(declare-fun m!653809 () Bool)

(assert (=> b!690181 m!653809))

(check-sat (not b!690180) (not b!690183) (not b!690184) (not b!690178) (not b!690177) (not b!690181) (not start!61690) (not b!690185))
