; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114126 () Bool)

(assert start!114126)

(declare-fun b!1355474 () Bool)

(declare-fun res!900396 () Bool)

(declare-fun e!769758 () Bool)

(assert (=> b!1355474 (=> (not res!900396) (not e!769758))))

(declare-datatypes ((List!31643 0))(
  ( (Nil!31640) (Cons!31639 (h!32848 (_ BitVec 64)) (t!46301 List!31643)) )
))
(declare-fun acc!759 () List!31643)

(declare-fun contains!9352 (List!31643 (_ BitVec 64)) Bool)

(assert (=> b!1355474 (= res!900396 (not (contains!9352 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355475 () Bool)

(declare-datatypes ((Unit!44547 0))(
  ( (Unit!44548) )
))
(declare-fun e!769759 () Unit!44547)

(declare-fun Unit!44549 () Unit!44547)

(assert (=> b!1355475 (= e!769759 Unit!44549)))

(declare-fun b!1355476 () Bool)

(declare-fun res!900402 () Bool)

(assert (=> b!1355476 (=> (not res!900402) (not e!769758))))

(declare-datatypes ((array!92308 0))(
  ( (array!92309 (arr!44602 (Array (_ BitVec 32) (_ BitVec 64))) (size!45152 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92308)

(declare-fun arrayNoDuplicates!0 (array!92308 (_ BitVec 32) List!31643) Bool)

(assert (=> b!1355476 (= res!900402 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31640))))

(declare-fun b!1355477 () Bool)

(declare-fun e!769757 () Bool)

(assert (=> b!1355477 (= e!769758 e!769757)))

(declare-fun res!900403 () Bool)

(assert (=> b!1355477 (=> (not res!900403) (not e!769757))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598644 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355477 (= res!900403 (and (not (= from!3120 i!1404)) (not lt!598644) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598646 () Unit!44547)

(assert (=> b!1355477 (= lt!598646 e!769759)))

(declare-fun c!126980 () Bool)

(assert (=> b!1355477 (= c!126980 lt!598644)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355477 (= lt!598644 (validKeyInArray!0 (select (arr!44602 a!3742) from!3120)))))

(declare-fun b!1355478 () Bool)

(declare-fun res!900395 () Bool)

(assert (=> b!1355478 (=> (not res!900395) (not e!769758))))

(assert (=> b!1355478 (= res!900395 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45152 a!3742)))))

(declare-fun b!1355479 () Bool)

(declare-fun lt!598645 () Unit!44547)

(assert (=> b!1355479 (= e!769759 lt!598645)))

(declare-fun lt!598648 () Unit!44547)

(declare-fun lemmaListSubSeqRefl!0 (List!31643) Unit!44547)

(assert (=> b!1355479 (= lt!598648 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!772 (List!31643 List!31643) Bool)

(assert (=> b!1355479 (subseq!772 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92308 List!31643 List!31643 (_ BitVec 32)) Unit!44547)

(declare-fun $colon$colon!787 (List!31643 (_ BitVec 64)) List!31643)

(assert (=> b!1355479 (= lt!598645 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!787 acc!759 (select (arr!44602 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355479 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355480 () Bool)

(declare-fun res!900401 () Bool)

(assert (=> b!1355480 (=> (not res!900401) (not e!769758))))

(assert (=> b!1355480 (= res!900401 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45152 a!3742))))))

(declare-fun b!1355481 () Bool)

(declare-fun res!900398 () Bool)

(assert (=> b!1355481 (=> (not res!900398) (not e!769758))))

(assert (=> b!1355481 (= res!900398 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355482 () Bool)

(declare-fun res!900397 () Bool)

(assert (=> b!1355482 (=> (not res!900397) (not e!769758))))

(assert (=> b!1355482 (= res!900397 (not (contains!9352 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900400 () Bool)

(assert (=> start!114126 (=> (not res!900400) (not e!769758))))

(assert (=> start!114126 (= res!900400 (and (bvslt (size!45152 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45152 a!3742))))))

(assert (=> start!114126 e!769758))

(assert (=> start!114126 true))

(declare-fun array_inv!33630 (array!92308) Bool)

(assert (=> start!114126 (array_inv!33630 a!3742)))

(declare-fun b!1355483 () Bool)

(declare-fun res!900399 () Bool)

(assert (=> b!1355483 (=> (not res!900399) (not e!769758))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355483 (= res!900399 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355484 () Bool)

(declare-fun res!900394 () Bool)

(assert (=> b!1355484 (=> (not res!900394) (not e!769758))))

(declare-fun noDuplicate!2209 (List!31643) Bool)

(assert (=> b!1355484 (= res!900394 (noDuplicate!2209 acc!759))))

(declare-fun b!1355485 () Bool)

(assert (=> b!1355485 (= e!769757 false)))

(declare-fun lt!598647 () Bool)

(assert (=> b!1355485 (= lt!598647 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114126 res!900400) b!1355484))

(assert (= (and b!1355484 res!900394) b!1355482))

(assert (= (and b!1355482 res!900397) b!1355474))

(assert (= (and b!1355474 res!900396) b!1355476))

(assert (= (and b!1355476 res!900402) b!1355481))

(assert (= (and b!1355481 res!900398) b!1355480))

(assert (= (and b!1355480 res!900401) b!1355483))

(assert (= (and b!1355483 res!900399) b!1355478))

(assert (= (and b!1355478 res!900395) b!1355477))

(assert (= (and b!1355477 c!126980) b!1355479))

(assert (= (and b!1355477 (not c!126980)) b!1355475))

(assert (= (and b!1355477 res!900403) b!1355485))

(declare-fun m!1241649 () Bool)

(assert (=> b!1355483 m!1241649))

(declare-fun m!1241651 () Bool)

(assert (=> b!1355482 m!1241651))

(declare-fun m!1241653 () Bool)

(assert (=> b!1355485 m!1241653))

(declare-fun m!1241655 () Bool)

(assert (=> start!114126 m!1241655))

(declare-fun m!1241657 () Bool)

(assert (=> b!1355479 m!1241657))

(declare-fun m!1241659 () Bool)

(assert (=> b!1355479 m!1241659))

(declare-fun m!1241661 () Bool)

(assert (=> b!1355479 m!1241661))

(declare-fun m!1241663 () Bool)

(assert (=> b!1355479 m!1241663))

(assert (=> b!1355479 m!1241653))

(assert (=> b!1355479 m!1241659))

(assert (=> b!1355479 m!1241661))

(declare-fun m!1241665 () Bool)

(assert (=> b!1355479 m!1241665))

(declare-fun m!1241667 () Bool)

(assert (=> b!1355474 m!1241667))

(declare-fun m!1241669 () Bool)

(assert (=> b!1355481 m!1241669))

(declare-fun m!1241671 () Bool)

(assert (=> b!1355476 m!1241671))

(declare-fun m!1241673 () Bool)

(assert (=> b!1355484 m!1241673))

(assert (=> b!1355477 m!1241659))

(assert (=> b!1355477 m!1241659))

(declare-fun m!1241675 () Bool)

(assert (=> b!1355477 m!1241675))

(push 1)

(assert (not b!1355485))

(assert (not b!1355474))

(assert (not b!1355476))

(assert (not b!1355484))

(assert (not b!1355479))

