; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60130 () Bool)

(assert start!60130)

(declare-fun b!669502 () Bool)

(declare-fun res!436323 () Bool)

(declare-fun e!382969 () Bool)

(assert (=> b!669502 (=> (not res!436323) (not e!382969))))

(declare-datatypes ((List!12695 0))(
  ( (Nil!12692) (Cons!12691 (h!13739 (_ BitVec 64)) (t!18915 List!12695)) )
))
(declare-fun acc!681 () List!12695)

(declare-fun noDuplicate!621 (List!12695) Bool)

(assert (=> b!669502 (= res!436323 (noDuplicate!621 acc!681))))

(declare-fun b!669504 () Bool)

(declare-datatypes ((Unit!23464 0))(
  ( (Unit!23465) )
))
(declare-fun e!382967 () Unit!23464)

(declare-fun Unit!23466 () Unit!23464)

(assert (=> b!669504 (= e!382967 Unit!23466)))

(declare-fun b!669505 () Bool)

(declare-fun e!382972 () Unit!23464)

(declare-fun Unit!23467 () Unit!23464)

(assert (=> b!669505 (= e!382972 Unit!23467)))

(declare-fun b!669506 () Bool)

(declare-fun e!382971 () Bool)

(declare-fun lt!311661 () List!12695)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3347 (List!12695 (_ BitVec 64)) Bool)

(assert (=> b!669506 (= e!382971 (not (contains!3347 lt!311661 k!2843)))))

(declare-fun b!669507 () Bool)

(declare-fun res!436313 () Bool)

(declare-fun e!382976 () Bool)

(assert (=> b!669507 (=> res!436313 e!382976)))

(assert (=> b!669507 (= res!436313 (contains!3347 lt!311661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669508 () Bool)

(declare-fun res!436309 () Bool)

(assert (=> b!669508 (=> (not res!436309) (not e!382969))))

(declare-datatypes ((array!39115 0))(
  ( (array!39116 (arr!18747 (Array (_ BitVec 32) (_ BitVec 64))) (size!19111 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39115)

(declare-fun arrayContainsKey!0 (array!39115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669508 (= res!436309 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669509 () Bool)

(declare-fun res!436317 () Bool)

(assert (=> b!669509 (=> (not res!436317) (not e!382969))))

(declare-fun e!382970 () Bool)

(assert (=> b!669509 (= res!436317 e!382970)))

(declare-fun res!436311 () Bool)

(assert (=> b!669509 (=> res!436311 e!382970)))

(declare-fun e!382968 () Bool)

(assert (=> b!669509 (= res!436311 e!382968)))

(declare-fun res!436326 () Bool)

(assert (=> b!669509 (=> (not res!436326) (not e!382968))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669509 (= res!436326 (bvsgt from!3004 i!1382))))

(declare-fun b!669510 () Bool)

(declare-fun res!436316 () Bool)

(assert (=> b!669510 (=> (not res!436316) (not e!382969))))

(assert (=> b!669510 (= res!436316 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19111 a!3626))))))

(declare-fun b!669511 () Bool)

(declare-fun e!382977 () Bool)

(assert (=> b!669511 (= e!382970 e!382977)))

(declare-fun res!436319 () Bool)

(assert (=> b!669511 (=> (not res!436319) (not e!382977))))

(assert (=> b!669511 (= res!436319 (bvsle from!3004 i!1382))))

(declare-fun b!669512 () Bool)

(declare-fun e!382974 () Bool)

(assert (=> b!669512 (= e!382974 e!382971)))

(declare-fun res!436320 () Bool)

(assert (=> b!669512 (=> (not res!436320) (not e!382971))))

(assert (=> b!669512 (= res!436320 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669513 () Bool)

(assert (=> b!669513 (= e!382969 (not e!382976))))

(declare-fun res!436321 () Bool)

(assert (=> b!669513 (=> res!436321 e!382976)))

(assert (=> b!669513 (= res!436321 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39115 (_ BitVec 32) List!12695) Bool)

(assert (=> b!669513 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311661)))

(declare-fun lt!311658 () Unit!23464)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39115 (_ BitVec 64) (_ BitVec 32) List!12695 List!12695) Unit!23464)

(assert (=> b!669513 (= lt!311658 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311661))))

(declare-fun -!106 (List!12695 (_ BitVec 64)) List!12695)

(assert (=> b!669513 (= (-!106 lt!311661 k!2843) acc!681)))

(declare-fun $colon$colon!238 (List!12695 (_ BitVec 64)) List!12695)

(assert (=> b!669513 (= lt!311661 ($colon$colon!238 acc!681 k!2843))))

(declare-fun lt!311659 () Unit!23464)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12695) Unit!23464)

(assert (=> b!669513 (= lt!311659 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!109 (List!12695 List!12695) Bool)

(assert (=> b!669513 (subseq!109 acc!681 acc!681)))

(declare-fun lt!311665 () Unit!23464)

(declare-fun lemmaListSubSeqRefl!0 (List!12695) Unit!23464)

(assert (=> b!669513 (= lt!311665 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669513 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311662 () Unit!23464)

(assert (=> b!669513 (= lt!311662 e!382972)))

(declare-fun c!76967 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669513 (= c!76967 (validKeyInArray!0 (select (arr!18747 a!3626) from!3004)))))

(declare-fun lt!311663 () Unit!23464)

(assert (=> b!669513 (= lt!311663 e!382967)))

(declare-fun c!76966 () Bool)

(assert (=> b!669513 (= c!76966 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669513 (arrayContainsKey!0 (array!39116 (store (arr!18747 a!3626) i!1382 k!2843) (size!19111 a!3626)) k!2843 from!3004)))

(declare-fun b!669514 () Bool)

(declare-fun res!436315 () Bool)

(assert (=> b!669514 (=> (not res!436315) (not e!382969))))

(assert (=> b!669514 (= res!436315 (not (contains!3347 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669515 () Bool)

(declare-fun res!436314 () Bool)

(assert (=> b!669515 (=> (not res!436314) (not e!382969))))

(assert (=> b!669515 (= res!436314 (validKeyInArray!0 k!2843))))

(declare-fun b!669516 () Bool)

(declare-fun res!436322 () Bool)

(assert (=> b!669516 (=> res!436322 e!382976)))

(assert (=> b!669516 (= res!436322 (contains!3347 lt!311661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669517 () Bool)

(declare-fun res!436307 () Bool)

(assert (=> b!669517 (=> (not res!436307) (not e!382969))))

(assert (=> b!669517 (= res!436307 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19111 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669518 () Bool)

(assert (=> b!669518 (= e!382976 true)))

(declare-fun lt!311657 () Bool)

(assert (=> b!669518 (= lt!311657 e!382974)))

(declare-fun res!436318 () Bool)

(assert (=> b!669518 (=> res!436318 e!382974)))

(declare-fun e!382975 () Bool)

(assert (=> b!669518 (= res!436318 e!382975)))

(declare-fun res!436327 () Bool)

(assert (=> b!669518 (=> (not res!436327) (not e!382975))))

(assert (=> b!669518 (= res!436327 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!436312 () Bool)

(assert (=> start!60130 (=> (not res!436312) (not e!382969))))

(assert (=> start!60130 (= res!436312 (and (bvslt (size!19111 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19111 a!3626))))))

(assert (=> start!60130 e!382969))

(assert (=> start!60130 true))

(declare-fun array_inv!14606 (array!39115) Bool)

(assert (=> start!60130 (array_inv!14606 a!3626)))

(declare-fun b!669503 () Bool)

(declare-fun res!436310 () Bool)

(assert (=> b!669503 (=> (not res!436310) (not e!382969))))

(assert (=> b!669503 (= res!436310 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12692))))

(declare-fun b!669519 () Bool)

(assert (=> b!669519 (= e!382975 (contains!3347 lt!311661 k!2843))))

(declare-fun b!669520 () Bool)

(declare-fun res!436308 () Bool)

(assert (=> b!669520 (=> (not res!436308) (not e!382969))))

(assert (=> b!669520 (= res!436308 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669521 () Bool)

(declare-fun res!436324 () Bool)

(assert (=> b!669521 (=> (not res!436324) (not e!382969))))

(assert (=> b!669521 (= res!436324 (not (contains!3347 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669522 () Bool)

(declare-fun res!436325 () Bool)

(assert (=> b!669522 (=> res!436325 e!382976)))

(assert (=> b!669522 (= res!436325 (not (noDuplicate!621 lt!311661)))))

(declare-fun b!669523 () Bool)

(declare-fun Unit!23468 () Unit!23464)

(assert (=> b!669523 (= e!382967 Unit!23468)))

(declare-fun lt!311664 () Unit!23464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39115 (_ BitVec 64) (_ BitVec 32)) Unit!23464)

(assert (=> b!669523 (= lt!311664 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669523 false))

(declare-fun b!669524 () Bool)

(declare-fun lt!311660 () Unit!23464)

(assert (=> b!669524 (= e!382972 lt!311660)))

(declare-fun lt!311656 () Unit!23464)

(assert (=> b!669524 (= lt!311656 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669524 (subseq!109 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39115 List!12695 List!12695 (_ BitVec 32)) Unit!23464)

(assert (=> b!669524 (= lt!311660 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!238 acc!681 (select (arr!18747 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669524 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669525 () Bool)

(assert (=> b!669525 (= e!382977 (not (contains!3347 acc!681 k!2843)))))

(declare-fun b!669526 () Bool)

(assert (=> b!669526 (= e!382968 (contains!3347 acc!681 k!2843))))

(assert (= (and start!60130 res!436312) b!669502))

(assert (= (and b!669502 res!436323) b!669514))

(assert (= (and b!669514 res!436315) b!669521))

(assert (= (and b!669521 res!436324) b!669509))

(assert (= (and b!669509 res!436326) b!669526))

(assert (= (and b!669509 (not res!436311)) b!669511))

(assert (= (and b!669511 res!436319) b!669525))

(assert (= (and b!669509 res!436317) b!669503))

(assert (= (and b!669503 res!436310) b!669520))

(assert (= (and b!669520 res!436308) b!669510))

(assert (= (and b!669510 res!436316) b!669515))

(assert (= (and b!669515 res!436314) b!669508))

(assert (= (and b!669508 res!436309) b!669517))

(assert (= (and b!669517 res!436307) b!669513))

(assert (= (and b!669513 c!76966) b!669523))

(assert (= (and b!669513 (not c!76966)) b!669504))

(assert (= (and b!669513 c!76967) b!669524))

(assert (= (and b!669513 (not c!76967)) b!669505))

(assert (= (and b!669513 (not res!436321)) b!669522))

(assert (= (and b!669522 (not res!436325)) b!669516))

(assert (= (and b!669516 (not res!436322)) b!669507))

(assert (= (and b!669507 (not res!436313)) b!669518))

(assert (= (and b!669518 res!436327) b!669519))

(assert (= (and b!669518 (not res!436318)) b!669512))

(assert (= (and b!669512 res!436320) b!669506))

(declare-fun m!640107 () Bool)

(assert (=> b!669516 m!640107))

(declare-fun m!640109 () Bool)

(assert (=> b!669522 m!640109))

(declare-fun m!640111 () Bool)

(assert (=> b!669513 m!640111))

(declare-fun m!640113 () Bool)

(assert (=> b!669513 m!640113))

(declare-fun m!640115 () Bool)

(assert (=> b!669513 m!640115))

(declare-fun m!640117 () Bool)

(assert (=> b!669513 m!640117))

(declare-fun m!640119 () Bool)

(assert (=> b!669513 m!640119))

(declare-fun m!640121 () Bool)

(assert (=> b!669513 m!640121))

(assert (=> b!669513 m!640119))

(declare-fun m!640123 () Bool)

(assert (=> b!669513 m!640123))

(declare-fun m!640125 () Bool)

(assert (=> b!669513 m!640125))

(declare-fun m!640127 () Bool)

(assert (=> b!669513 m!640127))

(declare-fun m!640129 () Bool)

(assert (=> b!669513 m!640129))

(declare-fun m!640131 () Bool)

(assert (=> b!669513 m!640131))

(declare-fun m!640133 () Bool)

(assert (=> b!669513 m!640133))

(declare-fun m!640135 () Bool)

(assert (=> b!669513 m!640135))

(declare-fun m!640137 () Bool)

(assert (=> b!669523 m!640137))

(declare-fun m!640139 () Bool)

(assert (=> b!669508 m!640139))

(declare-fun m!640141 () Bool)

(assert (=> b!669521 m!640141))

(declare-fun m!640143 () Bool)

(assert (=> start!60130 m!640143))

(assert (=> b!669524 m!640111))

(assert (=> b!669524 m!640119))

(declare-fun m!640145 () Bool)

(assert (=> b!669524 m!640145))

(declare-fun m!640147 () Bool)

(assert (=> b!669524 m!640147))

(assert (=> b!669524 m!640119))

(assert (=> b!669524 m!640145))

(assert (=> b!669524 m!640115))

(assert (=> b!669524 m!640135))

(declare-fun m!640149 () Bool)

(assert (=> b!669507 m!640149))

(declare-fun m!640151 () Bool)

(assert (=> b!669515 m!640151))

(declare-fun m!640153 () Bool)

(assert (=> b!669514 m!640153))

(declare-fun m!640155 () Bool)

(assert (=> b!669503 m!640155))

(declare-fun m!640157 () Bool)

(assert (=> b!669525 m!640157))

(declare-fun m!640159 () Bool)

(assert (=> b!669506 m!640159))

(assert (=> b!669526 m!640157))

(declare-fun m!640161 () Bool)

(assert (=> b!669520 m!640161))

(declare-fun m!640163 () Bool)

(assert (=> b!669502 m!640163))

(assert (=> b!669519 m!640159))

(push 1)

(assert (not b!669507))

(assert (not start!60130))

(assert (not b!669513))

(assert (not b!669526))

(assert (not b!669508))

(assert (not b!669514))

(assert (not b!669523))

(assert (not b!669515))

(assert (not b!669520))

(assert (not b!669522))

(assert (not b!669521))

(assert (not b!669506))

(assert (not b!669503))

(assert (not b!669502))

(assert (not b!669524))

(assert (not b!669519))

(assert (not b!669516))

(assert (not b!669525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

