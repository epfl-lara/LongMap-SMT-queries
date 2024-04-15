; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114080 () Bool)

(assert start!114080)

(declare-fun b!1354406 () Bool)

(declare-fun res!899516 () Bool)

(declare-fun e!769414 () Bool)

(assert (=> b!1354406 (=> (not res!899516) (not e!769414))))

(declare-datatypes ((array!92211 0))(
  ( (array!92212 (arr!44554 (Array (_ BitVec 32) (_ BitVec 64))) (size!45106 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92211)

(declare-datatypes ((List!31673 0))(
  ( (Nil!31670) (Cons!31669 (h!32878 (_ BitVec 64)) (t!46323 List!31673)) )
))
(declare-fun arrayNoDuplicates!0 (array!92211 (_ BitVec 32) List!31673) Bool)

(assert (=> b!1354406 (= res!899516 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31670))))

(declare-fun res!899511 () Bool)

(assert (=> start!114080 (=> (not res!899511) (not e!769414))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114080 (= res!899511 (and (bvslt (size!45106 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45106 a!3742))))))

(assert (=> start!114080 e!769414))

(assert (=> start!114080 true))

(declare-fun array_inv!33787 (array!92211) Bool)

(assert (=> start!114080 (array_inv!33787 a!3742)))

(declare-fun b!1354407 () Bool)

(declare-datatypes ((Unit!44319 0))(
  ( (Unit!44320) )
))
(declare-fun e!769417 () Unit!44319)

(declare-fun lt!598082 () Unit!44319)

(assert (=> b!1354407 (= e!769417 lt!598082)))

(declare-fun lt!598084 () Unit!44319)

(declare-fun acc!759 () List!31673)

(declare-fun lemmaListSubSeqRefl!0 (List!31673) Unit!44319)

(assert (=> b!1354407 (= lt!598084 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!749 (List!31673 List!31673) Bool)

(assert (=> b!1354407 (subseq!749 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92211 List!31673 List!31673 (_ BitVec 32)) Unit!44319)

(declare-fun $colon$colon!766 (List!31673 (_ BitVec 64)) List!31673)

(assert (=> b!1354407 (= lt!598082 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!766 acc!759 (select (arr!44554 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354407 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354408 () Bool)

(declare-fun e!769416 () Bool)

(declare-fun e!769415 () Bool)

(assert (=> b!1354408 (= e!769416 e!769415)))

(declare-fun res!899517 () Bool)

(assert (=> b!1354408 (=> (not res!899517) (not e!769415))))

(assert (=> b!1354408 (= res!899517 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!598081 () List!31673)

(assert (=> b!1354408 (= lt!598081 ($colon$colon!766 acc!759 (select (arr!44554 a!3742) from!3120)))))

(declare-fun b!1354409 () Bool)

(declare-fun res!899512 () Bool)

(assert (=> b!1354409 (=> (not res!899512) (not e!769415))))

(declare-fun contains!9293 (List!31673 (_ BitVec 64)) Bool)

(assert (=> b!1354409 (= res!899512 (not (contains!9293 lt!598081 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354410 () Bool)

(declare-fun res!899507 () Bool)

(assert (=> b!1354410 (=> (not res!899507) (not e!769415))))

(assert (=> b!1354410 (= res!899507 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598081))))

(declare-fun b!1354411 () Bool)

(declare-fun res!899509 () Bool)

(assert (=> b!1354411 (=> (not res!899509) (not e!769414))))

(assert (=> b!1354411 (= res!899509 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45106 a!3742)))))

(declare-fun b!1354412 () Bool)

(declare-fun res!899513 () Bool)

(assert (=> b!1354412 (=> (not res!899513) (not e!769414))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354412 (= res!899513 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45106 a!3742))))))

(declare-fun b!1354413 () Bool)

(assert (=> b!1354413 (= e!769414 e!769416)))

(declare-fun res!899510 () Bool)

(assert (=> b!1354413 (=> (not res!899510) (not e!769416))))

(declare-fun lt!598083 () Bool)

(assert (=> b!1354413 (= res!899510 (and (not (= from!3120 i!1404)) lt!598083))))

(declare-fun lt!598079 () Unit!44319)

(assert (=> b!1354413 (= lt!598079 e!769417)))

(declare-fun c!126893 () Bool)

(assert (=> b!1354413 (= c!126893 lt!598083)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354413 (= lt!598083 (validKeyInArray!0 (select (arr!44554 a!3742) from!3120)))))

(declare-fun b!1354414 () Bool)

(declare-fun res!899508 () Bool)

(assert (=> b!1354414 (=> (not res!899508) (not e!769415))))

(assert (=> b!1354414 (= res!899508 (not (contains!9293 lt!598081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354415 () Bool)

(assert (=> b!1354415 (= e!769415 (not (bvsle from!3120 (size!45106 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354415 (arrayNoDuplicates!0 (array!92212 (store (arr!44554 a!3742) i!1404 l!3587) (size!45106 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598081)))

(declare-fun lt!598080 () Unit!44319)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31673) Unit!44319)

(assert (=> b!1354415 (= lt!598080 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598081))))

(declare-fun b!1354416 () Bool)

(declare-fun res!899506 () Bool)

(assert (=> b!1354416 (=> (not res!899506) (not e!769414))))

(assert (=> b!1354416 (= res!899506 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354417 () Bool)

(declare-fun res!899514 () Bool)

(assert (=> b!1354417 (=> (not res!899514) (not e!769414))))

(assert (=> b!1354417 (= res!899514 (not (contains!9293 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354418 () Bool)

(declare-fun res!899505 () Bool)

(assert (=> b!1354418 (=> (not res!899505) (not e!769414))))

(assert (=> b!1354418 (= res!899505 (not (contains!9293 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354419 () Bool)

(declare-fun res!899519 () Bool)

(assert (=> b!1354419 (=> (not res!899519) (not e!769414))))

(assert (=> b!1354419 (= res!899519 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354420 () Bool)

(declare-fun res!899515 () Bool)

(assert (=> b!1354420 (=> (not res!899515) (not e!769414))))

(declare-fun noDuplicate!2208 (List!31673) Bool)

(assert (=> b!1354420 (= res!899515 (noDuplicate!2208 acc!759))))

(declare-fun b!1354421 () Bool)

(declare-fun Unit!44321 () Unit!44319)

(assert (=> b!1354421 (= e!769417 Unit!44321)))

(declare-fun b!1354422 () Bool)

(declare-fun res!899518 () Bool)

(assert (=> b!1354422 (=> (not res!899518) (not e!769415))))

(assert (=> b!1354422 (= res!899518 (noDuplicate!2208 lt!598081))))

(assert (= (and start!114080 res!899511) b!1354420))

(assert (= (and b!1354420 res!899515) b!1354417))

(assert (= (and b!1354417 res!899514) b!1354418))

(assert (= (and b!1354418 res!899505) b!1354406))

(assert (= (and b!1354406 res!899516) b!1354419))

(assert (= (and b!1354419 res!899519) b!1354412))

(assert (= (and b!1354412 res!899513) b!1354416))

(assert (= (and b!1354416 res!899506) b!1354411))

(assert (= (and b!1354411 res!899509) b!1354413))

(assert (= (and b!1354413 c!126893) b!1354407))

(assert (= (and b!1354413 (not c!126893)) b!1354421))

(assert (= (and b!1354413 res!899510) b!1354408))

(assert (= (and b!1354408 res!899517) b!1354422))

(assert (= (and b!1354422 res!899518) b!1354414))

(assert (= (and b!1354414 res!899508) b!1354409))

(assert (= (and b!1354409 res!899512) b!1354410))

(assert (= (and b!1354410 res!899507) b!1354415))

(declare-fun m!1240321 () Bool)

(assert (=> b!1354413 m!1240321))

(assert (=> b!1354413 m!1240321))

(declare-fun m!1240323 () Bool)

(assert (=> b!1354413 m!1240323))

(declare-fun m!1240325 () Bool)

(assert (=> b!1354409 m!1240325))

(declare-fun m!1240327 () Bool)

(assert (=> b!1354418 m!1240327))

(assert (=> b!1354408 m!1240321))

(assert (=> b!1354408 m!1240321))

(declare-fun m!1240329 () Bool)

(assert (=> b!1354408 m!1240329))

(declare-fun m!1240331 () Bool)

(assert (=> start!114080 m!1240331))

(declare-fun m!1240333 () Bool)

(assert (=> b!1354410 m!1240333))

(declare-fun m!1240335 () Bool)

(assert (=> b!1354406 m!1240335))

(declare-fun m!1240337 () Bool)

(assert (=> b!1354416 m!1240337))

(declare-fun m!1240339 () Bool)

(assert (=> b!1354414 m!1240339))

(declare-fun m!1240341 () Bool)

(assert (=> b!1354420 m!1240341))

(declare-fun m!1240343 () Bool)

(assert (=> b!1354422 m!1240343))

(declare-fun m!1240345 () Bool)

(assert (=> b!1354419 m!1240345))

(declare-fun m!1240347 () Bool)

(assert (=> b!1354407 m!1240347))

(assert (=> b!1354407 m!1240321))

(assert (=> b!1354407 m!1240329))

(declare-fun m!1240349 () Bool)

(assert (=> b!1354407 m!1240349))

(declare-fun m!1240351 () Bool)

(assert (=> b!1354407 m!1240351))

(assert (=> b!1354407 m!1240321))

(assert (=> b!1354407 m!1240329))

(declare-fun m!1240353 () Bool)

(assert (=> b!1354407 m!1240353))

(declare-fun m!1240355 () Bool)

(assert (=> b!1354417 m!1240355))

(declare-fun m!1240357 () Bool)

(assert (=> b!1354415 m!1240357))

(declare-fun m!1240359 () Bool)

(assert (=> b!1354415 m!1240359))

(declare-fun m!1240361 () Bool)

(assert (=> b!1354415 m!1240361))

(check-sat (not b!1354416) (not b!1354420) (not b!1354418) (not b!1354407) (not b!1354415) (not b!1354414) (not b!1354413) (not start!114080) (not b!1354408) (not b!1354422) (not b!1354410) (not b!1354406) (not b!1354419) (not b!1354417) (not b!1354409))
(check-sat)
