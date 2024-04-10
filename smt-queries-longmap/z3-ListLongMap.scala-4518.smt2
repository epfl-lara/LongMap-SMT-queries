; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62578 () Bool)

(assert start!62578)

(declare-fun b!705831 () Bool)

(declare-fun res!469650 () Bool)

(declare-fun e!397872 () Bool)

(assert (=> b!705831 (=> (not res!469650) (not e!397872))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705831 (= res!469650 (validKeyInArray!0 k0!2824))))

(declare-fun b!705832 () Bool)

(declare-fun res!469641 () Bool)

(assert (=> b!705832 (=> (not res!469641) (not e!397872))))

(declare-datatypes ((array!40257 0))(
  ( (array!40258 (arr!19285 (Array (_ BitVec 32) (_ BitVec 64))) (size!19670 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40257)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13326 0))(
  ( (Nil!13323) (Cons!13322 (h!14367 (_ BitVec 64)) (t!19608 List!13326)) )
))
(declare-fun acc!652 () List!13326)

(declare-fun arrayNoDuplicates!0 (array!40257 (_ BitVec 32) List!13326) Bool)

(assert (=> b!705832 (= res!469641 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705833 () Bool)

(declare-fun res!469645 () Bool)

(assert (=> b!705833 (=> (not res!469645) (not e!397872))))

(declare-fun contains!3903 (List!13326 (_ BitVec 64)) Bool)

(assert (=> b!705833 (= res!469645 (not (contains!3903 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705834 () Bool)

(declare-fun res!469643 () Bool)

(assert (=> b!705834 (=> (not res!469643) (not e!397872))))

(assert (=> b!705834 (= res!469643 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705835 () Bool)

(declare-fun res!469656 () Bool)

(assert (=> b!705835 (=> (not res!469656) (not e!397872))))

(assert (=> b!705835 (= res!469656 (not (contains!3903 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705836 () Bool)

(declare-fun res!469648 () Bool)

(assert (=> b!705836 (=> (not res!469648) (not e!397872))))

(declare-fun newAcc!49 () List!13326)

(declare-fun noDuplicate!1150 (List!13326) Bool)

(assert (=> b!705836 (= res!469648 (noDuplicate!1150 newAcc!49))))

(declare-fun b!705837 () Bool)

(declare-fun res!469644 () Bool)

(assert (=> b!705837 (=> (not res!469644) (not e!397872))))

(assert (=> b!705837 (= res!469644 (not (contains!3903 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705838 () Bool)

(declare-fun res!469647 () Bool)

(assert (=> b!705838 (=> (not res!469647) (not e!397872))))

(declare-fun arrayContainsKey!0 (array!40257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705838 (= res!469647 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705839 () Bool)

(declare-fun res!469649 () Bool)

(assert (=> b!705839 (=> (not res!469649) (not e!397872))))

(declare-fun -!313 (List!13326 (_ BitVec 64)) List!13326)

(assert (=> b!705839 (= res!469649 (= (-!313 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705840 () Bool)

(declare-fun res!469651 () Bool)

(assert (=> b!705840 (=> (not res!469651) (not e!397872))))

(assert (=> b!705840 (= res!469651 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705841 () Bool)

(declare-fun res!469642 () Bool)

(assert (=> b!705841 (=> (not res!469642) (not e!397872))))

(assert (=> b!705841 (= res!469642 (not (contains!3903 acc!652 k0!2824)))))

(declare-fun b!705842 () Bool)

(declare-fun res!469646 () Bool)

(assert (=> b!705842 (=> (not res!469646) (not e!397872))))

(assert (=> b!705842 (= res!469646 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19670 a!3591)))))

(declare-fun b!705843 () Bool)

(declare-fun res!469654 () Bool)

(assert (=> b!705843 (=> (not res!469654) (not e!397872))))

(assert (=> b!705843 (= res!469654 (not (contains!3903 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705844 () Bool)

(declare-fun res!469659 () Bool)

(assert (=> b!705844 (=> (not res!469659) (not e!397872))))

(assert (=> b!705844 (= res!469659 (noDuplicate!1150 acc!652))))

(declare-fun b!705845 () Bool)

(declare-fun res!469657 () Bool)

(assert (=> b!705845 (=> (not res!469657) (not e!397872))))

(declare-fun subseq!348 (List!13326 List!13326) Bool)

(assert (=> b!705845 (= res!469657 (subseq!348 acc!652 newAcc!49))))

(declare-fun b!705846 () Bool)

(declare-fun res!469652 () Bool)

(assert (=> b!705846 (=> (not res!469652) (not e!397872))))

(assert (=> b!705846 (= res!469652 (not (validKeyInArray!0 (select (arr!19285 a!3591) from!2969))))))

(declare-fun b!705847 () Bool)

(assert (=> b!705847 (= e!397872 (not true))))

(assert (=> b!705847 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24620 0))(
  ( (Unit!24621) )
))
(declare-fun lt!317919 () Unit!24620)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40257 (_ BitVec 64) (_ BitVec 32) List!13326 List!13326) Unit!24620)

(assert (=> b!705847 (= lt!317919 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun res!469658 () Bool)

(assert (=> start!62578 (=> (not res!469658) (not e!397872))))

(assert (=> start!62578 (= res!469658 (and (bvslt (size!19670 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19670 a!3591))))))

(assert (=> start!62578 e!397872))

(assert (=> start!62578 true))

(declare-fun array_inv!15081 (array!40257) Bool)

(assert (=> start!62578 (array_inv!15081 a!3591)))

(declare-fun b!705848 () Bool)

(declare-fun res!469653 () Bool)

(assert (=> b!705848 (=> (not res!469653) (not e!397872))))

(assert (=> b!705848 (= res!469653 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705849 () Bool)

(declare-fun res!469655 () Bool)

(assert (=> b!705849 (=> (not res!469655) (not e!397872))))

(assert (=> b!705849 (= res!469655 (contains!3903 newAcc!49 k0!2824))))

(assert (= (and start!62578 res!469658) b!705844))

(assert (= (and b!705844 res!469659) b!705836))

(assert (= (and b!705836 res!469648) b!705835))

(assert (= (and b!705835 res!469656) b!705833))

(assert (= (and b!705833 res!469645) b!705840))

(assert (= (and b!705840 res!469651) b!705841))

(assert (= (and b!705841 res!469642) b!705831))

(assert (= (and b!705831 res!469650) b!705832))

(assert (= (and b!705832 res!469641) b!705845))

(assert (= (and b!705845 res!469657) b!705849))

(assert (= (and b!705849 res!469655) b!705839))

(assert (= (and b!705839 res!469649) b!705837))

(assert (= (and b!705837 res!469644) b!705843))

(assert (= (and b!705843 res!469654) b!705842))

(assert (= (and b!705842 res!469646) b!705846))

(assert (= (and b!705846 res!469652) b!705834))

(assert (= (and b!705834 res!469643) b!705838))

(assert (= (and b!705838 res!469647) b!705848))

(assert (= (and b!705848 res!469653) b!705847))

(declare-fun m!663875 () Bool)

(assert (=> b!705838 m!663875))

(declare-fun m!663877 () Bool)

(assert (=> b!705835 m!663877))

(declare-fun m!663879 () Bool)

(assert (=> b!705845 m!663879))

(declare-fun m!663881 () Bool)

(assert (=> b!705844 m!663881))

(declare-fun m!663883 () Bool)

(assert (=> b!705836 m!663883))

(declare-fun m!663885 () Bool)

(assert (=> b!705843 m!663885))

(declare-fun m!663887 () Bool)

(assert (=> b!705847 m!663887))

(declare-fun m!663889 () Bool)

(assert (=> b!705847 m!663889))

(declare-fun m!663891 () Bool)

(assert (=> b!705833 m!663891))

(declare-fun m!663893 () Bool)

(assert (=> b!705839 m!663893))

(declare-fun m!663895 () Bool)

(assert (=> b!705837 m!663895))

(declare-fun m!663897 () Bool)

(assert (=> b!705840 m!663897))

(declare-fun m!663899 () Bool)

(assert (=> b!705846 m!663899))

(assert (=> b!705846 m!663899))

(declare-fun m!663901 () Bool)

(assert (=> b!705846 m!663901))

(declare-fun m!663903 () Bool)

(assert (=> b!705832 m!663903))

(declare-fun m!663905 () Bool)

(assert (=> b!705831 m!663905))

(declare-fun m!663907 () Bool)

(assert (=> b!705841 m!663907))

(declare-fun m!663909 () Bool)

(assert (=> b!705848 m!663909))

(declare-fun m!663911 () Bool)

(assert (=> b!705849 m!663911))

(declare-fun m!663913 () Bool)

(assert (=> start!62578 m!663913))

(check-sat (not b!705831) (not b!705849) (not b!705843) (not b!705833) (not b!705846) (not b!705840) (not b!705838) (not b!705832) (not b!705848) (not b!705847) (not b!705845) (not b!705837) (not b!705835) (not start!62578) (not b!705839) (not b!705836) (not b!705844) (not b!705841))
(check-sat)
