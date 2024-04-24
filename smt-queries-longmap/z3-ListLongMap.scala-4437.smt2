; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61746 () Bool)

(assert start!61746)

(declare-fun b!690374 () Bool)

(declare-fun res!454674 () Bool)

(declare-fun e!393128 () Bool)

(assert (=> b!690374 (=> (not res!454674) (not e!393128))))

(declare-datatypes ((List!12984 0))(
  ( (Nil!12981) (Cons!12980 (h!14028 (_ BitVec 64)) (t!19243 List!12984)) )
))
(declare-fun acc!681 () List!12984)

(declare-fun noDuplicate!910 (List!12984) Bool)

(assert (=> b!690374 (= res!454674 (noDuplicate!910 acc!681))))

(declare-fun b!690375 () Bool)

(declare-fun e!393131 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3636 (List!12984 (_ BitVec 64)) Bool)

(assert (=> b!690375 (= e!393131 (not (contains!3636 acc!681 k0!2843)))))

(declare-fun b!690376 () Bool)

(assert (=> b!690376 (= e!393128 false)))

(declare-fun lt!316510 () Bool)

(declare-datatypes ((array!39738 0))(
  ( (array!39739 (arr!19036 (Array (_ BitVec 32) (_ BitVec 64))) (size!19419 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39738)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39738 (_ BitVec 32) List!12984) Bool)

(assert (=> b!690376 (= lt!316510 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690377 () Bool)

(declare-fun e!393130 () Bool)

(assert (=> b!690377 (= e!393130 e!393131)))

(declare-fun res!454667 () Bool)

(assert (=> b!690377 (=> (not res!454667) (not e!393131))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690377 (= res!454667 (bvsle from!3004 i!1382))))

(declare-fun b!690379 () Bool)

(declare-fun e!393132 () Bool)

(assert (=> b!690379 (= e!393132 (contains!3636 acc!681 k0!2843))))

(declare-fun b!690380 () Bool)

(declare-fun res!454673 () Bool)

(assert (=> b!690380 (=> (not res!454673) (not e!393128))))

(assert (=> b!690380 (= res!454673 (not (contains!3636 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690381 () Bool)

(declare-fun res!454672 () Bool)

(assert (=> b!690381 (=> (not res!454672) (not e!393128))))

(assert (=> b!690381 (= res!454672 (not (contains!3636 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690382 () Bool)

(declare-fun res!454670 () Bool)

(assert (=> b!690382 (=> (not res!454670) (not e!393128))))

(assert (=> b!690382 (= res!454670 e!393130)))

(declare-fun res!454669 () Bool)

(assert (=> b!690382 (=> res!454669 e!393130)))

(assert (=> b!690382 (= res!454669 e!393132)))

(declare-fun res!454668 () Bool)

(assert (=> b!690382 (=> (not res!454668) (not e!393132))))

(assert (=> b!690382 (= res!454668 (bvsgt from!3004 i!1382))))

(declare-fun b!690378 () Bool)

(declare-fun res!454671 () Bool)

(assert (=> b!690378 (=> (not res!454671) (not e!393128))))

(assert (=> b!690378 (= res!454671 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12981))))

(declare-fun res!454675 () Bool)

(assert (=> start!61746 (=> (not res!454675) (not e!393128))))

(assert (=> start!61746 (= res!454675 (and (bvslt (size!19419 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19419 a!3626))))))

(assert (=> start!61746 e!393128))

(assert (=> start!61746 true))

(declare-fun array_inv!14895 (array!39738) Bool)

(assert (=> start!61746 (array_inv!14895 a!3626)))

(assert (= (and start!61746 res!454675) b!690374))

(assert (= (and b!690374 res!454674) b!690380))

(assert (= (and b!690380 res!454673) b!690381))

(assert (= (and b!690381 res!454672) b!690382))

(assert (= (and b!690382 res!454668) b!690379))

(assert (= (and b!690382 (not res!454669)) b!690377))

(assert (= (and b!690377 res!454667) b!690375))

(assert (= (and b!690382 res!454670) b!690378))

(assert (= (and b!690378 res!454671) b!690376))

(declare-fun m!654481 () Bool)

(assert (=> b!690380 m!654481))

(declare-fun m!654483 () Bool)

(assert (=> b!690375 m!654483))

(declare-fun m!654485 () Bool)

(assert (=> b!690374 m!654485))

(declare-fun m!654487 () Bool)

(assert (=> b!690376 m!654487))

(assert (=> b!690379 m!654483))

(declare-fun m!654489 () Bool)

(assert (=> b!690381 m!654489))

(declare-fun m!654491 () Bool)

(assert (=> start!61746 m!654491))

(declare-fun m!654493 () Bool)

(assert (=> b!690378 m!654493))

(check-sat (not b!690381) (not start!61746) (not b!690378) (not b!690374) (not b!690380) (not b!690376) (not b!690379) (not b!690375))
(check-sat)
