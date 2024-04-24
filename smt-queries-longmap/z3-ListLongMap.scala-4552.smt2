; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63496 () Bool)

(assert start!63496)

(declare-fun b!714763 () Bool)

(declare-fun res!477673 () Bool)

(declare-fun e!401745 () Bool)

(assert (=> b!714763 (=> (not res!477673) (not e!401745))))

(declare-datatypes ((array!40491 0))(
  ( (array!40492 (arr!19381 (Array (_ BitVec 32) (_ BitVec 64))) (size!19794 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40491)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13329 0))(
  ( (Nil!13326) (Cons!13325 (h!14373 (_ BitVec 64)) (t!19636 List!13329)) )
))
(declare-fun acc!652 () List!13329)

(declare-fun arrayNoDuplicates!0 (array!40491 (_ BitVec 32) List!13329) Bool)

(assert (=> b!714763 (= res!477673 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714764 () Bool)

(declare-fun res!477672 () Bool)

(assert (=> b!714764 (=> (not res!477672) (not e!401745))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714764 (= res!477672 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714765 () Bool)

(declare-fun res!477670 () Bool)

(assert (=> b!714765 (=> (not res!477670) (not e!401745))))

(declare-fun newAcc!49 () List!13329)

(declare-fun -!413 (List!13329 (_ BitVec 64)) List!13329)

(assert (=> b!714765 (= res!477670 (= (-!413 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714766 () Bool)

(declare-fun res!477679 () Bool)

(assert (=> b!714766 (=> (not res!477679) (not e!401745))))

(declare-fun noDuplicate!1255 (List!13329) Bool)

(assert (=> b!714766 (= res!477679 (noDuplicate!1255 acc!652))))

(declare-fun b!714767 () Bool)

(declare-fun res!477682 () Bool)

(assert (=> b!714767 (=> (not res!477682) (not e!401745))))

(declare-fun contains!3981 (List!13329 (_ BitVec 64)) Bool)

(assert (=> b!714767 (= res!477682 (not (contains!3981 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477676 () Bool)

(assert (=> start!63496 (=> (not res!477676) (not e!401745))))

(assert (=> start!63496 (= res!477676 (and (bvslt (size!19794 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19794 a!3591))))))

(assert (=> start!63496 e!401745))

(assert (=> start!63496 true))

(declare-fun array_inv!15240 (array!40491) Bool)

(assert (=> start!63496 (array_inv!15240 a!3591)))

(declare-fun b!714768 () Bool)

(declare-fun res!477678 () Bool)

(assert (=> b!714768 (=> (not res!477678) (not e!401745))))

(assert (=> b!714768 (= res!477678 (noDuplicate!1255 newAcc!49))))

(declare-fun b!714769 () Bool)

(declare-fun res!477671 () Bool)

(assert (=> b!714769 (=> (not res!477671) (not e!401745))))

(assert (=> b!714769 (= res!477671 (not (contains!3981 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714770 () Bool)

(declare-fun res!477677 () Bool)

(assert (=> b!714770 (=> (not res!477677) (not e!401745))))

(assert (=> b!714770 (= res!477677 (not (contains!3981 acc!652 k0!2824)))))

(declare-fun b!714771 () Bool)

(declare-fun res!477675 () Bool)

(assert (=> b!714771 (=> (not res!477675) (not e!401745))))

(declare-fun subseq!449 (List!13329 List!13329) Bool)

(assert (=> b!714771 (= res!477675 (subseq!449 acc!652 newAcc!49))))

(declare-fun b!714772 () Bool)

(declare-fun res!477674 () Bool)

(assert (=> b!714772 (=> (not res!477674) (not e!401745))))

(assert (=> b!714772 (= res!477674 (contains!3981 newAcc!49 k0!2824))))

(declare-fun b!714773 () Bool)

(assert (=> b!714773 (= e!401745 false)))

(declare-fun lt!318891 () Bool)

(assert (=> b!714773 (= lt!318891 (contains!3981 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714774 () Bool)

(declare-fun res!477681 () Bool)

(assert (=> b!714774 (=> (not res!477681) (not e!401745))))

(assert (=> b!714774 (= res!477681 (not (contains!3981 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714775 () Bool)

(declare-fun res!477680 () Bool)

(assert (=> b!714775 (=> (not res!477680) (not e!401745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714775 (= res!477680 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63496 res!477676) b!714766))

(assert (= (and b!714766 res!477679) b!714768))

(assert (= (and b!714768 res!477678) b!714767))

(assert (= (and b!714767 res!477682) b!714769))

(assert (= (and b!714769 res!477671) b!714764))

(assert (= (and b!714764 res!477672) b!714770))

(assert (= (and b!714770 res!477677) b!714775))

(assert (= (and b!714775 res!477680) b!714763))

(assert (= (and b!714763 res!477673) b!714771))

(assert (= (and b!714771 res!477675) b!714772))

(assert (= (and b!714772 res!477674) b!714765))

(assert (= (and b!714765 res!477670) b!714774))

(assert (= (and b!714774 res!477681) b!714773))

(declare-fun m!671775 () Bool)

(assert (=> b!714767 m!671775))

(declare-fun m!671777 () Bool)

(assert (=> b!714774 m!671777))

(declare-fun m!671779 () Bool)

(assert (=> b!714775 m!671779))

(declare-fun m!671781 () Bool)

(assert (=> b!714765 m!671781))

(declare-fun m!671783 () Bool)

(assert (=> b!714766 m!671783))

(declare-fun m!671785 () Bool)

(assert (=> b!714769 m!671785))

(declare-fun m!671787 () Bool)

(assert (=> b!714764 m!671787))

(declare-fun m!671789 () Bool)

(assert (=> b!714768 m!671789))

(declare-fun m!671791 () Bool)

(assert (=> b!714771 m!671791))

(declare-fun m!671793 () Bool)

(assert (=> b!714773 m!671793))

(declare-fun m!671795 () Bool)

(assert (=> b!714763 m!671795))

(declare-fun m!671797 () Bool)

(assert (=> b!714772 m!671797))

(declare-fun m!671799 () Bool)

(assert (=> b!714770 m!671799))

(declare-fun m!671801 () Bool)

(assert (=> start!63496 m!671801))

(check-sat (not b!714774) (not start!63496) (not b!714769) (not b!714763) (not b!714772) (not b!714766) (not b!714771) (not b!714767) (not b!714765) (not b!714773) (not b!714775) (not b!714768) (not b!714770) (not b!714764))
(check-sat)
