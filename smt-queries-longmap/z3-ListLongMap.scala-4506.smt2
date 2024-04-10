; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62506 () Bool)

(assert start!62506)

(declare-fun b!703864 () Bool)

(declare-fun res!467688 () Bool)

(declare-fun e!397657 () Bool)

(assert (=> b!703864 (=> (not res!467688) (not e!397657))))

(declare-datatypes ((List!13290 0))(
  ( (Nil!13287) (Cons!13286 (h!14331 (_ BitVec 64)) (t!19572 List!13290)) )
))
(declare-fun acc!652 () List!13290)

(declare-fun noDuplicate!1114 (List!13290) Bool)

(assert (=> b!703864 (= res!467688 (noDuplicate!1114 acc!652))))

(declare-fun b!703866 () Bool)

(declare-fun res!467682 () Bool)

(assert (=> b!703866 (=> (not res!467682) (not e!397657))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703866 (= res!467682 (validKeyInArray!0 k0!2824))))

(declare-fun b!703867 () Bool)

(declare-fun res!467675 () Bool)

(assert (=> b!703867 (=> (not res!467675) (not e!397657))))

(declare-datatypes ((array!40185 0))(
  ( (array!40186 (arr!19249 (Array (_ BitVec 32) (_ BitVec 64))) (size!19634 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40185)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703867 (= res!467675 (not (validKeyInArray!0 (select (arr!19249 a!3591) from!2969))))))

(declare-fun b!703868 () Bool)

(declare-fun res!467674 () Bool)

(assert (=> b!703868 (=> (not res!467674) (not e!397657))))

(declare-fun arrayContainsKey!0 (array!40185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703868 (= res!467674 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703869 () Bool)

(declare-fun res!467684 () Bool)

(assert (=> b!703869 (=> (not res!467684) (not e!397657))))

(declare-fun newAcc!49 () List!13290)

(declare-fun contains!3867 (List!13290 (_ BitVec 64)) Bool)

(assert (=> b!703869 (= res!467684 (contains!3867 newAcc!49 k0!2824))))

(declare-fun b!703870 () Bool)

(declare-fun res!467690 () Bool)

(assert (=> b!703870 (=> (not res!467690) (not e!397657))))

(declare-fun subseq!312 (List!13290 List!13290) Bool)

(assert (=> b!703870 (= res!467690 (subseq!312 acc!652 newAcc!49))))

(declare-fun b!703871 () Bool)

(declare-fun res!467686 () Bool)

(assert (=> b!703871 (=> (not res!467686) (not e!397657))))

(assert (=> b!703871 (= res!467686 (not (contains!3867 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703872 () Bool)

(declare-fun res!467676 () Bool)

(assert (=> b!703872 (=> (not res!467676) (not e!397657))))

(assert (=> b!703872 (= res!467676 (noDuplicate!1114 newAcc!49))))

(declare-fun b!703873 () Bool)

(declare-fun res!467677 () Bool)

(assert (=> b!703873 (=> (not res!467677) (not e!397657))))

(declare-fun arrayNoDuplicates!0 (array!40185 (_ BitVec 32) List!13290) Bool)

(assert (=> b!703873 (= res!467677 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703865 () Bool)

(declare-fun res!467681 () Bool)

(assert (=> b!703865 (=> (not res!467681) (not e!397657))))

(assert (=> b!703865 (= res!467681 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!467685 () Bool)

(assert (=> start!62506 (=> (not res!467685) (not e!397657))))

(assert (=> start!62506 (= res!467685 (and (bvslt (size!19634 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19634 a!3591))))))

(assert (=> start!62506 e!397657))

(assert (=> start!62506 true))

(declare-fun array_inv!15045 (array!40185) Bool)

(assert (=> start!62506 (array_inv!15045 a!3591)))

(declare-fun b!703874 () Bool)

(declare-fun res!467689 () Bool)

(assert (=> b!703874 (=> (not res!467689) (not e!397657))))

(assert (=> b!703874 (= res!467689 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703875 () Bool)

(declare-fun res!467680 () Bool)

(assert (=> b!703875 (=> (not res!467680) (not e!397657))))

(declare-fun -!277 (List!13290 (_ BitVec 64)) List!13290)

(assert (=> b!703875 (= res!467680 (= (-!277 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703876 () Bool)

(declare-fun res!467687 () Bool)

(assert (=> b!703876 (=> (not res!467687) (not e!397657))))

(assert (=> b!703876 (= res!467687 (not (contains!3867 acc!652 k0!2824)))))

(declare-fun b!703877 () Bool)

(declare-fun res!467691 () Bool)

(assert (=> b!703877 (=> (not res!467691) (not e!397657))))

(assert (=> b!703877 (= res!467691 (not (contains!3867 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703878 () Bool)

(declare-fun res!467679 () Bool)

(assert (=> b!703878 (=> (not res!467679) (not e!397657))))

(assert (=> b!703878 (= res!467679 (not (contains!3867 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703879 () Bool)

(declare-fun res!467678 () Bool)

(assert (=> b!703879 (=> (not res!467678) (not e!397657))))

(assert (=> b!703879 (= res!467678 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19634 a!3591)))))

(declare-fun b!703880 () Bool)

(assert (=> b!703880 (= e!397657 false)))

(declare-fun lt!317811 () Bool)

(assert (=> b!703880 (= lt!317811 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703881 () Bool)

(declare-fun res!467683 () Bool)

(assert (=> b!703881 (=> (not res!467683) (not e!397657))))

(assert (=> b!703881 (= res!467683 (not (contains!3867 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62506 res!467685) b!703864))

(assert (= (and b!703864 res!467688) b!703872))

(assert (= (and b!703872 res!467676) b!703871))

(assert (= (and b!703871 res!467686) b!703877))

(assert (= (and b!703877 res!467691) b!703874))

(assert (= (and b!703874 res!467689) b!703876))

(assert (= (and b!703876 res!467687) b!703866))

(assert (= (and b!703866 res!467682) b!703873))

(assert (= (and b!703873 res!467677) b!703870))

(assert (= (and b!703870 res!467690) b!703869))

(assert (= (and b!703869 res!467684) b!703875))

(assert (= (and b!703875 res!467680) b!703881))

(assert (= (and b!703881 res!467683) b!703878))

(assert (= (and b!703878 res!467679) b!703879))

(assert (= (and b!703879 res!467678) b!703867))

(assert (= (and b!703867 res!467675) b!703865))

(assert (= (and b!703865 res!467681) b!703868))

(assert (= (and b!703868 res!467674) b!703880))

(declare-fun m!662551 () Bool)

(assert (=> b!703875 m!662551))

(declare-fun m!662553 () Bool)

(assert (=> b!703877 m!662553))

(declare-fun m!662555 () Bool)

(assert (=> b!703876 m!662555))

(declare-fun m!662557 () Bool)

(assert (=> b!703871 m!662557))

(declare-fun m!662559 () Bool)

(assert (=> b!703880 m!662559))

(declare-fun m!662561 () Bool)

(assert (=> b!703870 m!662561))

(declare-fun m!662563 () Bool)

(assert (=> b!703868 m!662563))

(declare-fun m!662565 () Bool)

(assert (=> b!703878 m!662565))

(declare-fun m!662567 () Bool)

(assert (=> b!703872 m!662567))

(declare-fun m!662569 () Bool)

(assert (=> start!62506 m!662569))

(declare-fun m!662571 () Bool)

(assert (=> b!703874 m!662571))

(declare-fun m!662573 () Bool)

(assert (=> b!703864 m!662573))

(declare-fun m!662575 () Bool)

(assert (=> b!703873 m!662575))

(declare-fun m!662577 () Bool)

(assert (=> b!703881 m!662577))

(declare-fun m!662579 () Bool)

(assert (=> b!703869 m!662579))

(declare-fun m!662581 () Bool)

(assert (=> b!703866 m!662581))

(declare-fun m!662583 () Bool)

(assert (=> b!703867 m!662583))

(assert (=> b!703867 m!662583))

(declare-fun m!662585 () Bool)

(assert (=> b!703867 m!662585))

(check-sat (not b!703872) (not b!703880) (not b!703869) (not b!703873) (not b!703874) (not b!703878) (not b!703875) (not b!703870) (not b!703864) (not b!703877) (not b!703866) (not b!703876) (not start!62506) (not b!703871) (not b!703867) (not b!703868) (not b!703881))
(check-sat)
