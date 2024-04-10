; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60068 () Bool)

(assert start!60068)

(declare-fun b!669128 () Bool)

(declare-fun res!436081 () Bool)

(declare-fun e!382770 () Bool)

(assert (=> b!669128 (=> res!436081 e!382770)))

(declare-datatypes ((List!12791 0))(
  ( (Nil!12788) (Cons!12787 (h!13832 (_ BitVec 64)) (t!19019 List!12791)) )
))
(declare-fun lt!311495 () List!12791)

(declare-fun contains!3368 (List!12791 (_ BitVec 64)) Bool)

(assert (=> b!669128 (= res!436081 (contains!3368 lt!311495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669129 () Bool)

(declare-fun e!382766 () Bool)

(declare-fun e!382763 () Bool)

(assert (=> b!669129 (= e!382766 e!382763)))

(declare-fun res!436071 () Bool)

(assert (=> b!669129 (=> (not res!436071) (not e!382763))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669129 (= res!436071 (bvsle from!3004 i!1382))))

(declare-fun b!669130 () Bool)

(declare-fun res!436088 () Bool)

(declare-fun e!382764 () Bool)

(assert (=> b!669130 (=> (not res!436088) (not e!382764))))

(declare-fun acc!681 () List!12791)

(declare-fun noDuplicate!615 (List!12791) Bool)

(assert (=> b!669130 (= res!436088 (noDuplicate!615 acc!681))))

(declare-fun b!669131 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!669131 (= e!382763 (not (contains!3368 acc!681 k!2843)))))

(declare-fun b!669132 () Bool)

(declare-fun res!436068 () Bool)

(assert (=> b!669132 (=> res!436068 e!382770)))

(assert (=> b!669132 (= res!436068 (not (noDuplicate!615 lt!311495)))))

(declare-fun b!669133 () Bool)

(declare-fun res!436085 () Bool)

(assert (=> b!669133 (=> (not res!436085) (not e!382764))))

(declare-datatypes ((array!39115 0))(
  ( (array!39116 (arr!18750 (Array (_ BitVec 32) (_ BitVec 64))) (size!19114 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39115)

(assert (=> b!669133 (= res!436085 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19114 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669134 () Bool)

(declare-datatypes ((Unit!23475 0))(
  ( (Unit!23476) )
))
(declare-fun e!382769 () Unit!23475)

(declare-fun Unit!23477 () Unit!23475)

(assert (=> b!669134 (= e!382769 Unit!23477)))

(declare-fun b!669135 () Bool)

(declare-fun e!382767 () Bool)

(declare-fun e!382760 () Bool)

(assert (=> b!669135 (= e!382767 e!382760)))

(declare-fun res!436077 () Bool)

(assert (=> b!669135 (=> (not res!436077) (not e!382760))))

(assert (=> b!669135 (= res!436077 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669136 () Bool)

(declare-fun Unit!23478 () Unit!23475)

(assert (=> b!669136 (= e!382769 Unit!23478)))

(declare-fun lt!311496 () Unit!23475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39115 (_ BitVec 64) (_ BitVec 32)) Unit!23475)

(assert (=> b!669136 (= lt!311496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669136 false))

(declare-fun b!669137 () Bool)

(declare-fun e!382762 () Unit!23475)

(declare-fun Unit!23479 () Unit!23475)

(assert (=> b!669137 (= e!382762 Unit!23479)))

(declare-fun res!436069 () Bool)

(assert (=> start!60068 (=> (not res!436069) (not e!382764))))

(assert (=> start!60068 (= res!436069 (and (bvslt (size!19114 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19114 a!3626))))))

(assert (=> start!60068 e!382764))

(assert (=> start!60068 true))

(declare-fun array_inv!14546 (array!39115) Bool)

(assert (=> start!60068 (array_inv!14546 a!3626)))

(declare-fun b!669138 () Bool)

(assert (=> b!669138 (= e!382764 (not e!382770))))

(declare-fun res!436087 () Bool)

(assert (=> b!669138 (=> res!436087 e!382770)))

(assert (=> b!669138 (= res!436087 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39115 (_ BitVec 32) List!12791) Bool)

(assert (=> b!669138 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311495)))

(declare-fun lt!311498 () Unit!23475)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39115 (_ BitVec 64) (_ BitVec 32) List!12791 List!12791) Unit!23475)

(assert (=> b!669138 (= lt!311498 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311495))))

(declare-fun -!105 (List!12791 (_ BitVec 64)) List!12791)

(assert (=> b!669138 (= (-!105 lt!311495 k!2843) acc!681)))

(declare-fun $colon$colon!239 (List!12791 (_ BitVec 64)) List!12791)

(assert (=> b!669138 (= lt!311495 ($colon$colon!239 acc!681 k!2843))))

(declare-fun lt!311499 () Unit!23475)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12791) Unit!23475)

(assert (=> b!669138 (= lt!311499 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!107 (List!12791 List!12791) Bool)

(assert (=> b!669138 (subseq!107 acc!681 acc!681)))

(declare-fun lt!311500 () Unit!23475)

(declare-fun lemmaListSubSeqRefl!0 (List!12791) Unit!23475)

(assert (=> b!669138 (= lt!311500 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669138 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311503 () Unit!23475)

(assert (=> b!669138 (= lt!311503 e!382762)))

(declare-fun c!76897 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669138 (= c!76897 (validKeyInArray!0 (select (arr!18750 a!3626) from!3004)))))

(declare-fun lt!311501 () Unit!23475)

(assert (=> b!669138 (= lt!311501 e!382769)))

(declare-fun c!76898 () Bool)

(declare-fun arrayContainsKey!0 (array!39115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669138 (= c!76898 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669138 (arrayContainsKey!0 (array!39116 (store (arr!18750 a!3626) i!1382 k!2843) (size!19114 a!3626)) k!2843 from!3004)))

(declare-fun b!669139 () Bool)

(declare-fun res!436072 () Bool)

(assert (=> b!669139 (=> (not res!436072) (not e!382764))))

(assert (=> b!669139 (= res!436072 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669140 () Bool)

(declare-fun res!436078 () Bool)

(assert (=> b!669140 (=> res!436078 e!382770)))

(assert (=> b!669140 (= res!436078 (contains!3368 lt!311495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669141 () Bool)

(declare-fun e!382765 () Bool)

(assert (=> b!669141 (= e!382765 (contains!3368 lt!311495 k!2843))))

(declare-fun b!669142 () Bool)

(declare-fun res!436084 () Bool)

(assert (=> b!669142 (=> (not res!436084) (not e!382764))))

(assert (=> b!669142 (= res!436084 e!382766)))

(declare-fun res!436075 () Bool)

(assert (=> b!669142 (=> res!436075 e!382766)))

(declare-fun e!382768 () Bool)

(assert (=> b!669142 (= res!436075 e!382768)))

(declare-fun res!436083 () Bool)

(assert (=> b!669142 (=> (not res!436083) (not e!382768))))

(assert (=> b!669142 (= res!436083 (bvsgt from!3004 i!1382))))

(declare-fun b!669143 () Bool)

(assert (=> b!669143 (= e!382768 (contains!3368 acc!681 k!2843))))

(declare-fun b!669144 () Bool)

(assert (=> b!669144 (= e!382770 true)))

(declare-fun lt!311502 () Bool)

(assert (=> b!669144 (= lt!311502 e!382767)))

(declare-fun res!436080 () Bool)

(assert (=> b!669144 (=> res!436080 e!382767)))

(assert (=> b!669144 (= res!436080 e!382765)))

(declare-fun res!436073 () Bool)

(assert (=> b!669144 (=> (not res!436073) (not e!382765))))

(assert (=> b!669144 (= res!436073 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669145 () Bool)

(declare-fun res!436074 () Bool)

(assert (=> b!669145 (=> (not res!436074) (not e!382764))))

(assert (=> b!669145 (= res!436074 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19114 a!3626))))))

(declare-fun b!669146 () Bool)

(declare-fun res!436076 () Bool)

(assert (=> b!669146 (=> (not res!436076) (not e!382764))))

(assert (=> b!669146 (= res!436076 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669147 () Bool)

(declare-fun res!436079 () Bool)

(assert (=> b!669147 (=> (not res!436079) (not e!382764))))

(assert (=> b!669147 (= res!436079 (not (contains!3368 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669148 () Bool)

(declare-fun res!436070 () Bool)

(assert (=> b!669148 (=> (not res!436070) (not e!382764))))

(assert (=> b!669148 (= res!436070 (not (contains!3368 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669149 () Bool)

(declare-fun lt!311494 () Unit!23475)

(assert (=> b!669149 (= e!382762 lt!311494)))

(declare-fun lt!311497 () Unit!23475)

(assert (=> b!669149 (= lt!311497 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669149 (subseq!107 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39115 List!12791 List!12791 (_ BitVec 32)) Unit!23475)

(assert (=> b!669149 (= lt!311494 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!239 acc!681 (select (arr!18750 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669149 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669150 () Bool)

(declare-fun res!436082 () Bool)

(assert (=> b!669150 (=> (not res!436082) (not e!382764))))

(assert (=> b!669150 (= res!436082 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12788))))

(declare-fun b!669151 () Bool)

(declare-fun res!436086 () Bool)

(assert (=> b!669151 (=> (not res!436086) (not e!382764))))

(assert (=> b!669151 (= res!436086 (validKeyInArray!0 k!2843))))

(declare-fun b!669152 () Bool)

(assert (=> b!669152 (= e!382760 (not (contains!3368 lt!311495 k!2843)))))

(assert (= (and start!60068 res!436069) b!669130))

(assert (= (and b!669130 res!436088) b!669147))

(assert (= (and b!669147 res!436079) b!669148))

(assert (= (and b!669148 res!436070) b!669142))

(assert (= (and b!669142 res!436083) b!669143))

(assert (= (and b!669142 (not res!436075)) b!669129))

(assert (= (and b!669129 res!436071) b!669131))

(assert (= (and b!669142 res!436084) b!669150))

(assert (= (and b!669150 res!436082) b!669146))

(assert (= (and b!669146 res!436076) b!669145))

(assert (= (and b!669145 res!436074) b!669151))

(assert (= (and b!669151 res!436086) b!669139))

(assert (= (and b!669139 res!436072) b!669133))

(assert (= (and b!669133 res!436085) b!669138))

(assert (= (and b!669138 c!76898) b!669136))

(assert (= (and b!669138 (not c!76898)) b!669134))

(assert (= (and b!669138 c!76897) b!669149))

(assert (= (and b!669138 (not c!76897)) b!669137))

(assert (= (and b!669138 (not res!436087)) b!669132))

(assert (= (and b!669132 (not res!436068)) b!669128))

(assert (= (and b!669128 (not res!436081)) b!669140))

(assert (= (and b!669140 (not res!436078)) b!669144))

(assert (= (and b!669144 res!436073) b!669141))

(assert (= (and b!669144 (not res!436080)) b!669135))

(assert (= (and b!669135 res!436077) b!669152))

(declare-fun m!639293 () Bool)

(assert (=> b!669130 m!639293))

(declare-fun m!639295 () Bool)

(assert (=> b!669131 m!639295))

(declare-fun m!639297 () Bool)

(assert (=> b!669132 m!639297))

(declare-fun m!639299 () Bool)

(assert (=> b!669148 m!639299))

(declare-fun m!639301 () Bool)

(assert (=> b!669141 m!639301))

(declare-fun m!639303 () Bool)

(assert (=> b!669146 m!639303))

(declare-fun m!639305 () Bool)

(assert (=> b!669140 m!639305))

(declare-fun m!639307 () Bool)

(assert (=> b!669139 m!639307))

(declare-fun m!639309 () Bool)

(assert (=> b!669128 m!639309))

(declare-fun m!639311 () Bool)

(assert (=> start!60068 m!639311))

(declare-fun m!639313 () Bool)

(assert (=> b!669136 m!639313))

(assert (=> b!669152 m!639301))

(declare-fun m!639315 () Bool)

(assert (=> b!669150 m!639315))

(declare-fun m!639317 () Bool)

(assert (=> b!669151 m!639317))

(declare-fun m!639319 () Bool)

(assert (=> b!669149 m!639319))

(declare-fun m!639321 () Bool)

(assert (=> b!669149 m!639321))

(declare-fun m!639323 () Bool)

(assert (=> b!669149 m!639323))

(declare-fun m!639325 () Bool)

(assert (=> b!669149 m!639325))

(assert (=> b!669149 m!639321))

(assert (=> b!669149 m!639323))

(declare-fun m!639327 () Bool)

(assert (=> b!669149 m!639327))

(declare-fun m!639329 () Bool)

(assert (=> b!669149 m!639329))

(assert (=> b!669143 m!639295))

(declare-fun m!639331 () Bool)

(assert (=> b!669138 m!639331))

(assert (=> b!669138 m!639319))

(assert (=> b!669138 m!639321))

(declare-fun m!639333 () Bool)

(assert (=> b!669138 m!639333))

(declare-fun m!639335 () Bool)

(assert (=> b!669138 m!639335))

(declare-fun m!639337 () Bool)

(assert (=> b!669138 m!639337))

(declare-fun m!639339 () Bool)

(assert (=> b!669138 m!639339))

(assert (=> b!669138 m!639327))

(declare-fun m!639341 () Bool)

(assert (=> b!669138 m!639341))

(declare-fun m!639343 () Bool)

(assert (=> b!669138 m!639343))

(assert (=> b!669138 m!639321))

(declare-fun m!639345 () Bool)

(assert (=> b!669138 m!639345))

(declare-fun m!639347 () Bool)

(assert (=> b!669138 m!639347))

(assert (=> b!669138 m!639329))

(declare-fun m!639349 () Bool)

(assert (=> b!669147 m!639349))

(push 1)

(assert (not b!669147))

(assert (not b!669131))

(assert (not b!669130))

(assert (not b!669128))

(assert (not b!669143))

(assert (not b!669138))

(assert (not b!669151))

(assert (not start!60068))

(assert (not b!669140))

(assert (not b!669149))

(assert (not b!669141))

(assert (not b!669139))

(assert (not b!669148))

(assert (not b!669132))

