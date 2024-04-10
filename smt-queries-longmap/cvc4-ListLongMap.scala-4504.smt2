; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62496 () Bool)

(assert start!62496)

(declare-fun b!703594 () Bool)

(declare-fun res!467418 () Bool)

(declare-fun e!397626 () Bool)

(assert (=> b!703594 (=> (not res!467418) (not e!397626))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703594 (= res!467418 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703595 () Bool)

(declare-fun res!467417 () Bool)

(assert (=> b!703595 (=> (not res!467417) (not e!397626))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703595 (= res!467417 (validKeyInArray!0 k!2824))))

(declare-fun b!703596 () Bool)

(declare-fun res!467414 () Bool)

(assert (=> b!703596 (=> (not res!467414) (not e!397626))))

(declare-datatypes ((List!13285 0))(
  ( (Nil!13282) (Cons!13281 (h!14326 (_ BitVec 64)) (t!19567 List!13285)) )
))
(declare-fun acc!652 () List!13285)

(declare-fun contains!3862 (List!13285 (_ BitVec 64)) Bool)

(assert (=> b!703596 (= res!467414 (not (contains!3862 acc!652 k!2824)))))

(declare-fun res!467412 () Bool)

(assert (=> start!62496 (=> (not res!467412) (not e!397626))))

(declare-datatypes ((array!40175 0))(
  ( (array!40176 (arr!19244 (Array (_ BitVec 32) (_ BitVec 64))) (size!19629 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40175)

(assert (=> start!62496 (= res!467412 (and (bvslt (size!19629 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19629 a!3591))))))

(assert (=> start!62496 e!397626))

(assert (=> start!62496 true))

(declare-fun array_inv!15040 (array!40175) Bool)

(assert (=> start!62496 (array_inv!15040 a!3591)))

(declare-fun b!703597 () Bool)

(declare-fun res!467413 () Bool)

(assert (=> b!703597 (=> (not res!467413) (not e!397626))))

(declare-fun newAcc!49 () List!13285)

(assert (=> b!703597 (= res!467413 (contains!3862 newAcc!49 k!2824))))

(declare-fun b!703598 () Bool)

(declare-fun res!467415 () Bool)

(assert (=> b!703598 (=> (not res!467415) (not e!397626))))

(declare-fun subseq!307 (List!13285 List!13285) Bool)

(assert (=> b!703598 (= res!467415 (subseq!307 acc!652 newAcc!49))))

(declare-fun b!703599 () Bool)

(declare-fun res!467406 () Bool)

(assert (=> b!703599 (=> (not res!467406) (not e!397626))))

(assert (=> b!703599 (= res!467406 (not (contains!3862 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703600 () Bool)

(declare-fun res!467419 () Bool)

(assert (=> b!703600 (=> (not res!467419) (not e!397626))))

(declare-fun noDuplicate!1109 (List!13285) Bool)

(assert (=> b!703600 (= res!467419 (noDuplicate!1109 acc!652))))

(declare-fun b!703601 () Bool)

(assert (=> b!703601 (= e!397626 false)))

(declare-fun lt!317796 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40175 (_ BitVec 32) List!13285) Bool)

(assert (=> b!703601 (= lt!317796 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703602 () Bool)

(declare-fun res!467407 () Bool)

(assert (=> b!703602 (=> (not res!467407) (not e!397626))))

(assert (=> b!703602 (= res!467407 (not (contains!3862 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703603 () Bool)

(declare-fun res!467404 () Bool)

(assert (=> b!703603 (=> (not res!467404) (not e!397626))))

(assert (=> b!703603 (= res!467404 (noDuplicate!1109 newAcc!49))))

(declare-fun b!703604 () Bool)

(declare-fun res!467409 () Bool)

(assert (=> b!703604 (=> (not res!467409) (not e!397626))))

(assert (=> b!703604 (= res!467409 (not (contains!3862 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703605 () Bool)

(declare-fun res!467405 () Bool)

(assert (=> b!703605 (=> (not res!467405) (not e!397626))))

(declare-fun arrayContainsKey!0 (array!40175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703605 (= res!467405 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703606 () Bool)

(declare-fun res!467421 () Bool)

(assert (=> b!703606 (=> (not res!467421) (not e!397626))))

(declare-fun -!272 (List!13285 (_ BitVec 64)) List!13285)

(assert (=> b!703606 (= res!467421 (= (-!272 newAcc!49 k!2824) acc!652))))

(declare-fun b!703607 () Bool)

(declare-fun res!467420 () Bool)

(assert (=> b!703607 (=> (not res!467420) (not e!397626))))

(assert (=> b!703607 (= res!467420 (not (contains!3862 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703608 () Bool)

(declare-fun res!467416 () Bool)

(assert (=> b!703608 (=> (not res!467416) (not e!397626))))

(assert (=> b!703608 (= res!467416 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703609 () Bool)

(declare-fun res!467408 () Bool)

(assert (=> b!703609 (=> (not res!467408) (not e!397626))))

(assert (=> b!703609 (= res!467408 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703610 () Bool)

(declare-fun res!467411 () Bool)

(assert (=> b!703610 (=> (not res!467411) (not e!397626))))

(assert (=> b!703610 (= res!467411 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19629 a!3591)))))

(declare-fun b!703611 () Bool)

(declare-fun res!467410 () Bool)

(assert (=> b!703611 (=> (not res!467410) (not e!397626))))

(assert (=> b!703611 (= res!467410 (not (validKeyInArray!0 (select (arr!19244 a!3591) from!2969))))))

(assert (= (and start!62496 res!467412) b!703600))

(assert (= (and b!703600 res!467419) b!703603))

(assert (= (and b!703603 res!467404) b!703599))

(assert (= (and b!703599 res!467406) b!703607))

(assert (= (and b!703607 res!467420) b!703608))

(assert (= (and b!703608 res!467416) b!703596))

(assert (= (and b!703596 res!467414) b!703595))

(assert (= (and b!703595 res!467417) b!703609))

(assert (= (and b!703609 res!467408) b!703598))

(assert (= (and b!703598 res!467415) b!703597))

(assert (= (and b!703597 res!467413) b!703606))

(assert (= (and b!703606 res!467421) b!703604))

(assert (= (and b!703604 res!467409) b!703602))

(assert (= (and b!703602 res!467407) b!703610))

(assert (= (and b!703610 res!467411) b!703611))

(assert (= (and b!703611 res!467410) b!703594))

(assert (= (and b!703594 res!467418) b!703605))

(assert (= (and b!703605 res!467405) b!703601))

(declare-fun m!662371 () Bool)

(assert (=> b!703605 m!662371))

(declare-fun m!662373 () Bool)

(assert (=> b!703602 m!662373))

(declare-fun m!662375 () Bool)

(assert (=> b!703609 m!662375))

(declare-fun m!662377 () Bool)

(assert (=> start!62496 m!662377))

(declare-fun m!662379 () Bool)

(assert (=> b!703606 m!662379))

(declare-fun m!662381 () Bool)

(assert (=> b!703600 m!662381))

(declare-fun m!662383 () Bool)

(assert (=> b!703604 m!662383))

(declare-fun m!662385 () Bool)

(assert (=> b!703601 m!662385))

(declare-fun m!662387 () Bool)

(assert (=> b!703607 m!662387))

(declare-fun m!662389 () Bool)

(assert (=> b!703611 m!662389))

(assert (=> b!703611 m!662389))

(declare-fun m!662391 () Bool)

(assert (=> b!703611 m!662391))

(declare-fun m!662393 () Bool)

(assert (=> b!703603 m!662393))

(declare-fun m!662395 () Bool)

(assert (=> b!703597 m!662395))

(declare-fun m!662397 () Bool)

(assert (=> b!703599 m!662397))

(declare-fun m!662399 () Bool)

(assert (=> b!703608 m!662399))

(declare-fun m!662401 () Bool)

(assert (=> b!703598 m!662401))

(declare-fun m!662403 () Bool)

(assert (=> b!703595 m!662403))

(declare-fun m!662405 () Bool)

(assert (=> b!703596 m!662405))

(push 1)

(assert (not b!703608))

(assert (not b!703600))

(assert (not b!703605))

(assert (not b!703602))

(assert (not b!703596))

(assert (not b!703606))

(assert (not b!703604))

(assert (not b!703611))

(assert (not b!703598))

(assert (not b!703609))

(assert (not b!703603))

(assert (not start!62496))

(assert (not b!703597))

(assert (not b!703595))

(assert (not b!703599))

(assert (not b!703601))

(assert (not b!703607))

(check-sat)

