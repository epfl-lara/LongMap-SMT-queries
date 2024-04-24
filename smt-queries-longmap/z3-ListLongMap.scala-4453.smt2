; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62022 () Bool)

(assert start!62022)

(declare-fun b!693349 () Bool)

(declare-fun res!457420 () Bool)

(declare-fun e!394540 () Bool)

(assert (=> b!693349 (=> (not res!457420) (not e!394540))))

(declare-datatypes ((array!39846 0))(
  ( (array!39847 (arr!19084 (Array (_ BitVec 32) (_ BitVec 64))) (size!19467 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39846)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693349 (= res!457420 (validKeyInArray!0 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!693350 () Bool)

(declare-fun res!457403 () Bool)

(assert (=> b!693350 (=> (not res!457403) (not e!394540))))

(declare-fun e!394533 () Bool)

(assert (=> b!693350 (= res!457403 e!394533)))

(declare-fun res!457408 () Bool)

(assert (=> b!693350 (=> res!457408 e!394533)))

(declare-fun e!394538 () Bool)

(assert (=> b!693350 (= res!457408 e!394538)))

(declare-fun res!457404 () Bool)

(assert (=> b!693350 (=> (not res!457404) (not e!394538))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693350 (= res!457404 (bvsgt from!3004 i!1382))))

(declare-fun b!693351 () Bool)

(declare-fun e!394534 () Bool)

(declare-datatypes ((List!13032 0))(
  ( (Nil!13029) (Cons!13028 (h!14076 (_ BitVec 64)) (t!19300 List!13032)) )
))
(declare-fun lt!316808 () List!13032)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3684 (List!13032 (_ BitVec 64)) Bool)

(assert (=> b!693351 (= e!394534 (not (contains!3684 lt!316808 k0!2843)))))

(declare-fun b!693352 () Bool)

(declare-fun res!457401 () Bool)

(assert (=> b!693352 (=> (not res!457401) (not e!394540))))

(assert (=> b!693352 (= res!457401 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19467 a!3626))))))

(declare-fun b!693353 () Bool)

(declare-fun res!457415 () Bool)

(assert (=> b!693353 (=> (not res!457415) (not e!394540))))

(assert (=> b!693353 (= res!457415 (validKeyInArray!0 k0!2843))))

(declare-fun b!693354 () Bool)

(declare-fun e!394535 () Bool)

(declare-fun acc!681 () List!13032)

(assert (=> b!693354 (= e!394535 (not (contains!3684 acc!681 k0!2843)))))

(declare-fun b!693355 () Bool)

(declare-datatypes ((Unit!24453 0))(
  ( (Unit!24454) )
))
(declare-fun e!394542 () Unit!24453)

(declare-fun Unit!24455 () Unit!24453)

(assert (=> b!693355 (= e!394542 Unit!24455)))

(declare-fun arrayContainsKey!0 (array!39846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693355 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316809 () Unit!24453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39846 (_ BitVec 64) (_ BitVec 32)) Unit!24453)

(assert (=> b!693355 (= lt!316809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693355 false))

(declare-fun b!693356 () Bool)

(declare-fun res!457419 () Bool)

(assert (=> b!693356 (=> (not res!457419) (not e!394540))))

(declare-fun arrayNoDuplicates!0 (array!39846 (_ BitVec 32) List!13032) Bool)

(assert (=> b!693356 (= res!457419 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13029))))

(declare-fun b!693357 () Bool)

(declare-fun res!457406 () Bool)

(assert (=> b!693357 (=> (not res!457406) (not e!394540))))

(declare-fun noDuplicate!958 (List!13032) Bool)

(assert (=> b!693357 (= res!457406 (noDuplicate!958 acc!681))))

(declare-fun b!693358 () Bool)

(declare-fun res!457407 () Bool)

(declare-fun e!394541 () Bool)

(assert (=> b!693358 (=> (not res!457407) (not e!394541))))

(assert (=> b!693358 (= res!457407 (not (contains!3684 lt!316808 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693359 () Bool)

(assert (=> b!693359 (= e!394541 false)))

(declare-fun lt!316807 () Bool)

(declare-fun e!394536 () Bool)

(assert (=> b!693359 (= lt!316807 e!394536)))

(declare-fun res!457398 () Bool)

(assert (=> b!693359 (=> res!457398 e!394536)))

(declare-fun e!394532 () Bool)

(assert (=> b!693359 (= res!457398 e!394532)))

(declare-fun res!457418 () Bool)

(assert (=> b!693359 (=> (not res!457418) (not e!394532))))

(assert (=> b!693359 (= res!457418 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693360 () Bool)

(declare-fun res!457417 () Bool)

(assert (=> b!693360 (=> (not res!457417) (not e!394540))))

(assert (=> b!693360 (= res!457417 (not (contains!3684 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693361 () Bool)

(declare-fun res!457402 () Bool)

(assert (=> b!693361 (=> (not res!457402) (not e!394540))))

(assert (=> b!693361 (= res!457402 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693362 () Bool)

(declare-fun res!457413 () Bool)

(assert (=> b!693362 (=> (not res!457413) (not e!394541))))

(assert (=> b!693362 (= res!457413 (not (contains!3684 lt!316808 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693363 () Bool)

(declare-fun res!457412 () Bool)

(assert (=> b!693363 (=> (not res!457412) (not e!394540))))

(assert (=> b!693363 (= res!457412 (not (contains!3684 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693364 () Bool)

(declare-fun e!394539 () Bool)

(assert (=> b!693364 (= e!394540 e!394539)))

(declare-fun res!457400 () Bool)

(assert (=> b!693364 (=> (not res!457400) (not e!394539))))

(assert (=> b!693364 (= res!457400 (not (= (select (arr!19084 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316810 () Unit!24453)

(assert (=> b!693364 (= lt!316810 e!394542)))

(declare-fun c!78344 () Bool)

(assert (=> b!693364 (= c!78344 (= (select (arr!19084 a!3626) from!3004) k0!2843))))

(declare-fun b!693365 () Bool)

(assert (=> b!693365 (= e!394532 (contains!3684 lt!316808 k0!2843))))

(declare-fun b!693366 () Bool)

(assert (=> b!693366 (= e!394539 e!394541)))

(declare-fun res!457411 () Bool)

(assert (=> b!693366 (=> (not res!457411) (not e!394541))))

(assert (=> b!693366 (= res!457411 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!416 (List!13032 (_ BitVec 64)) List!13032)

(assert (=> b!693366 (= lt!316808 ($colon$colon!416 acc!681 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!693367 () Bool)

(assert (=> b!693367 (= e!394533 e!394535)))

(declare-fun res!457405 () Bool)

(assert (=> b!693367 (=> (not res!457405) (not e!394535))))

(assert (=> b!693367 (= res!457405 (bvsle from!3004 i!1382))))

(declare-fun b!693368 () Bool)

(declare-fun Unit!24456 () Unit!24453)

(assert (=> b!693368 (= e!394542 Unit!24456)))

(declare-fun b!693369 () Bool)

(assert (=> b!693369 (= e!394538 (contains!3684 acc!681 k0!2843))))

(declare-fun res!457399 () Bool)

(assert (=> start!62022 (=> (not res!457399) (not e!394540))))

(assert (=> start!62022 (= res!457399 (and (bvslt (size!19467 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19467 a!3626))))))

(assert (=> start!62022 e!394540))

(assert (=> start!62022 true))

(declare-fun array_inv!14943 (array!39846) Bool)

(assert (=> start!62022 (array_inv!14943 a!3626)))

(declare-fun b!693370 () Bool)

(declare-fun res!457409 () Bool)

(assert (=> b!693370 (=> (not res!457409) (not e!394541))))

(assert (=> b!693370 (= res!457409 (noDuplicate!958 lt!316808))))

(declare-fun b!693371 () Bool)

(declare-fun res!457414 () Bool)

(assert (=> b!693371 (=> (not res!457414) (not e!394540))))

(assert (=> b!693371 (= res!457414 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693372 () Bool)

(declare-fun res!457416 () Bool)

(assert (=> b!693372 (=> (not res!457416) (not e!394540))))

(assert (=> b!693372 (= res!457416 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19467 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693373 () Bool)

(assert (=> b!693373 (= e!394536 e!394534)))

(declare-fun res!457410 () Bool)

(assert (=> b!693373 (=> (not res!457410) (not e!394534))))

(assert (=> b!693373 (= res!457410 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62022 res!457399) b!693357))

(assert (= (and b!693357 res!457406) b!693360))

(assert (= (and b!693360 res!457417) b!693363))

(assert (= (and b!693363 res!457412) b!693350))

(assert (= (and b!693350 res!457404) b!693369))

(assert (= (and b!693350 (not res!457408)) b!693367))

(assert (= (and b!693367 res!457405) b!693354))

(assert (= (and b!693350 res!457403) b!693356))

(assert (= (and b!693356 res!457419) b!693371))

(assert (= (and b!693371 res!457414) b!693352))

(assert (= (and b!693352 res!457401) b!693353))

(assert (= (and b!693353 res!457415) b!693361))

(assert (= (and b!693361 res!457402) b!693372))

(assert (= (and b!693372 res!457416) b!693349))

(assert (= (and b!693349 res!457420) b!693364))

(assert (= (and b!693364 c!78344) b!693355))

(assert (= (and b!693364 (not c!78344)) b!693368))

(assert (= (and b!693364 res!457400) b!693366))

(assert (= (and b!693366 res!457411) b!693370))

(assert (= (and b!693370 res!457409) b!693362))

(assert (= (and b!693362 res!457413) b!693358))

(assert (= (and b!693358 res!457407) b!693359))

(assert (= (and b!693359 res!457418) b!693365))

(assert (= (and b!693359 (not res!457398)) b!693373))

(assert (= (and b!693373 res!457410) b!693351))

(declare-fun m!656227 () Bool)

(assert (=> b!693355 m!656227))

(declare-fun m!656229 () Bool)

(assert (=> b!693355 m!656229))

(declare-fun m!656231 () Bool)

(assert (=> b!693358 m!656231))

(declare-fun m!656233 () Bool)

(assert (=> b!693353 m!656233))

(declare-fun m!656235 () Bool)

(assert (=> b!693351 m!656235))

(assert (=> b!693365 m!656235))

(declare-fun m!656237 () Bool)

(assert (=> b!693369 m!656237))

(declare-fun m!656239 () Bool)

(assert (=> b!693356 m!656239))

(declare-fun m!656241 () Bool)

(assert (=> b!693364 m!656241))

(assert (=> b!693349 m!656241))

(assert (=> b!693349 m!656241))

(declare-fun m!656243 () Bool)

(assert (=> b!693349 m!656243))

(declare-fun m!656245 () Bool)

(assert (=> b!693360 m!656245))

(declare-fun m!656247 () Bool)

(assert (=> b!693362 m!656247))

(declare-fun m!656249 () Bool)

(assert (=> b!693361 m!656249))

(declare-fun m!656251 () Bool)

(assert (=> b!693363 m!656251))

(declare-fun m!656253 () Bool)

(assert (=> b!693371 m!656253))

(assert (=> b!693366 m!656241))

(assert (=> b!693366 m!656241))

(declare-fun m!656255 () Bool)

(assert (=> b!693366 m!656255))

(assert (=> b!693354 m!656237))

(declare-fun m!656257 () Bool)

(assert (=> b!693357 m!656257))

(declare-fun m!656259 () Bool)

(assert (=> b!693370 m!656259))

(declare-fun m!656261 () Bool)

(assert (=> start!62022 m!656261))

(check-sat (not b!693365) (not b!693361) (not b!693366) (not b!693369) (not b!693353) (not b!693360) (not b!693356) (not b!693351) (not b!693349) (not b!693354) (not b!693357) (not b!693371) (not b!693355) (not b!693363) (not start!62022) (not b!693358) (not b!693362) (not b!693370))
(check-sat)
