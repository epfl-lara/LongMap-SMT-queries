; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92542 () Bool)

(assert start!92542)

(declare-fun b!1052523 () Bool)

(declare-fun e!597611 () Bool)

(declare-fun e!597615 () Bool)

(assert (=> b!1052523 (= e!597611 e!597615)))

(declare-fun res!701739 () Bool)

(assert (=> b!1052523 (=> (not res!701739) (not e!597615))))

(declare-datatypes ((array!66284 0))(
  ( (array!66285 (arr!31881 (Array (_ BitVec 32) (_ BitVec 64))) (size!32419 (_ BitVec 32))) )
))
(declare-fun lt!464709 () array!66284)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052523 (= res!701739 (arrayContainsKey!0 lt!464709 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66284)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052523 (= lt!464709 (array!66285 (store (arr!31881 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32419 a!3488)))))

(declare-fun b!1052524 () Bool)

(declare-fun res!701738 () Bool)

(assert (=> b!1052524 (=> (not res!701738) (not e!597611))))

(declare-datatypes ((List!22252 0))(
  ( (Nil!22249) (Cons!22248 (h!23457 (_ BitVec 64)) (t!31550 List!22252)) )
))
(declare-fun arrayNoDuplicates!0 (array!66284 (_ BitVec 32) List!22252) Bool)

(assert (=> b!1052524 (= res!701738 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22249))))

(declare-fun b!1052525 () Bool)

(declare-fun res!701737 () Bool)

(assert (=> b!1052525 (=> (not res!701737) (not e!597611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052525 (= res!701737 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052526 () Bool)

(declare-fun e!597612 () Bool)

(assert (=> b!1052526 (= e!597612 true)))

(declare-fun lt!464710 () (_ BitVec 32))

(assert (=> b!1052526 (not (= (select (arr!31881 a!3488) lt!464710) k0!2747))))

(declare-datatypes ((Unit!34367 0))(
  ( (Unit!34368) )
))
(declare-fun lt!464708 () Unit!34367)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66284 (_ BitVec 64) (_ BitVec 32) List!22252) Unit!34367)

(assert (=> b!1052526 (= lt!464708 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464710 Nil!22249))))

(declare-fun lt!464705 () (_ BitVec 32))

(assert (=> b!1052526 (arrayContainsKey!0 a!3488 k0!2747 lt!464705)))

(declare-fun lt!464707 () Unit!34367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34367)

(assert (=> b!1052526 (= lt!464707 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464705))))

(assert (=> b!1052526 (= lt!464705 (bvadd #b00000000000000000000000000000001 lt!464710))))

(assert (=> b!1052526 (arrayNoDuplicates!0 a!3488 lt!464710 Nil!22249)))

(declare-fun lt!464706 () Unit!34367)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66284 (_ BitVec 32) (_ BitVec 32)) Unit!34367)

(assert (=> b!1052526 (= lt!464706 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464710))))

(declare-fun b!1052527 () Bool)

(declare-fun e!597609 () Bool)

(assert (=> b!1052527 (= e!597615 e!597609)))

(declare-fun res!701733 () Bool)

(assert (=> b!1052527 (=> (not res!701733) (not e!597609))))

(assert (=> b!1052527 (= res!701733 (not (= lt!464710 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66284 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052527 (= lt!464710 (arrayScanForKey!0 lt!464709 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052528 () Bool)

(declare-fun e!597610 () Bool)

(declare-fun e!597614 () Bool)

(assert (=> b!1052528 (= e!597610 e!597614)))

(declare-fun res!701734 () Bool)

(assert (=> b!1052528 (=> res!701734 e!597614)))

(assert (=> b!1052528 (= res!701734 (or (bvsgt lt!464710 i!1381) (bvsle i!1381 lt!464710)))))

(declare-fun res!701740 () Bool)

(assert (=> start!92542 (=> (not res!701740) (not e!597611))))

(assert (=> start!92542 (= res!701740 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32419 a!3488)) (bvslt (size!32419 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92542 e!597611))

(assert (=> start!92542 true))

(declare-fun array_inv!24664 (array!66284) Bool)

(assert (=> start!92542 (array_inv!24664 a!3488)))

(declare-fun b!1052522 () Bool)

(assert (=> b!1052522 (= e!597609 (not e!597612))))

(declare-fun res!701736 () Bool)

(assert (=> b!1052522 (=> res!701736 e!597612)))

(assert (=> b!1052522 (= res!701736 (or (bvsgt lt!464710 i!1381) (bvsle i!1381 lt!464710)))))

(assert (=> b!1052522 e!597610))

(declare-fun res!701732 () Bool)

(assert (=> b!1052522 (=> (not res!701732) (not e!597610))))

(assert (=> b!1052522 (= res!701732 (= (select (store (arr!31881 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464710) k0!2747))))

(declare-fun b!1052529 () Bool)

(assert (=> b!1052529 (= e!597614 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052530 () Bool)

(declare-fun res!701735 () Bool)

(assert (=> b!1052530 (=> (not res!701735) (not e!597611))))

(assert (=> b!1052530 (= res!701735 (= (select (arr!31881 a!3488) i!1381) k0!2747))))

(assert (= (and start!92542 res!701740) b!1052524))

(assert (= (and b!1052524 res!701738) b!1052525))

(assert (= (and b!1052525 res!701737) b!1052530))

(assert (= (and b!1052530 res!701735) b!1052523))

(assert (= (and b!1052523 res!701739) b!1052527))

(assert (= (and b!1052527 res!701733) b!1052522))

(assert (= (and b!1052522 res!701732) b!1052528))

(assert (= (and b!1052528 (not res!701734)) b!1052529))

(assert (= (and b!1052522 (not res!701736)) b!1052526))

(declare-fun m!972451 () Bool)

(assert (=> b!1052522 m!972451))

(declare-fun m!972453 () Bool)

(assert (=> b!1052522 m!972453))

(declare-fun m!972455 () Bool)

(assert (=> start!92542 m!972455))

(declare-fun m!972457 () Bool)

(assert (=> b!1052524 m!972457))

(declare-fun m!972459 () Bool)

(assert (=> b!1052527 m!972459))

(declare-fun m!972461 () Bool)

(assert (=> b!1052530 m!972461))

(declare-fun m!972463 () Bool)

(assert (=> b!1052525 m!972463))

(declare-fun m!972465 () Bool)

(assert (=> b!1052529 m!972465))

(declare-fun m!972467 () Bool)

(assert (=> b!1052523 m!972467))

(assert (=> b!1052523 m!972451))

(declare-fun m!972469 () Bool)

(assert (=> b!1052526 m!972469))

(declare-fun m!972471 () Bool)

(assert (=> b!1052526 m!972471))

(declare-fun m!972473 () Bool)

(assert (=> b!1052526 m!972473))

(declare-fun m!972475 () Bool)

(assert (=> b!1052526 m!972475))

(declare-fun m!972477 () Bool)

(assert (=> b!1052526 m!972477))

(declare-fun m!972479 () Bool)

(assert (=> b!1052526 m!972479))

(check-sat (not b!1052527) (not b!1052529) (not b!1052524) (not start!92542) (not b!1052525) (not b!1052526) (not b!1052523))
(check-sat)
