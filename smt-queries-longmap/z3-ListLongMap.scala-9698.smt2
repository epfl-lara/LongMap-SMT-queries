; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114578 () Bool)

(assert start!114578)

(declare-fun b!1359459 () Bool)

(declare-fun res!903965 () Bool)

(declare-fun e!771400 () Bool)

(assert (=> b!1359459 (=> (not res!903965) (not e!771400))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359459 (= res!903965 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359460 () Bool)

(declare-datatypes ((Unit!44607 0))(
  ( (Unit!44608) )
))
(declare-fun e!771403 () Unit!44607)

(declare-fun Unit!44609 () Unit!44607)

(assert (=> b!1359460 (= e!771403 Unit!44609)))

(declare-fun b!1359461 () Bool)

(declare-fun res!903966 () Bool)

(assert (=> b!1359461 (=> (not res!903966) (not e!771400))))

(declare-datatypes ((List!31796 0))(
  ( (Nil!31793) (Cons!31792 (h!33001 (_ BitVec 64)) (t!46461 List!31796)) )
))
(declare-fun acc!759 () List!31796)

(declare-fun contains!9416 (List!31796 (_ BitVec 64)) Bool)

(assert (=> b!1359461 (= res!903966 (not (contains!9416 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359463 () Bool)

(declare-fun lt!599449 () Unit!44607)

(assert (=> b!1359463 (= e!771403 lt!599449)))

(declare-fun lt!599447 () Unit!44607)

(declare-fun lemmaListSubSeqRefl!0 (List!31796) Unit!44607)

(assert (=> b!1359463 (= lt!599447 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!854 (List!31796 List!31796) Bool)

(assert (=> b!1359463 (subseq!854 acc!759 acc!759)))

(declare-datatypes ((array!92472 0))(
  ( (array!92473 (arr!44677 (Array (_ BitVec 32) (_ BitVec 64))) (size!45229 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92472)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92472 List!31796 List!31796 (_ BitVec 32)) Unit!44607)

(declare-fun $colon$colon!859 (List!31796 (_ BitVec 64)) List!31796)

(assert (=> b!1359463 (= lt!599449 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!859 acc!759 (select (arr!44677 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92472 (_ BitVec 32) List!31796) Bool)

(assert (=> b!1359463 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359464 () Bool)

(declare-fun e!771402 () Bool)

(assert (=> b!1359464 (= e!771402 (bvsge (bvsub (size!45229 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45229 a!3742) from!3120)))))

(declare-fun b!1359465 () Bool)

(declare-fun res!903968 () Bool)

(assert (=> b!1359465 (=> (not res!903968) (not e!771400))))

(assert (=> b!1359465 (= res!903968 (not (contains!9416 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359466 () Bool)

(declare-fun res!903958 () Bool)

(assert (=> b!1359466 (=> (not res!903958) (not e!771400))))

(assert (=> b!1359466 (= res!903958 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45229 a!3742)))))

(declare-fun b!1359467 () Bool)

(assert (=> b!1359467 (= e!771400 e!771402)))

(declare-fun res!903961 () Bool)

(assert (=> b!1359467 (=> (not res!903961) (not e!771402))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359467 (= res!903961 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599448 () Unit!44607)

(assert (=> b!1359467 (= lt!599448 e!771403)))

(declare-fun c!127193 () Bool)

(assert (=> b!1359467 (= c!127193 (validKeyInArray!0 (select (arr!44677 a!3742) from!3120)))))

(declare-fun b!1359468 () Bool)

(declare-fun res!903967 () Bool)

(assert (=> b!1359468 (=> (not res!903967) (not e!771400))))

(declare-fun noDuplicate!2331 (List!31796) Bool)

(assert (=> b!1359468 (= res!903967 (noDuplicate!2331 acc!759))))

(declare-fun b!1359469 () Bool)

(declare-fun res!903964 () Bool)

(assert (=> b!1359469 (=> (not res!903964) (not e!771400))))

(assert (=> b!1359469 (= res!903964 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45229 a!3742))))))

(declare-fun b!1359470 () Bool)

(declare-fun res!903962 () Bool)

(assert (=> b!1359470 (=> (not res!903962) (not e!771402))))

(assert (=> b!1359470 (= res!903962 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359471 () Bool)

(declare-fun res!903959 () Bool)

(assert (=> b!1359471 (=> (not res!903959) (not e!771400))))

(assert (=> b!1359471 (= res!903959 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31793))))

(declare-fun b!1359462 () Bool)

(declare-fun res!903963 () Bool)

(assert (=> b!1359462 (=> (not res!903963) (not e!771400))))

(assert (=> b!1359462 (= res!903963 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!903960 () Bool)

(assert (=> start!114578 (=> (not res!903960) (not e!771400))))

(assert (=> start!114578 (= res!903960 (and (bvslt (size!45229 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45229 a!3742))))))

(assert (=> start!114578 e!771400))

(assert (=> start!114578 true))

(declare-fun array_inv!33910 (array!92472) Bool)

(assert (=> start!114578 (array_inv!33910 a!3742)))

(assert (= (and start!114578 res!903960) b!1359468))

(assert (= (and b!1359468 res!903967) b!1359461))

(assert (= (and b!1359461 res!903966) b!1359465))

(assert (= (and b!1359465 res!903968) b!1359471))

(assert (= (and b!1359471 res!903959) b!1359462))

(assert (= (and b!1359462 res!903963) b!1359469))

(assert (= (and b!1359469 res!903964) b!1359459))

(assert (= (and b!1359459 res!903965) b!1359466))

(assert (= (and b!1359466 res!903958) b!1359467))

(assert (= (and b!1359467 c!127193) b!1359463))

(assert (= (and b!1359467 (not c!127193)) b!1359460))

(assert (= (and b!1359467 res!903961) b!1359470))

(assert (= (and b!1359470 res!903962) b!1359464))

(declare-fun m!1244401 () Bool)

(assert (=> b!1359467 m!1244401))

(assert (=> b!1359467 m!1244401))

(declare-fun m!1244403 () Bool)

(assert (=> b!1359467 m!1244403))

(declare-fun m!1244405 () Bool)

(assert (=> b!1359465 m!1244405))

(declare-fun m!1244407 () Bool)

(assert (=> b!1359471 m!1244407))

(declare-fun m!1244409 () Bool)

(assert (=> b!1359463 m!1244409))

(assert (=> b!1359463 m!1244401))

(declare-fun m!1244411 () Bool)

(assert (=> b!1359463 m!1244411))

(declare-fun m!1244413 () Bool)

(assert (=> b!1359463 m!1244413))

(declare-fun m!1244415 () Bool)

(assert (=> b!1359463 m!1244415))

(assert (=> b!1359463 m!1244401))

(assert (=> b!1359463 m!1244411))

(declare-fun m!1244417 () Bool)

(assert (=> b!1359463 m!1244417))

(declare-fun m!1244419 () Bool)

(assert (=> b!1359462 m!1244419))

(declare-fun m!1244421 () Bool)

(assert (=> b!1359461 m!1244421))

(declare-fun m!1244423 () Bool)

(assert (=> start!114578 m!1244423))

(assert (=> b!1359470 m!1244415))

(declare-fun m!1244425 () Bool)

(assert (=> b!1359468 m!1244425))

(declare-fun m!1244427 () Bool)

(assert (=> b!1359459 m!1244427))

(check-sat (not b!1359468) (not b!1359461) (not b!1359470) (not b!1359462) (not b!1359471) (not b!1359463) (not start!114578) (not b!1359467) (not b!1359459) (not b!1359465))
(check-sat)
