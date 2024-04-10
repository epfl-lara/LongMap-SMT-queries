; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59906 () Bool)

(assert start!59906)

(declare-fun b!663354 () Bool)

(declare-fun res!431275 () Bool)

(declare-fun e!380640 () Bool)

(assert (=> b!663354 (=> (not res!431275) (not e!380640))))

(declare-datatypes ((array!38953 0))(
  ( (array!38954 (arr!18669 (Array (_ BitVec 32) (_ BitVec 64))) (size!19033 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38953)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12710 0))(
  ( (Nil!12707) (Cons!12706 (h!13751 (_ BitVec 64)) (t!18938 List!12710)) )
))
(declare-fun acc!681 () List!12710)

(declare-fun arrayNoDuplicates!0 (array!38953 (_ BitVec 32) List!12710) Bool)

(assert (=> b!663354 (= res!431275 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663355 () Bool)

(declare-fun res!431279 () Bool)

(assert (=> b!663355 (=> (not res!431279) (not e!380640))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663355 (= res!431279 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19033 a!3626))))))

(declare-fun b!663356 () Bool)

(declare-fun e!380637 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3287 (List!12710 (_ BitVec 64)) Bool)

(assert (=> b!663356 (= e!380637 (contains!3287 acc!681 k!2843))))

(declare-fun b!663357 () Bool)

(declare-fun res!431274 () Bool)

(assert (=> b!663357 (=> (not res!431274) (not e!380640))))

(declare-fun noDuplicate!534 (List!12710) Bool)

(assert (=> b!663357 (= res!431274 (noDuplicate!534 acc!681))))

(declare-fun b!663358 () Bool)

(assert (=> b!663358 (= e!380640 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!23070 0))(
  ( (Unit!23071) )
))
(declare-fun lt!309263 () Unit!23070)

(declare-fun e!380642 () Unit!23070)

(assert (=> b!663358 (= lt!309263 e!380642)))

(declare-fun c!76411 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663358 (= c!76411 (validKeyInArray!0 (select (arr!18669 a!3626) from!3004)))))

(declare-fun lt!309261 () Unit!23070)

(declare-fun e!380638 () Unit!23070)

(assert (=> b!663358 (= lt!309261 e!380638)))

(declare-fun c!76412 () Bool)

(declare-fun arrayContainsKey!0 (array!38953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663358 (= c!76412 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663358 (arrayContainsKey!0 (array!38954 (store (arr!18669 a!3626) i!1382 k!2843) (size!19033 a!3626)) k!2843 from!3004)))

(declare-fun b!663359 () Bool)

(declare-fun e!380639 () Bool)

(assert (=> b!663359 (= e!380639 (not (contains!3287 acc!681 k!2843)))))

(declare-fun b!663360 () Bool)

(declare-fun Unit!23072 () Unit!23070)

(assert (=> b!663360 (= e!380638 Unit!23072)))

(declare-fun lt!309265 () Unit!23070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38953 (_ BitVec 64) (_ BitVec 32)) Unit!23070)

(assert (=> b!663360 (= lt!309265 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663360 false))

(declare-fun b!663361 () Bool)

(declare-fun res!431269 () Bool)

(assert (=> b!663361 (=> (not res!431269) (not e!380640))))

(assert (=> b!663361 (= res!431269 (validKeyInArray!0 k!2843))))

(declare-fun b!663362 () Bool)

(declare-fun res!431273 () Bool)

(assert (=> b!663362 (=> (not res!431273) (not e!380640))))

(declare-fun e!380643 () Bool)

(assert (=> b!663362 (= res!431273 e!380643)))

(declare-fun res!431266 () Bool)

(assert (=> b!663362 (=> res!431266 e!380643)))

(assert (=> b!663362 (= res!431266 e!380637)))

(declare-fun res!431272 () Bool)

(assert (=> b!663362 (=> (not res!431272) (not e!380637))))

(assert (=> b!663362 (= res!431272 (bvsgt from!3004 i!1382))))

(declare-fun b!663363 () Bool)

(declare-fun res!431270 () Bool)

(assert (=> b!663363 (=> (not res!431270) (not e!380640))))

(assert (=> b!663363 (= res!431270 (not (contains!3287 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!431277 () Bool)

(assert (=> start!59906 (=> (not res!431277) (not e!380640))))

(assert (=> start!59906 (= res!431277 (and (bvslt (size!19033 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19033 a!3626))))))

(assert (=> start!59906 e!380640))

(assert (=> start!59906 true))

(declare-fun array_inv!14465 (array!38953) Bool)

(assert (=> start!59906 (array_inv!14465 a!3626)))

(declare-fun b!663364 () Bool)

(declare-fun lt!309262 () Unit!23070)

(assert (=> b!663364 (= e!380642 lt!309262)))

(declare-fun lt!309264 () Unit!23070)

(declare-fun lemmaListSubSeqRefl!0 (List!12710) Unit!23070)

(assert (=> b!663364 (= lt!309264 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!26 (List!12710 List!12710) Bool)

(assert (=> b!663364 (subseq!26 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38953 List!12710 List!12710 (_ BitVec 32)) Unit!23070)

(declare-fun $colon$colon!158 (List!12710 (_ BitVec 64)) List!12710)

(assert (=> b!663364 (= lt!309262 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!158 acc!681 (select (arr!18669 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663364 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663365 () Bool)

(declare-fun Unit!23073 () Unit!23070)

(assert (=> b!663365 (= e!380642 Unit!23073)))

(declare-fun b!663366 () Bool)

(declare-fun res!431267 () Bool)

(assert (=> b!663366 (=> (not res!431267) (not e!380640))))

(assert (=> b!663366 (= res!431267 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663367 () Bool)

(declare-fun res!431268 () Bool)

(assert (=> b!663367 (=> (not res!431268) (not e!380640))))

(assert (=> b!663367 (= res!431268 (not (contains!3287 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663368 () Bool)

(declare-fun res!431271 () Bool)

(assert (=> b!663368 (=> (not res!431271) (not e!380640))))

(assert (=> b!663368 (= res!431271 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12707))))

(declare-fun b!663369 () Bool)

(declare-fun Unit!23074 () Unit!23070)

(assert (=> b!663369 (= e!380638 Unit!23074)))

(declare-fun b!663370 () Bool)

(declare-fun res!431278 () Bool)

(assert (=> b!663370 (=> (not res!431278) (not e!380640))))

(assert (=> b!663370 (= res!431278 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19033 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663371 () Bool)

(assert (=> b!663371 (= e!380643 e!380639)))

(declare-fun res!431276 () Bool)

(assert (=> b!663371 (=> (not res!431276) (not e!380639))))

(assert (=> b!663371 (= res!431276 (bvsle from!3004 i!1382))))

(assert (= (and start!59906 res!431277) b!663357))

(assert (= (and b!663357 res!431274) b!663363))

(assert (= (and b!663363 res!431270) b!663367))

(assert (= (and b!663367 res!431268) b!663362))

(assert (= (and b!663362 res!431272) b!663356))

(assert (= (and b!663362 (not res!431266)) b!663371))

(assert (= (and b!663371 res!431276) b!663359))

(assert (= (and b!663362 res!431273) b!663368))

(assert (= (and b!663368 res!431271) b!663354))

(assert (= (and b!663354 res!431275) b!663355))

(assert (= (and b!663355 res!431279) b!663361))

(assert (= (and b!663361 res!431269) b!663366))

(assert (= (and b!663366 res!431267) b!663370))

(assert (= (and b!663370 res!431278) b!663358))

(assert (= (and b!663358 c!76412) b!663360))

(assert (= (and b!663358 (not c!76412)) b!663369))

(assert (= (and b!663358 c!76411) b!663364))

(assert (= (and b!663358 (not c!76411)) b!663365))

(declare-fun m!634949 () Bool)

(assert (=> b!663356 m!634949))

(declare-fun m!634951 () Bool)

(assert (=> b!663354 m!634951))

(declare-fun m!634953 () Bool)

(assert (=> b!663364 m!634953))

(declare-fun m!634955 () Bool)

(assert (=> b!663364 m!634955))

(declare-fun m!634957 () Bool)

(assert (=> b!663364 m!634957))

(declare-fun m!634959 () Bool)

(assert (=> b!663364 m!634959))

(assert (=> b!663364 m!634955))

(assert (=> b!663364 m!634957))

(declare-fun m!634961 () Bool)

(assert (=> b!663364 m!634961))

(declare-fun m!634963 () Bool)

(assert (=> b!663364 m!634963))

(declare-fun m!634965 () Bool)

(assert (=> b!663368 m!634965))

(assert (=> b!663358 m!634955))

(declare-fun m!634967 () Bool)

(assert (=> b!663358 m!634967))

(declare-fun m!634969 () Bool)

(assert (=> b!663358 m!634969))

(assert (=> b!663358 m!634955))

(declare-fun m!634971 () Bool)

(assert (=> b!663358 m!634971))

(declare-fun m!634973 () Bool)

(assert (=> b!663358 m!634973))

(declare-fun m!634975 () Bool)

(assert (=> b!663357 m!634975))

(declare-fun m!634977 () Bool)

(assert (=> b!663360 m!634977))

(declare-fun m!634979 () Bool)

(assert (=> b!663363 m!634979))

(declare-fun m!634981 () Bool)

(assert (=> start!59906 m!634981))

(assert (=> b!663359 m!634949))

(declare-fun m!634983 () Bool)

(assert (=> b!663361 m!634983))

(declare-fun m!634985 () Bool)

(assert (=> b!663367 m!634985))

(declare-fun m!634987 () Bool)

(assert (=> b!663366 m!634987))

(push 1)

