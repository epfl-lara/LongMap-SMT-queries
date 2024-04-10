; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92258 () Bool)

(assert start!92258)

(declare-fun b!1048492 () Bool)

(declare-fun e!594703 () Bool)

(declare-fun e!594706 () Bool)

(assert (=> b!1048492 (= e!594703 e!594706)))

(declare-fun res!697621 () Bool)

(assert (=> b!1048492 (=> (not res!697621) (not e!594706))))

(declare-fun lt!463211 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048492 (= res!697621 (not (= lt!463211 i!1381)))))

(declare-datatypes ((array!66059 0))(
  ( (array!66060 (arr!31769 (Array (_ BitVec 32) (_ BitVec 64))) (size!32305 (_ BitVec 32))) )
))
(declare-fun lt!463212 () array!66059)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66059 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048492 (= lt!463211 (arrayScanForKey!0 lt!463212 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048493 () Bool)

(declare-fun e!594701 () Bool)

(assert (=> b!1048493 (= e!594701 e!594703)))

(declare-fun res!697619 () Bool)

(assert (=> b!1048493 (=> (not res!697619) (not e!594703))))

(declare-fun arrayContainsKey!0 (array!66059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048493 (= res!697619 (arrayContainsKey!0 lt!463212 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66059)

(assert (=> b!1048493 (= lt!463212 (array!66060 (store (arr!31769 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32305 a!3488)))))

(declare-fun b!1048494 () Bool)

(assert (=> b!1048494 (= e!594706 (not true))))

(declare-fun e!594702 () Bool)

(assert (=> b!1048494 e!594702))

(declare-fun res!697618 () Bool)

(assert (=> b!1048494 (=> (not res!697618) (not e!594702))))

(assert (=> b!1048494 (= res!697618 (= (select (store (arr!31769 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463211) k0!2747))))

(declare-fun b!1048495 () Bool)

(declare-fun e!594705 () Bool)

(assert (=> b!1048495 (= e!594702 e!594705)))

(declare-fun res!697625 () Bool)

(assert (=> b!1048495 (=> res!697625 e!594705)))

(assert (=> b!1048495 (= res!697625 (bvsle lt!463211 i!1381))))

(declare-fun b!1048496 () Bool)

(declare-fun res!697623 () Bool)

(assert (=> b!1048496 (=> (not res!697623) (not e!594701))))

(declare-datatypes ((List!22081 0))(
  ( (Nil!22078) (Cons!22077 (h!23286 (_ BitVec 64)) (t!31388 List!22081)) )
))
(declare-fun arrayNoDuplicates!0 (array!66059 (_ BitVec 32) List!22081) Bool)

(assert (=> b!1048496 (= res!697623 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22078))))

(declare-fun b!1048497 () Bool)

(declare-fun res!697620 () Bool)

(assert (=> b!1048497 (=> (not res!697620) (not e!594701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048497 (= res!697620 (validKeyInArray!0 k0!2747))))

(declare-fun res!697622 () Bool)

(assert (=> start!92258 (=> (not res!697622) (not e!594701))))

(assert (=> start!92258 (= res!697622 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32305 a!3488)) (bvslt (size!32305 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92258 e!594701))

(assert (=> start!92258 true))

(declare-fun array_inv!24549 (array!66059) Bool)

(assert (=> start!92258 (array_inv!24549 a!3488)))

(declare-fun b!1048498 () Bool)

(assert (=> b!1048498 (= e!594705 (arrayContainsKey!0 a!3488 k0!2747 lt!463211))))

(declare-fun b!1048499 () Bool)

(declare-fun res!697624 () Bool)

(assert (=> b!1048499 (=> (not res!697624) (not e!594701))))

(assert (=> b!1048499 (= res!697624 (= (select (arr!31769 a!3488) i!1381) k0!2747))))

(assert (= (and start!92258 res!697622) b!1048496))

(assert (= (and b!1048496 res!697623) b!1048497))

(assert (= (and b!1048497 res!697620) b!1048499))

(assert (= (and b!1048499 res!697624) b!1048493))

(assert (= (and b!1048493 res!697619) b!1048492))

(assert (= (and b!1048492 res!697621) b!1048494))

(assert (= (and b!1048494 res!697618) b!1048495))

(assert (= (and b!1048495 (not res!697625)) b!1048498))

(declare-fun m!969449 () Bool)

(assert (=> b!1048493 m!969449))

(declare-fun m!969451 () Bool)

(assert (=> b!1048493 m!969451))

(assert (=> b!1048494 m!969451))

(declare-fun m!969453 () Bool)

(assert (=> b!1048494 m!969453))

(declare-fun m!969455 () Bool)

(assert (=> b!1048496 m!969455))

(declare-fun m!969457 () Bool)

(assert (=> b!1048499 m!969457))

(declare-fun m!969459 () Bool)

(assert (=> b!1048498 m!969459))

(declare-fun m!969461 () Bool)

(assert (=> b!1048497 m!969461))

(declare-fun m!969463 () Bool)

(assert (=> b!1048492 m!969463))

(declare-fun m!969465 () Bool)

(assert (=> start!92258 m!969465))

(check-sat (not b!1048492) (not b!1048496) (not b!1048493) (not b!1048498) (not start!92258) (not b!1048497))
(check-sat)
