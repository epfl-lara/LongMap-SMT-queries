; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59908 () Bool)

(assert start!59908)

(declare-fun b!663408 () Bool)

(declare-datatypes ((Unit!23075 0))(
  ( (Unit!23076) )
))
(declare-fun e!380663 () Unit!23075)

(declare-fun Unit!23077 () Unit!23075)

(assert (=> b!663408 (= e!380663 Unit!23077)))

(declare-fun res!431318 () Bool)

(declare-fun e!380664 () Bool)

(assert (=> start!59908 (=> (not res!431318) (not e!380664))))

(declare-datatypes ((array!38955 0))(
  ( (array!38956 (arr!18670 (Array (_ BitVec 32) (_ BitVec 64))) (size!19034 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38955)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59908 (= res!431318 (and (bvslt (size!19034 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19034 a!3626))))))

(assert (=> start!59908 e!380664))

(assert (=> start!59908 true))

(declare-fun array_inv!14466 (array!38955) Bool)

(assert (=> start!59908 (array_inv!14466 a!3626)))

(declare-fun b!663409 () Bool)

(declare-fun e!380658 () Bool)

(declare-datatypes ((List!12711 0))(
  ( (Nil!12708) (Cons!12707 (h!13752 (_ BitVec 64)) (t!18939 List!12711)) )
))
(declare-fun acc!681 () List!12711)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3288 (List!12711 (_ BitVec 64)) Bool)

(assert (=> b!663409 (= e!380658 (not (contains!3288 acc!681 k0!2843)))))

(declare-fun b!663410 () Bool)

(assert (=> b!663410 (= e!380664 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!309276 () Unit!23075)

(declare-fun e!380662 () Unit!23075)

(assert (=> b!663410 (= lt!309276 e!380662)))

(declare-fun c!76418 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663410 (= c!76418 (validKeyInArray!0 (select (arr!18670 a!3626) from!3004)))))

(declare-fun lt!309277 () Unit!23075)

(assert (=> b!663410 (= lt!309277 e!380663)))

(declare-fun c!76417 () Bool)

(declare-fun arrayContainsKey!0 (array!38955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663410 (= c!76417 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663410 (arrayContainsKey!0 (array!38956 (store (arr!18670 a!3626) i!1382 k0!2843) (size!19034 a!3626)) k0!2843 from!3004)))

(declare-fun b!663411 () Bool)

(declare-fun res!431313 () Bool)

(assert (=> b!663411 (=> (not res!431313) (not e!380664))))

(assert (=> b!663411 (= res!431313 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19034 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663412 () Bool)

(declare-fun e!380659 () Bool)

(assert (=> b!663412 (= e!380659 e!380658)))

(declare-fun res!431319 () Bool)

(assert (=> b!663412 (=> (not res!431319) (not e!380658))))

(assert (=> b!663412 (= res!431319 (bvsle from!3004 i!1382))))

(declare-fun b!663413 () Bool)

(declare-fun lt!309279 () Unit!23075)

(assert (=> b!663413 (= e!380662 lt!309279)))

(declare-fun lt!309278 () Unit!23075)

(declare-fun lemmaListSubSeqRefl!0 (List!12711) Unit!23075)

(assert (=> b!663413 (= lt!309278 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!27 (List!12711 List!12711) Bool)

(assert (=> b!663413 (subseq!27 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38955 List!12711 List!12711 (_ BitVec 32)) Unit!23075)

(declare-fun $colon$colon!159 (List!12711 (_ BitVec 64)) List!12711)

(assert (=> b!663413 (= lt!309279 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!159 acc!681 (select (arr!18670 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38955 (_ BitVec 32) List!12711) Bool)

(assert (=> b!663413 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663414 () Bool)

(declare-fun res!431308 () Bool)

(assert (=> b!663414 (=> (not res!431308) (not e!380664))))

(assert (=> b!663414 (= res!431308 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663415 () Bool)

(declare-fun res!431309 () Bool)

(assert (=> b!663415 (=> (not res!431309) (not e!380664))))

(assert (=> b!663415 (= res!431309 e!380659)))

(declare-fun res!431316 () Bool)

(assert (=> b!663415 (=> res!431316 e!380659)))

(declare-fun e!380660 () Bool)

(assert (=> b!663415 (= res!431316 e!380660)))

(declare-fun res!431310 () Bool)

(assert (=> b!663415 (=> (not res!431310) (not e!380660))))

(assert (=> b!663415 (= res!431310 (bvsgt from!3004 i!1382))))

(declare-fun b!663416 () Bool)

(declare-fun res!431312 () Bool)

(assert (=> b!663416 (=> (not res!431312) (not e!380664))))

(assert (=> b!663416 (= res!431312 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12708))))

(declare-fun b!663417 () Bool)

(declare-fun res!431311 () Bool)

(assert (=> b!663417 (=> (not res!431311) (not e!380664))))

(declare-fun noDuplicate!535 (List!12711) Bool)

(assert (=> b!663417 (= res!431311 (noDuplicate!535 acc!681))))

(declare-fun b!663418 () Bool)

(declare-fun res!431317 () Bool)

(assert (=> b!663418 (=> (not res!431317) (not e!380664))))

(assert (=> b!663418 (= res!431317 (not (contains!3288 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663419 () Bool)

(declare-fun Unit!23078 () Unit!23075)

(assert (=> b!663419 (= e!380663 Unit!23078)))

(declare-fun lt!309280 () Unit!23075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38955 (_ BitVec 64) (_ BitVec 32)) Unit!23075)

(assert (=> b!663419 (= lt!309280 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663419 false))

(declare-fun b!663420 () Bool)

(declare-fun res!431320 () Bool)

(assert (=> b!663420 (=> (not res!431320) (not e!380664))))

(assert (=> b!663420 (= res!431320 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19034 a!3626))))))

(declare-fun b!663421 () Bool)

(declare-fun Unit!23079 () Unit!23075)

(assert (=> b!663421 (= e!380662 Unit!23079)))

(declare-fun b!663422 () Bool)

(assert (=> b!663422 (= e!380660 (contains!3288 acc!681 k0!2843))))

(declare-fun b!663423 () Bool)

(declare-fun res!431314 () Bool)

(assert (=> b!663423 (=> (not res!431314) (not e!380664))))

(assert (=> b!663423 (= res!431314 (not (contains!3288 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663424 () Bool)

(declare-fun res!431315 () Bool)

(assert (=> b!663424 (=> (not res!431315) (not e!380664))))

(assert (=> b!663424 (= res!431315 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663425 () Bool)

(declare-fun res!431321 () Bool)

(assert (=> b!663425 (=> (not res!431321) (not e!380664))))

(assert (=> b!663425 (= res!431321 (validKeyInArray!0 k0!2843))))

(assert (= (and start!59908 res!431318) b!663417))

(assert (= (and b!663417 res!431311) b!663423))

(assert (= (and b!663423 res!431314) b!663418))

(assert (= (and b!663418 res!431317) b!663415))

(assert (= (and b!663415 res!431310) b!663422))

(assert (= (and b!663415 (not res!431316)) b!663412))

(assert (= (and b!663412 res!431319) b!663409))

(assert (= (and b!663415 res!431309) b!663416))

(assert (= (and b!663416 res!431312) b!663414))

(assert (= (and b!663414 res!431308) b!663420))

(assert (= (and b!663420 res!431320) b!663425))

(assert (= (and b!663425 res!431321) b!663424))

(assert (= (and b!663424 res!431315) b!663411))

(assert (= (and b!663411 res!431313) b!663410))

(assert (= (and b!663410 c!76417) b!663419))

(assert (= (and b!663410 (not c!76417)) b!663408))

(assert (= (and b!663410 c!76418) b!663413))

(assert (= (and b!663410 (not c!76418)) b!663421))

(declare-fun m!634989 () Bool)

(assert (=> b!663418 m!634989))

(declare-fun m!634991 () Bool)

(assert (=> b!663423 m!634991))

(declare-fun m!634993 () Bool)

(assert (=> b!663416 m!634993))

(declare-fun m!634995 () Bool)

(assert (=> b!663419 m!634995))

(declare-fun m!634997 () Bool)

(assert (=> start!59908 m!634997))

(declare-fun m!634999 () Bool)

(assert (=> b!663425 m!634999))

(declare-fun m!635001 () Bool)

(assert (=> b!663409 m!635001))

(assert (=> b!663422 m!635001))

(declare-fun m!635003 () Bool)

(assert (=> b!663414 m!635003))

(declare-fun m!635005 () Bool)

(assert (=> b!663413 m!635005))

(declare-fun m!635007 () Bool)

(assert (=> b!663413 m!635007))

(declare-fun m!635009 () Bool)

(assert (=> b!663413 m!635009))

(declare-fun m!635011 () Bool)

(assert (=> b!663413 m!635011))

(assert (=> b!663413 m!635007))

(assert (=> b!663413 m!635009))

(declare-fun m!635013 () Bool)

(assert (=> b!663413 m!635013))

(declare-fun m!635015 () Bool)

(assert (=> b!663413 m!635015))

(declare-fun m!635017 () Bool)

(assert (=> b!663424 m!635017))

(declare-fun m!635019 () Bool)

(assert (=> b!663417 m!635019))

(assert (=> b!663410 m!635007))

(declare-fun m!635021 () Bool)

(assert (=> b!663410 m!635021))

(declare-fun m!635023 () Bool)

(assert (=> b!663410 m!635023))

(assert (=> b!663410 m!635007))

(declare-fun m!635025 () Bool)

(assert (=> b!663410 m!635025))

(declare-fun m!635027 () Bool)

(assert (=> b!663410 m!635027))

(check-sat (not b!663425) (not b!663417) (not b!663413) (not b!663422) (not b!663423) (not b!663424) (not b!663416) (not b!663410) (not b!663418) (not b!663419) (not start!59908) (not b!663409) (not b!663414))
(check-sat)
