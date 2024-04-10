; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59874 () Bool)

(assert start!59874)

(declare-fun b!662306 () Bool)

(declare-fun res!430333 () Bool)

(declare-fun e!380258 () Bool)

(assert (=> b!662306 (=> (not res!430333) (not e!380258))))

(declare-datatypes ((List!12694 0))(
  ( (Nil!12691) (Cons!12690 (h!13735 (_ BitVec 64)) (t!18922 List!12694)) )
))
(declare-fun acc!681 () List!12694)

(declare-fun contains!3271 (List!12694 (_ BitVec 64)) Bool)

(assert (=> b!662306 (= res!430333 (not (contains!3271 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662307 () Bool)

(declare-fun res!430326 () Bool)

(assert (=> b!662307 (=> (not res!430326) (not e!380258))))

(assert (=> b!662307 (= res!430326 (not (contains!3271 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662308 () Bool)

(declare-fun res!430335 () Bool)

(declare-fun e!380262 () Bool)

(assert (=> b!662308 (=> res!430335 e!380262)))

(declare-fun lt!308980 () List!12694)

(assert (=> b!662308 (= res!430335 (contains!3271 lt!308980 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662309 () Bool)

(declare-fun res!430318 () Bool)

(assert (=> b!662309 (=> (not res!430318) (not e!380258))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38921 0))(
  ( (array!38922 (arr!18653 (Array (_ BitVec 32) (_ BitVec 64))) (size!19017 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38921)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662309 (= res!430318 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19017 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662310 () Bool)

(declare-fun res!430320 () Bool)

(assert (=> b!662310 (=> res!430320 e!380262)))

(declare-fun subseq!10 (List!12694 List!12694) Bool)

(assert (=> b!662310 (= res!430320 (not (subseq!10 acc!681 lt!308980)))))

(declare-fun b!662311 () Bool)

(declare-fun e!380257 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!662311 (= e!380257 (contains!3271 acc!681 k!2843))))

(declare-fun b!662312 () Bool)

(declare-fun res!430319 () Bool)

(assert (=> b!662312 (=> (not res!430319) (not e!380258))))

(declare-fun arrayNoDuplicates!0 (array!38921 (_ BitVec 32) List!12694) Bool)

(assert (=> b!662312 (= res!430319 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12691))))

(declare-fun b!662313 () Bool)

(declare-fun res!430327 () Bool)

(assert (=> b!662313 (=> (not res!430327) (not e!380258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662313 (= res!430327 (validKeyInArray!0 k!2843))))

(declare-fun b!662314 () Bool)

(declare-fun res!430324 () Bool)

(assert (=> b!662314 (=> res!430324 e!380262)))

(assert (=> b!662314 (= res!430324 (contains!3271 lt!308980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662315 () Bool)

(declare-fun e!380260 () Bool)

(assert (=> b!662315 (= e!380258 (not e!380260))))

(declare-fun res!430337 () Bool)

(assert (=> b!662315 (=> res!430337 e!380260)))

(assert (=> b!662315 (= res!430337 (not (validKeyInArray!0 (select (arr!18653 a!3626) from!3004))))))

(declare-datatypes ((Unit!23006 0))(
  ( (Unit!23007) )
))
(declare-fun lt!308975 () Unit!23006)

(declare-fun e!380261 () Unit!23006)

(assert (=> b!662315 (= lt!308975 e!380261)))

(declare-fun c!76361 () Bool)

(declare-fun arrayContainsKey!0 (array!38921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662315 (= c!76361 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662315 (arrayContainsKey!0 (array!38922 (store (arr!18653 a!3626) i!1382 k!2843) (size!19017 a!3626)) k!2843 from!3004)))

(declare-fun b!662316 () Bool)

(declare-fun res!430334 () Bool)

(assert (=> b!662316 (=> res!430334 e!380262)))

(declare-fun noDuplicate!518 (List!12694) Bool)

(assert (=> b!662316 (= res!430334 (not (noDuplicate!518 lt!308980)))))

(declare-fun res!430331 () Bool)

(assert (=> start!59874 (=> (not res!430331) (not e!380258))))

(assert (=> start!59874 (= res!430331 (and (bvslt (size!19017 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19017 a!3626))))))

(assert (=> start!59874 e!380258))

(assert (=> start!59874 true))

(declare-fun array_inv!14449 (array!38921) Bool)

(assert (=> start!59874 (array_inv!14449 a!3626)))

(declare-fun b!662317 () Bool)

(declare-fun e!380256 () Bool)

(declare-fun e!380259 () Bool)

(assert (=> b!662317 (= e!380256 e!380259)))

(declare-fun res!430336 () Bool)

(assert (=> b!662317 (=> (not res!430336) (not e!380259))))

(assert (=> b!662317 (= res!430336 (bvsle from!3004 i!1382))))

(declare-fun b!662318 () Bool)

(assert (=> b!662318 (= e!380259 (not (contains!3271 acc!681 k!2843)))))

(declare-fun b!662319 () Bool)

(declare-fun Unit!23008 () Unit!23006)

(assert (=> b!662319 (= e!380261 Unit!23008)))

(declare-fun lt!308976 () Unit!23006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38921 (_ BitVec 64) (_ BitVec 32)) Unit!23006)

(assert (=> b!662319 (= lt!308976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662319 false))

(declare-fun b!662320 () Bool)

(assert (=> b!662320 (= e!380260 e!380262)))

(declare-fun res!430321 () Bool)

(assert (=> b!662320 (=> res!430321 e!380262)))

(assert (=> b!662320 (= res!430321 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!142 (List!12694 (_ BitVec 64)) List!12694)

(assert (=> b!662320 (= lt!308980 ($colon$colon!142 acc!681 (select (arr!18653 a!3626) from!3004)))))

(assert (=> b!662320 (subseq!10 acc!681 acc!681)))

(declare-fun lt!308977 () Unit!23006)

(declare-fun lemmaListSubSeqRefl!0 (List!12694) Unit!23006)

(assert (=> b!662320 (= lt!308977 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662321 () Bool)

(declare-fun res!430332 () Bool)

(assert (=> b!662321 (=> (not res!430332) (not e!380258))))

(assert (=> b!662321 (= res!430332 (noDuplicate!518 acc!681))))

(declare-fun b!662322 () Bool)

(declare-fun res!430328 () Bool)

(assert (=> b!662322 (=> (not res!430328) (not e!380258))))

(assert (=> b!662322 (= res!430328 e!380256)))

(declare-fun res!430325 () Bool)

(assert (=> b!662322 (=> res!430325 e!380256)))

(assert (=> b!662322 (= res!430325 e!380257)))

(declare-fun res!430322 () Bool)

(assert (=> b!662322 (=> (not res!430322) (not e!380257))))

(assert (=> b!662322 (= res!430322 (bvsgt from!3004 i!1382))))

(declare-fun b!662323 () Bool)

(declare-fun Unit!23009 () Unit!23006)

(assert (=> b!662323 (= e!380261 Unit!23009)))

(declare-fun b!662324 () Bool)

(declare-fun res!430330 () Bool)

(assert (=> b!662324 (=> (not res!430330) (not e!380258))))

(assert (=> b!662324 (= res!430330 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662325 () Bool)

(declare-fun res!430329 () Bool)

(assert (=> b!662325 (=> (not res!430329) (not e!380258))))

(assert (=> b!662325 (= res!430329 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19017 a!3626))))))

(declare-fun b!662326 () Bool)

(declare-fun res!430323 () Bool)

(assert (=> b!662326 (=> (not res!430323) (not e!380258))))

(assert (=> b!662326 (= res!430323 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662327 () Bool)

(assert (=> b!662327 (= e!380262 true)))

(declare-fun lt!308979 () Bool)

(assert (=> b!662327 (= lt!308979 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308980))))

(declare-fun lt!308978 () Unit!23006)

(declare-fun noDuplicateSubseq!10 (List!12694 List!12694) Unit!23006)

(assert (=> b!662327 (= lt!308978 (noDuplicateSubseq!10 acc!681 lt!308980))))

(assert (= (and start!59874 res!430331) b!662321))

(assert (= (and b!662321 res!430332) b!662307))

(assert (= (and b!662307 res!430326) b!662306))

(assert (= (and b!662306 res!430333) b!662322))

(assert (= (and b!662322 res!430322) b!662311))

(assert (= (and b!662322 (not res!430325)) b!662317))

(assert (= (and b!662317 res!430336) b!662318))

(assert (= (and b!662322 res!430328) b!662312))

(assert (= (and b!662312 res!430319) b!662324))

(assert (= (and b!662324 res!430330) b!662325))

(assert (= (and b!662325 res!430329) b!662313))

(assert (= (and b!662313 res!430327) b!662326))

(assert (= (and b!662326 res!430323) b!662309))

(assert (= (and b!662309 res!430318) b!662315))

(assert (= (and b!662315 c!76361) b!662319))

(assert (= (and b!662315 (not c!76361)) b!662323))

(assert (= (and b!662315 (not res!430337)) b!662320))

(assert (= (and b!662320 (not res!430321)) b!662316))

(assert (= (and b!662316 (not res!430334)) b!662314))

(assert (= (and b!662314 (not res!430324)) b!662308))

(assert (= (and b!662308 (not res!430335)) b!662310))

(assert (= (and b!662310 (not res!430320)) b!662327))

(declare-fun m!634181 () Bool)

(assert (=> b!662312 m!634181))

(declare-fun m!634183 () Bool)

(assert (=> b!662313 m!634183))

(declare-fun m!634185 () Bool)

(assert (=> b!662307 m!634185))

(declare-fun m!634187 () Bool)

(assert (=> b!662319 m!634187))

(declare-fun m!634189 () Bool)

(assert (=> b!662314 m!634189))

(declare-fun m!634191 () Bool)

(assert (=> b!662306 m!634191))

(declare-fun m!634193 () Bool)

(assert (=> b!662321 m!634193))

(declare-fun m!634195 () Bool)

(assert (=> b!662308 m!634195))

(declare-fun m!634197 () Bool)

(assert (=> b!662318 m!634197))

(declare-fun m!634199 () Bool)

(assert (=> b!662315 m!634199))

(declare-fun m!634201 () Bool)

(assert (=> b!662315 m!634201))

(declare-fun m!634203 () Bool)

(assert (=> b!662315 m!634203))

(assert (=> b!662315 m!634199))

(declare-fun m!634205 () Bool)

(assert (=> b!662315 m!634205))

(declare-fun m!634207 () Bool)

(assert (=> b!662315 m!634207))

(declare-fun m!634209 () Bool)

(assert (=> b!662327 m!634209))

(declare-fun m!634211 () Bool)

(assert (=> b!662327 m!634211))

(assert (=> b!662320 m!634199))

(assert (=> b!662320 m!634199))

(declare-fun m!634213 () Bool)

(assert (=> b!662320 m!634213))

(declare-fun m!634215 () Bool)

(assert (=> b!662320 m!634215))

(declare-fun m!634217 () Bool)

(assert (=> b!662320 m!634217))

(declare-fun m!634219 () Bool)

(assert (=> b!662326 m!634219))

(declare-fun m!634221 () Bool)

(assert (=> start!59874 m!634221))

(declare-fun m!634223 () Bool)

(assert (=> b!662324 m!634223))

(declare-fun m!634225 () Bool)

(assert (=> b!662316 m!634225))

(declare-fun m!634227 () Bool)

(assert (=> b!662310 m!634227))

(assert (=> b!662311 m!634197))

(push 1)

