; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114086 () Bool)

(assert start!114086)

(declare-fun b!1354559 () Bool)

(declare-datatypes ((Unit!44328 0))(
  ( (Unit!44329) )
))
(declare-fun e!769462 () Unit!44328)

(declare-fun lt!598138 () Unit!44328)

(assert (=> b!1354559 (= e!769462 lt!598138)))

(declare-fun lt!598135 () Unit!44328)

(declare-datatypes ((List!31676 0))(
  ( (Nil!31673) (Cons!31672 (h!32881 (_ BitVec 64)) (t!46326 List!31676)) )
))
(declare-fun acc!759 () List!31676)

(declare-fun lemmaListSubSeqRefl!0 (List!31676) Unit!44328)

(assert (=> b!1354559 (= lt!598135 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!752 (List!31676 List!31676) Bool)

(assert (=> b!1354559 (subseq!752 acc!759 acc!759)))

(declare-datatypes ((array!92217 0))(
  ( (array!92218 (arr!44557 (Array (_ BitVec 32) (_ BitVec 64))) (size!45109 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92217)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92217 List!31676 List!31676 (_ BitVec 32)) Unit!44328)

(declare-fun $colon$colon!769 (List!31676 (_ BitVec 64)) List!31676)

(assert (=> b!1354559 (= lt!598138 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!769 acc!759 (select (arr!44557 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92217 (_ BitVec 32) List!31676) Bool)

(assert (=> b!1354559 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354560 () Bool)

(declare-fun res!899650 () Bool)

(declare-fun e!769461 () Bool)

(assert (=> b!1354560 (=> (not res!899650) (not e!769461))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354560 (= res!899650 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45109 a!3742))))))

(declare-fun b!1354561 () Bool)

(declare-fun e!769458 () Bool)

(assert (=> b!1354561 (= e!769458 (not true))))

(declare-fun lt!598137 () List!31676)

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354561 (arrayNoDuplicates!0 (array!92218 (store (arr!44557 a!3742) i!1404 l!3587) (size!45109 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598137)))

(declare-fun lt!598136 () Unit!44328)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92217 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31676) Unit!44328)

(assert (=> b!1354561 (= lt!598136 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598137))))

(declare-fun b!1354562 () Bool)

(declare-fun res!899644 () Bool)

(assert (=> b!1354562 (=> (not res!899644) (not e!769461))))

(assert (=> b!1354562 (= res!899644 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354563 () Bool)

(declare-fun e!769459 () Bool)

(assert (=> b!1354563 (= e!769461 e!769459)))

(declare-fun res!899645 () Bool)

(assert (=> b!1354563 (=> (not res!899645) (not e!769459))))

(declare-fun lt!598134 () Bool)

(assert (=> b!1354563 (= res!899645 (and (not (= from!3120 i!1404)) lt!598134))))

(declare-fun lt!598133 () Unit!44328)

(assert (=> b!1354563 (= lt!598133 e!769462)))

(declare-fun c!126902 () Bool)

(assert (=> b!1354563 (= c!126902 lt!598134)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354563 (= lt!598134 (validKeyInArray!0 (select (arr!44557 a!3742) from!3120)))))

(declare-fun b!1354564 () Bool)

(declare-fun res!899643 () Bool)

(assert (=> b!1354564 (=> (not res!899643) (not e!769461))))

(declare-fun contains!9296 (List!31676 (_ BitVec 64)) Bool)

(assert (=> b!1354564 (= res!899643 (not (contains!9296 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354565 () Bool)

(declare-fun Unit!44330 () Unit!44328)

(assert (=> b!1354565 (= e!769462 Unit!44330)))

(declare-fun b!1354566 () Bool)

(declare-fun res!899653 () Bool)

(assert (=> b!1354566 (=> (not res!899653) (not e!769461))))

(assert (=> b!1354566 (= res!899653 (not (contains!9296 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!899648 () Bool)

(assert (=> start!114086 (=> (not res!899648) (not e!769461))))

(assert (=> start!114086 (= res!899648 (and (bvslt (size!45109 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45109 a!3742))))))

(assert (=> start!114086 e!769461))

(assert (=> start!114086 true))

(declare-fun array_inv!33790 (array!92217) Bool)

(assert (=> start!114086 (array_inv!33790 a!3742)))

(declare-fun b!1354567 () Bool)

(declare-fun res!899652 () Bool)

(assert (=> b!1354567 (=> (not res!899652) (not e!769458))))

(assert (=> b!1354567 (= res!899652 (not (contains!9296 lt!598137 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354568 () Bool)

(declare-fun res!899654 () Bool)

(assert (=> b!1354568 (=> (not res!899654) (not e!769458))))

(assert (=> b!1354568 (= res!899654 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598137))))

(declare-fun b!1354569 () Bool)

(declare-fun res!899640 () Bool)

(assert (=> b!1354569 (=> (not res!899640) (not e!769458))))

(declare-fun noDuplicate!2211 (List!31676) Bool)

(assert (=> b!1354569 (= res!899640 (noDuplicate!2211 lt!598137))))

(declare-fun b!1354570 () Bool)

(declare-fun res!899651 () Bool)

(assert (=> b!1354570 (=> (not res!899651) (not e!769461))))

(assert (=> b!1354570 (= res!899651 (noDuplicate!2211 acc!759))))

(declare-fun b!1354571 () Bool)

(declare-fun res!899649 () Bool)

(assert (=> b!1354571 (=> (not res!899649) (not e!769461))))

(assert (=> b!1354571 (= res!899649 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354572 () Bool)

(declare-fun res!899641 () Bool)

(assert (=> b!1354572 (=> (not res!899641) (not e!769461))))

(assert (=> b!1354572 (= res!899641 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45109 a!3742)))))

(declare-fun b!1354573 () Bool)

(assert (=> b!1354573 (= e!769459 e!769458)))

(declare-fun res!899647 () Bool)

(assert (=> b!1354573 (=> (not res!899647) (not e!769458))))

(assert (=> b!1354573 (= res!899647 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354573 (= lt!598137 ($colon$colon!769 acc!759 (select (arr!44557 a!3742) from!3120)))))

(declare-fun b!1354574 () Bool)

(declare-fun res!899642 () Bool)

(assert (=> b!1354574 (=> (not res!899642) (not e!769458))))

(assert (=> b!1354574 (= res!899642 (not (contains!9296 lt!598137 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354575 () Bool)

(declare-fun res!899646 () Bool)

(assert (=> b!1354575 (=> (not res!899646) (not e!769461))))

(assert (=> b!1354575 (= res!899646 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31673))))

(assert (= (and start!114086 res!899648) b!1354570))

(assert (= (and b!1354570 res!899651) b!1354564))

(assert (= (and b!1354564 res!899643) b!1354566))

(assert (= (and b!1354566 res!899653) b!1354575))

(assert (= (and b!1354575 res!899646) b!1354562))

(assert (= (and b!1354562 res!899644) b!1354560))

(assert (= (and b!1354560 res!899650) b!1354571))

(assert (= (and b!1354571 res!899649) b!1354572))

(assert (= (and b!1354572 res!899641) b!1354563))

(assert (= (and b!1354563 c!126902) b!1354559))

(assert (= (and b!1354563 (not c!126902)) b!1354565))

(assert (= (and b!1354563 res!899645) b!1354573))

(assert (= (and b!1354573 res!899647) b!1354569))

(assert (= (and b!1354569 res!899640) b!1354567))

(assert (= (and b!1354567 res!899652) b!1354574))

(assert (= (and b!1354574 res!899642) b!1354568))

(assert (= (and b!1354568 res!899654) b!1354561))

(declare-fun m!1240447 () Bool)

(assert (=> b!1354568 m!1240447))

(declare-fun m!1240449 () Bool)

(assert (=> b!1354566 m!1240449))

(declare-fun m!1240451 () Bool)

(assert (=> b!1354561 m!1240451))

(declare-fun m!1240453 () Bool)

(assert (=> b!1354561 m!1240453))

(declare-fun m!1240455 () Bool)

(assert (=> b!1354561 m!1240455))

(declare-fun m!1240457 () Bool)

(assert (=> b!1354570 m!1240457))

(declare-fun m!1240459 () Bool)

(assert (=> b!1354573 m!1240459))

(assert (=> b!1354573 m!1240459))

(declare-fun m!1240461 () Bool)

(assert (=> b!1354573 m!1240461))

(declare-fun m!1240463 () Bool)

(assert (=> b!1354567 m!1240463))

(declare-fun m!1240465 () Bool)

(assert (=> b!1354559 m!1240465))

(assert (=> b!1354559 m!1240459))

(assert (=> b!1354559 m!1240461))

(declare-fun m!1240467 () Bool)

(assert (=> b!1354559 m!1240467))

(declare-fun m!1240469 () Bool)

(assert (=> b!1354559 m!1240469))

(assert (=> b!1354559 m!1240459))

(assert (=> b!1354559 m!1240461))

(declare-fun m!1240471 () Bool)

(assert (=> b!1354559 m!1240471))

(declare-fun m!1240473 () Bool)

(assert (=> b!1354575 m!1240473))

(declare-fun m!1240475 () Bool)

(assert (=> b!1354574 m!1240475))

(declare-fun m!1240477 () Bool)

(assert (=> start!114086 m!1240477))

(declare-fun m!1240479 () Bool)

(assert (=> b!1354571 m!1240479))

(declare-fun m!1240481 () Bool)

(assert (=> b!1354562 m!1240481))

(declare-fun m!1240483 () Bool)

(assert (=> b!1354569 m!1240483))

(declare-fun m!1240485 () Bool)

(assert (=> b!1354564 m!1240485))

(assert (=> b!1354563 m!1240459))

(assert (=> b!1354563 m!1240459))

(declare-fun m!1240487 () Bool)

(assert (=> b!1354563 m!1240487))

(check-sat (not b!1354575) (not b!1354563) (not b!1354564) (not b!1354561) (not b!1354570) (not start!114086) (not b!1354574) (not b!1354569) (not b!1354571) (not b!1354566) (not b!1354573) (not b!1354562) (not b!1354559) (not b!1354568) (not b!1354567))
(check-sat)
