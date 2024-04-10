; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114180 () Bool)

(assert start!114180)

(declare-fun b!1356481 () Bool)

(declare-fun res!901241 () Bool)

(declare-fun e!770081 () Bool)

(assert (=> b!1356481 (=> (not res!901241) (not e!770081))))

(declare-datatypes ((array!92362 0))(
  ( (array!92363 (arr!44629 (Array (_ BitVec 32) (_ BitVec 64))) (size!45179 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92362)

(declare-datatypes ((List!31670 0))(
  ( (Nil!31667) (Cons!31666 (h!32875 (_ BitVec 64)) (t!46328 List!31670)) )
))
(declare-fun arrayNoDuplicates!0 (array!92362 (_ BitVec 32) List!31670) Bool)

(assert (=> b!1356481 (= res!901241 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31667))))

(declare-fun b!1356482 () Bool)

(declare-fun res!901245 () Bool)

(declare-fun e!770080 () Bool)

(assert (=> b!1356482 (=> (not res!901245) (not e!770080))))

(declare-fun acc!759 () List!31670)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356482 (= res!901245 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356483 () Bool)

(declare-fun res!901242 () Bool)

(assert (=> b!1356483 (=> (not res!901242) (not e!770081))))

(assert (=> b!1356483 (= res!901242 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45179 a!3742)))))

(declare-fun b!1356484 () Bool)

(declare-fun res!901240 () Bool)

(assert (=> b!1356484 (=> (not res!901240) (not e!770081))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356484 (= res!901240 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356485 () Bool)

(assert (=> b!1356485 (= e!770080 (not true))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356485 (arrayNoDuplicates!0 (array!92363 (store (arr!44629 a!3742) i!1404 l!3587) (size!45179 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44628 0))(
  ( (Unit!44629) )
))
(declare-fun lt!599050 () Unit!44628)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31670) Unit!44628)

(assert (=> b!1356485 (= lt!599050 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356486 () Bool)

(declare-fun res!901246 () Bool)

(assert (=> b!1356486 (=> (not res!901246) (not e!770081))))

(declare-fun contains!9379 (List!31670 (_ BitVec 64)) Bool)

(assert (=> b!1356486 (= res!901246 (not (contains!9379 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901243 () Bool)

(assert (=> start!114180 (=> (not res!901243) (not e!770081))))

(assert (=> start!114180 (= res!901243 (and (bvslt (size!45179 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45179 a!3742))))))

(assert (=> start!114180 e!770081))

(assert (=> start!114180 true))

(declare-fun array_inv!33657 (array!92362) Bool)

(assert (=> start!114180 (array_inv!33657 a!3742)))

(declare-fun b!1356487 () Bool)

(declare-fun res!901247 () Bool)

(assert (=> b!1356487 (=> (not res!901247) (not e!770081))))

(assert (=> b!1356487 (= res!901247 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45179 a!3742))))))

(declare-fun b!1356488 () Bool)

(assert (=> b!1356488 (= e!770081 e!770080)))

(declare-fun res!901248 () Bool)

(assert (=> b!1356488 (=> (not res!901248) (not e!770080))))

(declare-fun lt!599051 () Bool)

(assert (=> b!1356488 (= res!901248 (and (not (= from!3120 i!1404)) (not lt!599051) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599053 () Unit!44628)

(declare-fun e!770082 () Unit!44628)

(assert (=> b!1356488 (= lt!599053 e!770082)))

(declare-fun c!127061 () Bool)

(assert (=> b!1356488 (= c!127061 lt!599051)))

(assert (=> b!1356488 (= lt!599051 (validKeyInArray!0 (select (arr!44629 a!3742) from!3120)))))

(declare-fun b!1356489 () Bool)

(declare-fun lt!599049 () Unit!44628)

(assert (=> b!1356489 (= e!770082 lt!599049)))

(declare-fun lt!599052 () Unit!44628)

(declare-fun lemmaListSubSeqRefl!0 (List!31670) Unit!44628)

(assert (=> b!1356489 (= lt!599052 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!799 (List!31670 List!31670) Bool)

(assert (=> b!1356489 (subseq!799 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92362 List!31670 List!31670 (_ BitVec 32)) Unit!44628)

(declare-fun $colon$colon!814 (List!31670 (_ BitVec 64)) List!31670)

(assert (=> b!1356489 (= lt!599049 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!814 acc!759 (select (arr!44629 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356489 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356490 () Bool)

(declare-fun res!901244 () Bool)

(assert (=> b!1356490 (=> (not res!901244) (not e!770081))))

(assert (=> b!1356490 (= res!901244 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356491 () Bool)

(declare-fun res!901249 () Bool)

(assert (=> b!1356491 (=> (not res!901249) (not e!770081))))

(assert (=> b!1356491 (= res!901249 (not (contains!9379 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356492 () Bool)

(declare-fun Unit!44630 () Unit!44628)

(assert (=> b!1356492 (= e!770082 Unit!44630)))

(declare-fun b!1356493 () Bool)

(declare-fun res!901239 () Bool)

(assert (=> b!1356493 (=> (not res!901239) (not e!770081))))

(declare-fun noDuplicate!2236 (List!31670) Bool)

(assert (=> b!1356493 (= res!901239 (noDuplicate!2236 acc!759))))

(assert (= (and start!114180 res!901243) b!1356493))

(assert (= (and b!1356493 res!901239) b!1356491))

(assert (= (and b!1356491 res!901249) b!1356486))

(assert (= (and b!1356486 res!901246) b!1356481))

(assert (= (and b!1356481 res!901241) b!1356490))

(assert (= (and b!1356490 res!901244) b!1356487))

(assert (= (and b!1356487 res!901247) b!1356484))

(assert (= (and b!1356484 res!901240) b!1356483))

(assert (= (and b!1356483 res!901242) b!1356488))

(assert (= (and b!1356488 c!127061) b!1356489))

(assert (= (and b!1356488 (not c!127061)) b!1356492))

(assert (= (and b!1356488 res!901248) b!1356482))

(assert (= (and b!1356482 res!901245) b!1356485))

(declare-fun m!1242471 () Bool)

(assert (=> b!1356490 m!1242471))

(declare-fun m!1242473 () Bool)

(assert (=> start!114180 m!1242473))

(declare-fun m!1242475 () Bool)

(assert (=> b!1356493 m!1242475))

(declare-fun m!1242477 () Bool)

(assert (=> b!1356481 m!1242477))

(declare-fun m!1242479 () Bool)

(assert (=> b!1356484 m!1242479))

(declare-fun m!1242481 () Bool)

(assert (=> b!1356491 m!1242481))

(declare-fun m!1242483 () Bool)

(assert (=> b!1356482 m!1242483))

(declare-fun m!1242485 () Bool)

(assert (=> b!1356489 m!1242485))

(declare-fun m!1242487 () Bool)

(assert (=> b!1356489 m!1242487))

(declare-fun m!1242489 () Bool)

(assert (=> b!1356489 m!1242489))

(declare-fun m!1242491 () Bool)

(assert (=> b!1356489 m!1242491))

(assert (=> b!1356489 m!1242483))

(assert (=> b!1356489 m!1242487))

(assert (=> b!1356489 m!1242489))

(declare-fun m!1242493 () Bool)

(assert (=> b!1356489 m!1242493))

(declare-fun m!1242495 () Bool)

(assert (=> b!1356485 m!1242495))

(declare-fun m!1242497 () Bool)

(assert (=> b!1356485 m!1242497))

(declare-fun m!1242499 () Bool)

(assert (=> b!1356485 m!1242499))

(assert (=> b!1356488 m!1242487))

(assert (=> b!1356488 m!1242487))

(declare-fun m!1242501 () Bool)

(assert (=> b!1356488 m!1242501))

(declare-fun m!1242503 () Bool)

(assert (=> b!1356486 m!1242503))

(push 1)

