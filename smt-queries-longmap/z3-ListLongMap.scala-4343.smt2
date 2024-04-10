; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60088 () Bool)

(assert start!60088)

(declare-fun b!669883 () Bool)

(declare-fun res!436722 () Bool)

(declare-fun e!383099 () Bool)

(assert (=> b!669883 (=> res!436722 e!383099)))

(declare-datatypes ((List!12801 0))(
  ( (Nil!12798) (Cons!12797 (h!13842 (_ BitVec 64)) (t!19029 List!12801)) )
))
(declare-fun lt!311804 () List!12801)

(declare-fun contains!3378 (List!12801 (_ BitVec 64)) Bool)

(assert (=> b!669883 (= res!436722 (contains!3378 lt!311804 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669884 () Bool)

(declare-fun e!383095 () Bool)

(declare-fun e!383100 () Bool)

(assert (=> b!669884 (= e!383095 e!383100)))

(declare-fun res!436709 () Bool)

(assert (=> b!669884 (=> res!436709 e!383100)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669884 (= res!436709 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669885 () Bool)

(declare-fun e!383096 () Bool)

(assert (=> b!669885 (= e!383096 (not e!383099))))

(declare-fun res!436711 () Bool)

(assert (=> b!669885 (=> res!436711 e!383099)))

(assert (=> b!669885 (= res!436711 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39135 0))(
  ( (array!39136 (arr!18760 (Array (_ BitVec 32) (_ BitVec 64))) (size!19124 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39135)

(declare-fun arrayNoDuplicates!0 (array!39135 (_ BitVec 32) List!12801) Bool)

(assert (=> b!669885 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311804)))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12801)

(declare-datatypes ((Unit!23525 0))(
  ( (Unit!23526) )
))
(declare-fun lt!311806 () Unit!23525)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39135 (_ BitVec 64) (_ BitVec 32) List!12801 List!12801) Unit!23525)

(assert (=> b!669885 (= lt!311806 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311804))))

(declare-fun -!115 (List!12801 (_ BitVec 64)) List!12801)

(assert (=> b!669885 (= (-!115 lt!311804 k0!2843) acc!681)))

(declare-fun $colon$colon!249 (List!12801 (_ BitVec 64)) List!12801)

(assert (=> b!669885 (= lt!311804 ($colon$colon!249 acc!681 k0!2843))))

(declare-fun lt!311799 () Unit!23525)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12801) Unit!23525)

(assert (=> b!669885 (= lt!311799 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!117 (List!12801 List!12801) Bool)

(assert (=> b!669885 (subseq!117 acc!681 acc!681)))

(declare-fun lt!311803 () Unit!23525)

(declare-fun lemmaListSubSeqRefl!0 (List!12801) Unit!23525)

(assert (=> b!669885 (= lt!311803 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669885 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311801 () Unit!23525)

(declare-fun e!383094 () Unit!23525)

(assert (=> b!669885 (= lt!311801 e!383094)))

(declare-fun c!76957 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669885 (= c!76957 (validKeyInArray!0 (select (arr!18760 a!3626) from!3004)))))

(declare-fun lt!311808 () Unit!23525)

(declare-fun e!383098 () Unit!23525)

(assert (=> b!669885 (= lt!311808 e!383098)))

(declare-fun c!76958 () Bool)

(declare-fun arrayContainsKey!0 (array!39135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669885 (= c!76958 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!311805 () array!39135)

(assert (=> b!669885 (arrayContainsKey!0 lt!311805 k0!2843 from!3004)))

(assert (=> b!669885 (= lt!311805 (array!39136 (store (arr!18760 a!3626) i!1382 k0!2843) (size!19124 a!3626)))))

(declare-fun b!669886 () Bool)

(declare-fun Unit!23527 () Unit!23525)

(assert (=> b!669886 (= e!383094 Unit!23527)))

(declare-fun b!669887 () Bool)

(declare-fun res!436720 () Bool)

(assert (=> b!669887 (=> res!436720 e!383099)))

(assert (=> b!669887 (= res!436720 (contains!3378 lt!311804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669888 () Bool)

(declare-fun res!436723 () Bool)

(assert (=> b!669888 (=> (not res!436723) (not e!383096))))

(declare-fun e!383093 () Bool)

(assert (=> b!669888 (= res!436723 e!383093)))

(declare-fun res!436707 () Bool)

(assert (=> b!669888 (=> res!436707 e!383093)))

(declare-fun e!383090 () Bool)

(assert (=> b!669888 (= res!436707 e!383090)))

(declare-fun res!436719 () Bool)

(assert (=> b!669888 (=> (not res!436719) (not e!383090))))

(assert (=> b!669888 (= res!436719 (bvsgt from!3004 i!1382))))

(declare-fun b!669889 () Bool)

(declare-fun res!436714 () Bool)

(assert (=> b!669889 (=> (not res!436714) (not e!383096))))

(assert (=> b!669889 (= res!436714 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19124 a!3626))))))

(declare-fun b!669890 () Bool)

(declare-fun res!436715 () Bool)

(assert (=> b!669890 (=> res!436715 e!383099)))

(assert (=> b!669890 (= res!436715 e!383095)))

(declare-fun res!436710 () Bool)

(assert (=> b!669890 (=> (not res!436710) (not e!383095))))

(declare-fun e!383092 () Bool)

(assert (=> b!669890 (= res!436710 e!383092)))

(declare-fun res!436712 () Bool)

(assert (=> b!669890 (=> res!436712 e!383092)))

(assert (=> b!669890 (= res!436712 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669891 () Bool)

(declare-fun res!436717 () Bool)

(assert (=> b!669891 (=> (not res!436717) (not e!383096))))

(assert (=> b!669891 (= res!436717 (validKeyInArray!0 k0!2843))))

(declare-fun b!669892 () Bool)

(assert (=> b!669892 (= e!383092 (not (contains!3378 lt!311804 k0!2843)))))

(declare-fun b!669894 () Bool)

(declare-fun res!436703 () Bool)

(assert (=> b!669894 (=> (not res!436703) (not e!383096))))

(declare-fun noDuplicate!625 (List!12801) Bool)

(assert (=> b!669894 (= res!436703 (noDuplicate!625 acc!681))))

(declare-fun b!669895 () Bool)

(declare-fun res!436704 () Bool)

(assert (=> b!669895 (=> (not res!436704) (not e!383096))))

(assert (=> b!669895 (= res!436704 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669896 () Bool)

(declare-fun e!383097 () Bool)

(assert (=> b!669896 (= e!383097 (not (contains!3378 acc!681 k0!2843)))))

(declare-fun b!669897 () Bool)

(declare-fun res!436716 () Bool)

(assert (=> b!669897 (=> (not res!436716) (not e!383096))))

(assert (=> b!669897 (= res!436716 (not (contains!3378 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669898 () Bool)

(declare-fun res!436718 () Bool)

(assert (=> b!669898 (=> (not res!436718) (not e!383096))))

(assert (=> b!669898 (= res!436718 (not (contains!3378 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669899 () Bool)

(assert (=> b!669899 (= e!383099 (bvsle from!3004 (size!19124 a!3626)))))

(assert (=> b!669899 (arrayNoDuplicates!0 lt!311805 (bvadd #b00000000000000000000000000000001 from!3004) lt!311804)))

(declare-fun lt!311807 () Unit!23525)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12801) Unit!23525)

(assert (=> b!669899 (= lt!311807 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311804))))

(declare-fun b!669900 () Bool)

(assert (=> b!669900 (= e!383100 (contains!3378 lt!311804 k0!2843))))

(declare-fun b!669901 () Bool)

(declare-fun res!436708 () Bool)

(assert (=> b!669901 (=> (not res!436708) (not e!383096))))

(assert (=> b!669901 (= res!436708 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669902 () Bool)

(assert (=> b!669902 (= e!383090 (contains!3378 acc!681 k0!2843))))

(declare-fun b!669903 () Bool)

(assert (=> b!669903 (= e!383093 e!383097)))

(declare-fun res!436724 () Bool)

(assert (=> b!669903 (=> (not res!436724) (not e!383097))))

(assert (=> b!669903 (= res!436724 (bvsle from!3004 i!1382))))

(declare-fun b!669904 () Bool)

(declare-fun res!436721 () Bool)

(assert (=> b!669904 (=> res!436721 e!383099)))

(assert (=> b!669904 (= res!436721 (not (noDuplicate!625 lt!311804)))))

(declare-fun b!669905 () Bool)

(declare-fun res!436705 () Bool)

(assert (=> b!669905 (=> (not res!436705) (not e!383096))))

(assert (=> b!669905 (= res!436705 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19124 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669906 () Bool)

(declare-fun res!436713 () Bool)

(assert (=> b!669906 (=> (not res!436713) (not e!383096))))

(assert (=> b!669906 (= res!436713 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12798))))

(declare-fun b!669907 () Bool)

(declare-fun lt!311802 () Unit!23525)

(assert (=> b!669907 (= e!383094 lt!311802)))

(declare-fun lt!311800 () Unit!23525)

(assert (=> b!669907 (= lt!311800 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669907 (subseq!117 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39135 List!12801 List!12801 (_ BitVec 32)) Unit!23525)

(assert (=> b!669907 (= lt!311802 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!249 acc!681 (select (arr!18760 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669907 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669908 () Bool)

(declare-fun Unit!23528 () Unit!23525)

(assert (=> b!669908 (= e!383098 Unit!23528)))

(declare-fun b!669893 () Bool)

(declare-fun Unit!23529 () Unit!23525)

(assert (=> b!669893 (= e!383098 Unit!23529)))

(declare-fun lt!311809 () Unit!23525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39135 (_ BitVec 64) (_ BitVec 32)) Unit!23525)

(assert (=> b!669893 (= lt!311809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669893 false))

(declare-fun res!436706 () Bool)

(assert (=> start!60088 (=> (not res!436706) (not e!383096))))

(assert (=> start!60088 (= res!436706 (and (bvslt (size!19124 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19124 a!3626))))))

(assert (=> start!60088 e!383096))

(assert (=> start!60088 true))

(declare-fun array_inv!14556 (array!39135) Bool)

(assert (=> start!60088 (array_inv!14556 a!3626)))

(assert (= (and start!60088 res!436706) b!669894))

(assert (= (and b!669894 res!436703) b!669898))

(assert (= (and b!669898 res!436718) b!669897))

(assert (= (and b!669897 res!436716) b!669888))

(assert (= (and b!669888 res!436719) b!669902))

(assert (= (and b!669888 (not res!436707)) b!669903))

(assert (= (and b!669903 res!436724) b!669896))

(assert (= (and b!669888 res!436723) b!669906))

(assert (= (and b!669906 res!436713) b!669895))

(assert (= (and b!669895 res!436704) b!669889))

(assert (= (and b!669889 res!436714) b!669891))

(assert (= (and b!669891 res!436717) b!669901))

(assert (= (and b!669901 res!436708) b!669905))

(assert (= (and b!669905 res!436705) b!669885))

(assert (= (and b!669885 c!76958) b!669893))

(assert (= (and b!669885 (not c!76958)) b!669908))

(assert (= (and b!669885 c!76957) b!669907))

(assert (= (and b!669885 (not c!76957)) b!669886))

(assert (= (and b!669885 (not res!436711)) b!669904))

(assert (= (and b!669904 (not res!436721)) b!669887))

(assert (= (and b!669887 (not res!436720)) b!669883))

(assert (= (and b!669883 (not res!436722)) b!669890))

(assert (= (and b!669890 (not res!436712)) b!669892))

(assert (= (and b!669890 res!436710) b!669884))

(assert (= (and b!669884 (not res!436709)) b!669900))

(assert (= (and b!669890 (not res!436715)) b!669899))

(declare-fun m!639877 () Bool)

(assert (=> b!669900 m!639877))

(declare-fun m!639879 () Bool)

(assert (=> b!669885 m!639879))

(declare-fun m!639881 () Bool)

(assert (=> b!669885 m!639881))

(declare-fun m!639883 () Bool)

(assert (=> b!669885 m!639883))

(declare-fun m!639885 () Bool)

(assert (=> b!669885 m!639885))

(declare-fun m!639887 () Bool)

(assert (=> b!669885 m!639887))

(declare-fun m!639889 () Bool)

(assert (=> b!669885 m!639889))

(declare-fun m!639891 () Bool)

(assert (=> b!669885 m!639891))

(declare-fun m!639893 () Bool)

(assert (=> b!669885 m!639893))

(declare-fun m!639895 () Bool)

(assert (=> b!669885 m!639895))

(declare-fun m!639897 () Bool)

(assert (=> b!669885 m!639897))

(assert (=> b!669885 m!639893))

(declare-fun m!639899 () Bool)

(assert (=> b!669885 m!639899))

(declare-fun m!639901 () Bool)

(assert (=> b!669885 m!639901))

(declare-fun m!639903 () Bool)

(assert (=> b!669885 m!639903))

(declare-fun m!639905 () Bool)

(assert (=> b!669901 m!639905))

(declare-fun m!639907 () Bool)

(assert (=> b!669897 m!639907))

(declare-fun m!639909 () Bool)

(assert (=> b!669899 m!639909))

(declare-fun m!639911 () Bool)

(assert (=> b!669899 m!639911))

(declare-fun m!639913 () Bool)

(assert (=> b!669898 m!639913))

(assert (=> b!669892 m!639877))

(assert (=> b!669907 m!639881))

(assert (=> b!669907 m!639893))

(declare-fun m!639915 () Bool)

(assert (=> b!669907 m!639915))

(declare-fun m!639917 () Bool)

(assert (=> b!669907 m!639917))

(assert (=> b!669907 m!639893))

(assert (=> b!669907 m!639915))

(assert (=> b!669907 m!639887))

(assert (=> b!669907 m!639897))

(declare-fun m!639919 () Bool)

(assert (=> b!669891 m!639919))

(declare-fun m!639921 () Bool)

(assert (=> b!669906 m!639921))

(declare-fun m!639923 () Bool)

(assert (=> b!669883 m!639923))

(declare-fun m!639925 () Bool)

(assert (=> start!60088 m!639925))

(declare-fun m!639927 () Bool)

(assert (=> b!669894 m!639927))

(declare-fun m!639929 () Bool)

(assert (=> b!669896 m!639929))

(assert (=> b!669902 m!639929))

(declare-fun m!639931 () Bool)

(assert (=> b!669887 m!639931))

(declare-fun m!639933 () Bool)

(assert (=> b!669893 m!639933))

(declare-fun m!639935 () Bool)

(assert (=> b!669904 m!639935))

(declare-fun m!639937 () Bool)

(assert (=> b!669895 m!639937))

(check-sat (not b!669893) (not b!669898) (not b!669897) (not b!669887) (not start!60088) (not b!669883) (not b!669906) (not b!669900) (not b!669894) (not b!669891) (not b!669896) (not b!669892) (not b!669899) (not b!669895) (not b!669901) (not b!669904) (not b!669885) (not b!669907) (not b!669902))
(check-sat)
