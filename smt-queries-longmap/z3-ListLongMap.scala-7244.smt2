; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92528 () Bool)

(assert start!92528)

(declare-fun b!1052445 () Bool)

(declare-fun res!701573 () Bool)

(declare-fun e!597529 () Bool)

(assert (=> b!1052445 (=> (not res!701573) (not e!597529))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052445 (= res!701573 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052446 () Bool)

(declare-fun e!597528 () Bool)

(assert (=> b!1052446 (= e!597528 true)))

(declare-fun lt!464762 () Bool)

(declare-datatypes ((List!22216 0))(
  ( (Nil!22213) (Cons!22212 (h!23421 (_ BitVec 64)) (t!31523 List!22216)) )
))
(declare-fun contains!6158 (List!22216 (_ BitVec 64)) Bool)

(assert (=> b!1052446 (= lt!464762 (contains!6158 Nil!22213 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!66329 0))(
  ( (array!66330 (arr!31904 (Array (_ BitVec 32) (_ BitVec 64))) (size!32440 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66329)

(declare-fun e!597534 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun b!1052447 () Bool)

(declare-fun arrayContainsKey!0 (array!66329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052447 (= e!597534 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052448 () Bool)

(declare-fun e!597532 () Bool)

(declare-fun e!597533 () Bool)

(assert (=> b!1052448 (= e!597532 (not e!597533))))

(declare-fun res!701571 () Bool)

(assert (=> b!1052448 (=> res!701571 e!597533)))

(declare-fun lt!464761 () (_ BitVec 32))

(assert (=> b!1052448 (= res!701571 (or (bvsgt lt!464761 i!1381) (bvsle i!1381 lt!464761)))))

(declare-fun e!597531 () Bool)

(assert (=> b!1052448 e!597531))

(declare-fun res!701580 () Bool)

(assert (=> b!1052448 (=> (not res!701580) (not e!597531))))

(assert (=> b!1052448 (= res!701580 (= (select (store (arr!31904 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464761) k0!2747))))

(declare-fun res!701582 () Bool)

(assert (=> start!92528 (=> (not res!701582) (not e!597529))))

(assert (=> start!92528 (= res!701582 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32440 a!3488)) (bvslt (size!32440 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92528 e!597529))

(assert (=> start!92528 true))

(declare-fun array_inv!24684 (array!66329) Bool)

(assert (=> start!92528 (array_inv!24684 a!3488)))

(declare-fun b!1052449 () Bool)

(declare-fun e!597530 () Bool)

(assert (=> b!1052449 (= e!597529 e!597530)))

(declare-fun res!701572 () Bool)

(assert (=> b!1052449 (=> (not res!701572) (not e!597530))))

(declare-fun lt!464764 () array!66329)

(assert (=> b!1052449 (= res!701572 (arrayContainsKey!0 lt!464764 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052449 (= lt!464764 (array!66330 (store (arr!31904 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32440 a!3488)))))

(declare-fun b!1052450 () Bool)

(declare-fun res!701577 () Bool)

(assert (=> b!1052450 (=> res!701577 e!597528)))

(assert (=> b!1052450 (= res!701577 (contains!6158 Nil!22213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052451 () Bool)

(declare-fun res!701576 () Bool)

(assert (=> b!1052451 (=> res!701576 e!597528)))

(declare-fun noDuplicate!1543 (List!22216) Bool)

(assert (=> b!1052451 (= res!701576 (not (noDuplicate!1543 Nil!22213)))))

(declare-fun b!1052452 () Bool)

(assert (=> b!1052452 (= e!597530 e!597532)))

(declare-fun res!701579 () Bool)

(assert (=> b!1052452 (=> (not res!701579) (not e!597532))))

(assert (=> b!1052452 (= res!701579 (not (= lt!464761 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66329 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052452 (= lt!464761 (arrayScanForKey!0 lt!464764 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052453 () Bool)

(assert (=> b!1052453 (= e!597531 e!597534)))

(declare-fun res!701575 () Bool)

(assert (=> b!1052453 (=> res!701575 e!597534)))

(assert (=> b!1052453 (= res!701575 (or (bvsgt lt!464761 i!1381) (bvsle i!1381 lt!464761)))))

(declare-fun b!1052454 () Bool)

(declare-fun res!701574 () Bool)

(assert (=> b!1052454 (=> (not res!701574) (not e!597529))))

(declare-fun arrayNoDuplicates!0 (array!66329 (_ BitVec 32) List!22216) Bool)

(assert (=> b!1052454 (= res!701574 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22213))))

(declare-fun b!1052455 () Bool)

(declare-fun res!701578 () Bool)

(assert (=> b!1052455 (=> (not res!701578) (not e!597529))))

(assert (=> b!1052455 (= res!701578 (= (select (arr!31904 a!3488) i!1381) k0!2747))))

(declare-fun b!1052456 () Bool)

(assert (=> b!1052456 (= e!597533 e!597528)))

(declare-fun res!701581 () Bool)

(assert (=> b!1052456 (=> res!701581 e!597528)))

(declare-fun lt!464763 () (_ BitVec 32))

(assert (=> b!1052456 (= res!701581 (or (bvslt lt!464761 #b00000000000000000000000000000000) (bvsge lt!464763 (size!32440 a!3488)) (bvsge lt!464761 (size!32440 a!3488))))))

(assert (=> b!1052456 (arrayContainsKey!0 a!3488 k0!2747 lt!464763)))

(declare-datatypes ((Unit!34480 0))(
  ( (Unit!34481) )
))
(declare-fun lt!464766 () Unit!34480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34480)

(assert (=> b!1052456 (= lt!464766 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464763))))

(assert (=> b!1052456 (= lt!464763 (bvadd #b00000000000000000000000000000001 lt!464761))))

(assert (=> b!1052456 (arrayNoDuplicates!0 a!3488 lt!464761 Nil!22213)))

(declare-fun lt!464765 () Unit!34480)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66329 (_ BitVec 32) (_ BitVec 32)) Unit!34480)

(assert (=> b!1052456 (= lt!464765 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464761))))

(assert (= (and start!92528 res!701582) b!1052454))

(assert (= (and b!1052454 res!701574) b!1052445))

(assert (= (and b!1052445 res!701573) b!1052455))

(assert (= (and b!1052455 res!701578) b!1052449))

(assert (= (and b!1052449 res!701572) b!1052452))

(assert (= (and b!1052452 res!701579) b!1052448))

(assert (= (and b!1052448 res!701580) b!1052453))

(assert (= (and b!1052453 (not res!701575)) b!1052447))

(assert (= (and b!1052448 (not res!701571)) b!1052456))

(assert (= (and b!1052456 (not res!701581)) b!1052451))

(assert (= (and b!1052451 (not res!701576)) b!1052450))

(assert (= (and b!1052450 (not res!701577)) b!1052446))

(declare-fun m!972823 () Bool)

(assert (=> b!1052450 m!972823))

(declare-fun m!972825 () Bool)

(assert (=> b!1052456 m!972825))

(declare-fun m!972827 () Bool)

(assert (=> b!1052456 m!972827))

(declare-fun m!972829 () Bool)

(assert (=> b!1052456 m!972829))

(declare-fun m!972831 () Bool)

(assert (=> b!1052456 m!972831))

(declare-fun m!972833 () Bool)

(assert (=> b!1052452 m!972833))

(declare-fun m!972835 () Bool)

(assert (=> b!1052451 m!972835))

(declare-fun m!972837 () Bool)

(assert (=> b!1052447 m!972837))

(declare-fun m!972839 () Bool)

(assert (=> b!1052448 m!972839))

(declare-fun m!972841 () Bool)

(assert (=> b!1052448 m!972841))

(declare-fun m!972843 () Bool)

(assert (=> b!1052455 m!972843))

(declare-fun m!972845 () Bool)

(assert (=> b!1052454 m!972845))

(declare-fun m!972847 () Bool)

(assert (=> b!1052449 m!972847))

(assert (=> b!1052449 m!972839))

(declare-fun m!972849 () Bool)

(assert (=> b!1052445 m!972849))

(declare-fun m!972851 () Bool)

(assert (=> start!92528 m!972851))

(declare-fun m!972853 () Bool)

(assert (=> b!1052446 m!972853))

(check-sat (not b!1052446) (not b!1052449) (not b!1052456) (not b!1052445) (not b!1052454) (not b!1052451) (not start!92528) (not b!1052452) (not b!1052450) (not b!1052447))
(check-sat)
