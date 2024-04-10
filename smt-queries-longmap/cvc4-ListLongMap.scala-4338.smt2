; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60060 () Bool)

(assert start!60060)

(declare-fun b!668828 () Bool)

(declare-fun res!435826 () Bool)

(declare-fun e!382637 () Bool)

(assert (=> b!668828 (=> (not res!435826) (not e!382637))))

(declare-datatypes ((List!12787 0))(
  ( (Nil!12784) (Cons!12783 (h!13828 (_ BitVec 64)) (t!19015 List!12787)) )
))
(declare-fun acc!681 () List!12787)

(declare-fun contains!3364 (List!12787 (_ BitVec 64)) Bool)

(assert (=> b!668828 (= res!435826 (not (contains!3364 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668829 () Bool)

(declare-fun res!435820 () Bool)

(assert (=> b!668829 (=> (not res!435820) (not e!382637))))

(declare-datatypes ((array!39107 0))(
  ( (array!39108 (arr!18746 (Array (_ BitVec 32) (_ BitVec 64))) (size!19110 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39107)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668829 (= res!435820 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668830 () Bool)

(declare-fun res!435817 () Bool)

(assert (=> b!668830 (=> (not res!435817) (not e!382637))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39107 (_ BitVec 32) List!12787) Bool)

(assert (=> b!668830 (= res!435817 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668831 () Bool)

(declare-fun e!382628 () Bool)

(assert (=> b!668831 (= e!382628 (not (contains!3364 acc!681 k!2843)))))

(declare-fun b!668832 () Bool)

(declare-fun res!435831 () Bool)

(assert (=> b!668832 (=> (not res!435831) (not e!382637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668832 (= res!435831 (validKeyInArray!0 k!2843))))

(declare-fun b!668833 () Bool)

(declare-fun res!435824 () Bool)

(assert (=> b!668833 (=> (not res!435824) (not e!382637))))

(assert (=> b!668833 (= res!435824 (not (contains!3364 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668834 () Bool)

(declare-fun res!435821 () Bool)

(assert (=> b!668834 (=> (not res!435821) (not e!382637))))

(assert (=> b!668834 (= res!435821 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12784))))

(declare-fun b!668835 () Bool)

(declare-fun e!382633 () Bool)

(assert (=> b!668835 (= e!382633 e!382628)))

(declare-fun res!435829 () Bool)

(assert (=> b!668835 (=> (not res!435829) (not e!382628))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668835 (= res!435829 (bvsle from!3004 i!1382))))

(declare-fun b!668836 () Bool)

(declare-fun e!382630 () Bool)

(declare-fun e!382634 () Bool)

(assert (=> b!668836 (= e!382630 e!382634)))

(declare-fun res!435834 () Bool)

(assert (=> b!668836 (=> (not res!435834) (not e!382634))))

(assert (=> b!668836 (= res!435834 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668838 () Bool)

(declare-fun res!435816 () Bool)

(assert (=> b!668838 (=> (not res!435816) (not e!382637))))

(assert (=> b!668838 (= res!435816 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19110 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668839 () Bool)

(declare-fun res!435828 () Bool)

(assert (=> b!668839 (=> (not res!435828) (not e!382637))))

(declare-fun noDuplicate!611 (List!12787) Bool)

(assert (=> b!668839 (= res!435828 (noDuplicate!611 acc!681))))

(declare-fun b!668840 () Bool)

(declare-fun res!435833 () Bool)

(assert (=> b!668840 (=> (not res!435833) (not e!382637))))

(assert (=> b!668840 (= res!435833 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19110 a!3626))))))

(declare-fun b!668841 () Bool)

(declare-datatypes ((Unit!23455 0))(
  ( (Unit!23456) )
))
(declare-fun e!382631 () Unit!23455)

(declare-fun Unit!23457 () Unit!23455)

(assert (=> b!668841 (= e!382631 Unit!23457)))

(declare-fun b!668842 () Bool)

(declare-fun res!435819 () Bool)

(declare-fun e!382638 () Bool)

(assert (=> b!668842 (=> res!435819 e!382638)))

(declare-fun lt!311379 () List!12787)

(assert (=> b!668842 (= res!435819 (contains!3364 lt!311379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668843 () Bool)

(declare-fun lt!311375 () Unit!23455)

(assert (=> b!668843 (= e!382631 lt!311375)))

(declare-fun lt!311374 () Unit!23455)

(declare-fun lemmaListSubSeqRefl!0 (List!12787) Unit!23455)

(assert (=> b!668843 (= lt!311374 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!103 (List!12787 List!12787) Bool)

(assert (=> b!668843 (subseq!103 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39107 List!12787 List!12787 (_ BitVec 32)) Unit!23455)

(declare-fun $colon$colon!235 (List!12787 (_ BitVec 64)) List!12787)

(assert (=> b!668843 (= lt!311375 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!235 acc!681 (select (arr!18746 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668843 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668844 () Bool)

(declare-fun res!435823 () Bool)

(assert (=> b!668844 (=> res!435823 e!382638)))

(assert (=> b!668844 (= res!435823 (not (noDuplicate!611 lt!311379)))))

(declare-fun b!668845 () Bool)

(assert (=> b!668845 (= e!382638 true)))

(declare-fun lt!311383 () Bool)

(assert (=> b!668845 (= lt!311383 e!382630)))

(declare-fun res!435825 () Bool)

(assert (=> b!668845 (=> res!435825 e!382630)))

(declare-fun e!382629 () Bool)

(assert (=> b!668845 (= res!435825 e!382629)))

(declare-fun res!435836 () Bool)

(assert (=> b!668845 (=> (not res!435836) (not e!382629))))

(assert (=> b!668845 (= res!435836 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668846 () Bool)

(assert (=> b!668846 (= e!382629 (contains!3364 lt!311379 k!2843))))

(declare-fun b!668847 () Bool)

(declare-fun res!435827 () Bool)

(assert (=> b!668847 (=> (not res!435827) (not e!382637))))

(assert (=> b!668847 (= res!435827 e!382633)))

(declare-fun res!435830 () Bool)

(assert (=> b!668847 (=> res!435830 e!382633)))

(declare-fun e!382636 () Bool)

(assert (=> b!668847 (= res!435830 e!382636)))

(declare-fun res!435822 () Bool)

(assert (=> b!668847 (=> (not res!435822) (not e!382636))))

(assert (=> b!668847 (= res!435822 (bvsgt from!3004 i!1382))))

(declare-fun b!668848 () Bool)

(assert (=> b!668848 (= e!382636 (contains!3364 acc!681 k!2843))))

(declare-fun b!668849 () Bool)

(declare-fun res!435835 () Bool)

(assert (=> b!668849 (=> res!435835 e!382638)))

(assert (=> b!668849 (= res!435835 (contains!3364 lt!311379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!435818 () Bool)

(assert (=> start!60060 (=> (not res!435818) (not e!382637))))

(assert (=> start!60060 (= res!435818 (and (bvslt (size!19110 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19110 a!3626))))))

(assert (=> start!60060 e!382637))

(assert (=> start!60060 true))

(declare-fun array_inv!14542 (array!39107) Bool)

(assert (=> start!60060 (array_inv!14542 a!3626)))

(declare-fun b!668837 () Bool)

(declare-fun e!382635 () Unit!23455)

(declare-fun Unit!23458 () Unit!23455)

(assert (=> b!668837 (= e!382635 Unit!23458)))

(declare-fun b!668850 () Bool)

(declare-fun Unit!23459 () Unit!23455)

(assert (=> b!668850 (= e!382635 Unit!23459)))

(declare-fun lt!311378 () Unit!23455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39107 (_ BitVec 64) (_ BitVec 32)) Unit!23455)

(assert (=> b!668850 (= lt!311378 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668850 false))

(declare-fun b!668851 () Bool)

(assert (=> b!668851 (= e!382637 (not e!382638))))

(declare-fun res!435832 () Bool)

(assert (=> b!668851 (=> res!435832 e!382638)))

(assert (=> b!668851 (= res!435832 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668851 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311379)))

(declare-fun lt!311377 () Unit!23455)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39107 (_ BitVec 64) (_ BitVec 32) List!12787 List!12787) Unit!23455)

(assert (=> b!668851 (= lt!311377 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311379))))

(declare-fun -!101 (List!12787 (_ BitVec 64)) List!12787)

(assert (=> b!668851 (= (-!101 lt!311379 k!2843) acc!681)))

(assert (=> b!668851 (= lt!311379 ($colon$colon!235 acc!681 k!2843))))

(declare-fun lt!311381 () Unit!23455)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12787) Unit!23455)

(assert (=> b!668851 (= lt!311381 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668851 (subseq!103 acc!681 acc!681)))

(declare-fun lt!311382 () Unit!23455)

(assert (=> b!668851 (= lt!311382 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668851 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311376 () Unit!23455)

(assert (=> b!668851 (= lt!311376 e!382631)))

(declare-fun c!76873 () Bool)

(assert (=> b!668851 (= c!76873 (validKeyInArray!0 (select (arr!18746 a!3626) from!3004)))))

(declare-fun lt!311380 () Unit!23455)

(assert (=> b!668851 (= lt!311380 e!382635)))

(declare-fun c!76874 () Bool)

(assert (=> b!668851 (= c!76874 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668851 (arrayContainsKey!0 (array!39108 (store (arr!18746 a!3626) i!1382 k!2843) (size!19110 a!3626)) k!2843 from!3004)))

(declare-fun b!668852 () Bool)

(assert (=> b!668852 (= e!382634 (not (contains!3364 lt!311379 k!2843)))))

(assert (= (and start!60060 res!435818) b!668839))

(assert (= (and b!668839 res!435828) b!668828))

(assert (= (and b!668828 res!435826) b!668833))

(assert (= (and b!668833 res!435824) b!668847))

(assert (= (and b!668847 res!435822) b!668848))

(assert (= (and b!668847 (not res!435830)) b!668835))

(assert (= (and b!668835 res!435829) b!668831))

(assert (= (and b!668847 res!435827) b!668834))

(assert (= (and b!668834 res!435821) b!668830))

(assert (= (and b!668830 res!435817) b!668840))

(assert (= (and b!668840 res!435833) b!668832))

(assert (= (and b!668832 res!435831) b!668829))

(assert (= (and b!668829 res!435820) b!668838))

(assert (= (and b!668838 res!435816) b!668851))

(assert (= (and b!668851 c!76874) b!668850))

(assert (= (and b!668851 (not c!76874)) b!668837))

(assert (= (and b!668851 c!76873) b!668843))

(assert (= (and b!668851 (not c!76873)) b!668841))

(assert (= (and b!668851 (not res!435832)) b!668844))

(assert (= (and b!668844 (not res!435823)) b!668842))

(assert (= (and b!668842 (not res!435819)) b!668849))

(assert (= (and b!668849 (not res!435835)) b!668845))

(assert (= (and b!668845 res!435836) b!668846))

(assert (= (and b!668845 (not res!435825)) b!668836))

(assert (= (and b!668836 res!435834) b!668852))

(declare-fun m!639061 () Bool)

(assert (=> b!668828 m!639061))

(declare-fun m!639063 () Bool)

(assert (=> b!668849 m!639063))

(declare-fun m!639065 () Bool)

(assert (=> b!668839 m!639065))

(declare-fun m!639067 () Bool)

(assert (=> b!668834 m!639067))

(declare-fun m!639069 () Bool)

(assert (=> b!668831 m!639069))

(declare-fun m!639071 () Bool)

(assert (=> b!668846 m!639071))

(declare-fun m!639073 () Bool)

(assert (=> start!60060 m!639073))

(declare-fun m!639075 () Bool)

(assert (=> b!668833 m!639075))

(declare-fun m!639077 () Bool)

(assert (=> b!668851 m!639077))

(declare-fun m!639079 () Bool)

(assert (=> b!668851 m!639079))

(declare-fun m!639081 () Bool)

(assert (=> b!668851 m!639081))

(declare-fun m!639083 () Bool)

(assert (=> b!668851 m!639083))

(declare-fun m!639085 () Bool)

(assert (=> b!668851 m!639085))

(declare-fun m!639087 () Bool)

(assert (=> b!668851 m!639087))

(declare-fun m!639089 () Bool)

(assert (=> b!668851 m!639089))

(declare-fun m!639091 () Bool)

(assert (=> b!668851 m!639091))

(declare-fun m!639093 () Bool)

(assert (=> b!668851 m!639093))

(assert (=> b!668851 m!639079))

(declare-fun m!639095 () Bool)

(assert (=> b!668851 m!639095))

(declare-fun m!639097 () Bool)

(assert (=> b!668851 m!639097))

(declare-fun m!639099 () Bool)

(assert (=> b!668851 m!639099))

(declare-fun m!639101 () Bool)

(assert (=> b!668851 m!639101))

(assert (=> b!668843 m!639077))

(assert (=> b!668843 m!639079))

(declare-fun m!639103 () Bool)

(assert (=> b!668843 m!639103))

(declare-fun m!639105 () Bool)

(assert (=> b!668843 m!639105))

(assert (=> b!668843 m!639079))

(assert (=> b!668843 m!639103))

(assert (=> b!668843 m!639087))

(assert (=> b!668843 m!639101))

(declare-fun m!639107 () Bool)

(assert (=> b!668850 m!639107))

(assert (=> b!668848 m!639069))

(declare-fun m!639109 () Bool)

(assert (=> b!668842 m!639109))

(declare-fun m!639111 () Bool)

(assert (=> b!668829 m!639111))

(declare-fun m!639113 () Bool)

(assert (=> b!668832 m!639113))

(declare-fun m!639115 () Bool)

(assert (=> b!668830 m!639115))

(assert (=> b!668852 m!639071))

(declare-fun m!639117 () Bool)

(assert (=> b!668844 m!639117))

(push 1)

(assert (not b!668849))

(assert (not start!60060))

(assert (not b!668831))

(assert (not b!668851))

(assert (not b!668832))

(assert (not b!668829))

(assert (not b!668839))

(assert (not b!668850))

(assert (not b!668830))

(assert (not b!668842))

(assert (not b!668828))

(assert (not b!668848))

(assert (not b!668833))

(assert (not b!668844))

(assert (not b!668843))

(assert (not b!668846))

(assert (not b!668834))

(assert (not b!668852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

