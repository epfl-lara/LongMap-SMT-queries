; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63518 () Bool)

(assert start!63518)

(declare-fun b!715622 () Bool)

(declare-fun res!478607 () Bool)

(declare-fun e!401884 () Bool)

(assert (=> b!715622 (=> (not res!478607) (not e!401884))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!715622 (= res!478607 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715623 () Bool)

(declare-fun res!478603 () Bool)

(assert (=> b!715623 (=> (not res!478603) (not e!401884))))

(declare-datatypes ((array!40532 0))(
  ( (array!40533 (arr!19403 (Array (_ BitVec 32) (_ BitVec 64))) (size!19819 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40532)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715623 (= res!478603 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715624 () Bool)

(declare-fun res!478597 () Bool)

(assert (=> b!715624 (=> (not res!478597) (not e!401884))))

(declare-datatypes ((List!13444 0))(
  ( (Nil!13441) (Cons!13440 (h!14485 (_ BitVec 64)) (t!19759 List!13444)) )
))
(declare-fun newAcc!49 () List!13444)

(declare-fun contains!4021 (List!13444 (_ BitVec 64)) Bool)

(assert (=> b!715624 (= res!478597 (not (contains!4021 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715625 () Bool)

(declare-fun res!478609 () Bool)

(assert (=> b!715625 (=> (not res!478609) (not e!401884))))

(declare-fun noDuplicate!1268 (List!13444) Bool)

(assert (=> b!715625 (= res!478609 (noDuplicate!1268 newAcc!49))))

(declare-fun b!715626 () Bool)

(declare-fun res!478601 () Bool)

(assert (=> b!715626 (=> (not res!478601) (not e!401884))))

(declare-fun acc!652 () List!13444)

(assert (=> b!715626 (= res!478601 (not (contains!4021 acc!652 k!2824)))))

(declare-fun res!478605 () Bool)

(assert (=> start!63518 (=> (not res!478605) (not e!401884))))

(assert (=> start!63518 (= res!478605 (and (bvslt (size!19819 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19819 a!3591))))))

(assert (=> start!63518 e!401884))

(assert (=> start!63518 true))

(declare-fun array_inv!15199 (array!40532) Bool)

(assert (=> start!63518 (array_inv!15199 a!3591)))

(declare-fun b!715627 () Bool)

(declare-fun res!478604 () Bool)

(assert (=> b!715627 (=> (not res!478604) (not e!401884))))

(assert (=> b!715627 (= res!478604 (not (contains!4021 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715628 () Bool)

(declare-fun res!478598 () Bool)

(assert (=> b!715628 (=> (not res!478598) (not e!401884))))

(assert (=> b!715628 (= res!478598 (contains!4021 newAcc!49 k!2824))))

(declare-fun b!715629 () Bool)

(declare-fun res!478606 () Bool)

(assert (=> b!715629 (=> (not res!478606) (not e!401884))))

(assert (=> b!715629 (= res!478606 (noDuplicate!1268 acc!652))))

(declare-fun b!715630 () Bool)

(declare-fun res!478600 () Bool)

(assert (=> b!715630 (=> (not res!478600) (not e!401884))))

(assert (=> b!715630 (= res!478600 (not (contains!4021 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715631 () Bool)

(declare-fun res!478596 () Bool)

(assert (=> b!715631 (=> (not res!478596) (not e!401884))))

(declare-fun arrayNoDuplicates!0 (array!40532 (_ BitVec 32) List!13444) Bool)

(assert (=> b!715631 (= res!478596 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715632 () Bool)

(declare-fun res!478595 () Bool)

(assert (=> b!715632 (=> (not res!478595) (not e!401884))))

(declare-fun -!431 (List!13444 (_ BitVec 64)) List!13444)

(assert (=> b!715632 (= res!478595 (= (-!431 newAcc!49 k!2824) acc!652))))

(declare-fun b!715633 () Bool)

(assert (=> b!715633 (= e!401884 false)))

(declare-fun lt!318851 () Bool)

(assert (=> b!715633 (= lt!318851 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715634 () Bool)

(declare-fun res!478608 () Bool)

(assert (=> b!715634 (=> (not res!478608) (not e!401884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715634 (= res!478608 (not (validKeyInArray!0 (select (arr!19403 a!3591) from!2969))))))

(declare-fun b!715635 () Bool)

(declare-fun res!478594 () Bool)

(assert (=> b!715635 (=> (not res!478594) (not e!401884))))

(assert (=> b!715635 (= res!478594 (not (contains!4021 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715636 () Bool)

(declare-fun res!478599 () Bool)

(assert (=> b!715636 (=> (not res!478599) (not e!401884))))

(assert (=> b!715636 (= res!478599 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19819 a!3591)))))

(declare-fun b!715637 () Bool)

(declare-fun res!478592 () Bool)

(assert (=> b!715637 (=> (not res!478592) (not e!401884))))

(assert (=> b!715637 (= res!478592 (validKeyInArray!0 k!2824))))

(declare-fun b!715638 () Bool)

(declare-fun res!478593 () Bool)

(assert (=> b!715638 (=> (not res!478593) (not e!401884))))

(declare-fun subseq!466 (List!13444 List!13444) Bool)

(assert (=> b!715638 (= res!478593 (subseq!466 acc!652 newAcc!49))))

(declare-fun b!715639 () Bool)

(declare-fun res!478602 () Bool)

(assert (=> b!715639 (=> (not res!478602) (not e!401884))))

(assert (=> b!715639 (= res!478602 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!63518 res!478605) b!715629))

(assert (= (and b!715629 res!478606) b!715625))

(assert (= (and b!715625 res!478609) b!715630))

(assert (= (and b!715630 res!478600) b!715627))

(assert (= (and b!715627 res!478604) b!715623))

(assert (= (and b!715623 res!478603) b!715626))

(assert (= (and b!715626 res!478601) b!715637))

(assert (= (and b!715637 res!478592) b!715631))

(assert (= (and b!715631 res!478596) b!715638))

(assert (= (and b!715638 res!478593) b!715628))

(assert (= (and b!715628 res!478598) b!715632))

(assert (= (and b!715632 res!478595) b!715624))

(assert (= (and b!715624 res!478597) b!715635))

(assert (= (and b!715635 res!478594) b!715636))

(assert (= (and b!715636 res!478599) b!715634))

(assert (= (and b!715634 res!478608) b!715622))

(assert (= (and b!715622 res!478607) b!715639))

(assert (= (and b!715639 res!478602) b!715633))

(declare-fun m!671803 () Bool)

(assert (=> b!715626 m!671803))

(declare-fun m!671805 () Bool)

(assert (=> b!715637 m!671805))

(declare-fun m!671807 () Bool)

(assert (=> b!715628 m!671807))

(declare-fun m!671809 () Bool)

(assert (=> b!715624 m!671809))

(declare-fun m!671811 () Bool)

(assert (=> b!715632 m!671811))

(declare-fun m!671813 () Bool)

(assert (=> b!715629 m!671813))

(declare-fun m!671815 () Bool)

(assert (=> b!715634 m!671815))

(assert (=> b!715634 m!671815))

(declare-fun m!671817 () Bool)

(assert (=> b!715634 m!671817))

(declare-fun m!671819 () Bool)

(assert (=> b!715633 m!671819))

(declare-fun m!671821 () Bool)

(assert (=> b!715623 m!671821))

(declare-fun m!671823 () Bool)

(assert (=> b!715630 m!671823))

(declare-fun m!671825 () Bool)

(assert (=> b!715635 m!671825))

(declare-fun m!671827 () Bool)

(assert (=> b!715627 m!671827))

(declare-fun m!671829 () Bool)

(assert (=> b!715631 m!671829))

(declare-fun m!671831 () Bool)

(assert (=> start!63518 m!671831))

(declare-fun m!671833 () Bool)

(assert (=> b!715638 m!671833))

(declare-fun m!671835 () Bool)

(assert (=> b!715639 m!671835))

(declare-fun m!671837 () Bool)

(assert (=> b!715625 m!671837))

(push 1)

(assert (not b!715638))

(assert (not b!715630))

(assert (not b!715626))

(assert (not b!715629))

(assert (not b!715639))

(assert (not start!63518))

(assert (not b!715624))

(assert (not b!715637))

(assert (not b!715633))

(assert (not b!715632))

(assert (not b!715635))

(assert (not b!715631))

(assert (not b!715623))

(assert (not b!715627))

(assert (not b!715634))

(assert (not b!715625))

(assert (not b!715628))

(check-sat)

