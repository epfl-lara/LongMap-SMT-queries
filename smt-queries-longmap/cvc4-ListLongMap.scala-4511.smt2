; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62538 () Bool)

(assert start!62538)

(declare-fun b!704728 () Bool)

(declare-fun res!468540 () Bool)

(declare-fun e!397753 () Bool)

(assert (=> b!704728 (=> (not res!468540) (not e!397753))))

(declare-datatypes ((array!40217 0))(
  ( (array!40218 (arr!19265 (Array (_ BitVec 32) (_ BitVec 64))) (size!19650 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40217)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13306 0))(
  ( (Nil!13303) (Cons!13302 (h!14347 (_ BitVec 64)) (t!19588 List!13306)) )
))
(declare-fun acc!652 () List!13306)

(declare-fun arrayNoDuplicates!0 (array!40217 (_ BitVec 32) List!13306) Bool)

(assert (=> b!704728 (= res!468540 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704729 () Bool)

(declare-fun res!468552 () Bool)

(assert (=> b!704729 (=> (not res!468552) (not e!397753))))

(declare-fun noDuplicate!1130 (List!13306) Bool)

(assert (=> b!704729 (= res!468552 (noDuplicate!1130 acc!652))))

(declare-fun b!704730 () Bool)

(declare-fun res!468546 () Bool)

(assert (=> b!704730 (=> (not res!468546) (not e!397753))))

(declare-fun newAcc!49 () List!13306)

(assert (=> b!704730 (= res!468546 (noDuplicate!1130 newAcc!49))))

(declare-fun b!704731 () Bool)

(declare-fun res!468554 () Bool)

(assert (=> b!704731 (=> (not res!468554) (not e!397753))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3883 (List!13306 (_ BitVec 64)) Bool)

(assert (=> b!704731 (= res!468554 (contains!3883 newAcc!49 k!2824))))

(declare-fun b!704733 () Bool)

(declare-fun res!468550 () Bool)

(assert (=> b!704733 (=> (not res!468550) (not e!397753))))

(assert (=> b!704733 (= res!468550 (not (contains!3883 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704734 () Bool)

(declare-fun res!468541 () Bool)

(assert (=> b!704734 (=> (not res!468541) (not e!397753))))

(assert (=> b!704734 (= res!468541 (not (contains!3883 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704735 () Bool)

(declare-fun res!468555 () Bool)

(assert (=> b!704735 (=> (not res!468555) (not e!397753))))

(declare-fun subseq!328 (List!13306 List!13306) Bool)

(assert (=> b!704735 (= res!468555 (subseq!328 acc!652 newAcc!49))))

(declare-fun b!704736 () Bool)

(declare-fun res!468538 () Bool)

(assert (=> b!704736 (=> (not res!468538) (not e!397753))))

(assert (=> b!704736 (= res!468538 (not (contains!3883 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704737 () Bool)

(assert (=> b!704737 (= e!397753 false)))

(declare-fun lt!317859 () Bool)

(assert (=> b!704737 (= lt!317859 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704738 () Bool)

(declare-fun res!468539 () Bool)

(assert (=> b!704738 (=> (not res!468539) (not e!397753))))

(declare-fun -!293 (List!13306 (_ BitVec 64)) List!13306)

(assert (=> b!704738 (= res!468539 (= (-!293 newAcc!49 k!2824) acc!652))))

(declare-fun b!704739 () Bool)

(declare-fun res!468543 () Bool)

(assert (=> b!704739 (=> (not res!468543) (not e!397753))))

(assert (=> b!704739 (= res!468543 (not (contains!3883 acc!652 k!2824)))))

(declare-fun b!704740 () Bool)

(declare-fun res!468545 () Bool)

(assert (=> b!704740 (=> (not res!468545) (not e!397753))))

(assert (=> b!704740 (= res!468545 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19650 a!3591)))))

(declare-fun b!704741 () Bool)

(declare-fun res!468549 () Bool)

(assert (=> b!704741 (=> (not res!468549) (not e!397753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704741 (= res!468549 (not (validKeyInArray!0 (select (arr!19265 a!3591) from!2969))))))

(declare-fun res!468553 () Bool)

(assert (=> start!62538 (=> (not res!468553) (not e!397753))))

(assert (=> start!62538 (= res!468553 (and (bvslt (size!19650 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19650 a!3591))))))

(assert (=> start!62538 e!397753))

(assert (=> start!62538 true))

(declare-fun array_inv!15061 (array!40217) Bool)

(assert (=> start!62538 (array_inv!15061 a!3591)))

(declare-fun b!704732 () Bool)

(declare-fun res!468544 () Bool)

(assert (=> b!704732 (=> (not res!468544) (not e!397753))))

(declare-fun arrayContainsKey!0 (array!40217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704732 (= res!468544 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704742 () Bool)

(declare-fun res!468542 () Bool)

(assert (=> b!704742 (=> (not res!468542) (not e!397753))))

(assert (=> b!704742 (= res!468542 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704743 () Bool)

(declare-fun res!468547 () Bool)

(assert (=> b!704743 (=> (not res!468547) (not e!397753))))

(assert (=> b!704743 (= res!468547 (validKeyInArray!0 k!2824))))

(declare-fun b!704744 () Bool)

(declare-fun res!468551 () Bool)

(assert (=> b!704744 (=> (not res!468551) (not e!397753))))

(assert (=> b!704744 (= res!468551 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704745 () Bool)

(declare-fun res!468548 () Bool)

(assert (=> b!704745 (=> (not res!468548) (not e!397753))))

(assert (=> b!704745 (= res!468548 (not (contains!3883 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62538 res!468553) b!704729))

(assert (= (and b!704729 res!468552) b!704730))

(assert (= (and b!704730 res!468546) b!704736))

(assert (= (and b!704736 res!468538) b!704733))

(assert (= (and b!704733 res!468550) b!704744))

(assert (= (and b!704744 res!468551) b!704739))

(assert (= (and b!704739 res!468543) b!704743))

(assert (= (and b!704743 res!468547) b!704728))

(assert (= (and b!704728 res!468540) b!704735))

(assert (= (and b!704735 res!468555) b!704731))

(assert (= (and b!704731 res!468554) b!704738))

(assert (= (and b!704738 res!468539) b!704745))

(assert (= (and b!704745 res!468548) b!704734))

(assert (= (and b!704734 res!468541) b!704740))

(assert (= (and b!704740 res!468545) b!704741))

(assert (= (and b!704741 res!468549) b!704742))

(assert (= (and b!704742 res!468542) b!704732))

(assert (= (and b!704732 res!468544) b!704737))

(declare-fun m!663127 () Bool)

(assert (=> b!704735 m!663127))

(declare-fun m!663129 () Bool)

(assert (=> b!704733 m!663129))

(declare-fun m!663131 () Bool)

(assert (=> b!704728 m!663131))

(declare-fun m!663133 () Bool)

(assert (=> b!704731 m!663133))

(declare-fun m!663135 () Bool)

(assert (=> b!704736 m!663135))

(declare-fun m!663137 () Bool)

(assert (=> b!704730 m!663137))

(declare-fun m!663139 () Bool)

(assert (=> b!704737 m!663139))

(declare-fun m!663141 () Bool)

(assert (=> b!704745 m!663141))

(declare-fun m!663143 () Bool)

(assert (=> start!62538 m!663143))

(declare-fun m!663145 () Bool)

(assert (=> b!704744 m!663145))

(declare-fun m!663147 () Bool)

(assert (=> b!704743 m!663147))

(declare-fun m!663149 () Bool)

(assert (=> b!704739 m!663149))

(declare-fun m!663151 () Bool)

(assert (=> b!704732 m!663151))

(declare-fun m!663153 () Bool)

(assert (=> b!704734 m!663153))

(declare-fun m!663155 () Bool)

(assert (=> b!704741 m!663155))

(assert (=> b!704741 m!663155))

(declare-fun m!663157 () Bool)

(assert (=> b!704741 m!663157))

(declare-fun m!663159 () Bool)

(assert (=> b!704738 m!663159))

(declare-fun m!663161 () Bool)

(assert (=> b!704729 m!663161))

(push 1)

(assert (not b!704737))

(assert (not b!704730))

(assert (not b!704744))

(assert (not b!704733))

(assert (not b!704741))

(assert (not b!704735))

(assert (not start!62538))

(assert (not b!704739))

(assert (not b!704731))

(assert (not b!704729))

(assert (not b!704734))

(assert (not b!704732))

(assert (not b!704738))

(assert (not b!704745))

(assert (not b!704728))

(assert (not b!704743))

(assert (not b!704736))

(check-sat)

(pop 1)

