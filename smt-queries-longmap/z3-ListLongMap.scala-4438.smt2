; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61752 () Bool)

(assert start!61752)

(declare-fun b!690455 () Bool)

(declare-fun res!454751 () Bool)

(declare-fun e!393175 () Bool)

(assert (=> b!690455 (=> (not res!454751) (not e!393175))))

(declare-datatypes ((List!12987 0))(
  ( (Nil!12984) (Cons!12983 (h!14031 (_ BitVec 64)) (t!19246 List!12987)) )
))
(declare-fun acc!681 () List!12987)

(declare-fun contains!3639 (List!12987 (_ BitVec 64)) Bool)

(assert (=> b!690455 (= res!454751 (not (contains!3639 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690456 () Bool)

(assert (=> b!690456 (= e!393175 false)))

(declare-datatypes ((array!39744 0))(
  ( (array!39745 (arr!19039 (Array (_ BitVec 32) (_ BitVec 64))) (size!19422 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39744)

(declare-fun lt!316519 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39744 (_ BitVec 32) List!12987) Bool)

(assert (=> b!690456 (= lt!316519 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690457 () Bool)

(declare-fun res!454752 () Bool)

(assert (=> b!690457 (=> (not res!454752) (not e!393175))))

(assert (=> b!690457 (= res!454752 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12984))))

(declare-fun b!690458 () Bool)

(declare-fun e!393176 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!690458 (= e!393176 (contains!3639 acc!681 k0!2843))))

(declare-fun b!690459 () Bool)

(declare-fun res!454753 () Bool)

(assert (=> b!690459 (=> (not res!454753) (not e!393175))))

(assert (=> b!690459 (= res!454753 (not (contains!3639 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690460 () Bool)

(declare-fun res!454754 () Bool)

(assert (=> b!690460 (=> (not res!454754) (not e!393175))))

(declare-fun e!393173 () Bool)

(assert (=> b!690460 (= res!454754 e!393173)))

(declare-fun res!454755 () Bool)

(assert (=> b!690460 (=> res!454755 e!393173)))

(assert (=> b!690460 (= res!454755 e!393176)))

(declare-fun res!454750 () Bool)

(assert (=> b!690460 (=> (not res!454750) (not e!393176))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690460 (= res!454750 (bvsgt from!3004 i!1382))))

(declare-fun b!690462 () Bool)

(declare-fun e!393174 () Bool)

(assert (=> b!690462 (= e!393174 (not (contains!3639 acc!681 k0!2843)))))

(declare-fun b!690463 () Bool)

(assert (=> b!690463 (= e!393173 e!393174)))

(declare-fun res!454748 () Bool)

(assert (=> b!690463 (=> (not res!454748) (not e!393174))))

(assert (=> b!690463 (= res!454748 (bvsle from!3004 i!1382))))

(declare-fun b!690461 () Bool)

(declare-fun res!454749 () Bool)

(assert (=> b!690461 (=> (not res!454749) (not e!393175))))

(declare-fun noDuplicate!913 (List!12987) Bool)

(assert (=> b!690461 (= res!454749 (noDuplicate!913 acc!681))))

(declare-fun res!454756 () Bool)

(assert (=> start!61752 (=> (not res!454756) (not e!393175))))

(assert (=> start!61752 (= res!454756 (and (bvslt (size!19422 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19422 a!3626))))))

(assert (=> start!61752 e!393175))

(assert (=> start!61752 true))

(declare-fun array_inv!14898 (array!39744) Bool)

(assert (=> start!61752 (array_inv!14898 a!3626)))

(assert (= (and start!61752 res!454756) b!690461))

(assert (= (and b!690461 res!454749) b!690459))

(assert (= (and b!690459 res!454753) b!690455))

(assert (= (and b!690455 res!454751) b!690460))

(assert (= (and b!690460 res!454750) b!690458))

(assert (= (and b!690460 (not res!454755)) b!690463))

(assert (= (and b!690463 res!454748) b!690462))

(assert (= (and b!690460 res!454754) b!690457))

(assert (= (and b!690457 res!454752) b!690456))

(declare-fun m!654523 () Bool)

(assert (=> b!690462 m!654523))

(declare-fun m!654525 () Bool)

(assert (=> start!61752 m!654525))

(declare-fun m!654527 () Bool)

(assert (=> b!690456 m!654527))

(declare-fun m!654529 () Bool)

(assert (=> b!690457 m!654529))

(declare-fun m!654531 () Bool)

(assert (=> b!690455 m!654531))

(declare-fun m!654533 () Bool)

(assert (=> b!690459 m!654533))

(declare-fun m!654535 () Bool)

(assert (=> b!690461 m!654535))

(assert (=> b!690458 m!654523))

(check-sat (not b!690455) (not b!690458) (not b!690462) (not b!690459) (not b!690457) (not b!690461) (not b!690456) (not start!61752))
(check-sat)
