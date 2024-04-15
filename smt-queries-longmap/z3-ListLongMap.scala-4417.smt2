; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60980 () Bool)

(assert start!60980)

(declare-fun b!683878 () Bool)

(declare-fun res!449656 () Bool)

(declare-fun e!389486 () Bool)

(assert (=> b!683878 (=> (not res!449656) (not e!389486))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39600 0))(
  ( (array!39601 (arr!18980 (Array (_ BitVec 32) (_ BitVec 64))) (size!19347 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39600)

(assert (=> b!683878 (= res!449656 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19347 a!3626))))))

(declare-fun b!683879 () Bool)

(declare-fun res!449667 () Bool)

(declare-fun e!389485 () Bool)

(assert (=> b!683879 (=> res!449667 e!389485)))

(declare-datatypes ((List!13060 0))(
  ( (Nil!13057) (Cons!13056 (h!14101 (_ BitVec 64)) (t!19297 List!13060)) )
))
(declare-fun lt!313944 () List!13060)

(declare-fun noDuplicate!851 (List!13060) Bool)

(assert (=> b!683879 (= res!449667 (not (noDuplicate!851 lt!313944)))))

(declare-fun b!683880 () Bool)

(declare-fun res!449661 () Bool)

(assert (=> b!683880 (=> (not res!449661) (not e!389486))))

(declare-fun e!389484 () Bool)

(assert (=> b!683880 (= res!449661 e!389484)))

(declare-fun res!449653 () Bool)

(assert (=> b!683880 (=> res!449653 e!389484)))

(declare-fun e!389479 () Bool)

(assert (=> b!683880 (= res!449653 e!389479)))

(declare-fun res!449664 () Bool)

(assert (=> b!683880 (=> (not res!449664) (not e!389479))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!683880 (= res!449664 (bvsgt from!3004 i!1382))))

(declare-fun b!683881 () Bool)

(declare-datatypes ((Unit!24050 0))(
  ( (Unit!24051) )
))
(declare-fun e!389481 () Unit!24050)

(declare-fun Unit!24052 () Unit!24050)

(assert (=> b!683881 (= e!389481 Unit!24052)))

(declare-fun b!683882 () Bool)

(declare-fun lt!313945 () Unit!24050)

(assert (=> b!683882 (= e!389481 lt!313945)))

(declare-fun lt!313948 () Unit!24050)

(declare-fun acc!681 () List!13060)

(declare-fun lemmaListSubSeqRefl!0 (List!13060) Unit!24050)

(assert (=> b!683882 (= lt!313948 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!185 (List!13060 List!13060) Bool)

(assert (=> b!683882 (subseq!185 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39600 List!13060 List!13060 (_ BitVec 32)) Unit!24050)

(declare-fun $colon$colon!349 (List!13060 (_ BitVec 64)) List!13060)

(assert (=> b!683882 (= lt!313945 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!349 acc!681 (select (arr!18980 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39600 (_ BitVec 32) List!13060) Bool)

(assert (=> b!683882 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683883 () Bool)

(declare-fun res!449658 () Bool)

(assert (=> b!683883 (=> (not res!449658) (not e!389486))))

(assert (=> b!683883 (= res!449658 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683884 () Bool)

(declare-fun res!449660 () Bool)

(assert (=> b!683884 (=> (not res!449660) (not e!389486))))

(assert (=> b!683884 (= res!449660 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19347 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683885 () Bool)

(declare-fun res!449662 () Bool)

(assert (=> b!683885 (=> (not res!449662) (not e!389486))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683885 (= res!449662 (validKeyInArray!0 k0!2843))))

(declare-fun b!683886 () Bool)

(declare-fun e!389480 () Unit!24050)

(declare-fun Unit!24053 () Unit!24050)

(assert (=> b!683886 (= e!389480 Unit!24053)))

(declare-fun lt!313949 () Unit!24050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39600 (_ BitVec 64) (_ BitVec 32)) Unit!24050)

(assert (=> b!683886 (= lt!313949 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683886 false))

(declare-fun b!683887 () Bool)

(declare-fun res!449663 () Bool)

(assert (=> b!683887 (=> (not res!449663) (not e!389486))))

(assert (=> b!683887 (= res!449663 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13057))))

(declare-fun b!683888 () Bool)

(declare-fun Unit!24054 () Unit!24050)

(assert (=> b!683888 (= e!389480 Unit!24054)))

(declare-fun b!683889 () Bool)

(declare-fun e!389482 () Bool)

(declare-fun contains!3582 (List!13060 (_ BitVec 64)) Bool)

(assert (=> b!683889 (= e!389482 (not (contains!3582 acc!681 k0!2843)))))

(declare-fun res!449659 () Bool)

(assert (=> start!60980 (=> (not res!449659) (not e!389486))))

(assert (=> start!60980 (= res!449659 (and (bvslt (size!19347 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19347 a!3626))))))

(assert (=> start!60980 e!389486))

(assert (=> start!60980 true))

(declare-fun array_inv!14863 (array!39600) Bool)

(assert (=> start!60980 (array_inv!14863 a!3626)))

(declare-fun b!683890 () Bool)

(assert (=> b!683890 (= e!389484 e!389482)))

(declare-fun res!449654 () Bool)

(assert (=> b!683890 (=> (not res!449654) (not e!389482))))

(assert (=> b!683890 (= res!449654 (bvsle from!3004 i!1382))))

(declare-fun b!683891 () Bool)

(assert (=> b!683891 (= e!389479 (contains!3582 acc!681 k0!2843))))

(declare-fun b!683892 () Bool)

(declare-fun res!449665 () Bool)

(assert (=> b!683892 (=> (not res!449665) (not e!389486))))

(declare-fun arrayContainsKey!0 (array!39600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683892 (= res!449665 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683893 () Bool)

(assert (=> b!683893 (= e!389486 (not e!389485))))

(declare-fun res!449666 () Bool)

(assert (=> b!683893 (=> res!449666 e!389485)))

(assert (=> b!683893 (= res!449666 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!150 (List!13060 (_ BitVec 64)) List!13060)

(assert (=> b!683893 (= (-!150 lt!313944 k0!2843) acc!681)))

(assert (=> b!683893 (= lt!313944 ($colon$colon!349 acc!681 k0!2843))))

(declare-fun lt!313946 () Unit!24050)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13060) Unit!24050)

(assert (=> b!683893 (= lt!313946 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!683893 (subseq!185 acc!681 acc!681)))

(declare-fun lt!313941 () Unit!24050)

(assert (=> b!683893 (= lt!313941 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683893 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313943 () Unit!24050)

(assert (=> b!683893 (= lt!313943 e!389481)))

(declare-fun c!77481 () Bool)

(assert (=> b!683893 (= c!77481 (validKeyInArray!0 (select (arr!18980 a!3626) from!3004)))))

(declare-fun lt!313950 () Unit!24050)

(assert (=> b!683893 (= lt!313950 e!389480)))

(declare-fun c!77480 () Bool)

(declare-fun lt!313942 () Bool)

(assert (=> b!683893 (= c!77480 lt!313942)))

(assert (=> b!683893 (= lt!313942 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683893 (arrayContainsKey!0 (array!39601 (store (arr!18980 a!3626) i!1382 k0!2843) (size!19347 a!3626)) k0!2843 from!3004)))

(declare-fun b!683894 () Bool)

(declare-fun res!449668 () Bool)

(assert (=> b!683894 (=> res!449668 e!389485)))

(assert (=> b!683894 (= res!449668 lt!313942)))

(declare-fun b!683895 () Bool)

(declare-fun res!449652 () Bool)

(assert (=> b!683895 (=> (not res!449652) (not e!389486))))

(assert (=> b!683895 (= res!449652 (not (contains!3582 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683896 () Bool)

(assert (=> b!683896 (= e!389485 true)))

(declare-fun lt!313947 () Bool)

(assert (=> b!683896 (= lt!313947 (contains!3582 acc!681 k0!2843))))

(declare-fun b!683897 () Bool)

(declare-fun res!449657 () Bool)

(assert (=> b!683897 (=> (not res!449657) (not e!389486))))

(assert (=> b!683897 (= res!449657 (noDuplicate!851 acc!681))))

(declare-fun b!683898 () Bool)

(declare-fun res!449655 () Bool)

(assert (=> b!683898 (=> (not res!449655) (not e!389486))))

(assert (=> b!683898 (= res!449655 (not (contains!3582 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60980 res!449659) b!683897))

(assert (= (and b!683897 res!449657) b!683898))

(assert (= (and b!683898 res!449655) b!683895))

(assert (= (and b!683895 res!449652) b!683880))

(assert (= (and b!683880 res!449664) b!683891))

(assert (= (and b!683880 (not res!449653)) b!683890))

(assert (= (and b!683890 res!449654) b!683889))

(assert (= (and b!683880 res!449661) b!683887))

(assert (= (and b!683887 res!449663) b!683883))

(assert (= (and b!683883 res!449658) b!683878))

(assert (= (and b!683878 res!449656) b!683885))

(assert (= (and b!683885 res!449662) b!683892))

(assert (= (and b!683892 res!449665) b!683884))

(assert (= (and b!683884 res!449660) b!683893))

(assert (= (and b!683893 c!77480) b!683886))

(assert (= (and b!683893 (not c!77480)) b!683888))

(assert (= (and b!683893 c!77481) b!683882))

(assert (= (and b!683893 (not c!77481)) b!683881))

(assert (= (and b!683893 (not res!449666)) b!683879))

(assert (= (and b!683879 (not res!449667)) b!683894))

(assert (= (and b!683894 (not res!449668)) b!683896))

(declare-fun m!647811 () Bool)

(assert (=> b!683896 m!647811))

(assert (=> b!683889 m!647811))

(declare-fun m!647813 () Bool)

(assert (=> b!683882 m!647813))

(declare-fun m!647815 () Bool)

(assert (=> b!683882 m!647815))

(declare-fun m!647817 () Bool)

(assert (=> b!683882 m!647817))

(declare-fun m!647819 () Bool)

(assert (=> b!683882 m!647819))

(assert (=> b!683882 m!647815))

(assert (=> b!683882 m!647817))

(declare-fun m!647821 () Bool)

(assert (=> b!683882 m!647821))

(declare-fun m!647823 () Bool)

(assert (=> b!683882 m!647823))

(declare-fun m!647825 () Bool)

(assert (=> b!683892 m!647825))

(declare-fun m!647827 () Bool)

(assert (=> b!683897 m!647827))

(declare-fun m!647829 () Bool)

(assert (=> b!683893 m!647829))

(assert (=> b!683893 m!647813))

(assert (=> b!683893 m!647815))

(declare-fun m!647831 () Bool)

(assert (=> b!683893 m!647831))

(declare-fun m!647833 () Bool)

(assert (=> b!683893 m!647833))

(assert (=> b!683893 m!647821))

(declare-fun m!647835 () Bool)

(assert (=> b!683893 m!647835))

(declare-fun m!647837 () Bool)

(assert (=> b!683893 m!647837))

(assert (=> b!683893 m!647815))

(declare-fun m!647839 () Bool)

(assert (=> b!683893 m!647839))

(declare-fun m!647841 () Bool)

(assert (=> b!683893 m!647841))

(assert (=> b!683893 m!647823))

(declare-fun m!647843 () Bool)

(assert (=> start!60980 m!647843))

(declare-fun m!647845 () Bool)

(assert (=> b!683895 m!647845))

(declare-fun m!647847 () Bool)

(assert (=> b!683887 m!647847))

(assert (=> b!683891 m!647811))

(declare-fun m!647849 () Bool)

(assert (=> b!683898 m!647849))

(declare-fun m!647851 () Bool)

(assert (=> b!683885 m!647851))

(declare-fun m!647853 () Bool)

(assert (=> b!683883 m!647853))

(declare-fun m!647855 () Bool)

(assert (=> b!683886 m!647855))

(declare-fun m!647857 () Bool)

(assert (=> b!683879 m!647857))

(check-sat (not b!683885) (not b!683892) (not b!683898) (not b!683891) (not b!683895) (not b!683883) (not b!683882) (not b!683897) (not b!683879) (not b!683886) (not b!683896) (not b!683887) (not b!683889) (not start!60980) (not b!683893))
(check-sat)
