; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62444 () Bool)

(assert start!62444)

(declare-fun b!701852 () Bool)

(declare-fun e!397290 () Bool)

(declare-fun e!397292 () Bool)

(assert (=> b!701852 (= e!397290 e!397292)))

(declare-fun res!465826 () Bool)

(assert (=> b!701852 (=> (not res!465826) (not e!397292))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!701852 (= res!465826 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13303 0))(
  ( (Nil!13300) (Cons!13299 (h!14344 (_ BitVec 64)) (t!19576 List!13303)) )
))
(declare-fun newAcc!49 () List!13303)

(declare-fun lt!317416 () List!13303)

(declare-datatypes ((array!40134 0))(
  ( (array!40135 (arr!19223 (Array (_ BitVec 32) (_ BitVec 64))) (size!19605 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40134)

(declare-fun $colon$colon!484 (List!13303 (_ BitVec 64)) List!13303)

(assert (=> b!701852 (= lt!317416 ($colon$colon!484 newAcc!49 (select (arr!19223 a!3591) from!2969)))))

(declare-fun acc!652 () List!13303)

(declare-fun lt!317418 () List!13303)

(assert (=> b!701852 (= lt!317418 ($colon$colon!484 acc!652 (select (arr!19223 a!3591) from!2969)))))

(declare-fun b!701853 () Bool)

(declare-fun res!465827 () Bool)

(assert (=> b!701853 (=> (not res!465827) (not e!397292))))

(declare-fun contains!3825 (List!13303 (_ BitVec 64)) Bool)

(assert (=> b!701853 (= res!465827 (not (contains!3825 lt!317418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701854 () Bool)

(declare-fun res!465831 () Bool)

(assert (=> b!701854 (=> (not res!465831) (not e!397290))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!701854 (= res!465831 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!701855 () Bool)

(assert (=> b!701855 (= e!397292 (not (bvsle from!2969 (size!19605 a!3591))))))

(declare-fun arrayNoDuplicates!0 (array!40134 (_ BitVec 32) List!13303) Bool)

(assert (=> b!701855 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317416)))

(declare-datatypes ((Unit!24560 0))(
  ( (Unit!24561) )
))
(declare-fun lt!317417 () Unit!24560)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40134 (_ BitVec 64) (_ BitVec 32) List!13303 List!13303) Unit!24560)

(assert (=> b!701855 (= lt!317417 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317418 lt!317416))))

(declare-fun b!701856 () Bool)

(declare-fun res!465840 () Bool)

(assert (=> b!701856 (=> (not res!465840) (not e!397292))))

(assert (=> b!701856 (= res!465840 (contains!3825 lt!317416 k0!2824))))

(declare-fun b!701857 () Bool)

(declare-fun res!465825 () Bool)

(assert (=> b!701857 (=> (not res!465825) (not e!397290))))

(declare-fun -!252 (List!13303 (_ BitVec 64)) List!13303)

(assert (=> b!701857 (= res!465825 (= (-!252 newAcc!49 k0!2824) acc!652))))

(declare-fun b!701858 () Bool)

(declare-fun res!465822 () Bool)

(assert (=> b!701858 (=> (not res!465822) (not e!397292))))

(declare-fun noDuplicate!1094 (List!13303) Bool)

(assert (=> b!701858 (= res!465822 (noDuplicate!1094 lt!317418))))

(declare-fun b!701859 () Bool)

(declare-fun res!465835 () Bool)

(assert (=> b!701859 (=> (not res!465835) (not e!397290))))

(assert (=> b!701859 (= res!465835 (contains!3825 newAcc!49 k0!2824))))

(declare-fun b!701860 () Bool)

(declare-fun res!465833 () Bool)

(assert (=> b!701860 (=> (not res!465833) (not e!397292))))

(assert (=> b!701860 (= res!465833 (noDuplicate!1094 lt!317416))))

(declare-fun b!701861 () Bool)

(declare-fun res!465842 () Bool)

(assert (=> b!701861 (=> (not res!465842) (not e!397290))))

(assert (=> b!701861 (= res!465842 (not (contains!3825 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701862 () Bool)

(declare-fun res!465844 () Bool)

(assert (=> b!701862 (=> (not res!465844) (not e!397292))))

(assert (=> b!701862 (= res!465844 (not (contains!3825 lt!317416 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701863 () Bool)

(declare-fun res!465843 () Bool)

(assert (=> b!701863 (=> (not res!465843) (not e!397290))))

(declare-fun subseq!287 (List!13303 List!13303) Bool)

(assert (=> b!701863 (= res!465843 (subseq!287 acc!652 newAcc!49))))

(declare-fun b!701864 () Bool)

(declare-fun res!465850 () Bool)

(assert (=> b!701864 (=> (not res!465850) (not e!397290))))

(assert (=> b!701864 (= res!465850 (noDuplicate!1094 newAcc!49))))

(declare-fun b!701865 () Bool)

(declare-fun res!465830 () Bool)

(assert (=> b!701865 (=> (not res!465830) (not e!397290))))

(assert (=> b!701865 (= res!465830 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!701866 () Bool)

(declare-fun res!465841 () Bool)

(assert (=> b!701866 (=> (not res!465841) (not e!397290))))

(assert (=> b!701866 (= res!465841 (noDuplicate!1094 acc!652))))

(declare-fun b!701867 () Bool)

(declare-fun res!465828 () Bool)

(assert (=> b!701867 (=> (not res!465828) (not e!397292))))

(assert (=> b!701867 (= res!465828 (not (contains!3825 lt!317416 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701868 () Bool)

(declare-fun res!465836 () Bool)

(assert (=> b!701868 (=> (not res!465836) (not e!397290))))

(assert (=> b!701868 (= res!465836 (not (contains!3825 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701869 () Bool)

(declare-fun res!465849 () Bool)

(assert (=> b!701869 (=> (not res!465849) (not e!397292))))

(assert (=> b!701869 (= res!465849 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317418))))

(declare-fun b!701870 () Bool)

(declare-fun res!465845 () Bool)

(assert (=> b!701870 (=> (not res!465845) (not e!397290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!701870 (= res!465845 (validKeyInArray!0 k0!2824))))

(declare-fun b!701871 () Bool)

(declare-fun res!465837 () Bool)

(assert (=> b!701871 (=> (not res!465837) (not e!397290))))

(assert (=> b!701871 (= res!465837 (validKeyInArray!0 (select (arr!19223 a!3591) from!2969)))))

(declare-fun b!701872 () Bool)

(declare-fun res!465846 () Bool)

(assert (=> b!701872 (=> (not res!465846) (not e!397290))))

(assert (=> b!701872 (= res!465846 (not (contains!3825 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701873 () Bool)

(declare-fun res!465847 () Bool)

(assert (=> b!701873 (=> (not res!465847) (not e!397292))))

(assert (=> b!701873 (= res!465847 (not (contains!3825 lt!317418 k0!2824)))))

(declare-fun b!701874 () Bool)

(declare-fun res!465848 () Bool)

(assert (=> b!701874 (=> (not res!465848) (not e!397292))))

(assert (=> b!701874 (= res!465848 (subseq!287 lt!317418 lt!317416))))

(declare-fun res!465832 () Bool)

(assert (=> start!62444 (=> (not res!465832) (not e!397290))))

(assert (=> start!62444 (= res!465832 (and (bvslt (size!19605 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19605 a!3591))))))

(assert (=> start!62444 e!397290))

(assert (=> start!62444 true))

(declare-fun array_inv!15106 (array!40134) Bool)

(assert (=> start!62444 (array_inv!15106 a!3591)))

(declare-fun b!701875 () Bool)

(declare-fun res!465838 () Bool)

(assert (=> b!701875 (=> (not res!465838) (not e!397292))))

(assert (=> b!701875 (= res!465838 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!701876 () Bool)

(declare-fun res!465823 () Bool)

(assert (=> b!701876 (=> (not res!465823) (not e!397292))))

(assert (=> b!701876 (= res!465823 (not (contains!3825 lt!317418 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701877 () Bool)

(declare-fun res!465824 () Bool)

(assert (=> b!701877 (=> (not res!465824) (not e!397290))))

(assert (=> b!701877 (= res!465824 (not (contains!3825 acc!652 k0!2824)))))

(declare-fun b!701878 () Bool)

(declare-fun res!465829 () Bool)

(assert (=> b!701878 (=> (not res!465829) (not e!397292))))

(assert (=> b!701878 (= res!465829 (= (-!252 lt!317416 k0!2824) lt!317418))))

(declare-fun b!701879 () Bool)

(declare-fun res!465834 () Bool)

(assert (=> b!701879 (=> (not res!465834) (not e!397290))))

(assert (=> b!701879 (= res!465834 (not (contains!3825 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701880 () Bool)

(declare-fun res!465839 () Bool)

(assert (=> b!701880 (=> (not res!465839) (not e!397290))))

(assert (=> b!701880 (= res!465839 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19605 a!3591)))))

(assert (= (and start!62444 res!465832) b!701866))

(assert (= (and b!701866 res!465841) b!701864))

(assert (= (and b!701864 res!465850) b!701861))

(assert (= (and b!701861 res!465842) b!701872))

(assert (= (and b!701872 res!465846) b!701854))

(assert (= (and b!701854 res!465831) b!701877))

(assert (= (and b!701877 res!465824) b!701870))

(assert (= (and b!701870 res!465845) b!701865))

(assert (= (and b!701865 res!465830) b!701863))

(assert (= (and b!701863 res!465843) b!701859))

(assert (= (and b!701859 res!465835) b!701857))

(assert (= (and b!701857 res!465825) b!701879))

(assert (= (and b!701879 res!465834) b!701868))

(assert (= (and b!701868 res!465836) b!701880))

(assert (= (and b!701880 res!465839) b!701871))

(assert (= (and b!701871 res!465837) b!701852))

(assert (= (and b!701852 res!465826) b!701858))

(assert (= (and b!701858 res!465822) b!701860))

(assert (= (and b!701860 res!465833) b!701853))

(assert (= (and b!701853 res!465827) b!701876))

(assert (= (and b!701876 res!465823) b!701875))

(assert (= (and b!701875 res!465838) b!701873))

(assert (= (and b!701873 res!465847) b!701869))

(assert (= (and b!701869 res!465849) b!701874))

(assert (= (and b!701874 res!465848) b!701856))

(assert (= (and b!701856 res!465840) b!701878))

(assert (= (and b!701878 res!465829) b!701862))

(assert (= (and b!701862 res!465844) b!701867))

(assert (= (and b!701867 res!465828) b!701855))

(declare-fun m!660555 () Bool)

(assert (=> b!701867 m!660555))

(declare-fun m!660557 () Bool)

(assert (=> b!701870 m!660557))

(declare-fun m!660559 () Bool)

(assert (=> b!701859 m!660559))

(declare-fun m!660561 () Bool)

(assert (=> b!701872 m!660561))

(declare-fun m!660563 () Bool)

(assert (=> b!701868 m!660563))

(declare-fun m!660565 () Bool)

(assert (=> b!701874 m!660565))

(declare-fun m!660567 () Bool)

(assert (=> b!701866 m!660567))

(declare-fun m!660569 () Bool)

(assert (=> b!701853 m!660569))

(declare-fun m!660571 () Bool)

(assert (=> b!701878 m!660571))

(declare-fun m!660573 () Bool)

(assert (=> b!701860 m!660573))

(declare-fun m!660575 () Bool)

(assert (=> b!701856 m!660575))

(declare-fun m!660577 () Bool)

(assert (=> b!701854 m!660577))

(declare-fun m!660579 () Bool)

(assert (=> b!701858 m!660579))

(declare-fun m!660581 () Bool)

(assert (=> b!701865 m!660581))

(declare-fun m!660583 () Bool)

(assert (=> b!701879 m!660583))

(declare-fun m!660585 () Bool)

(assert (=> b!701875 m!660585))

(declare-fun m!660587 () Bool)

(assert (=> b!701876 m!660587))

(declare-fun m!660589 () Bool)

(assert (=> b!701857 m!660589))

(declare-fun m!660591 () Bool)

(assert (=> b!701862 m!660591))

(declare-fun m!660593 () Bool)

(assert (=> b!701873 m!660593))

(declare-fun m!660595 () Bool)

(assert (=> b!701871 m!660595))

(assert (=> b!701871 m!660595))

(declare-fun m!660597 () Bool)

(assert (=> b!701871 m!660597))

(declare-fun m!660599 () Bool)

(assert (=> b!701864 m!660599))

(declare-fun m!660601 () Bool)

(assert (=> b!701861 m!660601))

(assert (=> b!701852 m!660595))

(assert (=> b!701852 m!660595))

(declare-fun m!660603 () Bool)

(assert (=> b!701852 m!660603))

(assert (=> b!701852 m!660595))

(declare-fun m!660605 () Bool)

(assert (=> b!701852 m!660605))

(declare-fun m!660607 () Bool)

(assert (=> b!701863 m!660607))

(declare-fun m!660609 () Bool)

(assert (=> b!701877 m!660609))

(declare-fun m!660611 () Bool)

(assert (=> start!62444 m!660611))

(declare-fun m!660613 () Bool)

(assert (=> b!701869 m!660613))

(declare-fun m!660615 () Bool)

(assert (=> b!701855 m!660615))

(declare-fun m!660617 () Bool)

(assert (=> b!701855 m!660617))

(check-sat (not b!701869) (not b!701864) (not start!62444) (not b!701876) (not b!701874) (not b!701862) (not b!701865) (not b!701867) (not b!701871) (not b!701854) (not b!701859) (not b!701873) (not b!701875) (not b!701870) (not b!701879) (not b!701868) (not b!701857) (not b!701878) (not b!701872) (not b!701853) (not b!701863) (not b!701877) (not b!701856) (not b!701861) (not b!701860) (not b!701858) (not b!701866) (not b!701852) (not b!701855))
(check-sat)
