; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61558 () Bool)

(assert start!61558)

(declare-fun b!688343 () Bool)

(declare-fun res!453064 () Bool)

(declare-fun e!392066 () Bool)

(assert (=> b!688343 (=> (not res!453064) (not e!392066))))

(declare-datatypes ((List!13062 0))(
  ( (Nil!13059) (Cons!13058 (h!14103 (_ BitVec 64)) (t!19326 List!13062)) )
))
(declare-fun acc!681 () List!13062)

(declare-fun contains!3639 (List!13062 (_ BitVec 64)) Bool)

(assert (=> b!688343 (= res!453064 (not (contains!3639 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688345 () Bool)

(declare-fun res!453071 () Bool)

(assert (=> b!688345 (=> (not res!453071) (not e!392066))))

(declare-fun e!392074 () Bool)

(assert (=> b!688345 (= res!453071 e!392074)))

(declare-fun res!453075 () Bool)

(assert (=> b!688345 (=> res!453075 e!392074)))

(declare-fun e!392070 () Bool)

(assert (=> b!688345 (= res!453075 e!392070)))

(declare-fun res!453083 () Bool)

(assert (=> b!688345 (=> (not res!453083) (not e!392070))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688345 (= res!453083 (bvsgt from!3004 i!1382))))

(declare-fun b!688346 () Bool)

(declare-datatypes ((Unit!24272 0))(
  ( (Unit!24273) )
))
(declare-fun e!392069 () Unit!24272)

(declare-fun Unit!24274 () Unit!24272)

(assert (=> b!688346 (= e!392069 Unit!24274)))

(declare-fun b!688347 () Bool)

(declare-fun res!453081 () Bool)

(assert (=> b!688347 (=> (not res!453081) (not e!392066))))

(declare-datatypes ((array!39699 0))(
  ( (array!39700 (arr!19021 (Array (_ BitVec 32) (_ BitVec 64))) (size!19403 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39699)

(assert (=> b!688347 (= res!453081 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19403 a!3626))))))

(declare-fun b!688348 () Bool)

(declare-fun res!453079 () Bool)

(assert (=> b!688348 (=> (not res!453079) (not e!392066))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688348 (= res!453079 (validKeyInArray!0 k0!2843))))

(declare-fun b!688349 () Bool)

(declare-fun e!392071 () Bool)

(declare-fun lt!315730 () List!13062)

(assert (=> b!688349 (= e!392071 (not (contains!3639 lt!315730 k0!2843)))))

(declare-fun b!688350 () Bool)

(declare-fun e!392072 () Bool)

(assert (=> b!688350 (= e!392074 e!392072)))

(declare-fun res!453074 () Bool)

(assert (=> b!688350 (=> (not res!453074) (not e!392072))))

(assert (=> b!688350 (= res!453074 (bvsle from!3004 i!1382))))

(declare-fun b!688351 () Bool)

(declare-fun e!392067 () Bool)

(assert (=> b!688351 (= e!392067 (contains!3639 lt!315730 k0!2843))))

(declare-fun b!688352 () Bool)

(declare-fun res!453077 () Bool)

(declare-fun e!392073 () Bool)

(assert (=> b!688352 (=> res!453077 e!392073)))

(assert (=> b!688352 (= res!453077 (contains!3639 lt!315730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688353 () Bool)

(declare-fun e!392076 () Unit!24272)

(declare-fun Unit!24275 () Unit!24272)

(assert (=> b!688353 (= e!392076 Unit!24275)))

(declare-fun b!688354 () Bool)

(declare-fun res!453068 () Bool)

(assert (=> b!688354 (=> (not res!453068) (not e!392066))))

(declare-fun noDuplicate!886 (List!13062) Bool)

(assert (=> b!688354 (= res!453068 (noDuplicate!886 acc!681))))

(declare-fun b!688355 () Bool)

(assert (=> b!688355 (= e!392072 (not (contains!3639 acc!681 k0!2843)))))

(declare-fun b!688356 () Bool)

(assert (=> b!688356 (= e!392070 (contains!3639 acc!681 k0!2843))))

(declare-fun b!688357 () Bool)

(declare-fun res!453080 () Bool)

(assert (=> b!688357 (=> res!453080 e!392073)))

(assert (=> b!688357 (= res!453080 (contains!3639 lt!315730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688358 () Bool)

(declare-fun e!392068 () Bool)

(assert (=> b!688358 (= e!392068 e!392071)))

(declare-fun res!453067 () Bool)

(assert (=> b!688358 (=> (not res!453067) (not e!392071))))

(assert (=> b!688358 (= res!453067 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!453073 () Bool)

(assert (=> start!61558 (=> (not res!453073) (not e!392066))))

(assert (=> start!61558 (= res!453073 (and (bvslt (size!19403 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19403 a!3626))))))

(assert (=> start!61558 e!392066))

(assert (=> start!61558 true))

(declare-fun array_inv!14817 (array!39699) Bool)

(assert (=> start!61558 (array_inv!14817 a!3626)))

(declare-fun b!688344 () Bool)

(declare-fun res!453072 () Bool)

(assert (=> b!688344 (=> res!453072 e!392073)))

(assert (=> b!688344 (= res!453072 (not (noDuplicate!886 lt!315730)))))

(declare-fun b!688359 () Bool)

(declare-fun res!453063 () Bool)

(assert (=> b!688359 (=> (not res!453063) (not e!392066))))

(declare-fun arrayContainsKey!0 (array!39699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688359 (= res!453063 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688360 () Bool)

(declare-fun res!453070 () Bool)

(assert (=> b!688360 (=> (not res!453070) (not e!392066))))

(declare-fun arrayNoDuplicates!0 (array!39699 (_ BitVec 32) List!13062) Bool)

(assert (=> b!688360 (= res!453070 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688361 () Bool)

(declare-fun lt!315734 () Unit!24272)

(assert (=> b!688361 (= e!392069 lt!315734)))

(declare-fun lt!315739 () Unit!24272)

(declare-fun lemmaListSubSeqRefl!0 (List!13062) Unit!24272)

(assert (=> b!688361 (= lt!315739 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!225 (List!13062 List!13062) Bool)

(assert (=> b!688361 (subseq!225 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39699 List!13062 List!13062 (_ BitVec 32)) Unit!24272)

(declare-fun $colon$colon!390 (List!13062 (_ BitVec 64)) List!13062)

(assert (=> b!688361 (= lt!315734 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!390 acc!681 (select (arr!19021 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688361 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688362 () Bool)

(declare-fun res!453069 () Bool)

(assert (=> b!688362 (=> (not res!453069) (not e!392066))))

(assert (=> b!688362 (= res!453069 (not (contains!3639 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688363 () Bool)

(declare-fun res!453065 () Bool)

(assert (=> b!688363 (=> (not res!453065) (not e!392066))))

(assert (=> b!688363 (= res!453065 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13059))))

(declare-fun b!688364 () Bool)

(assert (=> b!688364 (= e!392066 (not e!392073))))

(declare-fun res!453078 () Bool)

(assert (=> b!688364 (=> res!453078 e!392073)))

(assert (=> b!688364 (= res!453078 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688364 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315730)))

(declare-fun lt!315731 () Unit!24272)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39699 (_ BitVec 64) (_ BitVec 32) List!13062 List!13062) Unit!24272)

(assert (=> b!688364 (= lt!315731 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315730))))

(declare-fun -!190 (List!13062 (_ BitVec 64)) List!13062)

(assert (=> b!688364 (= (-!190 lt!315730 k0!2843) acc!681)))

(assert (=> b!688364 (= lt!315730 ($colon$colon!390 acc!681 k0!2843))))

(declare-fun lt!315737 () Unit!24272)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13062) Unit!24272)

(assert (=> b!688364 (= lt!315737 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!688364 (subseq!225 acc!681 acc!681)))

(declare-fun lt!315732 () Unit!24272)

(assert (=> b!688364 (= lt!315732 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688364 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315736 () Unit!24272)

(assert (=> b!688364 (= lt!315736 e!392069)))

(declare-fun c!78008 () Bool)

(assert (=> b!688364 (= c!78008 (validKeyInArray!0 (select (arr!19021 a!3626) from!3004)))))

(declare-fun lt!315733 () Unit!24272)

(assert (=> b!688364 (= lt!315733 e!392076)))

(declare-fun c!78007 () Bool)

(assert (=> b!688364 (= c!78007 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688364 (arrayContainsKey!0 (array!39700 (store (arr!19021 a!3626) i!1382 k0!2843) (size!19403 a!3626)) k0!2843 from!3004)))

(declare-fun b!688365 () Bool)

(declare-fun Unit!24276 () Unit!24272)

(assert (=> b!688365 (= e!392076 Unit!24276)))

(declare-fun lt!315738 () Unit!24272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39699 (_ BitVec 64) (_ BitVec 32)) Unit!24272)

(assert (=> b!688365 (= lt!315738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688365 false))

(declare-fun b!688366 () Bool)

(declare-fun res!453082 () Bool)

(assert (=> b!688366 (=> (not res!453082) (not e!392066))))

(assert (=> b!688366 (= res!453082 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19403 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688367 () Bool)

(assert (=> b!688367 (= e!392073 true)))

(declare-fun lt!315735 () Bool)

(assert (=> b!688367 (= lt!315735 e!392068)))

(declare-fun res!453076 () Bool)

(assert (=> b!688367 (=> res!453076 e!392068)))

(assert (=> b!688367 (= res!453076 e!392067)))

(declare-fun res!453066 () Bool)

(assert (=> b!688367 (=> (not res!453066) (not e!392067))))

(assert (=> b!688367 (= res!453066 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61558 res!453073) b!688354))

(assert (= (and b!688354 res!453068) b!688343))

(assert (= (and b!688343 res!453064) b!688362))

(assert (= (and b!688362 res!453069) b!688345))

(assert (= (and b!688345 res!453083) b!688356))

(assert (= (and b!688345 (not res!453075)) b!688350))

(assert (= (and b!688350 res!453074) b!688355))

(assert (= (and b!688345 res!453071) b!688363))

(assert (= (and b!688363 res!453065) b!688360))

(assert (= (and b!688360 res!453070) b!688347))

(assert (= (and b!688347 res!453081) b!688348))

(assert (= (and b!688348 res!453079) b!688359))

(assert (= (and b!688359 res!453063) b!688366))

(assert (= (and b!688366 res!453082) b!688364))

(assert (= (and b!688364 c!78007) b!688365))

(assert (= (and b!688364 (not c!78007)) b!688353))

(assert (= (and b!688364 c!78008) b!688361))

(assert (= (and b!688364 (not c!78008)) b!688346))

(assert (= (and b!688364 (not res!453078)) b!688344))

(assert (= (and b!688344 (not res!453072)) b!688352))

(assert (= (and b!688352 (not res!453077)) b!688357))

(assert (= (and b!688357 (not res!453080)) b!688367))

(assert (= (and b!688367 res!453066) b!688351))

(assert (= (and b!688367 (not res!453076)) b!688358))

(assert (= (and b!688358 res!453067) b!688349))

(declare-fun m!652257 () Bool)

(assert (=> b!688354 m!652257))

(declare-fun m!652259 () Bool)

(assert (=> b!688351 m!652259))

(declare-fun m!652261 () Bool)

(assert (=> b!688362 m!652261))

(assert (=> b!688349 m!652259))

(declare-fun m!652263 () Bool)

(assert (=> b!688365 m!652263))

(declare-fun m!652265 () Bool)

(assert (=> b!688344 m!652265))

(declare-fun m!652267 () Bool)

(assert (=> b!688357 m!652267))

(declare-fun m!652269 () Bool)

(assert (=> b!688355 m!652269))

(assert (=> b!688356 m!652269))

(declare-fun m!652271 () Bool)

(assert (=> b!688360 m!652271))

(declare-fun m!652273 () Bool)

(assert (=> b!688352 m!652273))

(declare-fun m!652275 () Bool)

(assert (=> b!688361 m!652275))

(declare-fun m!652277 () Bool)

(assert (=> b!688361 m!652277))

(declare-fun m!652279 () Bool)

(assert (=> b!688361 m!652279))

(declare-fun m!652281 () Bool)

(assert (=> b!688361 m!652281))

(assert (=> b!688361 m!652277))

(assert (=> b!688361 m!652279))

(declare-fun m!652283 () Bool)

(assert (=> b!688361 m!652283))

(declare-fun m!652285 () Bool)

(assert (=> b!688361 m!652285))

(declare-fun m!652287 () Bool)

(assert (=> b!688348 m!652287))

(declare-fun m!652289 () Bool)

(assert (=> b!688363 m!652289))

(declare-fun m!652291 () Bool)

(assert (=> b!688343 m!652291))

(declare-fun m!652293 () Bool)

(assert (=> start!61558 m!652293))

(declare-fun m!652295 () Bool)

(assert (=> b!688359 m!652295))

(assert (=> b!688364 m!652275))

(assert (=> b!688364 m!652277))

(declare-fun m!652297 () Bool)

(assert (=> b!688364 m!652297))

(declare-fun m!652299 () Bool)

(assert (=> b!688364 m!652299))

(assert (=> b!688364 m!652283))

(declare-fun m!652301 () Bool)

(assert (=> b!688364 m!652301))

(declare-fun m!652303 () Bool)

(assert (=> b!688364 m!652303))

(declare-fun m!652305 () Bool)

(assert (=> b!688364 m!652305))

(assert (=> b!688364 m!652277))

(declare-fun m!652307 () Bool)

(assert (=> b!688364 m!652307))

(declare-fun m!652309 () Bool)

(assert (=> b!688364 m!652309))

(declare-fun m!652311 () Bool)

(assert (=> b!688364 m!652311))

(declare-fun m!652313 () Bool)

(assert (=> b!688364 m!652313))

(assert (=> b!688364 m!652285))

(check-sat (not b!688361) (not b!688351) (not b!688352) (not b!688359) (not b!688355) (not b!688354) (not b!688364) (not b!688360) (not b!688344) (not b!688365) (not b!688348) (not b!688343) (not b!688357) (not b!688349) (not start!61558) (not b!688362) (not b!688356) (not b!688363))
(check-sat)
