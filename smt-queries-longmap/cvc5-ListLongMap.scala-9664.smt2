; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114122 () Bool)

(assert start!114122)

(declare-fun b!1355402 () Bool)

(declare-fun res!900336 () Bool)

(declare-fun e!769734 () Bool)

(assert (=> b!1355402 (=> (not res!900336) (not e!769734))))

(declare-datatypes ((List!31641 0))(
  ( (Nil!31638) (Cons!31637 (h!32846 (_ BitVec 64)) (t!46299 List!31641)) )
))
(declare-fun acc!759 () List!31641)

(declare-fun contains!9350 (List!31641 (_ BitVec 64)) Bool)

(assert (=> b!1355402 (= res!900336 (not (contains!9350 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900342 () Bool)

(assert (=> start!114122 (=> (not res!900342) (not e!769734))))

(declare-datatypes ((array!92304 0))(
  ( (array!92305 (arr!44600 (Array (_ BitVec 32) (_ BitVec 64))) (size!45150 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92304)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114122 (= res!900342 (and (bvslt (size!45150 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45150 a!3742))))))

(assert (=> start!114122 e!769734))

(assert (=> start!114122 true))

(declare-fun array_inv!33628 (array!92304) Bool)

(assert (=> start!114122 (array_inv!33628 a!3742)))

(declare-fun b!1355403 () Bool)

(declare-fun res!900338 () Bool)

(assert (=> b!1355403 (=> (not res!900338) (not e!769734))))

(assert (=> b!1355403 (= res!900338 (not (contains!9350 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355404 () Bool)

(declare-datatypes ((Unit!44541 0))(
  ( (Unit!44542) )
))
(declare-fun e!769735 () Unit!44541)

(declare-fun Unit!44543 () Unit!44541)

(assert (=> b!1355404 (= e!769735 Unit!44543)))

(declare-fun b!1355405 () Bool)

(declare-fun res!900337 () Bool)

(assert (=> b!1355405 (=> (not res!900337) (not e!769734))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355405 (= res!900337 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45150 a!3742))))))

(declare-fun b!1355406 () Bool)

(declare-fun lt!598615 () Unit!44541)

(assert (=> b!1355406 (= e!769735 lt!598615)))

(declare-fun lt!598618 () Unit!44541)

(declare-fun lemmaListSubSeqRefl!0 (List!31641) Unit!44541)

(assert (=> b!1355406 (= lt!598618 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!770 (List!31641 List!31641) Bool)

(assert (=> b!1355406 (subseq!770 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92304 List!31641 List!31641 (_ BitVec 32)) Unit!44541)

(declare-fun $colon$colon!785 (List!31641 (_ BitVec 64)) List!31641)

(assert (=> b!1355406 (= lt!598615 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!785 acc!759 (select (arr!44600 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92304 (_ BitVec 32) List!31641) Bool)

(assert (=> b!1355406 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355407 () Bool)

(declare-fun res!900340 () Bool)

(assert (=> b!1355407 (=> (not res!900340) (not e!769734))))

(assert (=> b!1355407 (= res!900340 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31638))))

(declare-fun b!1355408 () Bool)

(declare-fun res!900334 () Bool)

(assert (=> b!1355408 (=> (not res!900334) (not e!769734))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355408 (= res!900334 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355409 () Bool)

(declare-fun res!900335 () Bool)

(assert (=> b!1355409 (=> (not res!900335) (not e!769734))))

(declare-fun noDuplicate!2207 (List!31641) Bool)

(assert (=> b!1355409 (= res!900335 (noDuplicate!2207 acc!759))))

(declare-fun b!1355410 () Bool)

(declare-fun e!769732 () Bool)

(assert (=> b!1355410 (= e!769734 e!769732)))

(declare-fun res!900341 () Bool)

(assert (=> b!1355410 (=> (not res!900341) (not e!769732))))

(declare-fun lt!598617 () Bool)

(assert (=> b!1355410 (= res!900341 (and (not (= from!3120 i!1404)) (not lt!598617) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598614 () Unit!44541)

(assert (=> b!1355410 (= lt!598614 e!769735)))

(declare-fun c!126974 () Bool)

(assert (=> b!1355410 (= c!126974 lt!598617)))

(assert (=> b!1355410 (= lt!598617 (validKeyInArray!0 (select (arr!44600 a!3742) from!3120)))))

(declare-fun b!1355411 () Bool)

(declare-fun res!900343 () Bool)

(assert (=> b!1355411 (=> (not res!900343) (not e!769734))))

(assert (=> b!1355411 (= res!900343 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355412 () Bool)

(declare-fun res!900339 () Bool)

(assert (=> b!1355412 (=> (not res!900339) (not e!769734))))

(assert (=> b!1355412 (= res!900339 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45150 a!3742)))))

(declare-fun b!1355413 () Bool)

(assert (=> b!1355413 (= e!769732 false)))

(declare-fun lt!598616 () Bool)

(assert (=> b!1355413 (= lt!598616 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114122 res!900342) b!1355409))

(assert (= (and b!1355409 res!900335) b!1355402))

(assert (= (and b!1355402 res!900336) b!1355403))

(assert (= (and b!1355403 res!900338) b!1355407))

(assert (= (and b!1355407 res!900340) b!1355411))

(assert (= (and b!1355411 res!900343) b!1355405))

(assert (= (and b!1355405 res!900337) b!1355408))

(assert (= (and b!1355408 res!900334) b!1355412))

(assert (= (and b!1355412 res!900339) b!1355410))

(assert (= (and b!1355410 c!126974) b!1355406))

(assert (= (and b!1355410 (not c!126974)) b!1355404))

(assert (= (and b!1355410 res!900341) b!1355413))

(declare-fun m!1241593 () Bool)

(assert (=> b!1355408 m!1241593))

(declare-fun m!1241595 () Bool)

(assert (=> b!1355406 m!1241595))

(declare-fun m!1241597 () Bool)

(assert (=> b!1355406 m!1241597))

(declare-fun m!1241599 () Bool)

(assert (=> b!1355406 m!1241599))

(declare-fun m!1241601 () Bool)

(assert (=> b!1355406 m!1241601))

(declare-fun m!1241603 () Bool)

(assert (=> b!1355406 m!1241603))

(assert (=> b!1355406 m!1241597))

(assert (=> b!1355406 m!1241599))

(declare-fun m!1241605 () Bool)

(assert (=> b!1355406 m!1241605))

(declare-fun m!1241607 () Bool)

(assert (=> b!1355411 m!1241607))

(declare-fun m!1241609 () Bool)

(assert (=> b!1355409 m!1241609))

(declare-fun m!1241611 () Bool)

(assert (=> b!1355407 m!1241611))

(assert (=> b!1355413 m!1241603))

(assert (=> b!1355410 m!1241597))

(assert (=> b!1355410 m!1241597))

(declare-fun m!1241613 () Bool)

(assert (=> b!1355410 m!1241613))

(declare-fun m!1241615 () Bool)

(assert (=> b!1355403 m!1241615))

(declare-fun m!1241617 () Bool)

(assert (=> start!114122 m!1241617))

(declare-fun m!1241619 () Bool)

(assert (=> b!1355402 m!1241619))

(push 1)

