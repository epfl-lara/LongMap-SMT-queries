; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61694 () Bool)

(assert start!61694)

(declare-fun b!690231 () Bool)

(declare-fun res!454642 () Bool)

(declare-fun e!393032 () Bool)

(assert (=> b!690231 (=> (not res!454642) (not e!393032))))

(declare-datatypes ((array!39748 0))(
  ( (array!39749 (arr!19044 (Array (_ BitVec 32) (_ BitVec 64))) (size!19429 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39748)

(declare-datatypes ((List!13085 0))(
  ( (Nil!13082) (Cons!13081 (h!14126 (_ BitVec 64)) (t!19352 List!13085)) )
))
(declare-fun arrayNoDuplicates!0 (array!39748 (_ BitVec 32) List!13085) Bool)

(assert (=> b!690231 (= res!454642 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13082))))

(declare-fun b!690232 () Bool)

(declare-fun e!393036 () Bool)

(declare-fun acc!681 () List!13085)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3662 (List!13085 (_ BitVec 64)) Bool)

(assert (=> b!690232 (= e!393036 (contains!3662 acc!681 k!2843))))

(declare-fun b!690233 () Bool)

(declare-fun e!393035 () Bool)

(assert (=> b!690233 (= e!393035 (not (contains!3662 acc!681 k!2843)))))

(declare-fun b!690234 () Bool)

(assert (=> b!690234 (= e!393032 false)))

(declare-fun lt!316417 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!690234 (= lt!316417 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690235 () Bool)

(declare-fun res!454640 () Bool)

(assert (=> b!690235 (=> (not res!454640) (not e!393032))))

(declare-fun e!393033 () Bool)

(assert (=> b!690235 (= res!454640 e!393033)))

(declare-fun res!454638 () Bool)

(assert (=> b!690235 (=> res!454638 e!393033)))

(assert (=> b!690235 (= res!454638 e!393036)))

(declare-fun res!454636 () Bool)

(assert (=> b!690235 (=> (not res!454636) (not e!393036))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690235 (= res!454636 (bvsgt from!3004 i!1382))))

(declare-fun b!690236 () Bool)

(declare-fun res!454643 () Bool)

(assert (=> b!690236 (=> (not res!454643) (not e!393032))))

(assert (=> b!690236 (= res!454643 (not (contains!3662 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!454639 () Bool)

(assert (=> start!61694 (=> (not res!454639) (not e!393032))))

(assert (=> start!61694 (= res!454639 (and (bvslt (size!19429 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19429 a!3626))))))

(assert (=> start!61694 e!393032))

(assert (=> start!61694 true))

(declare-fun array_inv!14840 (array!39748) Bool)

(assert (=> start!61694 (array_inv!14840 a!3626)))

(declare-fun b!690237 () Bool)

(declare-fun res!454637 () Bool)

(assert (=> b!690237 (=> (not res!454637) (not e!393032))))

(assert (=> b!690237 (= res!454637 (not (contains!3662 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690238 () Bool)

(declare-fun res!454635 () Bool)

(assert (=> b!690238 (=> (not res!454635) (not e!393032))))

(declare-fun noDuplicate!909 (List!13085) Bool)

(assert (=> b!690238 (= res!454635 (noDuplicate!909 acc!681))))

(declare-fun b!690239 () Bool)

(assert (=> b!690239 (= e!393033 e!393035)))

(declare-fun res!454641 () Bool)

(assert (=> b!690239 (=> (not res!454641) (not e!393035))))

(assert (=> b!690239 (= res!454641 (bvsle from!3004 i!1382))))

(assert (= (and start!61694 res!454639) b!690238))

(assert (= (and b!690238 res!454635) b!690237))

(assert (= (and b!690237 res!454637) b!690236))

(assert (= (and b!690236 res!454643) b!690235))

(assert (= (and b!690235 res!454636) b!690232))

(assert (= (and b!690235 (not res!454638)) b!690239))

(assert (= (and b!690239 res!454641) b!690233))

(assert (= (and b!690235 res!454640) b!690231))

(assert (= (and b!690231 res!454642) b!690234))

(declare-fun m!653825 () Bool)

(assert (=> b!690238 m!653825))

(declare-fun m!653827 () Bool)

(assert (=> b!690233 m!653827))

(declare-fun m!653829 () Bool)

(assert (=> b!690234 m!653829))

(assert (=> b!690232 m!653827))

(declare-fun m!653831 () Bool)

(assert (=> b!690237 m!653831))

(declare-fun m!653833 () Bool)

(assert (=> start!61694 m!653833))

(declare-fun m!653835 () Bool)

(assert (=> b!690236 m!653835))

(declare-fun m!653837 () Bool)

(assert (=> b!690231 m!653837))

(push 1)

(assert (not b!690238))

(assert (not b!690232))

(assert (not b!690236))

(assert (not b!690231))

(assert (not start!61694))

(assert (not b!690234))

(assert (not b!690233))

(assert (not b!690237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

