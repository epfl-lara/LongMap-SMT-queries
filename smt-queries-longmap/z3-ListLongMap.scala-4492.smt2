; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62408 () Bool)

(assert start!62408)

(declare-fun b!700338 () Bool)

(declare-fun res!464322 () Bool)

(declare-fun e!397128 () Bool)

(assert (=> b!700338 (=> (not res!464322) (not e!397128))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700338 (= res!464322 (validKeyInArray!0 k0!2824))))

(declare-fun b!700339 () Bool)

(declare-fun res!464326 () Bool)

(assert (=> b!700339 (=> (not res!464326) (not e!397128))))

(declare-datatypes ((array!40098 0))(
  ( (array!40099 (arr!19205 (Array (_ BitVec 32) (_ BitVec 64))) (size!19587 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40098)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!700339 (= res!464326 (validKeyInArray!0 (select (arr!19205 a!3591) from!2969)))))

(declare-fun b!700340 () Bool)

(declare-fun res!464323 () Bool)

(assert (=> b!700340 (=> (not res!464323) (not e!397128))))

(declare-datatypes ((List!13285 0))(
  ( (Nil!13282) (Cons!13281 (h!14326 (_ BitVec 64)) (t!19558 List!13285)) )
))
(declare-fun acc!652 () List!13285)

(declare-fun contains!3807 (List!13285 (_ BitVec 64)) Bool)

(assert (=> b!700340 (= res!464323 (not (contains!3807 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700341 () Bool)

(declare-fun res!464325 () Bool)

(assert (=> b!700341 (=> (not res!464325) (not e!397128))))

(declare-fun newAcc!49 () List!13285)

(declare-fun -!234 (List!13285 (_ BitVec 64)) List!13285)

(assert (=> b!700341 (= res!464325 (= (-!234 newAcc!49 k0!2824) acc!652))))

(declare-fun b!700342 () Bool)

(declare-fun res!464312 () Bool)

(declare-fun e!397130 () Bool)

(assert (=> b!700342 (=> (not res!464312) (not e!397130))))

(declare-fun lt!317256 () List!13285)

(declare-fun lt!317255 () List!13285)

(assert (=> b!700342 (= res!464312 (= (-!234 lt!317256 k0!2824) lt!317255))))

(declare-fun b!700343 () Bool)

(declare-fun res!464318 () Bool)

(assert (=> b!700343 (=> (not res!464318) (not e!397130))))

(assert (=> b!700343 (= res!464318 (not (contains!3807 lt!317256 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700344 () Bool)

(declare-fun res!464315 () Bool)

(assert (=> b!700344 (=> (not res!464315) (not e!397128))))

(declare-fun arrayContainsKey!0 (array!40098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700344 (= res!464315 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!700345 () Bool)

(declare-fun res!464311 () Bool)

(assert (=> b!700345 (=> (not res!464311) (not e!397128))))

(declare-fun subseq!269 (List!13285 List!13285) Bool)

(assert (=> b!700345 (= res!464311 (subseq!269 acc!652 newAcc!49))))

(declare-fun b!700346 () Bool)

(declare-fun res!464310 () Bool)

(assert (=> b!700346 (=> (not res!464310) (not e!397128))))

(assert (=> b!700346 (= res!464310 (contains!3807 newAcc!49 k0!2824))))

(declare-fun b!700347 () Bool)

(declare-fun res!464334 () Bool)

(assert (=> b!700347 (=> (not res!464334) (not e!397130))))

(assert (=> b!700347 (= res!464334 (not (contains!3807 lt!317255 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700348 () Bool)

(declare-fun res!464331 () Bool)

(assert (=> b!700348 (=> (not res!464331) (not e!397130))))

(assert (=> b!700348 (= res!464331 (subseq!269 lt!317255 lt!317256))))

(declare-fun b!700349 () Bool)

(declare-fun res!464324 () Bool)

(assert (=> b!700349 (=> (not res!464324) (not e!397130))))

(declare-fun noDuplicate!1076 (List!13285) Bool)

(assert (=> b!700349 (= res!464324 (noDuplicate!1076 lt!317255))))

(declare-fun b!700350 () Bool)

(declare-fun res!464319 () Bool)

(assert (=> b!700350 (=> (not res!464319) (not e!397130))))

(declare-fun arrayNoDuplicates!0 (array!40098 (_ BitVec 32) List!13285) Bool)

(assert (=> b!700350 (= res!464319 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317255))))

(declare-fun b!700351 () Bool)

(declare-fun res!464308 () Bool)

(assert (=> b!700351 (=> (not res!464308) (not e!397130))))

(assert (=> b!700351 (= res!464308 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700352 () Bool)

(declare-fun res!464317 () Bool)

(assert (=> b!700352 (=> (not res!464317) (not e!397130))))

(assert (=> b!700352 (= res!464317 (noDuplicate!1076 lt!317256))))

(declare-fun b!700353 () Bool)

(declare-fun res!464330 () Bool)

(assert (=> b!700353 (=> (not res!464330) (not e!397128))))

(assert (=> b!700353 (= res!464330 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19587 a!3591)))))

(declare-fun b!700354 () Bool)

(declare-fun res!464321 () Bool)

(assert (=> b!700354 (=> (not res!464321) (not e!397130))))

(assert (=> b!700354 (= res!464321 (not (contains!3807 lt!317255 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700355 () Bool)

(declare-fun res!464335 () Bool)

(assert (=> b!700355 (=> (not res!464335) (not e!397128))))

(assert (=> b!700355 (= res!464335 (noDuplicate!1076 newAcc!49))))

(declare-fun b!700356 () Bool)

(declare-fun res!464329 () Bool)

(assert (=> b!700356 (=> (not res!464329) (not e!397130))))

(assert (=> b!700356 (= res!464329 (not (contains!3807 lt!317255 k0!2824)))))

(declare-fun b!700357 () Bool)

(assert (=> b!700357 (= e!397130 false)))

(declare-fun lt!317254 () Bool)

(assert (=> b!700357 (= lt!317254 (contains!3807 lt!317256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!700358 () Bool)

(declare-fun res!464320 () Bool)

(assert (=> b!700358 (=> (not res!464320) (not e!397128))))

(assert (=> b!700358 (= res!464320 (not (contains!3807 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700359 () Bool)

(declare-fun res!464327 () Bool)

(assert (=> b!700359 (=> (not res!464327) (not e!397128))))

(assert (=> b!700359 (= res!464327 (noDuplicate!1076 acc!652))))

(declare-fun b!700360 () Bool)

(declare-fun res!464314 () Bool)

(assert (=> b!700360 (=> (not res!464314) (not e!397128))))

(assert (=> b!700360 (= res!464314 (not (contains!3807 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700361 () Bool)

(declare-fun res!464328 () Bool)

(assert (=> b!700361 (=> (not res!464328) (not e!397130))))

(assert (=> b!700361 (= res!464328 (contains!3807 lt!317256 k0!2824))))

(declare-fun b!700362 () Bool)

(declare-fun res!464333 () Bool)

(assert (=> b!700362 (=> (not res!464333) (not e!397128))))

(assert (=> b!700362 (= res!464333 (not (contains!3807 acc!652 k0!2824)))))

(declare-fun b!700363 () Bool)

(declare-fun res!464313 () Bool)

(assert (=> b!700363 (=> (not res!464313) (not e!397128))))

(assert (=> b!700363 (= res!464313 (not (contains!3807 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700364 () Bool)

(assert (=> b!700364 (= e!397128 e!397130)))

(declare-fun res!464332 () Bool)

(assert (=> b!700364 (=> (not res!464332) (not e!397130))))

(assert (=> b!700364 (= res!464332 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!466 (List!13285 (_ BitVec 64)) List!13285)

(assert (=> b!700364 (= lt!317256 ($colon$colon!466 newAcc!49 (select (arr!19205 a!3591) from!2969)))))

(assert (=> b!700364 (= lt!317255 ($colon$colon!466 acc!652 (select (arr!19205 a!3591) from!2969)))))

(declare-fun res!464316 () Bool)

(assert (=> start!62408 (=> (not res!464316) (not e!397128))))

(assert (=> start!62408 (= res!464316 (and (bvslt (size!19587 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19587 a!3591))))))

(assert (=> start!62408 e!397128))

(assert (=> start!62408 true))

(declare-fun array_inv!15088 (array!40098) Bool)

(assert (=> start!62408 (array_inv!15088 a!3591)))

(declare-fun b!700365 () Bool)

(declare-fun res!464309 () Bool)

(assert (=> b!700365 (=> (not res!464309) (not e!397128))))

(assert (=> b!700365 (= res!464309 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62408 res!464316) b!700359))

(assert (= (and b!700359 res!464327) b!700355))

(assert (= (and b!700355 res!464335) b!700358))

(assert (= (and b!700358 res!464320) b!700340))

(assert (= (and b!700340 res!464323) b!700344))

(assert (= (and b!700344 res!464315) b!700362))

(assert (= (and b!700362 res!464333) b!700338))

(assert (= (and b!700338 res!464322) b!700365))

(assert (= (and b!700365 res!464309) b!700345))

(assert (= (and b!700345 res!464311) b!700346))

(assert (= (and b!700346 res!464310) b!700341))

(assert (= (and b!700341 res!464325) b!700360))

(assert (= (and b!700360 res!464314) b!700363))

(assert (= (and b!700363 res!464313) b!700353))

(assert (= (and b!700353 res!464330) b!700339))

(assert (= (and b!700339 res!464326) b!700364))

(assert (= (and b!700364 res!464332) b!700349))

(assert (= (and b!700349 res!464324) b!700352))

(assert (= (and b!700352 res!464317) b!700347))

(assert (= (and b!700347 res!464334) b!700354))

(assert (= (and b!700354 res!464321) b!700351))

(assert (= (and b!700351 res!464308) b!700356))

(assert (= (and b!700356 res!464329) b!700350))

(assert (= (and b!700350 res!464319) b!700348))

(assert (= (and b!700348 res!464331) b!700361))

(assert (= (and b!700361 res!464328) b!700342))

(assert (= (and b!700342 res!464312) b!700343))

(assert (= (and b!700343 res!464318) b!700357))

(declare-fun m!659475 () Bool)

(assert (=> b!700341 m!659475))

(declare-fun m!659477 () Bool)

(assert (=> b!700347 m!659477))

(declare-fun m!659479 () Bool)

(assert (=> b!700363 m!659479))

(declare-fun m!659481 () Bool)

(assert (=> start!62408 m!659481))

(declare-fun m!659483 () Bool)

(assert (=> b!700344 m!659483))

(declare-fun m!659485 () Bool)

(assert (=> b!700354 m!659485))

(declare-fun m!659487 () Bool)

(assert (=> b!700342 m!659487))

(declare-fun m!659489 () Bool)

(assert (=> b!700350 m!659489))

(declare-fun m!659491 () Bool)

(assert (=> b!700349 m!659491))

(declare-fun m!659493 () Bool)

(assert (=> b!700338 m!659493))

(declare-fun m!659495 () Bool)

(assert (=> b!700365 m!659495))

(declare-fun m!659497 () Bool)

(assert (=> b!700357 m!659497))

(declare-fun m!659499 () Bool)

(assert (=> b!700351 m!659499))

(declare-fun m!659501 () Bool)

(assert (=> b!700359 m!659501))

(declare-fun m!659503 () Bool)

(assert (=> b!700352 m!659503))

(declare-fun m!659505 () Bool)

(assert (=> b!700348 m!659505))

(declare-fun m!659507 () Bool)

(assert (=> b!700360 m!659507))

(declare-fun m!659509 () Bool)

(assert (=> b!700362 m!659509))

(declare-fun m!659511 () Bool)

(assert (=> b!700343 m!659511))

(declare-fun m!659513 () Bool)

(assert (=> b!700339 m!659513))

(assert (=> b!700339 m!659513))

(declare-fun m!659515 () Bool)

(assert (=> b!700339 m!659515))

(declare-fun m!659517 () Bool)

(assert (=> b!700346 m!659517))

(declare-fun m!659519 () Bool)

(assert (=> b!700358 m!659519))

(declare-fun m!659521 () Bool)

(assert (=> b!700361 m!659521))

(declare-fun m!659523 () Bool)

(assert (=> b!700356 m!659523))

(assert (=> b!700364 m!659513))

(assert (=> b!700364 m!659513))

(declare-fun m!659525 () Bool)

(assert (=> b!700364 m!659525))

(assert (=> b!700364 m!659513))

(declare-fun m!659527 () Bool)

(assert (=> b!700364 m!659527))

(declare-fun m!659529 () Bool)

(assert (=> b!700355 m!659529))

(declare-fun m!659531 () Bool)

(assert (=> b!700345 m!659531))

(declare-fun m!659533 () Bool)

(assert (=> b!700340 m!659533))

(check-sat (not b!700340) (not b!700360) (not b!700345) (not b!700365) (not b!700354) (not b!700342) (not b!700346) (not b!700357) (not b!700349) (not b!700361) (not b!700338) (not start!62408) (not b!700355) (not b!700363) (not b!700350) (not b!700347) (not b!700358) (not b!700356) (not b!700344) (not b!700362) (not b!700339) (not b!700352) (not b!700348) (not b!700364) (not b!700343) (not b!700351) (not b!700341) (not b!700359))
(check-sat)
