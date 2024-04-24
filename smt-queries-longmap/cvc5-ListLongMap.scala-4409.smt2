; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60928 () Bool)

(assert start!60928)

(declare-fun b!682901 () Bool)

(declare-fun res!448742 () Bool)

(declare-fun e!389105 () Bool)

(assert (=> b!682901 (=> (not res!448742) (not e!389105))))

(declare-datatypes ((List!12902 0))(
  ( (Nil!12899) (Cons!12898 (h!13946 (_ BitVec 64)) (t!19137 List!12902)) )
))
(declare-fun acc!681 () List!12902)

(declare-fun contains!3554 (List!12902 (_ BitVec 64)) Bool)

(assert (=> b!682901 (= res!448742 (not (contains!3554 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682902 () Bool)

(declare-fun e!389101 () Bool)

(declare-fun e!389103 () Bool)

(assert (=> b!682902 (= e!389101 e!389103)))

(declare-fun res!448744 () Bool)

(assert (=> b!682902 (=> (not res!448744) (not e!389103))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682902 (= res!448744 (bvsle from!3004 i!1382))))

(declare-fun b!682903 () Bool)

(declare-fun res!448738 () Bool)

(assert (=> b!682903 (=> (not res!448738) (not e!389105))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682903 (= res!448738 (validKeyInArray!0 k!2843))))

(declare-fun b!682904 () Bool)

(declare-datatypes ((Unit!23941 0))(
  ( (Unit!23942) )
))
(declare-fun e!389104 () Unit!23941)

(declare-fun lt!313711 () Unit!23941)

(assert (=> b!682904 (= e!389104 lt!313711)))

(declare-fun lt!313712 () Unit!23941)

(declare-fun lemmaListSubSeqRefl!0 (List!12902) Unit!23941)

(assert (=> b!682904 (= lt!313712 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!163 (List!12902 List!12902) Bool)

(assert (=> b!682904 (subseq!163 acc!681 acc!681)))

(declare-datatypes ((array!39550 0))(
  ( (array!39551 (arr!18954 (Array (_ BitVec 32) (_ BitVec 64))) (size!19318 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39550)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39550 List!12902 List!12902 (_ BitVec 32)) Unit!23941)

(declare-fun $colon$colon!325 (List!12902 (_ BitVec 64)) List!12902)

(assert (=> b!682904 (= lt!313711 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!325 acc!681 (select (arr!18954 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39550 (_ BitVec 32) List!12902) Bool)

(assert (=> b!682904 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!448745 () Bool)

(assert (=> start!60928 (=> (not res!448745) (not e!389105))))

(assert (=> start!60928 (= res!448745 (and (bvslt (size!19318 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19318 a!3626))))))

(assert (=> start!60928 e!389105))

(assert (=> start!60928 true))

(declare-fun array_inv!14813 (array!39550) Bool)

(assert (=> start!60928 (array_inv!14813 a!3626)))

(declare-fun b!682905 () Bool)

(assert (=> b!682905 (= e!389103 (not (contains!3554 acc!681 k!2843)))))

(declare-fun b!682906 () Bool)

(assert (=> b!682906 (= e!389105 (not true))))

(declare-fun -!127 (List!12902 (_ BitVec 64)) List!12902)

(assert (=> b!682906 (= (-!127 ($colon$colon!325 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313710 () Unit!23941)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12902) Unit!23941)

(assert (=> b!682906 (= lt!313710 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!682906 (subseq!163 acc!681 acc!681)))

(declare-fun lt!313713 () Unit!23941)

(assert (=> b!682906 (= lt!313713 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682906 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313709 () Unit!23941)

(assert (=> b!682906 (= lt!313709 e!389104)))

(declare-fun c!77452 () Bool)

(assert (=> b!682906 (= c!77452 (validKeyInArray!0 (select (arr!18954 a!3626) from!3004)))))

(declare-fun lt!313714 () Unit!23941)

(declare-fun e!389106 () Unit!23941)

(assert (=> b!682906 (= lt!313714 e!389106)))

(declare-fun c!77453 () Bool)

(declare-fun arrayContainsKey!0 (array!39550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682906 (= c!77453 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682906 (arrayContainsKey!0 (array!39551 (store (arr!18954 a!3626) i!1382 k!2843) (size!19318 a!3626)) k!2843 from!3004)))

(declare-fun b!682907 () Bool)

(declare-fun res!448746 () Bool)

(assert (=> b!682907 (=> (not res!448746) (not e!389105))))

(assert (=> b!682907 (= res!448746 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19318 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682908 () Bool)

(declare-fun e!389100 () Bool)

(assert (=> b!682908 (= e!389100 (contains!3554 acc!681 k!2843))))

(declare-fun b!682909 () Bool)

(declare-fun res!448743 () Bool)

(assert (=> b!682909 (=> (not res!448743) (not e!389105))))

(assert (=> b!682909 (= res!448743 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12899))))

(declare-fun b!682910 () Bool)

(declare-fun res!448736 () Bool)

(assert (=> b!682910 (=> (not res!448736) (not e!389105))))

(assert (=> b!682910 (= res!448736 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682911 () Bool)

(declare-fun res!448741 () Bool)

(assert (=> b!682911 (=> (not res!448741) (not e!389105))))

(assert (=> b!682911 (= res!448741 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682912 () Bool)

(declare-fun Unit!23943 () Unit!23941)

(assert (=> b!682912 (= e!389106 Unit!23943)))

(declare-fun lt!313708 () Unit!23941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39550 (_ BitVec 64) (_ BitVec 32)) Unit!23941)

(assert (=> b!682912 (= lt!313708 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682912 false))

(declare-fun b!682913 () Bool)

(declare-fun res!448737 () Bool)

(assert (=> b!682913 (=> (not res!448737) (not e!389105))))

(assert (=> b!682913 (= res!448737 (not (contains!3554 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682914 () Bool)

(declare-fun res!448735 () Bool)

(assert (=> b!682914 (=> (not res!448735) (not e!389105))))

(declare-fun noDuplicate!828 (List!12902) Bool)

(assert (=> b!682914 (= res!448735 (noDuplicate!828 acc!681))))

(declare-fun b!682915 () Bool)

(declare-fun Unit!23944 () Unit!23941)

(assert (=> b!682915 (= e!389106 Unit!23944)))

(declare-fun b!682916 () Bool)

(declare-fun Unit!23945 () Unit!23941)

(assert (=> b!682916 (= e!389104 Unit!23945)))

(declare-fun b!682917 () Bool)

(declare-fun res!448734 () Bool)

(assert (=> b!682917 (=> (not res!448734) (not e!389105))))

(assert (=> b!682917 (= res!448734 e!389101)))

(declare-fun res!448740 () Bool)

(assert (=> b!682917 (=> res!448740 e!389101)))

(assert (=> b!682917 (= res!448740 e!389100)))

(declare-fun res!448739 () Bool)

(assert (=> b!682917 (=> (not res!448739) (not e!389100))))

(assert (=> b!682917 (= res!448739 (bvsgt from!3004 i!1382))))

(declare-fun b!682918 () Bool)

(declare-fun res!448747 () Bool)

(assert (=> b!682918 (=> (not res!448747) (not e!389105))))

(assert (=> b!682918 (= res!448747 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19318 a!3626))))))

(assert (= (and start!60928 res!448745) b!682914))

(assert (= (and b!682914 res!448735) b!682913))

(assert (= (and b!682913 res!448737) b!682901))

(assert (= (and b!682901 res!448742) b!682917))

(assert (= (and b!682917 res!448739) b!682908))

(assert (= (and b!682917 (not res!448740)) b!682902))

(assert (= (and b!682902 res!448744) b!682905))

(assert (= (and b!682917 res!448734) b!682909))

(assert (= (and b!682909 res!448743) b!682911))

(assert (= (and b!682911 res!448741) b!682918))

(assert (= (and b!682918 res!448747) b!682903))

(assert (= (and b!682903 res!448738) b!682910))

(assert (= (and b!682910 res!448736) b!682907))

(assert (= (and b!682907 res!448746) b!682906))

(assert (= (and b!682906 c!77453) b!682912))

(assert (= (and b!682906 (not c!77453)) b!682915))

(assert (= (and b!682906 c!77452) b!682904))

(assert (= (and b!682906 (not c!77452)) b!682916))

(declare-fun m!648027 () Bool)

(assert (=> start!60928 m!648027))

(declare-fun m!648029 () Bool)

(assert (=> b!682903 m!648029))

(declare-fun m!648031 () Bool)

(assert (=> b!682913 m!648031))

(declare-fun m!648033 () Bool)

(assert (=> b!682906 m!648033))

(declare-fun m!648035 () Bool)

(assert (=> b!682906 m!648035))

(declare-fun m!648037 () Bool)

(assert (=> b!682906 m!648037))

(declare-fun m!648039 () Bool)

(assert (=> b!682906 m!648039))

(declare-fun m!648041 () Bool)

(assert (=> b!682906 m!648041))

(declare-fun m!648043 () Bool)

(assert (=> b!682906 m!648043))

(declare-fun m!648045 () Bool)

(assert (=> b!682906 m!648045))

(declare-fun m!648047 () Bool)

(assert (=> b!682906 m!648047))

(assert (=> b!682906 m!648033))

(assert (=> b!682906 m!648039))

(declare-fun m!648049 () Bool)

(assert (=> b!682906 m!648049))

(declare-fun m!648051 () Bool)

(assert (=> b!682906 m!648051))

(declare-fun m!648053 () Bool)

(assert (=> b!682906 m!648053))

(declare-fun m!648055 () Bool)

(assert (=> b!682910 m!648055))

(declare-fun m!648057 () Bool)

(assert (=> b!682909 m!648057))

(declare-fun m!648059 () Bool)

(assert (=> b!682905 m!648059))

(assert (=> b!682904 m!648037))

(assert (=> b!682904 m!648039))

(declare-fun m!648061 () Bool)

(assert (=> b!682904 m!648061))

(declare-fun m!648063 () Bool)

(assert (=> b!682904 m!648063))

(assert (=> b!682904 m!648039))

(assert (=> b!682904 m!648061))

(assert (=> b!682904 m!648045))

(assert (=> b!682904 m!648053))

(declare-fun m!648065 () Bool)

(assert (=> b!682914 m!648065))

(declare-fun m!648067 () Bool)

(assert (=> b!682901 m!648067))

(assert (=> b!682908 m!648059))

(declare-fun m!648069 () Bool)

(assert (=> b!682911 m!648069))

(declare-fun m!648071 () Bool)

(assert (=> b!682912 m!648071))

(push 1)

(assert (not b!682911))

(assert (not b!682910))

(assert (not start!60928))

(assert (not b!682906))

(assert (not b!682901))

(assert (not b!682905))

(assert (not b!682908))

(assert (not b!682909))

(assert (not b!682913))

(assert (not b!682914))

(assert (not b!682903))

(assert (not b!682904))

(assert (not b!682912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

