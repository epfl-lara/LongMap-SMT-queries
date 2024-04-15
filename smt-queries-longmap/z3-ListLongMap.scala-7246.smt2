; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92536 () Bool)

(assert start!92536)

(declare-fun b!1052441 () Bool)

(declare-fun res!701655 () Bool)

(declare-fun e!597549 () Bool)

(assert (=> b!1052441 (=> (not res!701655) (not e!597549))))

(declare-datatypes ((array!66278 0))(
  ( (array!66279 (arr!31878 (Array (_ BitVec 32) (_ BitVec 64))) (size!32416 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66278)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052441 (= res!701655 (= (select (arr!31878 a!3488) i!1381) k0!2747))))

(declare-fun b!1052442 () Bool)

(declare-fun res!701654 () Bool)

(assert (=> b!1052442 (=> (not res!701654) (not e!597549))))

(declare-datatypes ((List!22249 0))(
  ( (Nil!22246) (Cons!22245 (h!23454 (_ BitVec 64)) (t!31547 List!22249)) )
))
(declare-fun arrayNoDuplicates!0 (array!66278 (_ BitVec 32) List!22249) Bool)

(assert (=> b!1052442 (= res!701654 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22246))))

(declare-fun b!1052443 () Bool)

(declare-fun res!701658 () Bool)

(assert (=> b!1052443 (=> (not res!701658) (not e!597549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052443 (= res!701658 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052444 () Bool)

(declare-fun e!597550 () Bool)

(declare-fun e!597552 () Bool)

(assert (=> b!1052444 (= e!597550 e!597552)))

(declare-fun res!701652 () Bool)

(assert (=> b!1052444 (=> res!701652 e!597552)))

(declare-fun lt!464652 () (_ BitVec 32))

(assert (=> b!1052444 (= res!701652 (or (bvsgt lt!464652 i!1381) (bvsle i!1381 lt!464652)))))

(declare-fun b!1052445 () Bool)

(declare-fun arrayContainsKey!0 (array!66278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052445 (= e!597552 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!701656 () Bool)

(assert (=> start!92536 (=> (not res!701656) (not e!597549))))

(assert (=> start!92536 (= res!701656 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32416 a!3488)) (bvslt (size!32416 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92536 e!597549))

(assert (=> start!92536 true))

(declare-fun array_inv!24661 (array!66278) Bool)

(assert (=> start!92536 (array_inv!24661 a!3488)))

(declare-fun b!1052446 () Bool)

(declare-fun e!597548 () Bool)

(declare-fun e!597546 () Bool)

(assert (=> b!1052446 (= e!597548 (not e!597546))))

(declare-fun res!701657 () Bool)

(assert (=> b!1052446 (=> res!701657 e!597546)))

(assert (=> b!1052446 (= res!701657 (or (bvsgt lt!464652 i!1381) (bvsle i!1381 lt!464652)))))

(assert (=> b!1052446 e!597550))

(declare-fun res!701651 () Bool)

(assert (=> b!1052446 (=> (not res!701651) (not e!597550))))

(assert (=> b!1052446 (= res!701651 (= (select (store (arr!31878 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464652) k0!2747))))

(declare-fun b!1052447 () Bool)

(declare-fun e!597551 () Bool)

(assert (=> b!1052447 (= e!597549 e!597551)))

(declare-fun res!701659 () Bool)

(assert (=> b!1052447 (=> (not res!701659) (not e!597551))))

(declare-fun lt!464653 () array!66278)

(assert (=> b!1052447 (= res!701659 (arrayContainsKey!0 lt!464653 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052447 (= lt!464653 (array!66279 (store (arr!31878 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32416 a!3488)))))

(declare-fun b!1052448 () Bool)

(assert (=> b!1052448 (= e!597551 e!597548)))

(declare-fun res!701653 () Bool)

(assert (=> b!1052448 (=> (not res!701653) (not e!597548))))

(assert (=> b!1052448 (= res!701653 (not (= lt!464652 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66278 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052448 (= lt!464652 (arrayScanForKey!0 lt!464653 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052449 () Bool)

(assert (=> b!1052449 (= e!597546 true)))

(assert (=> b!1052449 (not (= (select (arr!31878 a!3488) lt!464652) k0!2747))))

(declare-datatypes ((Unit!34361 0))(
  ( (Unit!34362) )
))
(declare-fun lt!464654 () Unit!34361)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66278 (_ BitVec 64) (_ BitVec 32) List!22249) Unit!34361)

(assert (=> b!1052449 (= lt!464654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464652 Nil!22246))))

(declare-fun lt!464651 () (_ BitVec 32))

(assert (=> b!1052449 (arrayContainsKey!0 a!3488 k0!2747 lt!464651)))

(declare-fun lt!464656 () Unit!34361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34361)

(assert (=> b!1052449 (= lt!464656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464651))))

(assert (=> b!1052449 (= lt!464651 (bvadd #b00000000000000000000000000000001 lt!464652))))

(assert (=> b!1052449 (arrayNoDuplicates!0 a!3488 lt!464652 Nil!22246)))

(declare-fun lt!464655 () Unit!34361)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66278 (_ BitVec 32) (_ BitVec 32)) Unit!34361)

(assert (=> b!1052449 (= lt!464655 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464652))))

(assert (= (and start!92536 res!701656) b!1052442))

(assert (= (and b!1052442 res!701654) b!1052443))

(assert (= (and b!1052443 res!701658) b!1052441))

(assert (= (and b!1052441 res!701655) b!1052447))

(assert (= (and b!1052447 res!701659) b!1052448))

(assert (= (and b!1052448 res!701653) b!1052446))

(assert (= (and b!1052446 res!701651) b!1052444))

(assert (= (and b!1052444 (not res!701652)) b!1052445))

(assert (= (and b!1052446 (not res!701657)) b!1052449))

(declare-fun m!972361 () Bool)

(assert (=> b!1052448 m!972361))

(declare-fun m!972363 () Bool)

(assert (=> b!1052445 m!972363))

(declare-fun m!972365 () Bool)

(assert (=> start!92536 m!972365))

(declare-fun m!972367 () Bool)

(assert (=> b!1052441 m!972367))

(declare-fun m!972369 () Bool)

(assert (=> b!1052446 m!972369))

(declare-fun m!972371 () Bool)

(assert (=> b!1052446 m!972371))

(declare-fun m!972373 () Bool)

(assert (=> b!1052447 m!972373))

(assert (=> b!1052447 m!972369))

(declare-fun m!972375 () Bool)

(assert (=> b!1052443 m!972375))

(declare-fun m!972377 () Bool)

(assert (=> b!1052449 m!972377))

(declare-fun m!972379 () Bool)

(assert (=> b!1052449 m!972379))

(declare-fun m!972381 () Bool)

(assert (=> b!1052449 m!972381))

(declare-fun m!972383 () Bool)

(assert (=> b!1052449 m!972383))

(declare-fun m!972385 () Bool)

(assert (=> b!1052449 m!972385))

(declare-fun m!972387 () Bool)

(assert (=> b!1052449 m!972387))

(declare-fun m!972389 () Bool)

(assert (=> b!1052442 m!972389))

(check-sat (not b!1052447) (not b!1052448) (not start!92536) (not b!1052443) (not b!1052449) (not b!1052445) (not b!1052442))
(check-sat)
