; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92504 () Bool)

(assert start!92504)

(declare-fun b!1052013 () Bool)

(declare-fun e!597245 () Bool)

(declare-fun e!597247 () Bool)

(assert (=> b!1052013 (= e!597245 e!597247)))

(declare-fun res!701142 () Bool)

(assert (=> b!1052013 (=> res!701142 e!597247)))

(declare-fun lt!464550 () (_ BitVec 32))

(declare-datatypes ((array!66305 0))(
  ( (array!66306 (arr!31892 (Array (_ BitVec 32) (_ BitVec 64))) (size!32428 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66305)

(declare-fun lt!464546 () (_ BitVec 32))

(assert (=> b!1052013 (= res!701142 (or (bvslt lt!464550 #b00000000000000000000000000000000) (bvsge lt!464546 (size!32428 a!3488)) (bvsge lt!464550 (size!32428 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052013 (arrayContainsKey!0 a!3488 k0!2747 lt!464546)))

(declare-datatypes ((Unit!34456 0))(
  ( (Unit!34457) )
))
(declare-fun lt!464548 () Unit!34456)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34456)

(assert (=> b!1052013 (= lt!464548 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464546))))

(assert (=> b!1052013 (= lt!464546 (bvadd #b00000000000000000000000000000001 lt!464550))))

(declare-datatypes ((List!22204 0))(
  ( (Nil!22201) (Cons!22200 (h!23409 (_ BitVec 64)) (t!31511 List!22204)) )
))
(declare-fun arrayNoDuplicates!0 (array!66305 (_ BitVec 32) List!22204) Bool)

(assert (=> b!1052013 (arrayNoDuplicates!0 a!3488 lt!464550 Nil!22201)))

(declare-fun lt!464545 () Unit!34456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66305 (_ BitVec 32) (_ BitVec 32)) Unit!34456)

(assert (=> b!1052013 (= lt!464545 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464550))))

(declare-fun b!1052014 () Bool)

(declare-fun e!597241 () Bool)

(assert (=> b!1052014 (= e!597241 (not e!597245))))

(declare-fun res!701144 () Bool)

(assert (=> b!1052014 (=> res!701144 e!597245)))

(assert (=> b!1052014 (= res!701144 (or (bvsgt lt!464550 i!1381) (bvsle i!1381 lt!464550)))))

(declare-fun e!597242 () Bool)

(assert (=> b!1052014 e!597242))

(declare-fun res!701143 () Bool)

(assert (=> b!1052014 (=> (not res!701143) (not e!597242))))

(assert (=> b!1052014 (= res!701143 (= (select (store (arr!31892 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464550) k0!2747))))

(declare-fun b!1052015 () Bool)

(declare-fun e!597244 () Bool)

(assert (=> b!1052015 (= e!597242 e!597244)))

(declare-fun res!701139 () Bool)

(assert (=> b!1052015 (=> res!701139 e!597244)))

(assert (=> b!1052015 (= res!701139 (or (bvsgt lt!464550 i!1381) (bvsle i!1381 lt!464550)))))

(declare-fun b!1052016 () Bool)

(declare-fun res!701145 () Bool)

(declare-fun e!597246 () Bool)

(assert (=> b!1052016 (=> (not res!701145) (not e!597246))))

(assert (=> b!1052016 (= res!701145 (= (select (arr!31892 a!3488) i!1381) k0!2747))))

(declare-fun res!701149 () Bool)

(assert (=> start!92504 (=> (not res!701149) (not e!597246))))

(assert (=> start!92504 (= res!701149 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32428 a!3488)) (bvslt (size!32428 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92504 e!597246))

(assert (=> start!92504 true))

(declare-fun array_inv!24672 (array!66305) Bool)

(assert (=> start!92504 (array_inv!24672 a!3488)))

(declare-fun b!1052017 () Bool)

(declare-fun e!597240 () Bool)

(assert (=> b!1052017 (= e!597246 e!597240)))

(declare-fun res!701140 () Bool)

(assert (=> b!1052017 (=> (not res!701140) (not e!597240))))

(declare-fun lt!464547 () array!66305)

(assert (=> b!1052017 (= res!701140 (arrayContainsKey!0 lt!464547 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052017 (= lt!464547 (array!66306 (store (arr!31892 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32428 a!3488)))))

(declare-fun b!1052018 () Bool)

(assert (=> b!1052018 (= e!597240 e!597241)))

(declare-fun res!701148 () Bool)

(assert (=> b!1052018 (=> (not res!701148) (not e!597241))))

(assert (=> b!1052018 (= res!701148 (not (= lt!464550 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66305 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052018 (= lt!464550 (arrayScanForKey!0 lt!464547 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052019 () Bool)

(declare-fun res!701150 () Bool)

(assert (=> b!1052019 (=> (not res!701150) (not e!597246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052019 (= res!701150 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052020 () Bool)

(declare-fun res!701141 () Bool)

(assert (=> b!1052020 (=> res!701141 e!597247)))

(declare-fun contains!6146 (List!22204 (_ BitVec 64)) Bool)

(assert (=> b!1052020 (= res!701141 (contains!6146 Nil!22201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052021 () Bool)

(declare-fun res!701146 () Bool)

(assert (=> b!1052021 (=> (not res!701146) (not e!597246))))

(assert (=> b!1052021 (= res!701146 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22201))))

(declare-fun b!1052022 () Bool)

(assert (=> b!1052022 (= e!597247 true)))

(declare-fun lt!464549 () Bool)

(assert (=> b!1052022 (= lt!464549 (contains!6146 Nil!22201 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052023 () Bool)

(declare-fun res!701147 () Bool)

(assert (=> b!1052023 (=> res!701147 e!597247)))

(declare-fun noDuplicate!1531 (List!22204) Bool)

(assert (=> b!1052023 (= res!701147 (not (noDuplicate!1531 Nil!22201)))))

(declare-fun b!1052024 () Bool)

(assert (=> b!1052024 (= e!597244 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92504 res!701149) b!1052021))

(assert (= (and b!1052021 res!701146) b!1052019))

(assert (= (and b!1052019 res!701150) b!1052016))

(assert (= (and b!1052016 res!701145) b!1052017))

(assert (= (and b!1052017 res!701140) b!1052018))

(assert (= (and b!1052018 res!701148) b!1052014))

(assert (= (and b!1052014 res!701143) b!1052015))

(assert (= (and b!1052015 (not res!701139)) b!1052024))

(assert (= (and b!1052014 (not res!701144)) b!1052013))

(assert (= (and b!1052013 (not res!701142)) b!1052023))

(assert (= (and b!1052023 (not res!701147)) b!1052020))

(assert (= (and b!1052020 (not res!701141)) b!1052022))

(declare-fun m!972439 () Bool)

(assert (=> start!92504 m!972439))

(declare-fun m!972441 () Bool)

(assert (=> b!1052016 m!972441))

(declare-fun m!972443 () Bool)

(assert (=> b!1052022 m!972443))

(declare-fun m!972445 () Bool)

(assert (=> b!1052017 m!972445))

(declare-fun m!972447 () Bool)

(assert (=> b!1052017 m!972447))

(declare-fun m!972449 () Bool)

(assert (=> b!1052020 m!972449))

(declare-fun m!972451 () Bool)

(assert (=> b!1052024 m!972451))

(declare-fun m!972453 () Bool)

(assert (=> b!1052023 m!972453))

(declare-fun m!972455 () Bool)

(assert (=> b!1052019 m!972455))

(assert (=> b!1052014 m!972447))

(declare-fun m!972457 () Bool)

(assert (=> b!1052014 m!972457))

(declare-fun m!972459 () Bool)

(assert (=> b!1052018 m!972459))

(declare-fun m!972461 () Bool)

(assert (=> b!1052021 m!972461))

(declare-fun m!972463 () Bool)

(assert (=> b!1052013 m!972463))

(declare-fun m!972465 () Bool)

(assert (=> b!1052013 m!972465))

(declare-fun m!972467 () Bool)

(assert (=> b!1052013 m!972467))

(declare-fun m!972469 () Bool)

(assert (=> b!1052013 m!972469))

(check-sat (not b!1052021) (not b!1052017) (not b!1052020) (not b!1052019) (not b!1052024) (not b!1052023) (not b!1052018) (not b!1052022) (not b!1052013) (not start!92504))
(check-sat)
