; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92846 () Bool)

(assert start!92846)

(declare-fun b!1054392 () Bool)

(declare-fun e!599020 () Bool)

(declare-fun e!599019 () Bool)

(assert (=> b!1054392 (= e!599020 e!599019)))

(declare-fun res!703337 () Bool)

(assert (=> b!1054392 (=> res!703337 e!599019)))

(declare-fun lt!465394 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054392 (= res!703337 (bvsle lt!465394 i!1381))))

(declare-fun res!703336 () Bool)

(declare-fun e!599017 () Bool)

(assert (=> start!92846 (=> (not res!703336) (not e!599017))))

(declare-datatypes ((array!66506 0))(
  ( (array!66507 (arr!31985 (Array (_ BitVec 32) (_ BitVec 64))) (size!32521 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66506)

(assert (=> start!92846 (= res!703336 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32521 a!3488)) (bvslt (size!32521 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92846 e!599017))

(assert (=> start!92846 true))

(declare-fun array_inv!24765 (array!66506) Bool)

(assert (=> start!92846 (array_inv!24765 a!3488)))

(declare-fun b!1054393 () Bool)

(declare-fun res!703338 () Bool)

(assert (=> b!1054393 (=> (not res!703338) (not e!599017))))

(declare-datatypes ((List!22297 0))(
  ( (Nil!22294) (Cons!22293 (h!23502 (_ BitVec 64)) (t!31604 List!22297)) )
))
(declare-fun arrayNoDuplicates!0 (array!66506 (_ BitVec 32) List!22297) Bool)

(assert (=> b!1054393 (= res!703338 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22294))))

(declare-fun b!1054394 () Bool)

(declare-fun e!599015 () Bool)

(declare-fun e!599016 () Bool)

(assert (=> b!1054394 (= e!599015 (not e!599016))))

(declare-fun res!703339 () Bool)

(assert (=> b!1054394 (=> res!703339 e!599016)))

(assert (=> b!1054394 (= res!703339 (bvsle lt!465394 i!1381))))

(assert (=> b!1054394 e!599020))

(declare-fun res!703335 () Bool)

(assert (=> b!1054394 (=> (not res!703335) (not e!599020))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1054394 (= res!703335 (= (select (store (arr!31985 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465394) k0!2747))))

(declare-fun b!1054395 () Bool)

(declare-fun arrayContainsKey!0 (array!66506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054395 (= e!599019 (arrayContainsKey!0 a!3488 k0!2747 lt!465394))))

(declare-fun b!1054396 () Bool)

(declare-fun e!599018 () Bool)

(assert (=> b!1054396 (= e!599018 e!599015)))

(declare-fun res!703333 () Bool)

(assert (=> b!1054396 (=> (not res!703333) (not e!599015))))

(assert (=> b!1054396 (= res!703333 (not (= lt!465394 i!1381)))))

(declare-fun lt!465395 () array!66506)

(declare-fun arrayScanForKey!0 (array!66506 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054396 (= lt!465394 (arrayScanForKey!0 lt!465395 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054397 () Bool)

(declare-fun res!703334 () Bool)

(assert (=> b!1054397 (=> (not res!703334) (not e!599017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054397 (= res!703334 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054398 () Bool)

(assert (=> b!1054398 (= e!599017 e!599018)))

(declare-fun res!703340 () Bool)

(assert (=> b!1054398 (=> (not res!703340) (not e!599018))))

(assert (=> b!1054398 (= res!703340 (arrayContainsKey!0 lt!465395 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054398 (= lt!465395 (array!66507 (store (arr!31985 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32521 a!3488)))))

(declare-fun b!1054399 () Bool)

(declare-fun res!703332 () Bool)

(assert (=> b!1054399 (=> (not res!703332) (not e!599017))))

(assert (=> b!1054399 (= res!703332 (= (select (arr!31985 a!3488) i!1381) k0!2747))))

(declare-fun b!1054400 () Bool)

(assert (=> b!1054400 (= e!599016 true)))

(assert (=> b!1054400 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22294)))

(declare-datatypes ((Unit!34528 0))(
  ( (Unit!34529) )
))
(declare-fun lt!465396 () Unit!34528)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66506 (_ BitVec 32) (_ BitVec 32)) Unit!34528)

(assert (=> b!1054400 (= lt!465396 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92846 res!703336) b!1054393))

(assert (= (and b!1054393 res!703338) b!1054397))

(assert (= (and b!1054397 res!703334) b!1054399))

(assert (= (and b!1054399 res!703332) b!1054398))

(assert (= (and b!1054398 res!703340) b!1054396))

(assert (= (and b!1054396 res!703333) b!1054394))

(assert (= (and b!1054394 res!703335) b!1054392))

(assert (= (and b!1054392 (not res!703337)) b!1054395))

(assert (= (and b!1054394 (not res!703339)) b!1054400))

(declare-fun m!974469 () Bool)

(assert (=> start!92846 m!974469))

(declare-fun m!974471 () Bool)

(assert (=> b!1054399 m!974471))

(declare-fun m!974473 () Bool)

(assert (=> b!1054396 m!974473))

(declare-fun m!974475 () Bool)

(assert (=> b!1054397 m!974475))

(declare-fun m!974477 () Bool)

(assert (=> b!1054400 m!974477))

(declare-fun m!974479 () Bool)

(assert (=> b!1054400 m!974479))

(declare-fun m!974481 () Bool)

(assert (=> b!1054398 m!974481))

(declare-fun m!974483 () Bool)

(assert (=> b!1054398 m!974483))

(declare-fun m!974485 () Bool)

(assert (=> b!1054393 m!974485))

(declare-fun m!974487 () Bool)

(assert (=> b!1054395 m!974487))

(assert (=> b!1054394 m!974483))

(declare-fun m!974489 () Bool)

(assert (=> b!1054394 m!974489))

(check-sat (not b!1054393) (not b!1054395) (not b!1054396) (not b!1054400) (not b!1054397) (not start!92846) (not b!1054398))
(check-sat)
