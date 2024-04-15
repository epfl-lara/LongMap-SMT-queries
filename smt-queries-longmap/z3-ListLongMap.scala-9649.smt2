; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114032 () Bool)

(assert start!114032)

(declare-fun b!1353252 () Bool)

(declare-fun res!898501 () Bool)

(declare-fun e!769053 () Bool)

(assert (=> b!1353252 (=> (not res!898501) (not e!769053))))

(declare-datatypes ((List!31649 0))(
  ( (Nil!31646) (Cons!31645 (h!32854 (_ BitVec 64)) (t!46299 List!31649)) )
))
(declare-fun lt!597651 () List!31649)

(declare-fun contains!9269 (List!31649 (_ BitVec 64)) Bool)

(assert (=> b!1353252 (= res!898501 (not (contains!9269 lt!597651 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353253 () Bool)

(declare-fun res!898507 () Bool)

(declare-fun e!769054 () Bool)

(assert (=> b!1353253 (=> (not res!898507) (not e!769054))))

(declare-fun acc!759 () List!31649)

(assert (=> b!1353253 (= res!898507 (not (contains!9269 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353254 () Bool)

(declare-fun res!898498 () Bool)

(assert (=> b!1353254 (=> (not res!898498) (not e!769054))))

(declare-datatypes ((array!92163 0))(
  ( (array!92164 (arr!44530 (Array (_ BitVec 32) (_ BitVec 64))) (size!45082 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92163)

(declare-fun arrayNoDuplicates!0 (array!92163 (_ BitVec 32) List!31649) Bool)

(assert (=> b!1353254 (= res!898498 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31646))))

(declare-fun b!1353255 () Bool)

(assert (=> b!1353255 (= e!769053 false)))

(declare-fun lt!597652 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353255 (= lt!597652 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597651))))

(declare-fun b!1353256 () Bool)

(declare-fun res!898502 () Bool)

(assert (=> b!1353256 (=> (not res!898502) (not e!769054))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353256 (= res!898502 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45082 a!3742))))))

(declare-fun b!1353257 () Bool)

(declare-fun res!898504 () Bool)

(assert (=> b!1353257 (=> (not res!898504) (not e!769054))))

(assert (=> b!1353257 (= res!898504 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45082 a!3742)))))

(declare-fun b!1353258 () Bool)

(declare-fun res!898506 () Bool)

(assert (=> b!1353258 (=> (not res!898506) (not e!769053))))

(declare-fun noDuplicate!2184 (List!31649) Bool)

(assert (=> b!1353258 (= res!898506 (noDuplicate!2184 lt!597651))))

(declare-fun b!1353259 () Bool)

(declare-fun res!898497 () Bool)

(assert (=> b!1353259 (=> (not res!898497) (not e!769054))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353259 (= res!898497 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353260 () Bool)

(declare-fun res!898499 () Bool)

(assert (=> b!1353260 (=> (not res!898499) (not e!769054))))

(assert (=> b!1353260 (= res!898499 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353262 () Bool)

(declare-fun res!898503 () Bool)

(assert (=> b!1353262 (=> (not res!898503) (not e!769053))))

(assert (=> b!1353262 (= res!898503 (not (contains!9269 lt!597651 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353263 () Bool)

(declare-datatypes ((Unit!44247 0))(
  ( (Unit!44248) )
))
(declare-fun e!769055 () Unit!44247)

(declare-fun lt!597647 () Unit!44247)

(assert (=> b!1353263 (= e!769055 lt!597647)))

(declare-fun lt!597648 () Unit!44247)

(declare-fun lemmaListSubSeqRefl!0 (List!31649) Unit!44247)

(assert (=> b!1353263 (= lt!597648 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!725 (List!31649 List!31649) Bool)

(assert (=> b!1353263 (subseq!725 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92163 List!31649 List!31649 (_ BitVec 32)) Unit!44247)

(declare-fun $colon$colon!742 (List!31649 (_ BitVec 64)) List!31649)

(assert (=> b!1353263 (= lt!597647 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!742 acc!759 (select (arr!44530 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353263 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353264 () Bool)

(declare-fun res!898500 () Bool)

(assert (=> b!1353264 (=> (not res!898500) (not e!769054))))

(assert (=> b!1353264 (= res!898500 (not (contains!9269 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353265 () Bool)

(declare-fun Unit!44249 () Unit!44247)

(assert (=> b!1353265 (= e!769055 Unit!44249)))

(declare-fun b!1353261 () Bool)

(declare-fun e!769057 () Bool)

(assert (=> b!1353261 (= e!769054 e!769057)))

(declare-fun res!898508 () Bool)

(assert (=> b!1353261 (=> (not res!898508) (not e!769057))))

(declare-fun lt!597650 () Bool)

(assert (=> b!1353261 (= res!898508 (and (not (= from!3120 i!1404)) lt!597650))))

(declare-fun lt!597649 () Unit!44247)

(assert (=> b!1353261 (= lt!597649 e!769055)))

(declare-fun c!126821 () Bool)

(assert (=> b!1353261 (= c!126821 lt!597650)))

(assert (=> b!1353261 (= lt!597650 (validKeyInArray!0 (select (arr!44530 a!3742) from!3120)))))

(declare-fun res!898496 () Bool)

(assert (=> start!114032 (=> (not res!898496) (not e!769054))))

(assert (=> start!114032 (= res!898496 (and (bvslt (size!45082 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45082 a!3742))))))

(assert (=> start!114032 e!769054))

(assert (=> start!114032 true))

(declare-fun array_inv!33763 (array!92163) Bool)

(assert (=> start!114032 (array_inv!33763 a!3742)))

(declare-fun b!1353266 () Bool)

(declare-fun res!898495 () Bool)

(assert (=> b!1353266 (=> (not res!898495) (not e!769054))))

(assert (=> b!1353266 (= res!898495 (noDuplicate!2184 acc!759))))

(declare-fun b!1353267 () Bool)

(assert (=> b!1353267 (= e!769057 e!769053)))

(declare-fun res!898505 () Bool)

(assert (=> b!1353267 (=> (not res!898505) (not e!769053))))

(assert (=> b!1353267 (= res!898505 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353267 (= lt!597651 ($colon$colon!742 acc!759 (select (arr!44530 a!3742) from!3120)))))

(assert (= (and start!114032 res!898496) b!1353266))

(assert (= (and b!1353266 res!898495) b!1353253))

(assert (= (and b!1353253 res!898507) b!1353264))

(assert (= (and b!1353264 res!898500) b!1353254))

(assert (= (and b!1353254 res!898498) b!1353260))

(assert (= (and b!1353260 res!898499) b!1353256))

(assert (= (and b!1353256 res!898502) b!1353259))

(assert (= (and b!1353259 res!898497) b!1353257))

(assert (= (and b!1353257 res!898504) b!1353261))

(assert (= (and b!1353261 c!126821) b!1353263))

(assert (= (and b!1353261 (not c!126821)) b!1353265))

(assert (= (and b!1353261 res!898508) b!1353267))

(assert (= (and b!1353267 res!898505) b!1353258))

(assert (= (and b!1353258 res!898506) b!1353262))

(assert (= (and b!1353262 res!898503) b!1353252))

(assert (= (and b!1353252 res!898501) b!1353255))

(declare-fun m!1239457 () Bool)

(assert (=> b!1353253 m!1239457))

(declare-fun m!1239459 () Bool)

(assert (=> b!1353255 m!1239459))

(declare-fun m!1239461 () Bool)

(assert (=> b!1353262 m!1239461))

(declare-fun m!1239463 () Bool)

(assert (=> b!1353260 m!1239463))

(declare-fun m!1239465 () Bool)

(assert (=> b!1353264 m!1239465))

(declare-fun m!1239467 () Bool)

(assert (=> b!1353261 m!1239467))

(assert (=> b!1353261 m!1239467))

(declare-fun m!1239469 () Bool)

(assert (=> b!1353261 m!1239469))

(assert (=> b!1353267 m!1239467))

(assert (=> b!1353267 m!1239467))

(declare-fun m!1239471 () Bool)

(assert (=> b!1353267 m!1239471))

(declare-fun m!1239473 () Bool)

(assert (=> b!1353263 m!1239473))

(assert (=> b!1353263 m!1239467))

(assert (=> b!1353263 m!1239471))

(declare-fun m!1239475 () Bool)

(assert (=> b!1353263 m!1239475))

(declare-fun m!1239477 () Bool)

(assert (=> b!1353263 m!1239477))

(assert (=> b!1353263 m!1239467))

(assert (=> b!1353263 m!1239471))

(declare-fun m!1239479 () Bool)

(assert (=> b!1353263 m!1239479))

(declare-fun m!1239481 () Bool)

(assert (=> b!1353258 m!1239481))

(declare-fun m!1239483 () Bool)

(assert (=> b!1353254 m!1239483))

(declare-fun m!1239485 () Bool)

(assert (=> start!114032 m!1239485))

(declare-fun m!1239487 () Bool)

(assert (=> b!1353252 m!1239487))

(declare-fun m!1239489 () Bool)

(assert (=> b!1353266 m!1239489))

(declare-fun m!1239491 () Bool)

(assert (=> b!1353259 m!1239491))

(check-sat (not b!1353263) (not b!1353264) (not b!1353254) (not b!1353260) (not b!1353258) (not b!1353253) (not b!1353266) (not b!1353262) (not start!114032) (not b!1353267) (not b!1353255) (not b!1353252) (not b!1353261) (not b!1353259))
(check-sat)
