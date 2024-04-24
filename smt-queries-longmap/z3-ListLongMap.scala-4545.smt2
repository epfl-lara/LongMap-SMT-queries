; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63406 () Bool)

(assert start!63406)

(declare-fun b!713665 () Bool)

(declare-fun res!476626 () Bool)

(declare-fun e!401420 () Bool)

(assert (=> b!713665 (=> (not res!476626) (not e!401420))))

(declare-datatypes ((List!13308 0))(
  ( (Nil!13305) (Cons!13304 (h!14352 (_ BitVec 64)) (t!19615 List!13308)) )
))
(declare-fun acc!652 () List!13308)

(declare-fun noDuplicate!1234 (List!13308) Bool)

(assert (=> b!713665 (= res!476626 (noDuplicate!1234 acc!652))))

(declare-fun b!713666 () Bool)

(declare-fun res!476629 () Bool)

(assert (=> b!713666 (=> (not res!476629) (not e!401420))))

(declare-fun newAcc!49 () List!13308)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!392 (List!13308 (_ BitVec 64)) List!13308)

(assert (=> b!713666 (= res!476629 (= (-!392 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713667 () Bool)

(declare-fun res!476637 () Bool)

(assert (=> b!713667 (=> (not res!476637) (not e!401420))))

(assert (=> b!713667 (= res!476637 (noDuplicate!1234 newAcc!49))))

(declare-fun b!713668 () Bool)

(declare-fun res!476641 () Bool)

(assert (=> b!713668 (=> (not res!476641) (not e!401420))))

(declare-fun contains!3960 (List!13308 (_ BitVec 64)) Bool)

(assert (=> b!713668 (= res!476641 (not (contains!3960 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713670 () Bool)

(declare-fun res!476631 () Bool)

(assert (=> b!713670 (=> (not res!476631) (not e!401420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713670 (= res!476631 (validKeyInArray!0 k0!2824))))

(declare-fun b!713671 () Bool)

(declare-fun res!476638 () Bool)

(assert (=> b!713671 (=> (not res!476638) (not e!401420))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40446 0))(
  ( (array!40447 (arr!19360 (Array (_ BitVec 32) (_ BitVec 64))) (size!19772 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40446)

(assert (=> b!713671 (= res!476638 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19772 a!3591)))))

(declare-fun b!713672 () Bool)

(declare-fun res!476630 () Bool)

(assert (=> b!713672 (=> (not res!476630) (not e!401420))))

(declare-fun subseq!428 (List!13308 List!13308) Bool)

(assert (=> b!713672 (= res!476630 (subseq!428 acc!652 newAcc!49))))

(declare-fun b!713673 () Bool)

(declare-fun res!476640 () Bool)

(assert (=> b!713673 (=> (not res!476640) (not e!401420))))

(assert (=> b!713673 (= res!476640 (not (contains!3960 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713674 () Bool)

(declare-fun res!476635 () Bool)

(assert (=> b!713674 (=> (not res!476635) (not e!401420))))

(declare-fun arrayNoDuplicates!0 (array!40446 (_ BitVec 32) List!13308) Bool)

(assert (=> b!713674 (= res!476635 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713675 () Bool)

(declare-fun res!476633 () Bool)

(assert (=> b!713675 (=> (not res!476633) (not e!401420))))

(assert (=> b!713675 (= res!476633 (not (contains!3960 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713676 () Bool)

(declare-fun res!476627 () Bool)

(assert (=> b!713676 (=> (not res!476627) (not e!401420))))

(assert (=> b!713676 (= res!476627 (not (contains!3960 acc!652 k0!2824)))))

(declare-fun b!713677 () Bool)

(declare-fun res!476634 () Bool)

(assert (=> b!713677 (=> (not res!476634) (not e!401420))))

(declare-fun arrayContainsKey!0 (array!40446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713677 (= res!476634 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713678 () Bool)

(declare-fun res!476639 () Bool)

(assert (=> b!713678 (=> (not res!476639) (not e!401420))))

(assert (=> b!713678 (= res!476639 (contains!3960 newAcc!49 k0!2824))))

(declare-fun b!713669 () Bool)

(assert (=> b!713669 (= e!401420 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!476628 () Bool)

(assert (=> start!63406 (=> (not res!476628) (not e!401420))))

(assert (=> start!63406 (= res!476628 (and (bvslt (size!19772 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19772 a!3591))))))

(assert (=> start!63406 e!401420))

(assert (=> start!63406 true))

(declare-fun array_inv!15219 (array!40446) Bool)

(assert (=> start!63406 (array_inv!15219 a!3591)))

(declare-fun b!713679 () Bool)

(declare-fun res!476636 () Bool)

(assert (=> b!713679 (=> (not res!476636) (not e!401420))))

(assert (=> b!713679 (= res!476636 (not (contains!3960 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713680 () Bool)

(declare-fun res!476632 () Bool)

(assert (=> b!713680 (=> (not res!476632) (not e!401420))))

(assert (=> b!713680 (= res!476632 (not (validKeyInArray!0 (select (arr!19360 a!3591) from!2969))))))

(assert (= (and start!63406 res!476628) b!713665))

(assert (= (and b!713665 res!476626) b!713667))

(assert (= (and b!713667 res!476637) b!713673))

(assert (= (and b!713673 res!476640) b!713668))

(assert (= (and b!713668 res!476641) b!713677))

(assert (= (and b!713677 res!476634) b!713676))

(assert (= (and b!713676 res!476627) b!713670))

(assert (= (and b!713670 res!476631) b!713674))

(assert (= (and b!713674 res!476635) b!713672))

(assert (= (and b!713672 res!476630) b!713678))

(assert (= (and b!713678 res!476639) b!713666))

(assert (= (and b!713666 res!476629) b!713679))

(assert (= (and b!713679 res!476636) b!713675))

(assert (= (and b!713675 res!476633) b!713671))

(assert (= (and b!713671 res!476638) b!713680))

(assert (= (and b!713680 res!476632) b!713669))

(declare-fun m!670977 () Bool)

(assert (=> b!713670 m!670977))

(declare-fun m!670979 () Bool)

(assert (=> b!713665 m!670979))

(declare-fun m!670981 () Bool)

(assert (=> start!63406 m!670981))

(declare-fun m!670983 () Bool)

(assert (=> b!713673 m!670983))

(declare-fun m!670985 () Bool)

(assert (=> b!713680 m!670985))

(assert (=> b!713680 m!670985))

(declare-fun m!670987 () Bool)

(assert (=> b!713680 m!670987))

(declare-fun m!670989 () Bool)

(assert (=> b!713672 m!670989))

(declare-fun m!670991 () Bool)

(assert (=> b!713674 m!670991))

(declare-fun m!670993 () Bool)

(assert (=> b!713675 m!670993))

(declare-fun m!670995 () Bool)

(assert (=> b!713666 m!670995))

(declare-fun m!670997 () Bool)

(assert (=> b!713667 m!670997))

(declare-fun m!670999 () Bool)

(assert (=> b!713678 m!670999))

(declare-fun m!671001 () Bool)

(assert (=> b!713679 m!671001))

(declare-fun m!671003 () Bool)

(assert (=> b!713676 m!671003))

(declare-fun m!671005 () Bool)

(assert (=> b!713668 m!671005))

(declare-fun m!671007 () Bool)

(assert (=> b!713677 m!671007))

(check-sat (not b!713667) (not b!713675) (not start!63406) (not b!713668) (not b!713678) (not b!713672) (not b!713673) (not b!713674) (not b!713677) (not b!713679) (not b!713666) (not b!713665) (not b!713676) (not b!713670) (not b!713680))
(check-sat)
