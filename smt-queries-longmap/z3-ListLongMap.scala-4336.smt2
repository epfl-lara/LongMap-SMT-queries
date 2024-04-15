; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60032 () Bool)

(assert start!60032)

(declare-fun b!667932 () Bool)

(declare-fun e!382174 () Bool)

(declare-datatypes ((List!12817 0))(
  ( (Nil!12814) (Cons!12813 (h!13858 (_ BitVec 64)) (t!19036 List!12817)) )
))
(declare-fun acc!681 () List!12817)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3339 (List!12817 (_ BitVec 64)) Bool)

(assert (=> b!667932 (= e!382174 (not (contains!3339 acc!681 k0!2843)))))

(declare-fun b!667933 () Bool)

(declare-fun res!435183 () Bool)

(declare-fun e!382175 () Bool)

(assert (=> b!667933 (=> (not res!435183) (not e!382175))))

(declare-datatypes ((array!39090 0))(
  ( (array!39091 (arr!18737 (Array (_ BitVec 32) (_ BitVec 64))) (size!19102 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39090)

(declare-fun arrayContainsKey!0 (array!39090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667933 (= res!435183 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667934 () Bool)

(declare-fun e!382182 () Bool)

(assert (=> b!667934 (= e!382182 true)))

(declare-fun lt!310884 () Bool)

(declare-fun e!382179 () Bool)

(assert (=> b!667934 (= lt!310884 e!382179)))

(declare-fun res!435182 () Bool)

(assert (=> b!667934 (=> res!435182 e!382179)))

(declare-fun e!382181 () Bool)

(assert (=> b!667934 (= res!435182 e!382181)))

(declare-fun res!435176 () Bool)

(assert (=> b!667934 (=> (not res!435176) (not e!382181))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667934 (= res!435176 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667935 () Bool)

(declare-fun res!435177 () Bool)

(assert (=> b!667935 (=> (not res!435177) (not e!382175))))

(assert (=> b!667935 (= res!435177 (not (contains!3339 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!435185 () Bool)

(assert (=> start!60032 (=> (not res!435185) (not e!382175))))

(assert (=> start!60032 (= res!435185 (and (bvslt (size!19102 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19102 a!3626))))))

(assert (=> start!60032 e!382175))

(assert (=> start!60032 true))

(declare-fun array_inv!14620 (array!39090) Bool)

(assert (=> start!60032 (array_inv!14620 a!3626)))

(declare-fun b!667936 () Bool)

(assert (=> b!667936 (= e!382175 (not e!382182))))

(declare-fun res!435194 () Bool)

(assert (=> b!667936 (=> res!435194 e!382182)))

(assert (=> b!667936 (= res!435194 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310883 () List!12817)

(declare-fun arrayNoDuplicates!0 (array!39090 (_ BitVec 32) List!12817) Bool)

(assert (=> b!667936 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310883)))

(declare-datatypes ((Unit!23393 0))(
  ( (Unit!23394) )
))
(declare-fun lt!310878 () Unit!23393)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39090 (_ BitVec 64) (_ BitVec 32) List!12817 List!12817) Unit!23393)

(assert (=> b!667936 (= lt!310878 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310883))))

(declare-fun -!93 (List!12817 (_ BitVec 64)) List!12817)

(assert (=> b!667936 (= (-!93 lt!310883 k0!2843) acc!681)))

(declare-fun $colon$colon!226 (List!12817 (_ BitVec 64)) List!12817)

(assert (=> b!667936 (= lt!310883 ($colon$colon!226 acc!681 k0!2843))))

(declare-fun lt!310881 () Unit!23393)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12817) Unit!23393)

(assert (=> b!667936 (= lt!310881 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!95 (List!12817 List!12817) Bool)

(assert (=> b!667936 (subseq!95 acc!681 acc!681)))

(declare-fun lt!310885 () Unit!23393)

(declare-fun lemmaListSubSeqRefl!0 (List!12817) Unit!23393)

(assert (=> b!667936 (= lt!310885 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667936 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310886 () Unit!23393)

(declare-fun e!382178 () Unit!23393)

(assert (=> b!667936 (= lt!310886 e!382178)))

(declare-fun c!76745 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667936 (= c!76745 (validKeyInArray!0 (select (arr!18737 a!3626) from!3004)))))

(declare-fun lt!310879 () Unit!23393)

(declare-fun e!382176 () Unit!23393)

(assert (=> b!667936 (= lt!310879 e!382176)))

(declare-fun c!76746 () Bool)

(assert (=> b!667936 (= c!76746 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667936 (arrayContainsKey!0 (array!39091 (store (arr!18737 a!3626) i!1382 k0!2843) (size!19102 a!3626)) k0!2843 from!3004)))

(declare-fun b!667937 () Bool)

(assert (=> b!667937 (= e!382181 (contains!3339 lt!310883 k0!2843))))

(declare-fun b!667938 () Bool)

(declare-fun res!435180 () Bool)

(assert (=> b!667938 (=> (not res!435180) (not e!382175))))

(assert (=> b!667938 (= res!435180 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667939 () Bool)

(declare-fun res!435190 () Bool)

(assert (=> b!667939 (=> (not res!435190) (not e!382175))))

(assert (=> b!667939 (= res!435190 (not (contains!3339 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667940 () Bool)

(declare-fun res!435188 () Bool)

(assert (=> b!667940 (=> (not res!435188) (not e!382175))))

(declare-fun e!382183 () Bool)

(assert (=> b!667940 (= res!435188 e!382183)))

(declare-fun res!435179 () Bool)

(assert (=> b!667940 (=> res!435179 e!382183)))

(declare-fun e!382184 () Bool)

(assert (=> b!667940 (= res!435179 e!382184)))

(declare-fun res!435187 () Bool)

(assert (=> b!667940 (=> (not res!435187) (not e!382184))))

(assert (=> b!667940 (= res!435187 (bvsgt from!3004 i!1382))))

(declare-fun b!667941 () Bool)

(declare-fun res!435193 () Bool)

(assert (=> b!667941 (=> res!435193 e!382182)))

(assert (=> b!667941 (= res!435193 (contains!3339 lt!310883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667942 () Bool)

(declare-fun res!435178 () Bool)

(assert (=> b!667942 (=> (not res!435178) (not e!382175))))

(declare-fun noDuplicate!608 (List!12817) Bool)

(assert (=> b!667942 (= res!435178 (noDuplicate!608 acc!681))))

(declare-fun b!667943 () Bool)

(declare-fun res!435184 () Bool)

(assert (=> b!667943 (=> (not res!435184) (not e!382175))))

(assert (=> b!667943 (= res!435184 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19102 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667944 () Bool)

(declare-fun res!435192 () Bool)

(assert (=> b!667944 (=> (not res!435192) (not e!382175))))

(assert (=> b!667944 (= res!435192 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12814))))

(declare-fun b!667945 () Bool)

(declare-fun res!435181 () Bool)

(assert (=> b!667945 (=> (not res!435181) (not e!382175))))

(assert (=> b!667945 (= res!435181 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19102 a!3626))))))

(declare-fun b!667946 () Bool)

(declare-fun Unit!23395 () Unit!23393)

(assert (=> b!667946 (= e!382178 Unit!23395)))

(declare-fun b!667947 () Bool)

(declare-fun e!382177 () Bool)

(assert (=> b!667947 (= e!382179 e!382177)))

(declare-fun res!435191 () Bool)

(assert (=> b!667947 (=> (not res!435191) (not e!382177))))

(assert (=> b!667947 (= res!435191 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667948 () Bool)

(assert (=> b!667948 (= e!382177 (not (contains!3339 lt!310883 k0!2843)))))

(declare-fun b!667949 () Bool)

(assert (=> b!667949 (= e!382183 e!382174)))

(declare-fun res!435186 () Bool)

(assert (=> b!667949 (=> (not res!435186) (not e!382174))))

(assert (=> b!667949 (= res!435186 (bvsle from!3004 i!1382))))

(declare-fun b!667950 () Bool)

(declare-fun res!435195 () Bool)

(assert (=> b!667950 (=> res!435195 e!382182)))

(assert (=> b!667950 (= res!435195 (not (noDuplicate!608 lt!310883)))))

(declare-fun b!667951 () Bool)

(declare-fun Unit!23396 () Unit!23393)

(assert (=> b!667951 (= e!382176 Unit!23396)))

(declare-fun b!667952 () Bool)

(declare-fun res!435189 () Bool)

(assert (=> b!667952 (=> res!435189 e!382182)))

(assert (=> b!667952 (= res!435189 (contains!3339 lt!310883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667953 () Bool)

(declare-fun lt!310887 () Unit!23393)

(assert (=> b!667953 (= e!382178 lt!310887)))

(declare-fun lt!310880 () Unit!23393)

(assert (=> b!667953 (= lt!310880 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667953 (subseq!95 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39090 List!12817 List!12817 (_ BitVec 32)) Unit!23393)

(assert (=> b!667953 (= lt!310887 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!226 acc!681 (select (arr!18737 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667953 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667954 () Bool)

(declare-fun res!435196 () Bool)

(assert (=> b!667954 (=> (not res!435196) (not e!382175))))

(assert (=> b!667954 (= res!435196 (validKeyInArray!0 k0!2843))))

(declare-fun b!667955 () Bool)

(assert (=> b!667955 (= e!382184 (contains!3339 acc!681 k0!2843))))

(declare-fun b!667956 () Bool)

(declare-fun Unit!23397 () Unit!23393)

(assert (=> b!667956 (= e!382176 Unit!23397)))

(declare-fun lt!310882 () Unit!23393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39090 (_ BitVec 64) (_ BitVec 32)) Unit!23393)

(assert (=> b!667956 (= lt!310882 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667956 false))

(assert (= (and start!60032 res!435185) b!667942))

(assert (= (and b!667942 res!435178) b!667939))

(assert (= (and b!667939 res!435190) b!667935))

(assert (= (and b!667935 res!435177) b!667940))

(assert (= (and b!667940 res!435187) b!667955))

(assert (= (and b!667940 (not res!435179)) b!667949))

(assert (= (and b!667949 res!435186) b!667932))

(assert (= (and b!667940 res!435188) b!667944))

(assert (= (and b!667944 res!435192) b!667938))

(assert (= (and b!667938 res!435180) b!667945))

(assert (= (and b!667945 res!435181) b!667954))

(assert (= (and b!667954 res!435196) b!667933))

(assert (= (and b!667933 res!435183) b!667943))

(assert (= (and b!667943 res!435184) b!667936))

(assert (= (and b!667936 c!76746) b!667956))

(assert (= (and b!667936 (not c!76746)) b!667951))

(assert (= (and b!667936 c!76745) b!667953))

(assert (= (and b!667936 (not c!76745)) b!667946))

(assert (= (and b!667936 (not res!435194)) b!667950))

(assert (= (and b!667950 (not res!435195)) b!667952))

(assert (= (and b!667952 (not res!435189)) b!667941))

(assert (= (and b!667941 (not res!435193)) b!667934))

(assert (= (and b!667934 res!435176) b!667937))

(assert (= (and b!667934 (not res!435182)) b!667947))

(assert (= (and b!667947 res!435191) b!667948))

(declare-fun m!637815 () Bool)

(assert (=> b!667956 m!637815))

(declare-fun m!637817 () Bool)

(assert (=> b!667950 m!637817))

(declare-fun m!637819 () Bool)

(assert (=> b!667939 m!637819))

(declare-fun m!637821 () Bool)

(assert (=> b!667953 m!637821))

(declare-fun m!637823 () Bool)

(assert (=> b!667953 m!637823))

(declare-fun m!637825 () Bool)

(assert (=> b!667953 m!637825))

(declare-fun m!637827 () Bool)

(assert (=> b!667953 m!637827))

(assert (=> b!667953 m!637823))

(assert (=> b!667953 m!637825))

(declare-fun m!637829 () Bool)

(assert (=> b!667953 m!637829))

(declare-fun m!637831 () Bool)

(assert (=> b!667953 m!637831))

(declare-fun m!637833 () Bool)

(assert (=> b!667941 m!637833))

(declare-fun m!637835 () Bool)

(assert (=> b!667935 m!637835))

(declare-fun m!637837 () Bool)

(assert (=> start!60032 m!637837))

(declare-fun m!637839 () Bool)

(assert (=> b!667938 m!637839))

(declare-fun m!637841 () Bool)

(assert (=> b!667955 m!637841))

(declare-fun m!637843 () Bool)

(assert (=> b!667944 m!637843))

(declare-fun m!637845 () Bool)

(assert (=> b!667933 m!637845))

(declare-fun m!637847 () Bool)

(assert (=> b!667942 m!637847))

(declare-fun m!637849 () Bool)

(assert (=> b!667936 m!637849))

(assert (=> b!667936 m!637823))

(declare-fun m!637851 () Bool)

(assert (=> b!667936 m!637851))

(declare-fun m!637853 () Bool)

(assert (=> b!667936 m!637853))

(assert (=> b!667936 m!637829))

(declare-fun m!637855 () Bool)

(assert (=> b!667936 m!637855))

(declare-fun m!637857 () Bool)

(assert (=> b!667936 m!637857))

(declare-fun m!637859 () Bool)

(assert (=> b!667936 m!637859))

(assert (=> b!667936 m!637823))

(declare-fun m!637861 () Bool)

(assert (=> b!667936 m!637861))

(declare-fun m!637863 () Bool)

(assert (=> b!667936 m!637863))

(assert (=> b!667936 m!637821))

(declare-fun m!637865 () Bool)

(assert (=> b!667936 m!637865))

(assert (=> b!667936 m!637831))

(declare-fun m!637867 () Bool)

(assert (=> b!667937 m!637867))

(declare-fun m!637869 () Bool)

(assert (=> b!667952 m!637869))

(declare-fun m!637871 () Bool)

(assert (=> b!667954 m!637871))

(assert (=> b!667948 m!637867))

(assert (=> b!667932 m!637841))

(check-sat (not b!667933) (not b!667937) (not b!667936) (not b!667948) (not b!667944) (not b!667950) (not b!667954) (not b!667942) (not b!667939) (not b!667941) (not b!667955) (not b!667935) (not b!667932) (not start!60032) (not b!667952) (not b!667953) (not b!667956) (not b!667938))
(check-sat)
