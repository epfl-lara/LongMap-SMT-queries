; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62626 () Bool)

(assert start!62626)

(declare-fun b!706863 () Bool)

(declare-fun e!398016 () Bool)

(assert (=> b!706863 (= e!398016 false)))

(declare-fun lt!317973 () Bool)

(declare-datatypes ((List!13350 0))(
  ( (Nil!13347) (Cons!13346 (h!14391 (_ BitVec 64)) (t!19632 List!13350)) )
))
(declare-fun newAcc!49 () List!13350)

(declare-fun contains!3927 (List!13350 (_ BitVec 64)) Bool)

(assert (=> b!706863 (= lt!317973 (contains!3927 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706864 () Bool)

(declare-fun res!470677 () Bool)

(assert (=> b!706864 (=> (not res!470677) (not e!398016))))

(declare-datatypes ((array!40305 0))(
  ( (array!40306 (arr!19309 (Array (_ BitVec 32) (_ BitVec 64))) (size!19694 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40305)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13350)

(declare-fun arrayNoDuplicates!0 (array!40305 (_ BitVec 32) List!13350) Bool)

(assert (=> b!706864 (= res!470677 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706865 () Bool)

(declare-fun res!470674 () Bool)

(assert (=> b!706865 (=> (not res!470674) (not e!398016))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706865 (= res!470674 (validKeyInArray!0 k0!2824))))

(declare-fun b!706866 () Bool)

(declare-fun res!470675 () Bool)

(assert (=> b!706866 (=> (not res!470675) (not e!398016))))

(assert (=> b!706866 (= res!470675 (not (contains!3927 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706867 () Bool)

(declare-fun res!470682 () Bool)

(assert (=> b!706867 (=> (not res!470682) (not e!398016))))

(declare-fun subseq!372 (List!13350 List!13350) Bool)

(assert (=> b!706867 (= res!470682 (subseq!372 acc!652 newAcc!49))))

(declare-fun b!706868 () Bool)

(declare-fun res!470676 () Bool)

(assert (=> b!706868 (=> (not res!470676) (not e!398016))))

(assert (=> b!706868 (= res!470676 (not (contains!3927 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706869 () Bool)

(declare-fun res!470683 () Bool)

(assert (=> b!706869 (=> (not res!470683) (not e!398016))))

(declare-fun noDuplicate!1174 (List!13350) Bool)

(assert (=> b!706869 (= res!470683 (noDuplicate!1174 acc!652))))

(declare-fun b!706870 () Bool)

(declare-fun res!470681 () Bool)

(assert (=> b!706870 (=> (not res!470681) (not e!398016))))

(assert (=> b!706870 (= res!470681 (noDuplicate!1174 newAcc!49))))

(declare-fun res!470679 () Bool)

(assert (=> start!62626 (=> (not res!470679) (not e!398016))))

(assert (=> start!62626 (= res!470679 (and (bvslt (size!19694 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19694 a!3591))))))

(assert (=> start!62626 e!398016))

(assert (=> start!62626 true))

(declare-fun array_inv!15105 (array!40305) Bool)

(assert (=> start!62626 (array_inv!15105 a!3591)))

(declare-fun b!706871 () Bool)

(declare-fun res!470680 () Bool)

(assert (=> b!706871 (=> (not res!470680) (not e!398016))))

(assert (=> b!706871 (= res!470680 (not (contains!3927 acc!652 k0!2824)))))

(declare-fun b!706872 () Bool)

(declare-fun res!470678 () Bool)

(assert (=> b!706872 (=> (not res!470678) (not e!398016))))

(assert (=> b!706872 (= res!470678 (contains!3927 newAcc!49 k0!2824))))

(declare-fun b!706873 () Bool)

(declare-fun res!470685 () Bool)

(assert (=> b!706873 (=> (not res!470685) (not e!398016))))

(assert (=> b!706873 (= res!470685 (not (contains!3927 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706874 () Bool)

(declare-fun res!470684 () Bool)

(assert (=> b!706874 (=> (not res!470684) (not e!398016))))

(declare-fun -!337 (List!13350 (_ BitVec 64)) List!13350)

(assert (=> b!706874 (= res!470684 (= (-!337 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706875 () Bool)

(declare-fun res!470673 () Bool)

(assert (=> b!706875 (=> (not res!470673) (not e!398016))))

(declare-fun arrayContainsKey!0 (array!40305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706875 (= res!470673 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62626 res!470679) b!706869))

(assert (= (and b!706869 res!470683) b!706870))

(assert (= (and b!706870 res!470681) b!706868))

(assert (= (and b!706868 res!470676) b!706873))

(assert (= (and b!706873 res!470685) b!706875))

(assert (= (and b!706875 res!470673) b!706871))

(assert (= (and b!706871 res!470680) b!706865))

(assert (= (and b!706865 res!470674) b!706864))

(assert (= (and b!706864 res!470677) b!706867))

(assert (= (and b!706867 res!470682) b!706872))

(assert (= (and b!706872 res!470678) b!706874))

(assert (= (and b!706874 res!470684) b!706866))

(assert (= (and b!706866 res!470675) b!706863))

(declare-fun m!664607 () Bool)

(assert (=> start!62626 m!664607))

(declare-fun m!664609 () Bool)

(assert (=> b!706867 m!664609))

(declare-fun m!664611 () Bool)

(assert (=> b!706869 m!664611))

(declare-fun m!664613 () Bool)

(assert (=> b!706866 m!664613))

(declare-fun m!664615 () Bool)

(assert (=> b!706864 m!664615))

(declare-fun m!664617 () Bool)

(assert (=> b!706868 m!664617))

(declare-fun m!664619 () Bool)

(assert (=> b!706875 m!664619))

(declare-fun m!664621 () Bool)

(assert (=> b!706863 m!664621))

(declare-fun m!664623 () Bool)

(assert (=> b!706870 m!664623))

(declare-fun m!664625 () Bool)

(assert (=> b!706873 m!664625))

(declare-fun m!664627 () Bool)

(assert (=> b!706865 m!664627))

(declare-fun m!664629 () Bool)

(assert (=> b!706874 m!664629))

(declare-fun m!664631 () Bool)

(assert (=> b!706871 m!664631))

(declare-fun m!664633 () Bool)

(assert (=> b!706872 m!664633))

(check-sat (not b!706864) (not b!706870) (not b!706875) (not b!706874) (not start!62626) (not b!706872) (not b!706868) (not b!706871) (not b!706873) (not b!706867) (not b!706869) (not b!706865) (not b!706863) (not b!706866))
(check-sat)
