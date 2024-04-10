; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60042 () Bool)

(assert start!60042)

(declare-fun b!668153 () Bool)

(declare-datatypes ((Unit!23410 0))(
  ( (Unit!23411) )
))
(declare-fun e!382333 () Unit!23410)

(declare-fun Unit!23412 () Unit!23410)

(assert (=> b!668153 (= e!382333 Unit!23412)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!311104 () Unit!23410)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39089 0))(
  ( (array!39090 (arr!18737 (Array (_ BitVec 32) (_ BitVec 64))) (size!19101 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39089 (_ BitVec 64) (_ BitVec 32)) Unit!23410)

(assert (=> b!668153 (= lt!311104 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668153 false))

(declare-fun b!668154 () Bool)

(declare-fun e!382341 () Bool)

(declare-fun e!382340 () Bool)

(assert (=> b!668154 (= e!382341 e!382340)))

(declare-fun res!435250 () Bool)

(assert (=> b!668154 (=> (not res!435250) (not e!382340))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668154 (= res!435250 (bvsle from!3004 i!1382))))

(declare-fun b!668155 () Bool)

(declare-fun e!382332 () Bool)

(assert (=> b!668155 (= e!382332 true)))

(declare-fun lt!311112 () Bool)

(declare-fun e!382334 () Bool)

(assert (=> b!668155 (= lt!311112 e!382334)))

(declare-fun res!435261 () Bool)

(assert (=> b!668155 (=> res!435261 e!382334)))

(declare-fun e!382338 () Bool)

(assert (=> b!668155 (= res!435261 e!382338)))

(declare-fun res!435258 () Bool)

(assert (=> b!668155 (=> (not res!435258) (not e!382338))))

(assert (=> b!668155 (= res!435258 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668156 () Bool)

(declare-fun Unit!23413 () Unit!23410)

(assert (=> b!668156 (= e!382333 Unit!23413)))

(declare-fun b!668157 () Bool)

(declare-fun e!382339 () Bool)

(assert (=> b!668157 (= e!382339 (not e!382332))))

(declare-fun res!435260 () Bool)

(assert (=> b!668157 (=> res!435260 e!382332)))

(assert (=> b!668157 (= res!435260 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12778 0))(
  ( (Nil!12775) (Cons!12774 (h!13819 (_ BitVec 64)) (t!19006 List!12778)) )
))
(declare-fun lt!311110 () List!12778)

(declare-fun arrayNoDuplicates!0 (array!39089 (_ BitVec 32) List!12778) Bool)

(assert (=> b!668157 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311110)))

(declare-fun acc!681 () List!12778)

(declare-fun lt!311105 () Unit!23410)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39089 (_ BitVec 64) (_ BitVec 32) List!12778 List!12778) Unit!23410)

(assert (=> b!668157 (= lt!311105 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311110))))

(declare-fun -!92 (List!12778 (_ BitVec 64)) List!12778)

(assert (=> b!668157 (= (-!92 lt!311110 k!2843) acc!681)))

(declare-fun $colon$colon!226 (List!12778 (_ BitVec 64)) List!12778)

(assert (=> b!668157 (= lt!311110 ($colon$colon!226 acc!681 k!2843))))

(declare-fun lt!311108 () Unit!23410)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12778) Unit!23410)

(assert (=> b!668157 (= lt!311108 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!94 (List!12778 List!12778) Bool)

(assert (=> b!668157 (subseq!94 acc!681 acc!681)))

(declare-fun lt!311109 () Unit!23410)

(declare-fun lemmaListSubSeqRefl!0 (List!12778) Unit!23410)

(assert (=> b!668157 (= lt!311109 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668157 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311107 () Unit!23410)

(declare-fun e!382337 () Unit!23410)

(assert (=> b!668157 (= lt!311107 e!382337)))

(declare-fun c!76820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668157 (= c!76820 (validKeyInArray!0 (select (arr!18737 a!3626) from!3004)))))

(declare-fun lt!311106 () Unit!23410)

(assert (=> b!668157 (= lt!311106 e!382333)))

(declare-fun c!76819 () Bool)

(declare-fun arrayContainsKey!0 (array!39089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668157 (= c!76819 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668157 (arrayContainsKey!0 (array!39090 (store (arr!18737 a!3626) i!1382 k!2843) (size!19101 a!3626)) k!2843 from!3004)))

(declare-fun b!668158 () Bool)

(declare-fun res!435251 () Bool)

(assert (=> b!668158 (=> res!435251 e!382332)))

(declare-fun noDuplicate!602 (List!12778) Bool)

(assert (=> b!668158 (= res!435251 (not (noDuplicate!602 lt!311110)))))

(declare-fun b!668160 () Bool)

(declare-fun contains!3355 (List!12778 (_ BitVec 64)) Bool)

(assert (=> b!668160 (= e!382338 (contains!3355 lt!311110 k!2843))))

(declare-fun b!668161 () Bool)

(declare-fun res!435255 () Bool)

(assert (=> b!668161 (=> (not res!435255) (not e!382339))))

(assert (=> b!668161 (= res!435255 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668162 () Bool)

(declare-fun res!435253 () Bool)

(assert (=> b!668162 (=> (not res!435253) (not e!382339))))

(assert (=> b!668162 (= res!435253 (not (contains!3355 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668163 () Bool)

(declare-fun res!435266 () Bool)

(assert (=> b!668163 (=> (not res!435266) (not e!382339))))

(assert (=> b!668163 (= res!435266 (noDuplicate!602 acc!681))))

(declare-fun b!668164 () Bool)

(assert (=> b!668164 (= e!382340 (not (contains!3355 acc!681 k!2843)))))

(declare-fun b!668165 () Bool)

(declare-fun res!435269 () Bool)

(assert (=> b!668165 (=> res!435269 e!382332)))

(assert (=> b!668165 (= res!435269 (contains!3355 lt!311110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668166 () Bool)

(declare-fun res!435256 () Bool)

(assert (=> b!668166 (=> (not res!435256) (not e!382339))))

(assert (=> b!668166 (= res!435256 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12775))))

(declare-fun b!668167 () Bool)

(declare-fun res!435252 () Bool)

(assert (=> b!668167 (=> (not res!435252) (not e!382339))))

(assert (=> b!668167 (= res!435252 (not (contains!3355 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668168 () Bool)

(declare-fun Unit!23414 () Unit!23410)

(assert (=> b!668168 (= e!382337 Unit!23414)))

(declare-fun b!668169 () Bool)

(declare-fun res!435264 () Bool)

(assert (=> b!668169 (=> res!435264 e!382332)))

(assert (=> b!668169 (= res!435264 (contains!3355 lt!311110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668170 () Bool)

(declare-fun res!435259 () Bool)

(assert (=> b!668170 (=> (not res!435259) (not e!382339))))

(assert (=> b!668170 (= res!435259 e!382341)))

(declare-fun res!435254 () Bool)

(assert (=> b!668170 (=> res!435254 e!382341)))

(declare-fun e!382331 () Bool)

(assert (=> b!668170 (= res!435254 e!382331)))

(declare-fun res!435263 () Bool)

(assert (=> b!668170 (=> (not res!435263) (not e!382331))))

(assert (=> b!668170 (= res!435263 (bvsgt from!3004 i!1382))))

(declare-fun b!668171 () Bool)

(declare-fun e!382336 () Bool)

(assert (=> b!668171 (= e!382334 e!382336)))

(declare-fun res!435268 () Bool)

(assert (=> b!668171 (=> (not res!435268) (not e!382336))))

(assert (=> b!668171 (= res!435268 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668172 () Bool)

(declare-fun res!435265 () Bool)

(assert (=> b!668172 (=> (not res!435265) (not e!382339))))

(assert (=> b!668172 (= res!435265 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19101 a!3626))))))

(declare-fun b!668173 () Bool)

(declare-fun res!435249 () Bool)

(assert (=> b!668173 (=> (not res!435249) (not e!382339))))

(assert (=> b!668173 (= res!435249 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19101 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668174 () Bool)

(declare-fun res!435267 () Bool)

(assert (=> b!668174 (=> (not res!435267) (not e!382339))))

(assert (=> b!668174 (= res!435267 (validKeyInArray!0 k!2843))))

(declare-fun b!668175 () Bool)

(assert (=> b!668175 (= e!382336 (not (contains!3355 lt!311110 k!2843)))))

(declare-fun res!435262 () Bool)

(assert (=> start!60042 (=> (not res!435262) (not e!382339))))

(assert (=> start!60042 (= res!435262 (and (bvslt (size!19101 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19101 a!3626))))))

(assert (=> start!60042 e!382339))

(assert (=> start!60042 true))

(declare-fun array_inv!14533 (array!39089) Bool)

(assert (=> start!60042 (array_inv!14533 a!3626)))

(declare-fun b!668159 () Bool)

(declare-fun res!435257 () Bool)

(assert (=> b!668159 (=> (not res!435257) (not e!382339))))

(assert (=> b!668159 (= res!435257 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668176 () Bool)

(assert (=> b!668176 (= e!382331 (contains!3355 acc!681 k!2843))))

(declare-fun b!668177 () Bool)

(declare-fun lt!311113 () Unit!23410)

(assert (=> b!668177 (= e!382337 lt!311113)))

(declare-fun lt!311111 () Unit!23410)

(assert (=> b!668177 (= lt!311111 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668177 (subseq!94 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39089 List!12778 List!12778 (_ BitVec 32)) Unit!23410)

(assert (=> b!668177 (= lt!311113 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!226 acc!681 (select (arr!18737 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668177 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60042 res!435262) b!668163))

(assert (= (and b!668163 res!435266) b!668162))

(assert (= (and b!668162 res!435253) b!668167))

(assert (= (and b!668167 res!435252) b!668170))

(assert (= (and b!668170 res!435263) b!668176))

(assert (= (and b!668170 (not res!435254)) b!668154))

(assert (= (and b!668154 res!435250) b!668164))

(assert (= (and b!668170 res!435259) b!668166))

(assert (= (and b!668166 res!435256) b!668159))

(assert (= (and b!668159 res!435257) b!668172))

(assert (= (and b!668172 res!435265) b!668174))

(assert (= (and b!668174 res!435267) b!668161))

(assert (= (and b!668161 res!435255) b!668173))

(assert (= (and b!668173 res!435249) b!668157))

(assert (= (and b!668157 c!76819) b!668153))

(assert (= (and b!668157 (not c!76819)) b!668156))

(assert (= (and b!668157 c!76820) b!668177))

(assert (= (and b!668157 (not c!76820)) b!668168))

(assert (= (and b!668157 (not res!435260)) b!668158))

(assert (= (and b!668158 (not res!435251)) b!668169))

(assert (= (and b!668169 (not res!435264)) b!668165))

(assert (= (and b!668165 (not res!435269)) b!668155))

(assert (= (and b!668155 res!435258) b!668160))

(assert (= (and b!668155 (not res!435261)) b!668171))

(assert (= (and b!668171 res!435268) b!668175))

(declare-fun m!638539 () Bool)

(assert (=> b!668159 m!638539))

(declare-fun m!638541 () Bool)

(assert (=> b!668157 m!638541))

(declare-fun m!638543 () Bool)

(assert (=> b!668157 m!638543))

(declare-fun m!638545 () Bool)

(assert (=> b!668157 m!638545))

(declare-fun m!638547 () Bool)

(assert (=> b!668157 m!638547))

(declare-fun m!638549 () Bool)

(assert (=> b!668157 m!638549))

(declare-fun m!638551 () Bool)

(assert (=> b!668157 m!638551))

(declare-fun m!638553 () Bool)

(assert (=> b!668157 m!638553))

(declare-fun m!638555 () Bool)

(assert (=> b!668157 m!638555))

(declare-fun m!638557 () Bool)

(assert (=> b!668157 m!638557))

(declare-fun m!638559 () Bool)

(assert (=> b!668157 m!638559))

(assert (=> b!668157 m!638557))

(declare-fun m!638561 () Bool)

(assert (=> b!668157 m!638561))

(declare-fun m!638563 () Bool)

(assert (=> b!668157 m!638563))

(declare-fun m!638565 () Bool)

(assert (=> b!668157 m!638565))

(declare-fun m!638567 () Bool)

(assert (=> b!668162 m!638567))

(declare-fun m!638569 () Bool)

(assert (=> b!668160 m!638569))

(declare-fun m!638571 () Bool)

(assert (=> start!60042 m!638571))

(declare-fun m!638573 () Bool)

(assert (=> b!668165 m!638573))

(declare-fun m!638575 () Bool)

(assert (=> b!668176 m!638575))

(declare-fun m!638577 () Bool)

(assert (=> b!668174 m!638577))

(declare-fun m!638579 () Bool)

(assert (=> b!668163 m!638579))

(assert (=> b!668175 m!638569))

(declare-fun m!638581 () Bool)

(assert (=> b!668167 m!638581))

(assert (=> b!668177 m!638543))

(assert (=> b!668177 m!638557))

(declare-fun m!638583 () Bool)

(assert (=> b!668177 m!638583))

(declare-fun m!638585 () Bool)

(assert (=> b!668177 m!638585))

(assert (=> b!668177 m!638557))

(assert (=> b!668177 m!638583))

(assert (=> b!668177 m!638551))

(assert (=> b!668177 m!638565))

(declare-fun m!638587 () Bool)

(assert (=> b!668158 m!638587))

(assert (=> b!668164 m!638575))

(declare-fun m!638589 () Bool)

(assert (=> b!668153 m!638589))

(declare-fun m!638591 () Bool)

(assert (=> b!668161 m!638591))

(declare-fun m!638593 () Bool)

(assert (=> b!668169 m!638593))

(declare-fun m!638595 () Bool)

(assert (=> b!668166 m!638595))

(push 1)

(assert (not b!668167))

(assert (not b!668166))

(assert (not b!668165))

(assert (not b!668169))

(assert (not b!668163))

(assert (not b!668176))

(assert (not b!668160))

(assert (not b!668164))

(assert (not b!668153))

(assert (not b!668157))

(assert (not b!668174))

(assert (not b!668162))

(assert (not b!668161))

(assert (not b!668159))

(assert (not b!668175))

(assert (not b!668158))

(assert (not start!60042))

(assert (not b!668177))

(check-sat)

(pop 1)

