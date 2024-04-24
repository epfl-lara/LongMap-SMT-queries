; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59952 () Bool)

(assert start!59952)

(declare-fun b!663190 () Bool)

(declare-fun res!431041 () Bool)

(declare-fun e!380637 () Bool)

(assert (=> b!663190 (=> (not res!431041) (not e!380637))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38937 0))(
  ( (array!38938 (arr!18658 (Array (_ BitVec 32) (_ BitVec 64))) (size!19022 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38937)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663190 (= res!431041 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19022 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663192 () Bool)

(declare-datatypes ((Unit!23025 0))(
  ( (Unit!23026) )
))
(declare-fun e!380638 () Unit!23025)

(declare-fun Unit!23027 () Unit!23025)

(assert (=> b!663192 (= e!380638 Unit!23027)))

(declare-fun lt!309259 () Unit!23025)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38937 (_ BitVec 64) (_ BitVec 32)) Unit!23025)

(assert (=> b!663192 (= lt!309259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663192 false))

(declare-fun b!663193 () Bool)

(declare-fun res!431034 () Bool)

(assert (=> b!663193 (=> (not res!431034) (not e!380637))))

(declare-fun arrayContainsKey!0 (array!38937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663193 (= res!431034 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663194 () Bool)

(declare-fun Unit!23028 () Unit!23025)

(assert (=> b!663194 (= e!380638 Unit!23028)))

(declare-fun b!663195 () Bool)

(declare-fun e!380636 () Bool)

(declare-fun e!380640 () Bool)

(assert (=> b!663195 (= e!380636 e!380640)))

(declare-fun res!431045 () Bool)

(assert (=> b!663195 (=> res!431045 e!380640)))

(assert (=> b!663195 (= res!431045 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12606 0))(
  ( (Nil!12603) (Cons!12602 (h!13650 (_ BitVec 64)) (t!18826 List!12606)) )
))
(declare-fun acc!681 () List!12606)

(declare-fun lt!309261 () List!12606)

(declare-fun $colon$colon!149 (List!12606 (_ BitVec 64)) List!12606)

(assert (=> b!663195 (= lt!309261 ($colon$colon!149 acc!681 (select (arr!18658 a!3626) from!3004)))))

(declare-fun subseq!20 (List!12606 List!12606) Bool)

(assert (=> b!663195 (subseq!20 acc!681 acc!681)))

(declare-fun lt!309257 () Unit!23025)

(declare-fun lemmaListSubSeqRefl!0 (List!12606) Unit!23025)

(assert (=> b!663195 (= lt!309257 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663196 () Bool)

(declare-fun e!380642 () Bool)

(declare-fun contains!3258 (List!12606 (_ BitVec 64)) Bool)

(assert (=> b!663196 (= e!380642 (not (contains!3258 acc!681 k0!2843)))))

(declare-fun b!663197 () Bool)

(declare-fun res!431047 () Bool)

(assert (=> b!663197 (=> (not res!431047) (not e!380637))))

(declare-fun e!380643 () Bool)

(assert (=> b!663197 (= res!431047 e!380643)))

(declare-fun res!431032 () Bool)

(assert (=> b!663197 (=> res!431032 e!380643)))

(declare-fun e!380639 () Bool)

(assert (=> b!663197 (= res!431032 e!380639)))

(declare-fun res!431035 () Bool)

(assert (=> b!663197 (=> (not res!431035) (not e!380639))))

(assert (=> b!663197 (= res!431035 (bvsgt from!3004 i!1382))))

(declare-fun b!663198 () Bool)

(declare-fun res!431050 () Bool)

(assert (=> b!663198 (=> res!431050 e!380640)))

(declare-fun noDuplicate!532 (List!12606) Bool)

(assert (=> b!663198 (= res!431050 (not (noDuplicate!532 lt!309261)))))

(declare-fun b!663199 () Bool)

(declare-fun res!431033 () Bool)

(assert (=> b!663199 (=> res!431033 e!380640)))

(assert (=> b!663199 (= res!431033 (not (subseq!20 acc!681 lt!309261)))))

(declare-fun b!663200 () Bool)

(declare-fun res!431043 () Bool)

(assert (=> b!663200 (=> (not res!431043) (not e!380637))))

(declare-fun arrayNoDuplicates!0 (array!38937 (_ BitVec 32) List!12606) Bool)

(assert (=> b!663200 (= res!431043 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663201 () Bool)

(declare-fun res!431049 () Bool)

(assert (=> b!663201 (=> (not res!431049) (not e!380637))))

(assert (=> b!663201 (= res!431049 (noDuplicate!532 acc!681))))

(declare-fun b!663202 () Bool)

(declare-fun res!431046 () Bool)

(assert (=> b!663202 (=> (not res!431046) (not e!380637))))

(assert (=> b!663202 (= res!431046 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19022 a!3626))))))

(declare-fun b!663203 () Bool)

(declare-fun res!431031 () Bool)

(assert (=> b!663203 (=> (not res!431031) (not e!380637))))

(assert (=> b!663203 (= res!431031 (not (contains!3258 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663204 () Bool)

(assert (=> b!663204 (= e!380640 true)))

(declare-fun lt!309260 () Bool)

(assert (=> b!663204 (= lt!309260 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309261))))

(declare-fun lt!309262 () Unit!23025)

(declare-fun noDuplicateSubseq!20 (List!12606 List!12606) Unit!23025)

(assert (=> b!663204 (= lt!309262 (noDuplicateSubseq!20 acc!681 lt!309261))))

(declare-fun b!663205 () Bool)

(assert (=> b!663205 (= e!380643 e!380642)))

(declare-fun res!431037 () Bool)

(assert (=> b!663205 (=> (not res!431037) (not e!380642))))

(assert (=> b!663205 (= res!431037 (bvsle from!3004 i!1382))))

(declare-fun b!663191 () Bool)

(assert (=> b!663191 (= e!380637 (not e!380636))))

(declare-fun res!431036 () Bool)

(assert (=> b!663191 (=> res!431036 e!380636)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663191 (= res!431036 (not (validKeyInArray!0 (select (arr!18658 a!3626) from!3004))))))

(declare-fun lt!309258 () Unit!23025)

(assert (=> b!663191 (= lt!309258 e!380638)))

(declare-fun c!76448 () Bool)

(assert (=> b!663191 (= c!76448 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663191 (arrayContainsKey!0 (array!38938 (store (arr!18658 a!3626) i!1382 k0!2843) (size!19022 a!3626)) k0!2843 from!3004)))

(declare-fun res!431042 () Bool)

(assert (=> start!59952 (=> (not res!431042) (not e!380637))))

(assert (=> start!59952 (= res!431042 (and (bvslt (size!19022 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19022 a!3626))))))

(assert (=> start!59952 e!380637))

(assert (=> start!59952 true))

(declare-fun array_inv!14517 (array!38937) Bool)

(assert (=> start!59952 (array_inv!14517 a!3626)))

(declare-fun b!663206 () Bool)

(declare-fun res!431044 () Bool)

(assert (=> b!663206 (=> res!431044 e!380640)))

(assert (=> b!663206 (= res!431044 (contains!3258 lt!309261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663207 () Bool)

(declare-fun res!431038 () Bool)

(assert (=> b!663207 (=> (not res!431038) (not e!380637))))

(assert (=> b!663207 (= res!431038 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12603))))

(declare-fun b!663208 () Bool)

(declare-fun res!431040 () Bool)

(assert (=> b!663208 (=> (not res!431040) (not e!380637))))

(assert (=> b!663208 (= res!431040 (validKeyInArray!0 k0!2843))))

(declare-fun b!663209 () Bool)

(declare-fun res!431039 () Bool)

(assert (=> b!663209 (=> (not res!431039) (not e!380637))))

(assert (=> b!663209 (= res!431039 (not (contains!3258 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663210 () Bool)

(assert (=> b!663210 (= e!380639 (contains!3258 acc!681 k0!2843))))

(declare-fun b!663211 () Bool)

(declare-fun res!431048 () Bool)

(assert (=> b!663211 (=> res!431048 e!380640)))

(assert (=> b!663211 (= res!431048 (contains!3258 lt!309261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59952 res!431042) b!663201))

(assert (= (and b!663201 res!431049) b!663203))

(assert (= (and b!663203 res!431031) b!663209))

(assert (= (and b!663209 res!431039) b!663197))

(assert (= (and b!663197 res!431035) b!663210))

(assert (= (and b!663197 (not res!431032)) b!663205))

(assert (= (and b!663205 res!431037) b!663196))

(assert (= (and b!663197 res!431047) b!663207))

(assert (= (and b!663207 res!431038) b!663200))

(assert (= (and b!663200 res!431043) b!663202))

(assert (= (and b!663202 res!431046) b!663208))

(assert (= (and b!663208 res!431040) b!663193))

(assert (= (and b!663193 res!431034) b!663190))

(assert (= (and b!663190 res!431041) b!663191))

(assert (= (and b!663191 c!76448) b!663192))

(assert (= (and b!663191 (not c!76448)) b!663194))

(assert (= (and b!663191 (not res!431036)) b!663195))

(assert (= (and b!663195 (not res!431045)) b!663198))

(assert (= (and b!663198 (not res!431050)) b!663211))

(assert (= (and b!663211 (not res!431048)) b!663206))

(assert (= (and b!663206 (not res!431044)) b!663199))

(assert (= (and b!663199 (not res!431033)) b!663204))

(declare-fun m!635359 () Bool)

(assert (=> b!663203 m!635359))

(declare-fun m!635361 () Bool)

(assert (=> b!663199 m!635361))

(declare-fun m!635363 () Bool)

(assert (=> b!663200 m!635363))

(declare-fun m!635365 () Bool)

(assert (=> start!59952 m!635365))

(declare-fun m!635367 () Bool)

(assert (=> b!663211 m!635367))

(declare-fun m!635369 () Bool)

(assert (=> b!663206 m!635369))

(declare-fun m!635371 () Bool)

(assert (=> b!663201 m!635371))

(declare-fun m!635373 () Bool)

(assert (=> b!663196 m!635373))

(assert (=> b!663210 m!635373))

(declare-fun m!635375 () Bool)

(assert (=> b!663209 m!635375))

(declare-fun m!635377 () Bool)

(assert (=> b!663195 m!635377))

(assert (=> b!663195 m!635377))

(declare-fun m!635379 () Bool)

(assert (=> b!663195 m!635379))

(declare-fun m!635381 () Bool)

(assert (=> b!663195 m!635381))

(declare-fun m!635383 () Bool)

(assert (=> b!663195 m!635383))

(declare-fun m!635385 () Bool)

(assert (=> b!663193 m!635385))

(declare-fun m!635387 () Bool)

(assert (=> b!663207 m!635387))

(declare-fun m!635389 () Bool)

(assert (=> b!663192 m!635389))

(declare-fun m!635391 () Bool)

(assert (=> b!663198 m!635391))

(declare-fun m!635393 () Bool)

(assert (=> b!663204 m!635393))

(declare-fun m!635395 () Bool)

(assert (=> b!663204 m!635395))

(declare-fun m!635397 () Bool)

(assert (=> b!663208 m!635397))

(assert (=> b!663191 m!635377))

(declare-fun m!635399 () Bool)

(assert (=> b!663191 m!635399))

(declare-fun m!635401 () Bool)

(assert (=> b!663191 m!635401))

(assert (=> b!663191 m!635377))

(declare-fun m!635403 () Bool)

(assert (=> b!663191 m!635403))

(declare-fun m!635405 () Bool)

(assert (=> b!663191 m!635405))

(check-sat (not b!663199) (not b!663200) (not b!663193) (not b!663195) (not b!663209) (not b!663204) (not b!663208) (not b!663211) (not b!663191) (not b!663207) (not b!663201) (not b!663198) (not b!663206) (not b!663196) (not b!663203) (not b!663210) (not start!59952) (not b!663192))
(check-sat)
