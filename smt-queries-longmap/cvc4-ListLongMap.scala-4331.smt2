; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60018 () Bool)

(assert start!60018)

(declare-fun b!667253 () Bool)

(declare-datatypes ((Unit!23350 0))(
  ( (Unit!23351) )
))
(declare-fun e!381941 () Unit!23350)

(declare-fun Unit!23352 () Unit!23350)

(assert (=> b!667253 (= e!381941 Unit!23352)))

(declare-fun lt!310744 () Unit!23350)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39065 0))(
  ( (array!39066 (arr!18725 (Array (_ BitVec 32) (_ BitVec 64))) (size!19089 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39065 (_ BitVec 64) (_ BitVec 32)) Unit!23350)

(assert (=> b!667253 (= lt!310744 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667253 false))

(declare-fun b!667254 () Bool)

(declare-fun res!434498 () Bool)

(declare-fun e!381944 () Bool)

(assert (=> b!667254 (=> res!434498 e!381944)))

(declare-datatypes ((List!12766 0))(
  ( (Nil!12763) (Cons!12762 (h!13807 (_ BitVec 64)) (t!18994 List!12766)) )
))
(declare-fun lt!310749 () List!12766)

(declare-fun noDuplicate!590 (List!12766) Bool)

(assert (=> b!667254 (= res!434498 (not (noDuplicate!590 lt!310749)))))

(declare-fun b!667255 () Bool)

(declare-fun res!434495 () Bool)

(declare-fun e!381945 () Bool)

(assert (=> b!667255 (=> (not res!434495) (not e!381945))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667255 (= res!434495 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19089 a!3626))))))

(declare-fun b!667256 () Bool)

(declare-fun res!434497 () Bool)

(assert (=> b!667256 (=> (not res!434497) (not e!381945))))

(declare-fun acc!681 () List!12766)

(declare-fun arrayNoDuplicates!0 (array!39065 (_ BitVec 32) List!12766) Bool)

(assert (=> b!667256 (= res!434497 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667257 () Bool)

(declare-fun res!434501 () Bool)

(assert (=> b!667257 (=> res!434501 e!381944)))

(declare-fun contains!3343 (List!12766 (_ BitVec 64)) Bool)

(assert (=> b!667257 (= res!434501 (not (contains!3343 lt!310749 k!2843)))))

(declare-fun b!667258 () Bool)

(declare-fun res!434507 () Bool)

(assert (=> b!667258 (=> (not res!434507) (not e!381945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667258 (= res!434507 (validKeyInArray!0 k!2843))))

(declare-fun b!667259 () Bool)

(assert (=> b!667259 (= e!381944 true)))

(declare-fun lt!310752 () Bool)

(assert (=> b!667259 (= lt!310752 (contains!3343 lt!310749 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667260 () Bool)

(declare-fun res!434513 () Bool)

(assert (=> b!667260 (=> res!434513 e!381944)))

(declare-fun lt!310748 () Bool)

(assert (=> b!667260 (= res!434513 lt!310748)))

(declare-fun b!667261 () Bool)

(declare-fun e!381940 () Bool)

(assert (=> b!667261 (= e!381940 (not (contains!3343 acc!681 k!2843)))))

(declare-fun b!667262 () Bool)

(declare-fun res!434505 () Bool)

(assert (=> b!667262 (=> res!434505 e!381944)))

(assert (=> b!667262 (= res!434505 (contains!3343 lt!310749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667263 () Bool)

(declare-fun res!434500 () Bool)

(assert (=> b!667263 (=> (not res!434500) (not e!381945))))

(assert (=> b!667263 (= res!434500 (not (contains!3343 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667264 () Bool)

(declare-fun res!434506 () Bool)

(assert (=> b!667264 (=> (not res!434506) (not e!381945))))

(declare-fun arrayContainsKey!0 (array!39065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667264 (= res!434506 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667265 () Bool)

(declare-fun res!434494 () Bool)

(assert (=> b!667265 (=> res!434494 e!381944)))

(assert (=> b!667265 (= res!434494 (contains!3343 acc!681 k!2843))))

(declare-fun b!667266 () Bool)

(declare-fun res!434502 () Bool)

(assert (=> b!667266 (=> (not res!434502) (not e!381945))))

(assert (=> b!667266 (= res!434502 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19089 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667267 () Bool)

(declare-fun res!434512 () Bool)

(assert (=> b!667267 (=> (not res!434512) (not e!381945))))

(assert (=> b!667267 (= res!434512 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12763))))

(declare-fun res!434499 () Bool)

(assert (=> start!60018 (=> (not res!434499) (not e!381945))))

(assert (=> start!60018 (= res!434499 (and (bvslt (size!19089 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19089 a!3626))))))

(assert (=> start!60018 e!381945))

(assert (=> start!60018 true))

(declare-fun array_inv!14521 (array!39065) Bool)

(assert (=> start!60018 (array_inv!14521 a!3626)))

(declare-fun b!667268 () Bool)

(declare-fun Unit!23353 () Unit!23350)

(assert (=> b!667268 (= e!381941 Unit!23353)))

(declare-fun b!667269 () Bool)

(assert (=> b!667269 (= e!381945 (not e!381944))))

(declare-fun res!434496 () Bool)

(assert (=> b!667269 (=> res!434496 e!381944)))

(assert (=> b!667269 (= res!434496 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!80 (List!12766 (_ BitVec 64)) List!12766)

(assert (=> b!667269 (= (-!80 lt!310749 k!2843) acc!681)))

(declare-fun $colon$colon!214 (List!12766 (_ BitVec 64)) List!12766)

(assert (=> b!667269 (= lt!310749 ($colon$colon!214 acc!681 k!2843))))

(declare-fun lt!310746 () Unit!23350)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12766) Unit!23350)

(assert (=> b!667269 (= lt!310746 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!82 (List!12766 List!12766) Bool)

(assert (=> b!667269 (subseq!82 acc!681 acc!681)))

(declare-fun lt!310747 () Unit!23350)

(declare-fun lemmaListSubSeqRefl!0 (List!12766) Unit!23350)

(assert (=> b!667269 (= lt!310747 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667269 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310751 () Unit!23350)

(declare-fun e!381938 () Unit!23350)

(assert (=> b!667269 (= lt!310751 e!381938)))

(declare-fun c!76747 () Bool)

(assert (=> b!667269 (= c!76747 (validKeyInArray!0 (select (arr!18725 a!3626) from!3004)))))

(declare-fun lt!310745 () Unit!23350)

(assert (=> b!667269 (= lt!310745 e!381941)))

(declare-fun c!76748 () Bool)

(assert (=> b!667269 (= c!76748 lt!310748)))

(assert (=> b!667269 (= lt!310748 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667269 (arrayContainsKey!0 (array!39066 (store (arr!18725 a!3626) i!1382 k!2843) (size!19089 a!3626)) k!2843 from!3004)))

(declare-fun b!667270 () Bool)

(declare-fun res!434504 () Bool)

(assert (=> b!667270 (=> (not res!434504) (not e!381945))))

(declare-fun e!381943 () Bool)

(assert (=> b!667270 (= res!434504 e!381943)))

(declare-fun res!434509 () Bool)

(assert (=> b!667270 (=> res!434509 e!381943)))

(declare-fun e!381942 () Bool)

(assert (=> b!667270 (= res!434509 e!381942)))

(declare-fun res!434508 () Bool)

(assert (=> b!667270 (=> (not res!434508) (not e!381942))))

(assert (=> b!667270 (= res!434508 (bvsgt from!3004 i!1382))))

(declare-fun b!667271 () Bool)

(declare-fun res!434493 () Bool)

(assert (=> b!667271 (=> (not res!434493) (not e!381945))))

(assert (=> b!667271 (= res!434493 (noDuplicate!590 acc!681))))

(declare-fun b!667272 () Bool)

(declare-fun Unit!23354 () Unit!23350)

(assert (=> b!667272 (= e!381938 Unit!23354)))

(declare-fun b!667273 () Bool)

(assert (=> b!667273 (= e!381942 (contains!3343 acc!681 k!2843))))

(declare-fun b!667274 () Bool)

(declare-fun res!434510 () Bool)

(assert (=> b!667274 (=> res!434510 e!381944)))

(assert (=> b!667274 (= res!434510 (not (subseq!82 acc!681 lt!310749)))))

(declare-fun b!667275 () Bool)

(declare-fun res!434511 () Bool)

(assert (=> b!667275 (=> (not res!434511) (not e!381945))))

(assert (=> b!667275 (= res!434511 (not (contains!3343 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667276 () Bool)

(assert (=> b!667276 (= e!381943 e!381940)))

(declare-fun res!434503 () Bool)

(assert (=> b!667276 (=> (not res!434503) (not e!381940))))

(assert (=> b!667276 (= res!434503 (bvsle from!3004 i!1382))))

(declare-fun b!667277 () Bool)

(declare-fun lt!310750 () Unit!23350)

(assert (=> b!667277 (= e!381938 lt!310750)))

(declare-fun lt!310753 () Unit!23350)

(assert (=> b!667277 (= lt!310753 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667277 (subseq!82 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39065 List!12766 List!12766 (_ BitVec 32)) Unit!23350)

(assert (=> b!667277 (= lt!310750 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!214 acc!681 (select (arr!18725 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667277 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60018 res!434499) b!667271))

(assert (= (and b!667271 res!434493) b!667263))

(assert (= (and b!667263 res!434500) b!667275))

(assert (= (and b!667275 res!434511) b!667270))

(assert (= (and b!667270 res!434508) b!667273))

(assert (= (and b!667270 (not res!434509)) b!667276))

(assert (= (and b!667276 res!434503) b!667261))

(assert (= (and b!667270 res!434504) b!667267))

(assert (= (and b!667267 res!434512) b!667256))

(assert (= (and b!667256 res!434497) b!667255))

(assert (= (and b!667255 res!434495) b!667258))

(assert (= (and b!667258 res!434507) b!667264))

(assert (= (and b!667264 res!434506) b!667266))

(assert (= (and b!667266 res!434502) b!667269))

(assert (= (and b!667269 c!76748) b!667253))

(assert (= (and b!667269 (not c!76748)) b!667268))

(assert (= (and b!667269 c!76747) b!667277))

(assert (= (and b!667269 (not c!76747)) b!667272))

(assert (= (and b!667269 (not res!434496)) b!667254))

(assert (= (and b!667254 (not res!434498)) b!667260))

(assert (= (and b!667260 (not res!434513)) b!667265))

(assert (= (and b!667265 (not res!434494)) b!667274))

(assert (= (and b!667274 (not res!434510)) b!667257))

(assert (= (and b!667257 (not res!434501)) b!667262))

(assert (= (and b!667262 (not res!434505)) b!667259))

(declare-fun m!637845 () Bool)

(assert (=> b!667265 m!637845))

(declare-fun m!637847 () Bool)

(assert (=> b!667258 m!637847))

(declare-fun m!637849 () Bool)

(assert (=> b!667254 m!637849))

(declare-fun m!637851 () Bool)

(assert (=> b!667274 m!637851))

(declare-fun m!637853 () Bool)

(assert (=> b!667262 m!637853))

(declare-fun m!637855 () Bool)

(assert (=> b!667269 m!637855))

(declare-fun m!637857 () Bool)

(assert (=> b!667269 m!637857))

(declare-fun m!637859 () Bool)

(assert (=> b!667269 m!637859))

(declare-fun m!637861 () Bool)

(assert (=> b!667269 m!637861))

(declare-fun m!637863 () Bool)

(assert (=> b!667269 m!637863))

(declare-fun m!637865 () Bool)

(assert (=> b!667269 m!637865))

(declare-fun m!637867 () Bool)

(assert (=> b!667269 m!637867))

(assert (=> b!667269 m!637857))

(declare-fun m!637869 () Bool)

(assert (=> b!667269 m!637869))

(declare-fun m!637871 () Bool)

(assert (=> b!667269 m!637871))

(declare-fun m!637873 () Bool)

(assert (=> b!667269 m!637873))

(declare-fun m!637875 () Bool)

(assert (=> b!667269 m!637875))

(declare-fun m!637877 () Bool)

(assert (=> b!667264 m!637877))

(declare-fun m!637879 () Bool)

(assert (=> b!667256 m!637879))

(assert (=> b!667277 m!637855))

(assert (=> b!667277 m!637857))

(declare-fun m!637881 () Bool)

(assert (=> b!667277 m!637881))

(declare-fun m!637883 () Bool)

(assert (=> b!667277 m!637883))

(assert (=> b!667277 m!637857))

(assert (=> b!667277 m!637881))

(assert (=> b!667277 m!637863))

(assert (=> b!667277 m!637875))

(declare-fun m!637885 () Bool)

(assert (=> b!667271 m!637885))

(declare-fun m!637887 () Bool)

(assert (=> start!60018 m!637887))

(declare-fun m!637889 () Bool)

(assert (=> b!667267 m!637889))

(assert (=> b!667273 m!637845))

(assert (=> b!667261 m!637845))

(declare-fun m!637891 () Bool)

(assert (=> b!667259 m!637891))

(declare-fun m!637893 () Bool)

(assert (=> b!667275 m!637893))

(declare-fun m!637895 () Bool)

(assert (=> b!667257 m!637895))

(declare-fun m!637897 () Bool)

(assert (=> b!667263 m!637897))

(declare-fun m!637899 () Bool)

(assert (=> b!667253 m!637899))

(push 1)

(assert (not b!667267))

(assert (not b!667274))

(assert (not b!667271))

(assert (not b!667257))

(assert (not b!667263))

(assert (not b!667254))

(assert (not b!667259))

(assert (not b!667261))

(assert (not b!667277))

(assert (not b!667262))

(assert (not b!667265))

(assert (not b!667275))

(assert (not b!667269))

(assert (not b!667273))

(assert (not b!667256))

(assert (not b!667253))

(assert (not b!667264))

(assert (not b!667258))

(assert (not start!60018))

(check-sat)

