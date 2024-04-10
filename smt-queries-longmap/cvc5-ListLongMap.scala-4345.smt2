; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60098 () Bool)

(assert start!60098)

(declare-fun b!670273 () Bool)

(declare-fun e!383257 () Bool)

(declare-datatypes ((List!12806 0))(
  ( (Nil!12803) (Cons!12802 (h!13847 (_ BitVec 64)) (t!19034 List!12806)) )
))
(declare-fun acc!681 () List!12806)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3383 (List!12806 (_ BitVec 64)) Bool)

(assert (=> b!670273 (= e!383257 (contains!3383 acc!681 k!2843))))

(declare-fun b!670274 () Bool)

(declare-fun res!437040 () Bool)

(declare-fun e!383262 () Bool)

(assert (=> b!670274 (=> (not res!437040) (not e!383262))))

(declare-datatypes ((array!39145 0))(
  ( (array!39146 (arr!18765 (Array (_ BitVec 32) (_ BitVec 64))) (size!19129 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39145)

(declare-fun arrayContainsKey!0 (array!39145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670274 (= res!437040 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670275 () Bool)

(declare-fun e!383265 () Bool)

(declare-fun lt!311969 () List!12806)

(assert (=> b!670275 (= e!383265 (not (contains!3383 lt!311969 k!2843)))))

(declare-fun b!670276 () Bool)

(declare-fun res!437043 () Bool)

(assert (=> b!670276 (=> (not res!437043) (not e!383262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670276 (= res!437043 (validKeyInArray!0 k!2843))))

(declare-fun b!670277 () Bool)

(declare-fun e!383255 () Bool)

(declare-fun e!383256 () Bool)

(assert (=> b!670277 (= e!383255 e!383256)))

(declare-fun res!437051 () Bool)

(assert (=> b!670277 (=> res!437051 e!383256)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670277 (= res!437051 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!437034 () Bool)

(assert (=> start!60098 (=> (not res!437034) (not e!383262))))

(assert (=> start!60098 (= res!437034 (and (bvslt (size!19129 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19129 a!3626))))))

(assert (=> start!60098 e!383262))

(assert (=> start!60098 true))

(declare-fun array_inv!14561 (array!39145) Bool)

(assert (=> start!60098 (array_inv!14561 a!3626)))

(declare-fun b!670278 () Bool)

(declare-fun res!437049 () Bool)

(declare-fun e!383260 () Bool)

(assert (=> b!670278 (=> res!437049 e!383260)))

(assert (=> b!670278 (= res!437049 e!383255)))

(declare-fun res!437045 () Bool)

(assert (=> b!670278 (=> (not res!437045) (not e!383255))))

(assert (=> b!670278 (= res!437045 e!383265)))

(declare-fun res!437046 () Bool)

(assert (=> b!670278 (=> res!437046 e!383265)))

(assert (=> b!670278 (= res!437046 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670279 () Bool)

(declare-fun res!437041 () Bool)

(assert (=> b!670279 (=> (not res!437041) (not e!383262))))

(assert (=> b!670279 (= res!437041 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19129 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670280 () Bool)

(declare-datatypes ((Unit!23550 0))(
  ( (Unit!23551) )
))
(declare-fun e!383261 () Unit!23550)

(declare-fun Unit!23552 () Unit!23550)

(assert (=> b!670280 (= e!383261 Unit!23552)))

(declare-fun lt!311966 () Unit!23550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39145 (_ BitVec 64) (_ BitVec 32)) Unit!23550)

(assert (=> b!670280 (= lt!311966 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670280 false))

(declare-fun b!670281 () Bool)

(assert (=> b!670281 (= e!383260 true)))

(declare-fun lt!311974 () array!39145)

(declare-fun arrayNoDuplicates!0 (array!39145 (_ BitVec 32) List!12806) Bool)

(assert (=> b!670281 (arrayNoDuplicates!0 lt!311974 (bvadd #b00000000000000000000000000000001 from!3004) lt!311969)))

(declare-fun lt!311970 () Unit!23550)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12806) Unit!23550)

(assert (=> b!670281 (= lt!311970 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311969))))

(declare-fun b!670282 () Bool)

(declare-fun e!383259 () Unit!23550)

(declare-fun lt!311968 () Unit!23550)

(assert (=> b!670282 (= e!383259 lt!311968)))

(declare-fun lt!311967 () Unit!23550)

(declare-fun lemmaListSubSeqRefl!0 (List!12806) Unit!23550)

(assert (=> b!670282 (= lt!311967 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!122 (List!12806 List!12806) Bool)

(assert (=> b!670282 (subseq!122 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39145 List!12806 List!12806 (_ BitVec 32)) Unit!23550)

(declare-fun $colon$colon!254 (List!12806 (_ BitVec 64)) List!12806)

(assert (=> b!670282 (= lt!311968 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!254 acc!681 (select (arr!18765 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670282 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670283 () Bool)

(declare-fun e!383263 () Bool)

(assert (=> b!670283 (= e!383263 (not (contains!3383 acc!681 k!2843)))))

(declare-fun b!670284 () Bool)

(declare-fun res!437037 () Bool)

(assert (=> b!670284 (=> (not res!437037) (not e!383262))))

(assert (=> b!670284 (= res!437037 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670285 () Bool)

(assert (=> b!670285 (= e!383262 (not e!383260))))

(declare-fun res!437050 () Bool)

(assert (=> b!670285 (=> res!437050 e!383260)))

(assert (=> b!670285 (= res!437050 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670285 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311969)))

(declare-fun lt!311972 () Unit!23550)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39145 (_ BitVec 64) (_ BitVec 32) List!12806 List!12806) Unit!23550)

(assert (=> b!670285 (= lt!311972 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311969))))

(declare-fun -!120 (List!12806 (_ BitVec 64)) List!12806)

(assert (=> b!670285 (= (-!120 lt!311969 k!2843) acc!681)))

(assert (=> b!670285 (= lt!311969 ($colon$colon!254 acc!681 k!2843))))

(declare-fun lt!311971 () Unit!23550)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12806) Unit!23550)

(assert (=> b!670285 (= lt!311971 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!670285 (subseq!122 acc!681 acc!681)))

(declare-fun lt!311964 () Unit!23550)

(assert (=> b!670285 (= lt!311964 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670285 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311973 () Unit!23550)

(assert (=> b!670285 (= lt!311973 e!383259)))

(declare-fun c!76987 () Bool)

(assert (=> b!670285 (= c!76987 (validKeyInArray!0 (select (arr!18765 a!3626) from!3004)))))

(declare-fun lt!311965 () Unit!23550)

(assert (=> b!670285 (= lt!311965 e!383261)))

(declare-fun c!76988 () Bool)

(assert (=> b!670285 (= c!76988 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670285 (arrayContainsKey!0 lt!311974 k!2843 from!3004)))

(assert (=> b!670285 (= lt!311974 (array!39146 (store (arr!18765 a!3626) i!1382 k!2843) (size!19129 a!3626)))))

(declare-fun b!670286 () Bool)

(declare-fun res!437035 () Bool)

(assert (=> b!670286 (=> (not res!437035) (not e!383262))))

(assert (=> b!670286 (= res!437035 (not (contains!3383 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670287 () Bool)

(assert (=> b!670287 (= e!383256 (contains!3383 lt!311969 k!2843))))

(declare-fun b!670288 () Bool)

(declare-fun res!437044 () Bool)

(assert (=> b!670288 (=> res!437044 e!383260)))

(assert (=> b!670288 (= res!437044 (contains!3383 lt!311969 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670289 () Bool)

(declare-fun res!437048 () Bool)

(assert (=> b!670289 (=> (not res!437048) (not e!383262))))

(assert (=> b!670289 (= res!437048 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12803))))

(declare-fun b!670290 () Bool)

(declare-fun res!437042 () Bool)

(assert (=> b!670290 (=> (not res!437042) (not e!383262))))

(assert (=> b!670290 (= res!437042 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19129 a!3626))))))

(declare-fun b!670291 () Bool)

(declare-fun Unit!23553 () Unit!23550)

(assert (=> b!670291 (= e!383261 Unit!23553)))

(declare-fun b!670292 () Bool)

(declare-fun res!437036 () Bool)

(assert (=> b!670292 (=> res!437036 e!383260)))

(declare-fun noDuplicate!630 (List!12806) Bool)

(assert (=> b!670292 (= res!437036 (not (noDuplicate!630 lt!311969)))))

(declare-fun b!670293 () Bool)

(declare-fun res!437038 () Bool)

(assert (=> b!670293 (=> (not res!437038) (not e!383262))))

(declare-fun e!383264 () Bool)

(assert (=> b!670293 (= res!437038 e!383264)))

(declare-fun res!437054 () Bool)

(assert (=> b!670293 (=> res!437054 e!383264)))

(assert (=> b!670293 (= res!437054 e!383257)))

(declare-fun res!437039 () Bool)

(assert (=> b!670293 (=> (not res!437039) (not e!383257))))

(assert (=> b!670293 (= res!437039 (bvsgt from!3004 i!1382))))

(declare-fun b!670294 () Bool)

(declare-fun Unit!23554 () Unit!23550)

(assert (=> b!670294 (= e!383259 Unit!23554)))

(declare-fun b!670295 () Bool)

(declare-fun res!437052 () Bool)

(assert (=> b!670295 (=> res!437052 e!383260)))

(assert (=> b!670295 (= res!437052 (contains!3383 lt!311969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670296 () Bool)

(assert (=> b!670296 (= e!383264 e!383263)))

(declare-fun res!437047 () Bool)

(assert (=> b!670296 (=> (not res!437047) (not e!383263))))

(assert (=> b!670296 (= res!437047 (bvsle from!3004 i!1382))))

(declare-fun b!670297 () Bool)

(declare-fun res!437033 () Bool)

(assert (=> b!670297 (=> (not res!437033) (not e!383262))))

(assert (=> b!670297 (= res!437033 (noDuplicate!630 acc!681))))

(declare-fun b!670298 () Bool)

(declare-fun res!437053 () Bool)

(assert (=> b!670298 (=> (not res!437053) (not e!383262))))

(assert (=> b!670298 (= res!437053 (not (contains!3383 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60098 res!437034) b!670297))

(assert (= (and b!670297 res!437033) b!670286))

(assert (= (and b!670286 res!437035) b!670298))

(assert (= (and b!670298 res!437053) b!670293))

(assert (= (and b!670293 res!437039) b!670273))

(assert (= (and b!670293 (not res!437054)) b!670296))

(assert (= (and b!670296 res!437047) b!670283))

(assert (= (and b!670293 res!437038) b!670289))

(assert (= (and b!670289 res!437048) b!670284))

(assert (= (and b!670284 res!437037) b!670290))

(assert (= (and b!670290 res!437042) b!670276))

(assert (= (and b!670276 res!437043) b!670274))

(assert (= (and b!670274 res!437040) b!670279))

(assert (= (and b!670279 res!437041) b!670285))

(assert (= (and b!670285 c!76988) b!670280))

(assert (= (and b!670285 (not c!76988)) b!670291))

(assert (= (and b!670285 c!76987) b!670282))

(assert (= (and b!670285 (not c!76987)) b!670294))

(assert (= (and b!670285 (not res!437050)) b!670292))

(assert (= (and b!670292 (not res!437036)) b!670295))

(assert (= (and b!670295 (not res!437052)) b!670288))

(assert (= (and b!670288 (not res!437044)) b!670278))

(assert (= (and b!670278 (not res!437046)) b!670275))

(assert (= (and b!670278 res!437045) b!670277))

(assert (= (and b!670277 (not res!437051)) b!670287))

(assert (= (and b!670278 (not res!437049)) b!670281))

(declare-fun m!640187 () Bool)

(assert (=> b!670285 m!640187))

(declare-fun m!640189 () Bool)

(assert (=> b!670285 m!640189))

(declare-fun m!640191 () Bool)

(assert (=> b!670285 m!640191))

(declare-fun m!640193 () Bool)

(assert (=> b!670285 m!640193))

(declare-fun m!640195 () Bool)

(assert (=> b!670285 m!640195))

(declare-fun m!640197 () Bool)

(assert (=> b!670285 m!640197))

(declare-fun m!640199 () Bool)

(assert (=> b!670285 m!640199))

(declare-fun m!640201 () Bool)

(assert (=> b!670285 m!640201))

(declare-fun m!640203 () Bool)

(assert (=> b!670285 m!640203))

(declare-fun m!640205 () Bool)

(assert (=> b!670285 m!640205))

(assert (=> b!670285 m!640189))

(declare-fun m!640207 () Bool)

(assert (=> b!670285 m!640207))

(declare-fun m!640209 () Bool)

(assert (=> b!670285 m!640209))

(declare-fun m!640211 () Bool)

(assert (=> b!670285 m!640211))

(declare-fun m!640213 () Bool)

(assert (=> b!670275 m!640213))

(declare-fun m!640215 () Bool)

(assert (=> b!670284 m!640215))

(declare-fun m!640217 () Bool)

(assert (=> b!670295 m!640217))

(declare-fun m!640219 () Bool)

(assert (=> b!670276 m!640219))

(declare-fun m!640221 () Bool)

(assert (=> b!670274 m!640221))

(declare-fun m!640223 () Bool)

(assert (=> b!670286 m!640223))

(declare-fun m!640225 () Bool)

(assert (=> b!670280 m!640225))

(declare-fun m!640227 () Bool)

(assert (=> b!670288 m!640227))

(declare-fun m!640229 () Bool)

(assert (=> b!670281 m!640229))

(declare-fun m!640231 () Bool)

(assert (=> b!670281 m!640231))

(declare-fun m!640233 () Bool)

(assert (=> b!670297 m!640233))

(declare-fun m!640235 () Bool)

(assert (=> b!670292 m!640235))

(assert (=> b!670287 m!640213))

(declare-fun m!640237 () Bool)

(assert (=> b!670289 m!640237))

(declare-fun m!640239 () Bool)

(assert (=> b!670283 m!640239))

(assert (=> b!670273 m!640239))

(assert (=> b!670282 m!640187))

(assert (=> b!670282 m!640189))

(declare-fun m!640241 () Bool)

(assert (=> b!670282 m!640241))

(declare-fun m!640243 () Bool)

(assert (=> b!670282 m!640243))

(assert (=> b!670282 m!640189))

(assert (=> b!670282 m!640241))

(assert (=> b!670282 m!640201))

(assert (=> b!670282 m!640209))

(declare-fun m!640245 () Bool)

(assert (=> start!60098 m!640245))

(declare-fun m!640247 () Bool)

(assert (=> b!670298 m!640247))

(push 1)

(assert (not b!670289))

(assert (not b!670297))

(assert (not b!670284))

(assert (not b!670298))

(assert (not b!670276))

(assert (not b!670292))

(assert (not b!670287))

(assert (not b!670274))

(assert (not b!670281))

(assert (not b!670295))

(assert (not b!670286))

(assert (not b!670288))

(assert (not start!60098))

(assert (not b!670280))

(assert (not b!670282))

(assert (not b!670273))

(assert (not b!670275))

(assert (not b!670285))

(assert (not b!670283))

(check-sat)

(pop 1)

