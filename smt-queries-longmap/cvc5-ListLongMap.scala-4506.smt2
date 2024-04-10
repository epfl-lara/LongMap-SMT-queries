; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62504 () Bool)

(assert start!62504)

(declare-fun b!703810 () Bool)

(declare-fun res!467630 () Bool)

(declare-fun e!397651 () Bool)

(assert (=> b!703810 (=> (not res!467630) (not e!397651))))

(declare-datatypes ((List!13289 0))(
  ( (Nil!13286) (Cons!13285 (h!14330 (_ BitVec 64)) (t!19571 List!13289)) )
))
(declare-fun acc!652 () List!13289)

(declare-fun noDuplicate!1113 (List!13289) Bool)

(assert (=> b!703810 (= res!467630 (noDuplicate!1113 acc!652))))

(declare-fun b!703811 () Bool)

(declare-fun res!467633 () Bool)

(assert (=> b!703811 (=> (not res!467633) (not e!397651))))

(declare-datatypes ((array!40183 0))(
  ( (array!40184 (arr!19248 (Array (_ BitVec 32) (_ BitVec 64))) (size!19633 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40183)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40183 (_ BitVec 32) List!13289) Bool)

(assert (=> b!703811 (= res!467633 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703812 () Bool)

(declare-fun res!467628 () Bool)

(assert (=> b!703812 (=> (not res!467628) (not e!397651))))

(declare-fun newAcc!49 () List!13289)

(declare-fun subseq!311 (List!13289 List!13289) Bool)

(assert (=> b!703812 (= res!467628 (subseq!311 acc!652 newAcc!49))))

(declare-fun b!703813 () Bool)

(declare-fun res!467624 () Bool)

(assert (=> b!703813 (=> (not res!467624) (not e!397651))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703813 (= res!467624 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703814 () Bool)

(assert (=> b!703814 (= e!397651 false)))

(declare-fun lt!317808 () Bool)

(assert (=> b!703814 (= lt!317808 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703815 () Bool)

(declare-fun res!467634 () Bool)

(assert (=> b!703815 (=> (not res!467634) (not e!397651))))

(declare-fun contains!3866 (List!13289 (_ BitVec 64)) Bool)

(assert (=> b!703815 (= res!467634 (not (contains!3866 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703816 () Bool)

(declare-fun res!467629 () Bool)

(assert (=> b!703816 (=> (not res!467629) (not e!397651))))

(assert (=> b!703816 (= res!467629 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703817 () Bool)

(declare-fun res!467632 () Bool)

(assert (=> b!703817 (=> (not res!467632) (not e!397651))))

(assert (=> b!703817 (= res!467632 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703818 () Bool)

(declare-fun res!467635 () Bool)

(assert (=> b!703818 (=> (not res!467635) (not e!397651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703818 (= res!467635 (not (validKeyInArray!0 (select (arr!19248 a!3591) from!2969))))))

(declare-fun b!703819 () Bool)

(declare-fun res!467636 () Bool)

(assert (=> b!703819 (=> (not res!467636) (not e!397651))))

(declare-fun -!276 (List!13289 (_ BitVec 64)) List!13289)

(assert (=> b!703819 (= res!467636 (= (-!276 newAcc!49 k!2824) acc!652))))

(declare-fun b!703820 () Bool)

(declare-fun res!467626 () Bool)

(assert (=> b!703820 (=> (not res!467626) (not e!397651))))

(assert (=> b!703820 (= res!467626 (validKeyInArray!0 k!2824))))

(declare-fun b!703821 () Bool)

(declare-fun res!467622 () Bool)

(assert (=> b!703821 (=> (not res!467622) (not e!397651))))

(assert (=> b!703821 (= res!467622 (not (contains!3866 acc!652 k!2824)))))

(declare-fun b!703822 () Bool)

(declare-fun res!467621 () Bool)

(assert (=> b!703822 (=> (not res!467621) (not e!397651))))

(assert (=> b!703822 (= res!467621 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19633 a!3591)))))

(declare-fun res!467625 () Bool)

(assert (=> start!62504 (=> (not res!467625) (not e!397651))))

(assert (=> start!62504 (= res!467625 (and (bvslt (size!19633 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19633 a!3591))))))

(assert (=> start!62504 e!397651))

(assert (=> start!62504 true))

(declare-fun array_inv!15044 (array!40183) Bool)

(assert (=> start!62504 (array_inv!15044 a!3591)))

(declare-fun b!703823 () Bool)

(declare-fun res!467620 () Bool)

(assert (=> b!703823 (=> (not res!467620) (not e!397651))))

(assert (=> b!703823 (= res!467620 (noDuplicate!1113 newAcc!49))))

(declare-fun b!703824 () Bool)

(declare-fun res!467631 () Bool)

(assert (=> b!703824 (=> (not res!467631) (not e!397651))))

(assert (=> b!703824 (= res!467631 (contains!3866 newAcc!49 k!2824))))

(declare-fun b!703825 () Bool)

(declare-fun res!467623 () Bool)

(assert (=> b!703825 (=> (not res!467623) (not e!397651))))

(assert (=> b!703825 (= res!467623 (not (contains!3866 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703826 () Bool)

(declare-fun res!467627 () Bool)

(assert (=> b!703826 (=> (not res!467627) (not e!397651))))

(assert (=> b!703826 (= res!467627 (not (contains!3866 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703827 () Bool)

(declare-fun res!467637 () Bool)

(assert (=> b!703827 (=> (not res!467637) (not e!397651))))

(assert (=> b!703827 (= res!467637 (not (contains!3866 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62504 res!467625) b!703810))

(assert (= (and b!703810 res!467630) b!703823))

(assert (= (and b!703823 res!467620) b!703826))

(assert (= (and b!703826 res!467627) b!703815))

(assert (= (and b!703815 res!467634) b!703817))

(assert (= (and b!703817 res!467632) b!703821))

(assert (= (and b!703821 res!467622) b!703820))

(assert (= (and b!703820 res!467626) b!703811))

(assert (= (and b!703811 res!467633) b!703812))

(assert (= (and b!703812 res!467628) b!703824))

(assert (= (and b!703824 res!467631) b!703819))

(assert (= (and b!703819 res!467636) b!703827))

(assert (= (and b!703827 res!467637) b!703825))

(assert (= (and b!703825 res!467623) b!703822))

(assert (= (and b!703822 res!467621) b!703818))

(assert (= (and b!703818 res!467635) b!703816))

(assert (= (and b!703816 res!467629) b!703813))

(assert (= (and b!703813 res!467624) b!703814))

(declare-fun m!662515 () Bool)

(assert (=> b!703818 m!662515))

(assert (=> b!703818 m!662515))

(declare-fun m!662517 () Bool)

(assert (=> b!703818 m!662517))

(declare-fun m!662519 () Bool)

(assert (=> b!703825 m!662519))

(declare-fun m!662521 () Bool)

(assert (=> start!62504 m!662521))

(declare-fun m!662523 () Bool)

(assert (=> b!703815 m!662523))

(declare-fun m!662525 () Bool)

(assert (=> b!703810 m!662525))

(declare-fun m!662527 () Bool)

(assert (=> b!703827 m!662527))

(declare-fun m!662529 () Bool)

(assert (=> b!703811 m!662529))

(declare-fun m!662531 () Bool)

(assert (=> b!703819 m!662531))

(declare-fun m!662533 () Bool)

(assert (=> b!703812 m!662533))

(declare-fun m!662535 () Bool)

(assert (=> b!703823 m!662535))

(declare-fun m!662537 () Bool)

(assert (=> b!703821 m!662537))

(declare-fun m!662539 () Bool)

(assert (=> b!703817 m!662539))

(declare-fun m!662541 () Bool)

(assert (=> b!703826 m!662541))

(declare-fun m!662543 () Bool)

(assert (=> b!703814 m!662543))

(declare-fun m!662545 () Bool)

(assert (=> b!703813 m!662545))

(declare-fun m!662547 () Bool)

(assert (=> b!703824 m!662547))

(declare-fun m!662549 () Bool)

(assert (=> b!703820 m!662549))

(push 1)

(assert (not b!703819))

(assert (not b!703825))

(assert (not b!703826))

(assert (not b!703820))

(assert (not start!62504))

(assert (not b!703815))

(assert (not b!703817))

(assert (not b!703812))

(assert (not b!703823))

(assert (not b!703810))

(assert (not b!703827))

(assert (not b!703811))

(assert (not b!703824))

(assert (not b!703813))

(assert (not b!703821))

(assert (not b!703814))

(assert (not b!703818))

(check-sat)

