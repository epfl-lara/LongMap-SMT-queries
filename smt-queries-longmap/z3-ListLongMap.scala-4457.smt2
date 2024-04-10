; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62038 () Bool)

(assert start!62038)

(declare-fun b!694303 () Bool)

(declare-datatypes ((Unit!24526 0))(
  ( (Unit!24527) )
))
(declare-fun e!394985 () Unit!24526)

(declare-fun Unit!24528 () Unit!24526)

(assert (=> b!694303 (= e!394985 Unit!24528)))

(declare-fun b!694304 () Bool)

(declare-fun e!394983 () Bool)

(declare-datatypes ((List!13143 0))(
  ( (Nil!13140) (Cons!13139 (h!14184 (_ BitVec 64)) (t!19422 List!13143)) )
))
(declare-fun lt!316888 () List!13143)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3720 (List!13143 (_ BitVec 64)) Bool)

(assert (=> b!694304 (= e!394983 (contains!3720 lt!316888 k0!2843))))

(declare-fun b!694305 () Bool)

(declare-fun e!394982 () Bool)

(declare-fun e!394978 () Bool)

(assert (=> b!694305 (= e!394982 e!394978)))

(declare-fun res!458366 () Bool)

(assert (=> b!694305 (=> (not res!458366) (not e!394978))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694305 (= res!458366 (bvsle from!3004 i!1382))))

(declare-fun res!458362 () Bool)

(declare-fun e!394977 () Bool)

(assert (=> start!62038 (=> (not res!458362) (not e!394977))))

(declare-datatypes ((array!39879 0))(
  ( (array!39880 (arr!19102 (Array (_ BitVec 32) (_ BitVec 64))) (size!19487 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39879)

(assert (=> start!62038 (= res!458362 (and (bvslt (size!19487 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19487 a!3626))))))

(assert (=> start!62038 e!394977))

(assert (=> start!62038 true))

(declare-fun array_inv!14898 (array!39879) Bool)

(assert (=> start!62038 (array_inv!14898 a!3626)))

(declare-fun b!694306 () Bool)

(declare-fun res!458375 () Bool)

(assert (=> b!694306 (=> (not res!458375) (not e!394977))))

(declare-fun acc!681 () List!13143)

(assert (=> b!694306 (= res!458375 (not (contains!3720 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694307 () Bool)

(declare-fun e!394986 () Bool)

(assert (=> b!694307 (= e!394977 e!394986)))

(declare-fun res!458371 () Bool)

(assert (=> b!694307 (=> (not res!458371) (not e!394986))))

(assert (=> b!694307 (= res!458371 (not (= (select (arr!19102 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316885 () Unit!24526)

(assert (=> b!694307 (= lt!316885 e!394985)))

(declare-fun c!78341 () Bool)

(assert (=> b!694307 (= c!78341 (= (select (arr!19102 a!3626) from!3004) k0!2843))))

(declare-fun b!694308 () Bool)

(declare-fun res!458367 () Bool)

(assert (=> b!694308 (=> (not res!458367) (not e!394977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694308 (= res!458367 (validKeyInArray!0 (select (arr!19102 a!3626) from!3004)))))

(declare-fun b!694309 () Bool)

(declare-fun res!458361 () Bool)

(declare-fun e!394981 () Bool)

(assert (=> b!694309 (=> (not res!458361) (not e!394981))))

(assert (=> b!694309 (= res!458361 (not (contains!3720 lt!316888 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694310 () Bool)

(declare-fun res!458372 () Bool)

(assert (=> b!694310 (=> (not res!458372) (not e!394977))))

(declare-fun arrayNoDuplicates!0 (array!39879 (_ BitVec 32) List!13143) Bool)

(assert (=> b!694310 (= res!458372 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694311 () Bool)

(declare-fun res!458374 () Bool)

(assert (=> b!694311 (=> (not res!458374) (not e!394981))))

(declare-fun noDuplicate!967 (List!13143) Bool)

(assert (=> b!694311 (= res!458374 (noDuplicate!967 lt!316888))))

(declare-fun b!694312 () Bool)

(declare-fun e!394984 () Bool)

(assert (=> b!694312 (= e!394984 (not (contains!3720 lt!316888 k0!2843)))))

(declare-fun b!694313 () Bool)

(assert (=> b!694313 (= e!394986 e!394981)))

(declare-fun res!458373 () Bool)

(assert (=> b!694313 (=> (not res!458373) (not e!394981))))

(assert (=> b!694313 (= res!458373 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!432 (List!13143 (_ BitVec 64)) List!13143)

(assert (=> b!694313 (= lt!316888 ($colon$colon!432 acc!681 (select (arr!19102 a!3626) from!3004)))))

(declare-fun b!694314 () Bool)

(assert (=> b!694314 (= e!394981 false)))

(declare-fun lt!316886 () Bool)

(assert (=> b!694314 (= lt!316886 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316888))))

(declare-fun b!694315 () Bool)

(declare-fun res!458356 () Bool)

(assert (=> b!694315 (=> (not res!458356) (not e!394977))))

(assert (=> b!694315 (= res!458356 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13140))))

(declare-fun b!694316 () Bool)

(declare-fun res!458363 () Bool)

(assert (=> b!694316 (=> (not res!458363) (not e!394977))))

(declare-fun arrayContainsKey!0 (array!39879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694316 (= res!458363 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694317 () Bool)

(declare-fun res!458360 () Bool)

(assert (=> b!694317 (=> (not res!458360) (not e!394977))))

(assert (=> b!694317 (= res!458360 (validKeyInArray!0 k0!2843))))

(declare-fun b!694318 () Bool)

(declare-fun e!394979 () Bool)

(assert (=> b!694318 (= e!394979 (contains!3720 acc!681 k0!2843))))

(declare-fun b!694319 () Bool)

(declare-fun res!458370 () Bool)

(assert (=> b!694319 (=> (not res!458370) (not e!394977))))

(assert (=> b!694319 (= res!458370 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19487 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694320 () Bool)

(assert (=> b!694320 (= e!394978 (not (contains!3720 acc!681 k0!2843)))))

(declare-fun b!694321 () Bool)

(declare-fun e!394976 () Bool)

(assert (=> b!694321 (= e!394976 e!394984)))

(declare-fun res!458368 () Bool)

(assert (=> b!694321 (=> (not res!458368) (not e!394984))))

(assert (=> b!694321 (= res!458368 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694322 () Bool)

(declare-fun Unit!24529 () Unit!24526)

(assert (=> b!694322 (= e!394985 Unit!24529)))

(assert (=> b!694322 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316887 () Unit!24526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39879 (_ BitVec 64) (_ BitVec 32)) Unit!24526)

(assert (=> b!694322 (= lt!316887 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694322 false))

(declare-fun b!694323 () Bool)

(declare-fun res!458377 () Bool)

(assert (=> b!694323 (=> (not res!458377) (not e!394981))))

(assert (=> b!694323 (= res!458377 e!394976)))

(declare-fun res!458369 () Bool)

(assert (=> b!694323 (=> res!458369 e!394976)))

(assert (=> b!694323 (= res!458369 e!394983)))

(declare-fun res!458376 () Bool)

(assert (=> b!694323 (=> (not res!458376) (not e!394983))))

(assert (=> b!694323 (= res!458376 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694324 () Bool)

(declare-fun res!458358 () Bool)

(assert (=> b!694324 (=> (not res!458358) (not e!394977))))

(assert (=> b!694324 (= res!458358 e!394982)))

(declare-fun res!458357 () Bool)

(assert (=> b!694324 (=> res!458357 e!394982)))

(assert (=> b!694324 (= res!458357 e!394979)))

(declare-fun res!458378 () Bool)

(assert (=> b!694324 (=> (not res!458378) (not e!394979))))

(assert (=> b!694324 (= res!458378 (bvsgt from!3004 i!1382))))

(declare-fun b!694325 () Bool)

(declare-fun res!458359 () Bool)

(assert (=> b!694325 (=> (not res!458359) (not e!394977))))

(assert (=> b!694325 (= res!458359 (not (contains!3720 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694326 () Bool)

(declare-fun res!458364 () Bool)

(assert (=> b!694326 (=> (not res!458364) (not e!394981))))

(assert (=> b!694326 (= res!458364 (not (contains!3720 lt!316888 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694327 () Bool)

(declare-fun res!458355 () Bool)

(assert (=> b!694327 (=> (not res!458355) (not e!394977))))

(assert (=> b!694327 (= res!458355 (noDuplicate!967 acc!681))))

(declare-fun b!694328 () Bool)

(declare-fun res!458365 () Bool)

(assert (=> b!694328 (=> (not res!458365) (not e!394977))))

(assert (=> b!694328 (= res!458365 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19487 a!3626))))))

(assert (= (and start!62038 res!458362) b!694327))

(assert (= (and b!694327 res!458355) b!694325))

(assert (= (and b!694325 res!458359) b!694306))

(assert (= (and b!694306 res!458375) b!694324))

(assert (= (and b!694324 res!458378) b!694318))

(assert (= (and b!694324 (not res!458357)) b!694305))

(assert (= (and b!694305 res!458366) b!694320))

(assert (= (and b!694324 res!458358) b!694315))

(assert (= (and b!694315 res!458356) b!694310))

(assert (= (and b!694310 res!458372) b!694328))

(assert (= (and b!694328 res!458365) b!694317))

(assert (= (and b!694317 res!458360) b!694316))

(assert (= (and b!694316 res!458363) b!694319))

(assert (= (and b!694319 res!458370) b!694308))

(assert (= (and b!694308 res!458367) b!694307))

(assert (= (and b!694307 c!78341) b!694322))

(assert (= (and b!694307 (not c!78341)) b!694303))

(assert (= (and b!694307 res!458371) b!694313))

(assert (= (and b!694313 res!458373) b!694311))

(assert (= (and b!694311 res!458374) b!694309))

(assert (= (and b!694309 res!458361) b!694326))

(assert (= (and b!694326 res!458364) b!694323))

(assert (= (and b!694323 res!458376) b!694304))

(assert (= (and b!694323 (not res!458369)) b!694321))

(assert (= (and b!694321 res!458368) b!694312))

(assert (= (and b!694323 res!458377) b!694314))

(declare-fun m!656203 () Bool)

(assert (=> b!694325 m!656203))

(declare-fun m!656205 () Bool)

(assert (=> b!694326 m!656205))

(declare-fun m!656207 () Bool)

(assert (=> b!694309 m!656207))

(declare-fun m!656209 () Bool)

(assert (=> b!694317 m!656209))

(declare-fun m!656211 () Bool)

(assert (=> start!62038 m!656211))

(declare-fun m!656213 () Bool)

(assert (=> b!694313 m!656213))

(assert (=> b!694313 m!656213))

(declare-fun m!656215 () Bool)

(assert (=> b!694313 m!656215))

(declare-fun m!656217 () Bool)

(assert (=> b!694314 m!656217))

(declare-fun m!656219 () Bool)

(assert (=> b!694320 m!656219))

(declare-fun m!656221 () Bool)

(assert (=> b!694312 m!656221))

(declare-fun m!656223 () Bool)

(assert (=> b!694315 m!656223))

(declare-fun m!656225 () Bool)

(assert (=> b!694316 m!656225))

(declare-fun m!656227 () Bool)

(assert (=> b!694327 m!656227))

(declare-fun m!656229 () Bool)

(assert (=> b!694322 m!656229))

(declare-fun m!656231 () Bool)

(assert (=> b!694322 m!656231))

(assert (=> b!694307 m!656213))

(assert (=> b!694304 m!656221))

(declare-fun m!656233 () Bool)

(assert (=> b!694311 m!656233))

(assert (=> b!694318 m!656219))

(declare-fun m!656235 () Bool)

(assert (=> b!694306 m!656235))

(assert (=> b!694308 m!656213))

(assert (=> b!694308 m!656213))

(declare-fun m!656237 () Bool)

(assert (=> b!694308 m!656237))

(declare-fun m!656239 () Bool)

(assert (=> b!694310 m!656239))

(check-sat (not b!694320) (not b!694304) (not b!694315) (not b!694311) (not b!694312) (not b!694310) (not b!694325) (not b!694322) (not b!694326) (not b!694314) (not b!694306) (not b!694309) (not start!62038) (not b!694327) (not b!694316) (not b!694318) (not b!694317) (not b!694308) (not b!694313))
(check-sat)
