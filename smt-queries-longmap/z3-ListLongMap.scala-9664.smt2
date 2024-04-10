; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114124 () Bool)

(assert start!114124)

(declare-fun b!1355438 () Bool)

(declare-datatypes ((Unit!44544 0))(
  ( (Unit!44545) )
))
(declare-fun e!769746 () Unit!44544)

(declare-fun Unit!44546 () Unit!44544)

(assert (=> b!1355438 (= e!769746 Unit!44546)))

(declare-fun b!1355439 () Bool)

(declare-fun e!769744 () Bool)

(declare-fun e!769747 () Bool)

(assert (=> b!1355439 (= e!769744 e!769747)))

(declare-fun res!900373 () Bool)

(assert (=> b!1355439 (=> (not res!900373) (not e!769747))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598632 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355439 (= res!900373 (and (not (= from!3120 i!1404)) (not lt!598632) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598631 () Unit!44544)

(assert (=> b!1355439 (= lt!598631 e!769746)))

(declare-fun c!126977 () Bool)

(assert (=> b!1355439 (= c!126977 lt!598632)))

(declare-datatypes ((array!92306 0))(
  ( (array!92307 (arr!44601 (Array (_ BitVec 32) (_ BitVec 64))) (size!45151 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92306)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355439 (= lt!598632 (validKeyInArray!0 (select (arr!44601 a!3742) from!3120)))))

(declare-fun b!1355441 () Bool)

(declare-fun res!900369 () Bool)

(assert (=> b!1355441 (=> (not res!900369) (not e!769744))))

(declare-datatypes ((List!31642 0))(
  ( (Nil!31639) (Cons!31638 (h!32847 (_ BitVec 64)) (t!46300 List!31642)) )
))
(declare-fun acc!759 () List!31642)

(declare-fun contains!9351 (List!31642 (_ BitVec 64)) Bool)

(assert (=> b!1355441 (= res!900369 (not (contains!9351 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355442 () Bool)

(declare-fun res!900368 () Bool)

(assert (=> b!1355442 (=> (not res!900368) (not e!769744))))

(declare-fun arrayNoDuplicates!0 (array!92306 (_ BitVec 32) List!31642) Bool)

(assert (=> b!1355442 (= res!900368 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355443 () Bool)

(assert (=> b!1355443 (= e!769747 false)))

(declare-fun lt!598629 () Bool)

(assert (=> b!1355443 (= lt!598629 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355444 () Bool)

(declare-fun res!900364 () Bool)

(assert (=> b!1355444 (=> (not res!900364) (not e!769744))))

(assert (=> b!1355444 (= res!900364 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45151 a!3742)))))

(declare-fun b!1355445 () Bool)

(declare-fun res!900371 () Bool)

(assert (=> b!1355445 (=> (not res!900371) (not e!769744))))

(assert (=> b!1355445 (= res!900371 (not (contains!9351 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355440 () Bool)

(declare-fun res!900372 () Bool)

(assert (=> b!1355440 (=> (not res!900372) (not e!769744))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355440 (= res!900372 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900366 () Bool)

(assert (=> start!114124 (=> (not res!900366) (not e!769744))))

(assert (=> start!114124 (= res!900366 (and (bvslt (size!45151 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45151 a!3742))))))

(assert (=> start!114124 e!769744))

(assert (=> start!114124 true))

(declare-fun array_inv!33629 (array!92306) Bool)

(assert (=> start!114124 (array_inv!33629 a!3742)))

(declare-fun b!1355446 () Bool)

(declare-fun res!900370 () Bool)

(assert (=> b!1355446 (=> (not res!900370) (not e!769744))))

(assert (=> b!1355446 (= res!900370 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45151 a!3742))))))

(declare-fun b!1355447 () Bool)

(declare-fun res!900367 () Bool)

(assert (=> b!1355447 (=> (not res!900367) (not e!769744))))

(assert (=> b!1355447 (= res!900367 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31639))))

(declare-fun b!1355448 () Bool)

(declare-fun res!900365 () Bool)

(assert (=> b!1355448 (=> (not res!900365) (not e!769744))))

(declare-fun noDuplicate!2208 (List!31642) Bool)

(assert (=> b!1355448 (= res!900365 (noDuplicate!2208 acc!759))))

(declare-fun b!1355449 () Bool)

(declare-fun lt!598630 () Unit!44544)

(assert (=> b!1355449 (= e!769746 lt!598630)))

(declare-fun lt!598633 () Unit!44544)

(declare-fun lemmaListSubSeqRefl!0 (List!31642) Unit!44544)

(assert (=> b!1355449 (= lt!598633 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!771 (List!31642 List!31642) Bool)

(assert (=> b!1355449 (subseq!771 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92306 List!31642 List!31642 (_ BitVec 32)) Unit!44544)

(declare-fun $colon$colon!786 (List!31642 (_ BitVec 64)) List!31642)

(assert (=> b!1355449 (= lt!598630 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!786 acc!759 (select (arr!44601 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355449 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114124 res!900366) b!1355448))

(assert (= (and b!1355448 res!900365) b!1355445))

(assert (= (and b!1355445 res!900371) b!1355441))

(assert (= (and b!1355441 res!900369) b!1355447))

(assert (= (and b!1355447 res!900367) b!1355442))

(assert (= (and b!1355442 res!900368) b!1355446))

(assert (= (and b!1355446 res!900370) b!1355440))

(assert (= (and b!1355440 res!900372) b!1355444))

(assert (= (and b!1355444 res!900364) b!1355439))

(assert (= (and b!1355439 c!126977) b!1355449))

(assert (= (and b!1355439 (not c!126977)) b!1355438))

(assert (= (and b!1355439 res!900373) b!1355443))

(declare-fun m!1241621 () Bool)

(assert (=> b!1355439 m!1241621))

(assert (=> b!1355439 m!1241621))

(declare-fun m!1241623 () Bool)

(assert (=> b!1355439 m!1241623))

(declare-fun m!1241625 () Bool)

(assert (=> b!1355443 m!1241625))

(declare-fun m!1241627 () Bool)

(assert (=> b!1355440 m!1241627))

(declare-fun m!1241629 () Bool)

(assert (=> b!1355445 m!1241629))

(declare-fun m!1241631 () Bool)

(assert (=> b!1355441 m!1241631))

(declare-fun m!1241633 () Bool)

(assert (=> b!1355442 m!1241633))

(declare-fun m!1241635 () Bool)

(assert (=> b!1355449 m!1241635))

(assert (=> b!1355449 m!1241621))

(declare-fun m!1241637 () Bool)

(assert (=> b!1355449 m!1241637))

(declare-fun m!1241639 () Bool)

(assert (=> b!1355449 m!1241639))

(assert (=> b!1355449 m!1241625))

(assert (=> b!1355449 m!1241621))

(assert (=> b!1355449 m!1241637))

(declare-fun m!1241641 () Bool)

(assert (=> b!1355449 m!1241641))

(declare-fun m!1241643 () Bool)

(assert (=> start!114124 m!1241643))

(declare-fun m!1241645 () Bool)

(assert (=> b!1355448 m!1241645))

(declare-fun m!1241647 () Bool)

(assert (=> b!1355447 m!1241647))

(check-sat (not b!1355443) (not b!1355440) (not b!1355442) (not b!1355439) (not b!1355448) (not b!1355441) (not b!1355447) (not b!1355445) (not start!114124) (not b!1355449))
(check-sat)
