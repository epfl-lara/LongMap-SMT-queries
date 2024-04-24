; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92682 () Bool)

(assert start!92682)

(declare-fun b!1052449 () Bool)

(declare-fun e!597460 () Bool)

(declare-fun e!597459 () Bool)

(assert (=> b!1052449 (= e!597460 e!597459)))

(declare-fun res!700777 () Bool)

(assert (=> b!1052449 (=> res!700777 e!597459)))

(declare-fun lt!464687 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052449 (= res!700777 (or (bvsgt lt!464687 i!1381) (bvsle i!1381 lt!464687)))))

(declare-fun b!1052450 () Bool)

(declare-fun res!700772 () Bool)

(declare-fun e!597458 () Bool)

(assert (=> b!1052450 (=> (not res!700772) (not e!597458))))

(declare-datatypes ((array!66298 0))(
  ( (array!66299 (arr!31882 (Array (_ BitVec 32) (_ BitVec 64))) (size!32419 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66298)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052450 (= res!700772 (= (select (arr!31882 a!3488) i!1381) k0!2747))))

(declare-fun b!1052451 () Bool)

(declare-fun e!597457 () Bool)

(assert (=> b!1052451 (= e!597458 e!597457)))

(declare-fun res!700775 () Bool)

(assert (=> b!1052451 (=> (not res!700775) (not e!597457))))

(declare-fun lt!464685 () array!66298)

(declare-fun arrayContainsKey!0 (array!66298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052451 (= res!700775 (arrayContainsKey!0 lt!464685 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052451 (= lt!464685 (array!66299 (store (arr!31882 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32419 a!3488)))))

(declare-fun b!1052452 () Bool)

(declare-fun e!597455 () Bool)

(assert (=> b!1052452 (= e!597457 e!597455)))

(declare-fun res!700773 () Bool)

(assert (=> b!1052452 (=> (not res!700773) (not e!597455))))

(assert (=> b!1052452 (= res!700773 (not (= lt!464687 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66298 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052452 (= lt!464687 (arrayScanForKey!0 lt!464685 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700774 () Bool)

(assert (=> start!92682 (=> (not res!700774) (not e!597458))))

(assert (=> start!92682 (= res!700774 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32419 a!3488)) (bvslt (size!32419 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92682 e!597458))

(assert (=> start!92682 true))

(declare-fun array_inv!24664 (array!66298) Bool)

(assert (=> start!92682 (array_inv!24664 a!3488)))

(declare-fun b!1052453 () Bool)

(declare-fun res!700776 () Bool)

(assert (=> b!1052453 (=> (not res!700776) (not e!597458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052453 (= res!700776 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052454 () Bool)

(assert (=> b!1052454 (= e!597459 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052455 () Bool)

(declare-fun res!700770 () Bool)

(assert (=> b!1052455 (=> (not res!700770) (not e!597458))))

(declare-datatypes ((List!22164 0))(
  ( (Nil!22161) (Cons!22160 (h!23378 (_ BitVec 64)) (t!31463 List!22164)) )
))
(declare-fun arrayNoDuplicates!0 (array!66298 (_ BitVec 32) List!22164) Bool)

(assert (=> b!1052455 (= res!700770 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22161))))

(declare-fun b!1052456 () Bool)

(declare-fun e!597456 () Bool)

(assert (=> b!1052456 (= e!597456 true)))

(assert (=> b!1052456 (arrayNoDuplicates!0 a!3488 lt!464687 Nil!22161)))

(declare-datatypes ((Unit!34405 0))(
  ( (Unit!34406) )
))
(declare-fun lt!464686 () Unit!34405)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66298 (_ BitVec 32) (_ BitVec 32)) Unit!34405)

(assert (=> b!1052456 (= lt!464686 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464687))))

(declare-fun b!1052457 () Bool)

(assert (=> b!1052457 (= e!597455 (not e!597456))))

(declare-fun res!700778 () Bool)

(assert (=> b!1052457 (=> res!700778 e!597456)))

(assert (=> b!1052457 (= res!700778 (or (bvsgt lt!464687 i!1381) (bvsle i!1381 lt!464687)))))

(assert (=> b!1052457 e!597460))

(declare-fun res!700771 () Bool)

(assert (=> b!1052457 (=> (not res!700771) (not e!597460))))

(assert (=> b!1052457 (= res!700771 (= (select (store (arr!31882 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464687) k0!2747))))

(assert (= (and start!92682 res!700774) b!1052455))

(assert (= (and b!1052455 res!700770) b!1052453))

(assert (= (and b!1052453 res!700776) b!1052450))

(assert (= (and b!1052450 res!700772) b!1052451))

(assert (= (and b!1052451 res!700775) b!1052452))

(assert (= (and b!1052452 res!700773) b!1052457))

(assert (= (and b!1052457 res!700771) b!1052449))

(assert (= (and b!1052449 (not res!700777)) b!1052454))

(assert (= (and b!1052457 (not res!700778)) b!1052456))

(declare-fun m!973361 () Bool)

(assert (=> b!1052452 m!973361))

(declare-fun m!973363 () Bool)

(assert (=> b!1052457 m!973363))

(declare-fun m!973365 () Bool)

(assert (=> b!1052457 m!973365))

(declare-fun m!973367 () Bool)

(assert (=> b!1052453 m!973367))

(declare-fun m!973369 () Bool)

(assert (=> b!1052456 m!973369))

(declare-fun m!973371 () Bool)

(assert (=> b!1052456 m!973371))

(declare-fun m!973373 () Bool)

(assert (=> b!1052450 m!973373))

(declare-fun m!973375 () Bool)

(assert (=> start!92682 m!973375))

(declare-fun m!973377 () Bool)

(assert (=> b!1052451 m!973377))

(assert (=> b!1052451 m!973363))

(declare-fun m!973379 () Bool)

(assert (=> b!1052455 m!973379))

(declare-fun m!973381 () Bool)

(assert (=> b!1052454 m!973381))

(check-sat (not b!1052455) (not start!92682) (not b!1052451) (not b!1052454) (not b!1052453) (not b!1052456) (not b!1052452))
(check-sat)
