; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62512 () Bool)

(assert start!62512)

(declare-fun b!702333 () Bool)

(declare-fun res!466060 () Bool)

(declare-fun e!397590 () Bool)

(assert (=> b!702333 (=> (not res!466060) (not e!397590))))

(declare-datatypes ((array!40131 0))(
  ( (array!40132 (arr!19219 (Array (_ BitVec 32) (_ BitVec 64))) (size!19602 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40131)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13167 0))(
  ( (Nil!13164) (Cons!13163 (h!14211 (_ BitVec 64)) (t!19441 List!13167)) )
))
(declare-fun lt!317769 () List!13167)

(declare-fun arrayNoDuplicates!0 (array!40131 (_ BitVec 32) List!13167) Bool)

(assert (=> b!702333 (= res!466060 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317769))))

(declare-fun b!702334 () Bool)

(declare-fun res!466065 () Bool)

(assert (=> b!702334 (=> (not res!466065) (not e!397590))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun lt!317767 () List!13167)

(declare-fun -!251 (List!13167 (_ BitVec 64)) List!13167)

(assert (=> b!702334 (= res!466065 (= (-!251 lt!317767 k0!2824) lt!317769))))

(declare-fun b!702335 () Bool)

(declare-fun res!466049 () Bool)

(assert (=> b!702335 (=> (not res!466049) (not e!397590))))

(declare-fun contains!3819 (List!13167 (_ BitVec 64)) Bool)

(assert (=> b!702335 (= res!466049 (not (contains!3819 lt!317769 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702336 () Bool)

(declare-fun res!466070 () Bool)

(declare-fun e!397588 () Bool)

(assert (=> b!702336 (=> (not res!466070) (not e!397588))))

(declare-fun acc!652 () List!13167)

(declare-fun noDuplicate!1093 (List!13167) Bool)

(assert (=> b!702336 (= res!466070 (noDuplicate!1093 acc!652))))

(declare-fun b!702337 () Bool)

(declare-fun res!466046 () Bool)

(assert (=> b!702337 (=> (not res!466046) (not e!397588))))

(declare-fun newAcc!49 () List!13167)

(assert (=> b!702337 (= res!466046 (contains!3819 newAcc!49 k0!2824))))

(declare-fun b!702338 () Bool)

(assert (=> b!702338 (= e!397588 e!397590)))

(declare-fun res!466054 () Bool)

(assert (=> b!702338 (=> (not res!466054) (not e!397590))))

(assert (=> b!702338 (= res!466054 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!482 (List!13167 (_ BitVec 64)) List!13167)

(assert (=> b!702338 (= lt!317767 ($colon$colon!482 newAcc!49 (select (arr!19219 a!3591) from!2969)))))

(assert (=> b!702338 (= lt!317769 ($colon$colon!482 acc!652 (select (arr!19219 a!3591) from!2969)))))

(declare-fun b!702339 () Bool)

(declare-fun res!466051 () Bool)

(assert (=> b!702339 (=> (not res!466051) (not e!397590))))

(assert (=> b!702339 (= res!466051 (not (contains!3819 lt!317769 k0!2824)))))

(declare-fun b!702340 () Bool)

(declare-fun res!466071 () Bool)

(assert (=> b!702340 (=> (not res!466071) (not e!397588))))

(assert (=> b!702340 (= res!466071 (not (contains!3819 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702341 () Bool)

(declare-fun res!466062 () Bool)

(assert (=> b!702341 (=> (not res!466062) (not e!397588))))

(assert (=> b!702341 (= res!466062 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19602 a!3591)))))

(declare-fun b!702342 () Bool)

(declare-fun res!466047 () Bool)

(assert (=> b!702342 (=> (not res!466047) (not e!397590))))

(declare-fun subseq!287 (List!13167 List!13167) Bool)

(assert (=> b!702342 (= res!466047 (subseq!287 lt!317769 lt!317767))))

(declare-fun b!702343 () Bool)

(declare-fun res!466048 () Bool)

(assert (=> b!702343 (=> (not res!466048) (not e!397588))))

(assert (=> b!702343 (= res!466048 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702344 () Bool)

(assert (=> b!702344 (= e!397590 (not (bvsle from!2969 (size!19602 a!3591))))))

(assert (=> b!702344 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317767)))

(declare-datatypes ((Unit!24561 0))(
  ( (Unit!24562) )
))
(declare-fun lt!317768 () Unit!24561)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40131 (_ BitVec 64) (_ BitVec 32) List!13167 List!13167) Unit!24561)

(assert (=> b!702344 (= lt!317768 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317769 lt!317767))))

(declare-fun b!702345 () Bool)

(declare-fun res!466050 () Bool)

(assert (=> b!702345 (=> (not res!466050) (not e!397588))))

(assert (=> b!702345 (= res!466050 (not (contains!3819 acc!652 k0!2824)))))

(declare-fun b!702346 () Bool)

(declare-fun res!466063 () Bool)

(assert (=> b!702346 (=> (not res!466063) (not e!397590))))

(assert (=> b!702346 (= res!466063 (not (contains!3819 lt!317769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702347 () Bool)

(declare-fun res!466057 () Bool)

(assert (=> b!702347 (=> (not res!466057) (not e!397588))))

(assert (=> b!702347 (= res!466057 (subseq!287 acc!652 newAcc!49))))

(declare-fun b!702348 () Bool)

(declare-fun res!466064 () Bool)

(assert (=> b!702348 (=> (not res!466064) (not e!397588))))

(assert (=> b!702348 (= res!466064 (not (contains!3819 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702349 () Bool)

(declare-fun res!466068 () Bool)

(assert (=> b!702349 (=> (not res!466068) (not e!397588))))

(assert (=> b!702349 (= res!466068 (= (-!251 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702350 () Bool)

(declare-fun res!466056 () Bool)

(assert (=> b!702350 (=> (not res!466056) (not e!397588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702350 (= res!466056 (validKeyInArray!0 (select (arr!19219 a!3591) from!2969)))))

(declare-fun b!702351 () Bool)

(declare-fun res!466058 () Bool)

(assert (=> b!702351 (=> (not res!466058) (not e!397588))))

(declare-fun arrayContainsKey!0 (array!40131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702351 (= res!466058 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702352 () Bool)

(declare-fun res!466045 () Bool)

(assert (=> b!702352 (=> (not res!466045) (not e!397588))))

(assert (=> b!702352 (= res!466045 (validKeyInArray!0 k0!2824))))

(declare-fun b!702353 () Bool)

(declare-fun res!466044 () Bool)

(assert (=> b!702353 (=> (not res!466044) (not e!397590))))

(assert (=> b!702353 (= res!466044 (noDuplicate!1093 lt!317769))))

(declare-fun b!702354 () Bool)

(declare-fun res!466067 () Bool)

(assert (=> b!702354 (=> (not res!466067) (not e!397588))))

(assert (=> b!702354 (= res!466067 (noDuplicate!1093 newAcc!49))))

(declare-fun b!702355 () Bool)

(declare-fun res!466053 () Bool)

(assert (=> b!702355 (=> (not res!466053) (not e!397590))))

(assert (=> b!702355 (= res!466053 (contains!3819 lt!317767 k0!2824))))

(declare-fun b!702356 () Bool)

(declare-fun res!466066 () Bool)

(assert (=> b!702356 (=> (not res!466066) (not e!397590))))

(assert (=> b!702356 (= res!466066 (noDuplicate!1093 lt!317767))))

(declare-fun b!702357 () Bool)

(declare-fun res!466069 () Bool)

(assert (=> b!702357 (=> (not res!466069) (not e!397590))))

(assert (=> b!702357 (= res!466069 (not (contains!3819 lt!317767 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702358 () Bool)

(declare-fun res!466055 () Bool)

(assert (=> b!702358 (=> (not res!466055) (not e!397588))))

(assert (=> b!702358 (= res!466055 (not (contains!3819 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702359 () Bool)

(declare-fun res!466072 () Bool)

(assert (=> b!702359 (=> (not res!466072) (not e!397588))))

(assert (=> b!702359 (= res!466072 (not (contains!3819 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702360 () Bool)

(declare-fun res!466061 () Bool)

(assert (=> b!702360 (=> (not res!466061) (not e!397590))))

(assert (=> b!702360 (= res!466061 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702361 () Bool)

(declare-fun res!466059 () Bool)

(assert (=> b!702361 (=> (not res!466059) (not e!397590))))

(assert (=> b!702361 (= res!466059 (not (contains!3819 lt!317767 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466052 () Bool)

(assert (=> start!62512 (=> (not res!466052) (not e!397588))))

(assert (=> start!62512 (= res!466052 (and (bvslt (size!19602 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19602 a!3591))))))

(assert (=> start!62512 e!397588))

(assert (=> start!62512 true))

(declare-fun array_inv!15078 (array!40131) Bool)

(assert (=> start!62512 (array_inv!15078 a!3591)))

(assert (= (and start!62512 res!466052) b!702336))

(assert (= (and b!702336 res!466070) b!702354))

(assert (= (and b!702354 res!466067) b!702359))

(assert (= (and b!702359 res!466072) b!702358))

(assert (= (and b!702358 res!466055) b!702351))

(assert (= (and b!702351 res!466058) b!702345))

(assert (= (and b!702345 res!466050) b!702352))

(assert (= (and b!702352 res!466045) b!702343))

(assert (= (and b!702343 res!466048) b!702347))

(assert (= (and b!702347 res!466057) b!702337))

(assert (= (and b!702337 res!466046) b!702349))

(assert (= (and b!702349 res!466068) b!702340))

(assert (= (and b!702340 res!466071) b!702348))

(assert (= (and b!702348 res!466064) b!702341))

(assert (= (and b!702341 res!466062) b!702350))

(assert (= (and b!702350 res!466056) b!702338))

(assert (= (and b!702338 res!466054) b!702353))

(assert (= (and b!702353 res!466044) b!702356))

(assert (= (and b!702356 res!466066) b!702346))

(assert (= (and b!702346 res!466063) b!702335))

(assert (= (and b!702335 res!466049) b!702360))

(assert (= (and b!702360 res!466061) b!702339))

(assert (= (and b!702339 res!466051) b!702333))

(assert (= (and b!702333 res!466060) b!702342))

(assert (= (and b!702342 res!466047) b!702355))

(assert (= (and b!702355 res!466053) b!702334))

(assert (= (and b!702334 res!466065) b!702361))

(assert (= (and b!702361 res!466059) b!702357))

(assert (= (and b!702357 res!466069) b!702344))

(declare-fun m!661971 () Bool)

(assert (=> b!702351 m!661971))

(declare-fun m!661973 () Bool)

(assert (=> b!702353 m!661973))

(declare-fun m!661975 () Bool)

(assert (=> b!702340 m!661975))

(declare-fun m!661977 () Bool)

(assert (=> b!702359 m!661977))

(declare-fun m!661979 () Bool)

(assert (=> b!702339 m!661979))

(declare-fun m!661981 () Bool)

(assert (=> b!702334 m!661981))

(declare-fun m!661983 () Bool)

(assert (=> b!702344 m!661983))

(declare-fun m!661985 () Bool)

(assert (=> b!702344 m!661985))

(declare-fun m!661987 () Bool)

(assert (=> b!702349 m!661987))

(declare-fun m!661989 () Bool)

(assert (=> b!702338 m!661989))

(assert (=> b!702338 m!661989))

(declare-fun m!661991 () Bool)

(assert (=> b!702338 m!661991))

(assert (=> b!702338 m!661989))

(declare-fun m!661993 () Bool)

(assert (=> b!702338 m!661993))

(declare-fun m!661995 () Bool)

(assert (=> b!702333 m!661995))

(declare-fun m!661997 () Bool)

(assert (=> b!702357 m!661997))

(declare-fun m!661999 () Bool)

(assert (=> b!702360 m!661999))

(declare-fun m!662001 () Bool)

(assert (=> b!702361 m!662001))

(declare-fun m!662003 () Bool)

(assert (=> b!702345 m!662003))

(declare-fun m!662005 () Bool)

(assert (=> b!702346 m!662005))

(declare-fun m!662007 () Bool)

(assert (=> b!702337 m!662007))

(declare-fun m!662009 () Bool)

(assert (=> b!702342 m!662009))

(declare-fun m!662011 () Bool)

(assert (=> b!702355 m!662011))

(declare-fun m!662013 () Bool)

(assert (=> b!702335 m!662013))

(declare-fun m!662015 () Bool)

(assert (=> b!702343 m!662015))

(declare-fun m!662017 () Bool)

(assert (=> b!702356 m!662017))

(declare-fun m!662019 () Bool)

(assert (=> b!702336 m!662019))

(declare-fun m!662021 () Bool)

(assert (=> b!702347 m!662021))

(declare-fun m!662023 () Bool)

(assert (=> b!702358 m!662023))

(declare-fun m!662025 () Bool)

(assert (=> start!62512 m!662025))

(declare-fun m!662027 () Bool)

(assert (=> b!702352 m!662027))

(declare-fun m!662029 () Bool)

(assert (=> b!702348 m!662029))

(assert (=> b!702350 m!661989))

(assert (=> b!702350 m!661989))

(declare-fun m!662031 () Bool)

(assert (=> b!702350 m!662031))

(declare-fun m!662033 () Bool)

(assert (=> b!702354 m!662033))

(check-sat (not b!702353) (not b!702361) (not b!702338) (not b!702347) (not b!702339) (not b!702348) (not b!702352) (not b!702345) (not b!702344) (not b!702351) (not start!62512) (not b!702356) (not b!702333) (not b!702343) (not b!702336) (not b!702346) (not b!702340) (not b!702358) (not b!702360) (not b!702355) (not b!702337) (not b!702357) (not b!702359) (not b!702349) (not b!702334) (not b!702342) (not b!702354) (not b!702335) (not b!702350))
(check-sat)
