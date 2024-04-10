; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60100 () Bool)

(assert start!60100)

(declare-fun b!670351 () Bool)

(declare-fun res!437117 () Bool)

(declare-fun e!383297 () Bool)

(assert (=> b!670351 (=> (not res!437117) (not e!383297))))

(declare-datatypes ((List!12807 0))(
  ( (Nil!12804) (Cons!12803 (h!13848 (_ BitVec 64)) (t!19035 List!12807)) )
))
(declare-fun acc!681 () List!12807)

(declare-fun contains!3384 (List!12807 (_ BitVec 64)) Bool)

(assert (=> b!670351 (= res!437117 (not (contains!3384 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670352 () Bool)

(declare-fun e!383290 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!670352 (= e!383290 (not (contains!3384 acc!681 k0!2843)))))

(declare-fun b!670353 () Bool)

(declare-fun e!383296 () Bool)

(assert (=> b!670353 (= e!383296 (contains!3384 acc!681 k0!2843))))

(declare-fun b!670354 () Bool)

(declare-datatypes ((Unit!23555 0))(
  ( (Unit!23556) )
))
(declare-fun e!383289 () Unit!23555)

(declare-fun Unit!23557 () Unit!23555)

(assert (=> b!670354 (= e!383289 Unit!23557)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!311998 () Unit!23555)

(declare-datatypes ((array!39147 0))(
  ( (array!39148 (arr!18766 (Array (_ BitVec 32) (_ BitVec 64))) (size!19130 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39147 (_ BitVec 64) (_ BitVec 32)) Unit!23555)

(assert (=> b!670354 (= lt!311998 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!670354 false))

(declare-fun b!670355 () Bool)

(declare-fun e!383288 () Unit!23555)

(declare-fun Unit!23558 () Unit!23555)

(assert (=> b!670355 (= e!383288 Unit!23558)))

(declare-fun b!670356 () Bool)

(declare-fun res!437101 () Bool)

(declare-fun e!383295 () Bool)

(assert (=> b!670356 (=> res!437101 e!383295)))

(declare-fun lt!311999 () List!12807)

(declare-fun noDuplicate!631 (List!12807) Bool)

(assert (=> b!670356 (= res!437101 (not (noDuplicate!631 lt!311999)))))

(declare-fun b!670358 () Bool)

(declare-fun res!437110 () Bool)

(assert (=> b!670358 (=> (not res!437110) (not e!383297))))

(declare-fun arrayNoDuplicates!0 (array!39147 (_ BitVec 32) List!12807) Bool)

(assert (=> b!670358 (= res!437110 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670359 () Bool)

(assert (=> b!670359 (= e!383295 true)))

(declare-fun lt!312001 () array!39147)

(assert (=> b!670359 (arrayNoDuplicates!0 lt!312001 (bvadd #b00000000000000000000000000000001 from!3004) lt!311999)))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun lt!312006 () Unit!23555)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12807) Unit!23555)

(assert (=> b!670359 (= lt!312006 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311999))))

(declare-fun b!670360 () Bool)

(declare-fun res!437119 () Bool)

(assert (=> b!670360 (=> (not res!437119) (not e!383297))))

(declare-fun arrayContainsKey!0 (array!39147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670360 (= res!437119 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670361 () Bool)

(declare-fun Unit!23559 () Unit!23555)

(assert (=> b!670361 (= e!383289 Unit!23559)))

(declare-fun b!670362 () Bool)

(declare-fun e!383298 () Bool)

(assert (=> b!670362 (= e!383298 (not (contains!3384 lt!311999 k0!2843)))))

(declare-fun b!670363 () Bool)

(declare-fun res!437105 () Bool)

(assert (=> b!670363 (=> (not res!437105) (not e!383297))))

(assert (=> b!670363 (= res!437105 (not (contains!3384 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670364 () Bool)

(declare-fun res!437099 () Bool)

(assert (=> b!670364 (=> res!437099 e!383295)))

(assert (=> b!670364 (= res!437099 (contains!3384 lt!311999 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670365 () Bool)

(declare-fun res!437112 () Bool)

(assert (=> b!670365 (=> (not res!437112) (not e!383297))))

(declare-fun e!383294 () Bool)

(assert (=> b!670365 (= res!437112 e!383294)))

(declare-fun res!437115 () Bool)

(assert (=> b!670365 (=> res!437115 e!383294)))

(assert (=> b!670365 (= res!437115 e!383296)))

(declare-fun res!437102 () Bool)

(assert (=> b!670365 (=> (not res!437102) (not e!383296))))

(assert (=> b!670365 (= res!437102 (bvsgt from!3004 i!1382))))

(declare-fun b!670357 () Bool)

(declare-fun res!437109 () Bool)

(assert (=> b!670357 (=> (not res!437109) (not e!383297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670357 (= res!437109 (validKeyInArray!0 k0!2843))))

(declare-fun res!437113 () Bool)

(assert (=> start!60100 (=> (not res!437113) (not e!383297))))

(assert (=> start!60100 (= res!437113 (and (bvslt (size!19130 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19130 a!3626))))))

(assert (=> start!60100 e!383297))

(assert (=> start!60100 true))

(declare-fun array_inv!14562 (array!39147) Bool)

(assert (=> start!60100 (array_inv!14562 a!3626)))

(declare-fun b!670366 () Bool)

(declare-fun res!437100 () Bool)

(assert (=> b!670366 (=> res!437100 e!383295)))

(assert (=> b!670366 (= res!437100 (contains!3384 lt!311999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670367 () Bool)

(declare-fun res!437103 () Bool)

(assert (=> b!670367 (=> (not res!437103) (not e!383297))))

(assert (=> b!670367 (= res!437103 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12804))))

(declare-fun b!670368 () Bool)

(declare-fun res!437111 () Bool)

(assert (=> b!670368 (=> (not res!437111) (not e!383297))))

(assert (=> b!670368 (= res!437111 (noDuplicate!631 acc!681))))

(declare-fun b!670369 () Bool)

(declare-fun res!437114 () Bool)

(assert (=> b!670369 (=> res!437114 e!383295)))

(declare-fun e!383292 () Bool)

(assert (=> b!670369 (= res!437114 e!383292)))

(declare-fun res!437120 () Bool)

(assert (=> b!670369 (=> (not res!437120) (not e!383292))))

(assert (=> b!670369 (= res!437120 e!383298)))

(declare-fun res!437108 () Bool)

(assert (=> b!670369 (=> res!437108 e!383298)))

(assert (=> b!670369 (= res!437108 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670370 () Bool)

(assert (=> b!670370 (= e!383297 (not e!383295))))

(declare-fun res!437104 () Bool)

(assert (=> b!670370 (=> res!437104 e!383295)))

(assert (=> b!670370 (= res!437104 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670370 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311999)))

(declare-fun lt!312005 () Unit!23555)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39147 (_ BitVec 64) (_ BitVec 32) List!12807 List!12807) Unit!23555)

(assert (=> b!670370 (= lt!312005 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311999))))

(declare-fun -!121 (List!12807 (_ BitVec 64)) List!12807)

(assert (=> b!670370 (= (-!121 lt!311999 k0!2843) acc!681)))

(declare-fun $colon$colon!255 (List!12807 (_ BitVec 64)) List!12807)

(assert (=> b!670370 (= lt!311999 ($colon$colon!255 acc!681 k0!2843))))

(declare-fun lt!312004 () Unit!23555)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12807) Unit!23555)

(assert (=> b!670370 (= lt!312004 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!123 (List!12807 List!12807) Bool)

(assert (=> b!670370 (subseq!123 acc!681 acc!681)))

(declare-fun lt!311997 () Unit!23555)

(declare-fun lemmaListSubSeqRefl!0 (List!12807) Unit!23555)

(assert (=> b!670370 (= lt!311997 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670370 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312000 () Unit!23555)

(assert (=> b!670370 (= lt!312000 e!383288)))

(declare-fun c!76994 () Bool)

(assert (=> b!670370 (= c!76994 (validKeyInArray!0 (select (arr!18766 a!3626) from!3004)))))

(declare-fun lt!312007 () Unit!23555)

(assert (=> b!670370 (= lt!312007 e!383289)))

(declare-fun c!76993 () Bool)

(assert (=> b!670370 (= c!76993 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670370 (arrayContainsKey!0 lt!312001 k0!2843 from!3004)))

(assert (=> b!670370 (= lt!312001 (array!39148 (store (arr!18766 a!3626) i!1382 k0!2843) (size!19130 a!3626)))))

(declare-fun b!670371 () Bool)

(declare-fun res!437116 () Bool)

(assert (=> b!670371 (=> (not res!437116) (not e!383297))))

(assert (=> b!670371 (= res!437116 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19130 a!3626))))))

(declare-fun b!670372 () Bool)

(declare-fun lt!312002 () Unit!23555)

(assert (=> b!670372 (= e!383288 lt!312002)))

(declare-fun lt!312003 () Unit!23555)

(assert (=> b!670372 (= lt!312003 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670372 (subseq!123 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39147 List!12807 List!12807 (_ BitVec 32)) Unit!23555)

(assert (=> b!670372 (= lt!312002 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!255 acc!681 (select (arr!18766 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670372 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670373 () Bool)

(declare-fun e!383291 () Bool)

(assert (=> b!670373 (= e!383292 e!383291)))

(declare-fun res!437118 () Bool)

(assert (=> b!670373 (=> res!437118 e!383291)))

(assert (=> b!670373 (= res!437118 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670374 () Bool)

(assert (=> b!670374 (= e!383294 e!383290)))

(declare-fun res!437107 () Bool)

(assert (=> b!670374 (=> (not res!437107) (not e!383290))))

(assert (=> b!670374 (= res!437107 (bvsle from!3004 i!1382))))

(declare-fun b!670375 () Bool)

(declare-fun res!437106 () Bool)

(assert (=> b!670375 (=> (not res!437106) (not e!383297))))

(assert (=> b!670375 (= res!437106 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19130 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670376 () Bool)

(assert (=> b!670376 (= e!383291 (contains!3384 lt!311999 k0!2843))))

(assert (= (and start!60100 res!437113) b!670368))

(assert (= (and b!670368 res!437111) b!670363))

(assert (= (and b!670363 res!437105) b!670351))

(assert (= (and b!670351 res!437117) b!670365))

(assert (= (and b!670365 res!437102) b!670353))

(assert (= (and b!670365 (not res!437115)) b!670374))

(assert (= (and b!670374 res!437107) b!670352))

(assert (= (and b!670365 res!437112) b!670367))

(assert (= (and b!670367 res!437103) b!670358))

(assert (= (and b!670358 res!437110) b!670371))

(assert (= (and b!670371 res!437116) b!670357))

(assert (= (and b!670357 res!437109) b!670360))

(assert (= (and b!670360 res!437119) b!670375))

(assert (= (and b!670375 res!437106) b!670370))

(assert (= (and b!670370 c!76993) b!670354))

(assert (= (and b!670370 (not c!76993)) b!670361))

(assert (= (and b!670370 c!76994) b!670372))

(assert (= (and b!670370 (not c!76994)) b!670355))

(assert (= (and b!670370 (not res!437104)) b!670356))

(assert (= (and b!670356 (not res!437101)) b!670366))

(assert (= (and b!670366 (not res!437100)) b!670364))

(assert (= (and b!670364 (not res!437099)) b!670369))

(assert (= (and b!670369 (not res!437108)) b!670362))

(assert (= (and b!670369 res!437120) b!670373))

(assert (= (and b!670373 (not res!437118)) b!670376))

(assert (= (and b!670369 (not res!437114)) b!670359))

(declare-fun m!640249 () Bool)

(assert (=> b!670353 m!640249))

(declare-fun m!640251 () Bool)

(assert (=> b!670364 m!640251))

(declare-fun m!640253 () Bool)

(assert (=> b!670351 m!640253))

(declare-fun m!640255 () Bool)

(assert (=> b!670360 m!640255))

(declare-fun m!640257 () Bool)

(assert (=> b!670356 m!640257))

(declare-fun m!640259 () Bool)

(assert (=> b!670362 m!640259))

(declare-fun m!640261 () Bool)

(assert (=> b!670370 m!640261))

(declare-fun m!640263 () Bool)

(assert (=> b!670370 m!640263))

(declare-fun m!640265 () Bool)

(assert (=> b!670370 m!640265))

(declare-fun m!640267 () Bool)

(assert (=> b!670370 m!640267))

(declare-fun m!640269 () Bool)

(assert (=> b!670370 m!640269))

(declare-fun m!640271 () Bool)

(assert (=> b!670370 m!640271))

(declare-fun m!640273 () Bool)

(assert (=> b!670370 m!640273))

(declare-fun m!640275 () Bool)

(assert (=> b!670370 m!640275))

(declare-fun m!640277 () Bool)

(assert (=> b!670370 m!640277))

(assert (=> b!670370 m!640263))

(declare-fun m!640279 () Bool)

(assert (=> b!670370 m!640279))

(declare-fun m!640281 () Bool)

(assert (=> b!670370 m!640281))

(declare-fun m!640283 () Bool)

(assert (=> b!670370 m!640283))

(declare-fun m!640285 () Bool)

(assert (=> b!670370 m!640285))

(declare-fun m!640287 () Bool)

(assert (=> b!670367 m!640287))

(assert (=> b!670376 m!640259))

(assert (=> b!670352 m!640249))

(declare-fun m!640289 () Bool)

(assert (=> b!670357 m!640289))

(assert (=> b!670372 m!640261))

(assert (=> b!670372 m!640263))

(declare-fun m!640291 () Bool)

(assert (=> b!670372 m!640291))

(declare-fun m!640293 () Bool)

(assert (=> b!670372 m!640293))

(assert (=> b!670372 m!640263))

(assert (=> b!670372 m!640291))

(assert (=> b!670372 m!640273))

(assert (=> b!670372 m!640281))

(declare-fun m!640295 () Bool)

(assert (=> b!670359 m!640295))

(declare-fun m!640297 () Bool)

(assert (=> b!670359 m!640297))

(declare-fun m!640299 () Bool)

(assert (=> b!670366 m!640299))

(declare-fun m!640301 () Bool)

(assert (=> b!670354 m!640301))

(declare-fun m!640303 () Bool)

(assert (=> start!60100 m!640303))

(declare-fun m!640305 () Bool)

(assert (=> b!670368 m!640305))

(declare-fun m!640307 () Bool)

(assert (=> b!670363 m!640307))

(declare-fun m!640309 () Bool)

(assert (=> b!670358 m!640309))

(check-sat (not b!670351) (not b!670352) (not b!670363) (not b!670366) (not b!670360) (not b!670368) (not b!670367) (not b!670353) (not b!670370) (not b!670362) (not b!670354) (not b!670357) (not b!670359) (not b!670356) (not start!60100) (not b!670376) (not b!670358) (not b!670364) (not b!670372))
(check-sat)
