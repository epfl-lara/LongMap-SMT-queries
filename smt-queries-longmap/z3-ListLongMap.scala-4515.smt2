; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62560 () Bool)

(assert start!62560)

(declare-fun b!705322 () Bool)

(declare-fun res!469148 () Bool)

(declare-fun e!397819 () Bool)

(assert (=> b!705322 (=> (not res!469148) (not e!397819))))

(declare-datatypes ((List!13317 0))(
  ( (Nil!13314) (Cons!13313 (h!14358 (_ BitVec 64)) (t!19599 List!13317)) )
))
(declare-fun acc!652 () List!13317)

(declare-fun contains!3894 (List!13317 (_ BitVec 64)) Bool)

(assert (=> b!705322 (= res!469148 (not (contains!3894 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705323 () Bool)

(declare-fun res!469137 () Bool)

(assert (=> b!705323 (=> (not res!469137) (not e!397819))))

(declare-datatypes ((array!40239 0))(
  ( (array!40240 (arr!19276 (Array (_ BitVec 32) (_ BitVec 64))) (size!19661 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40239)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705323 (= res!469137 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705324 () Bool)

(assert (=> b!705324 (= e!397819 false)))

(declare-fun lt!317892 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40239 (_ BitVec 32) List!13317) Bool)

(assert (=> b!705324 (= lt!317892 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705325 () Bool)

(declare-fun res!469139 () Bool)

(assert (=> b!705325 (=> (not res!469139) (not e!397819))))

(assert (=> b!705325 (= res!469139 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705326 () Bool)

(declare-fun res!469142 () Bool)

(assert (=> b!705326 (=> (not res!469142) (not e!397819))))

(declare-fun noDuplicate!1141 (List!13317) Bool)

(assert (=> b!705326 (= res!469142 (noDuplicate!1141 acc!652))))

(declare-fun b!705327 () Bool)

(declare-fun res!469133 () Bool)

(assert (=> b!705327 (=> (not res!469133) (not e!397819))))

(declare-fun newAcc!49 () List!13317)

(declare-fun subseq!339 (List!13317 List!13317) Bool)

(assert (=> b!705327 (= res!469133 (subseq!339 acc!652 newAcc!49))))

(declare-fun b!705328 () Bool)

(declare-fun res!469149 () Bool)

(assert (=> b!705328 (=> (not res!469149) (not e!397819))))

(assert (=> b!705328 (= res!469149 (noDuplicate!1141 newAcc!49))))

(declare-fun b!705330 () Bool)

(declare-fun res!469132 () Bool)

(assert (=> b!705330 (=> (not res!469132) (not e!397819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705330 (= res!469132 (not (validKeyInArray!0 (select (arr!19276 a!3591) from!2969))))))

(declare-fun b!705331 () Bool)

(declare-fun res!469135 () Bool)

(assert (=> b!705331 (=> (not res!469135) (not e!397819))))

(assert (=> b!705331 (= res!469135 (not (contains!3894 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705332 () Bool)

(declare-fun res!469134 () Bool)

(assert (=> b!705332 (=> (not res!469134) (not e!397819))))

(declare-fun -!304 (List!13317 (_ BitVec 64)) List!13317)

(assert (=> b!705332 (= res!469134 (= (-!304 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705333 () Bool)

(declare-fun res!469145 () Bool)

(assert (=> b!705333 (=> (not res!469145) (not e!397819))))

(assert (=> b!705333 (= res!469145 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19661 a!3591)))))

(declare-fun b!705334 () Bool)

(declare-fun res!469138 () Bool)

(assert (=> b!705334 (=> (not res!469138) (not e!397819))))

(assert (=> b!705334 (= res!469138 (contains!3894 newAcc!49 k0!2824))))

(declare-fun b!705335 () Bool)

(declare-fun res!469146 () Bool)

(assert (=> b!705335 (=> (not res!469146) (not e!397819))))

(assert (=> b!705335 (= res!469146 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!469141 () Bool)

(assert (=> start!62560 (=> (not res!469141) (not e!397819))))

(assert (=> start!62560 (= res!469141 (and (bvslt (size!19661 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19661 a!3591))))))

(assert (=> start!62560 e!397819))

(assert (=> start!62560 true))

(declare-fun array_inv!15072 (array!40239) Bool)

(assert (=> start!62560 (array_inv!15072 a!3591)))

(declare-fun b!705329 () Bool)

(declare-fun res!469143 () Bool)

(assert (=> b!705329 (=> (not res!469143) (not e!397819))))

(assert (=> b!705329 (= res!469143 (not (contains!3894 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705336 () Bool)

(declare-fun res!469147 () Bool)

(assert (=> b!705336 (=> (not res!469147) (not e!397819))))

(assert (=> b!705336 (= res!469147 (not (contains!3894 acc!652 k0!2824)))))

(declare-fun b!705337 () Bool)

(declare-fun res!469140 () Bool)

(assert (=> b!705337 (=> (not res!469140) (not e!397819))))

(assert (=> b!705337 (= res!469140 (validKeyInArray!0 k0!2824))))

(declare-fun b!705338 () Bool)

(declare-fun res!469144 () Bool)

(assert (=> b!705338 (=> (not res!469144) (not e!397819))))

(assert (=> b!705338 (= res!469144 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705339 () Bool)

(declare-fun res!469136 () Bool)

(assert (=> b!705339 (=> (not res!469136) (not e!397819))))

(assert (=> b!705339 (= res!469136 (not (contains!3894 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62560 res!469141) b!705326))

(assert (= (and b!705326 res!469142) b!705328))

(assert (= (and b!705328 res!469149) b!705331))

(assert (= (and b!705331 res!469135) b!705322))

(assert (= (and b!705322 res!469148) b!705338))

(assert (= (and b!705338 res!469144) b!705336))

(assert (= (and b!705336 res!469147) b!705337))

(assert (= (and b!705337 res!469140) b!705335))

(assert (= (and b!705335 res!469146) b!705327))

(assert (= (and b!705327 res!469133) b!705334))

(assert (= (and b!705334 res!469138) b!705332))

(assert (= (and b!705332 res!469134) b!705329))

(assert (= (and b!705329 res!469143) b!705339))

(assert (= (and b!705339 res!469136) b!705333))

(assert (= (and b!705333 res!469145) b!705330))

(assert (= (and b!705330 res!469132) b!705325))

(assert (= (and b!705325 res!469139) b!705323))

(assert (= (and b!705323 res!469137) b!705324))

(declare-fun m!663523 () Bool)

(assert (=> b!705338 m!663523))

(declare-fun m!663525 () Bool)

(assert (=> b!705326 m!663525))

(declare-fun m!663527 () Bool)

(assert (=> b!705328 m!663527))

(declare-fun m!663529 () Bool)

(assert (=> b!705335 m!663529))

(declare-fun m!663531 () Bool)

(assert (=> b!705334 m!663531))

(declare-fun m!663533 () Bool)

(assert (=> b!705331 m!663533))

(declare-fun m!663535 () Bool)

(assert (=> b!705327 m!663535))

(declare-fun m!663537 () Bool)

(assert (=> b!705339 m!663537))

(declare-fun m!663539 () Bool)

(assert (=> b!705323 m!663539))

(declare-fun m!663541 () Bool)

(assert (=> b!705324 m!663541))

(declare-fun m!663543 () Bool)

(assert (=> b!705336 m!663543))

(declare-fun m!663545 () Bool)

(assert (=> b!705329 m!663545))

(declare-fun m!663547 () Bool)

(assert (=> b!705332 m!663547))

(declare-fun m!663549 () Bool)

(assert (=> b!705330 m!663549))

(assert (=> b!705330 m!663549))

(declare-fun m!663551 () Bool)

(assert (=> b!705330 m!663551))

(declare-fun m!663553 () Bool)

(assert (=> b!705322 m!663553))

(declare-fun m!663555 () Bool)

(assert (=> start!62560 m!663555))

(declare-fun m!663557 () Bool)

(assert (=> b!705337 m!663557))

(check-sat (not b!705322) (not b!705323) (not b!705330) (not start!62560) (not b!705337) (not b!705324) (not b!705327) (not b!705335) (not b!705328) (not b!705332) (not b!705331) (not b!705336) (not b!705338) (not b!705326) (not b!705329) (not b!705334) (not b!705339))
(check-sat)
