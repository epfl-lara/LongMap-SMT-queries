; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131772 () Bool)

(assert start!131772)

(declare-fun b!1542547 () Bool)

(declare-fun e!858097 () Bool)

(declare-fun e!858099 () Bool)

(assert (=> b!1542547 (= e!858097 e!858099)))

(declare-fun res!1057669 () Bool)

(assert (=> b!1542547 (=> (not res!1057669) (not e!858099))))

(declare-datatypes ((SeekEntryResult!13438 0))(
  ( (MissingZero!13438 (index!56147 (_ BitVec 32))) (Found!13438 (index!56148 (_ BitVec 32))) (Intermediate!13438 (undefined!14250 Bool) (index!56149 (_ BitVec 32)) (x!138094 (_ BitVec 32))) (Undefined!13438) (MissingVacant!13438 (index!56150 (_ BitVec 32))) )
))
(declare-fun lt!666137 () SeekEntryResult!13438)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102428 0))(
  ( (array!102429 (arr!49417 (Array (_ BitVec 32) (_ BitVec 64))) (size!49968 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102428)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102428 (_ BitVec 32)) SeekEntryResult!13438)

(assert (=> b!1542547 (= res!1057669 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49417 a!2792) j!64) a!2792 mask!2480) lt!666137))))

(assert (=> b!1542547 (= lt!666137 (Found!13438 j!64))))

(declare-fun b!1542548 () Bool)

(declare-fun res!1057668 () Bool)

(assert (=> b!1542548 (=> (not res!1057668) (not e!858099))))

(assert (=> b!1542548 (= res!1057668 (not (= (select (arr!49417 a!2792) index!463) (select (arr!49417 a!2792) j!64))))))

(declare-fun b!1542549 () Bool)

(declare-fun res!1057667 () Bool)

(assert (=> b!1542549 (=> (not res!1057667) (not e!858097))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542549 (= res!1057667 (validKeyInArray!0 (select (arr!49417 a!2792) i!951)))))

(declare-fun b!1542550 () Bool)

(declare-fun res!1057661 () Bool)

(assert (=> b!1542550 (=> (not res!1057661) (not e!858097))))

(declare-datatypes ((List!35878 0))(
  ( (Nil!35875) (Cons!35874 (h!37337 (_ BitVec 64)) (t!50564 List!35878)) )
))
(declare-fun arrayNoDuplicates!0 (array!102428 (_ BitVec 32) List!35878) Bool)

(assert (=> b!1542550 (= res!1057661 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35875))))

(declare-fun b!1542551 () Bool)

(declare-fun e!858100 () Bool)

(assert (=> b!1542551 (= e!858099 e!858100)))

(declare-fun res!1057663 () Bool)

(assert (=> b!1542551 (=> (not res!1057663) (not e!858100))))

(declare-fun lt!666135 () (_ BitVec 32))

(assert (=> b!1542551 (= res!1057663 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666135 #b00000000000000000000000000000000) (bvslt lt!666135 (size!49968 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542551 (= lt!666135 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542552 () Bool)

(declare-fun e!858098 () Bool)

(assert (=> b!1542552 (= e!858098 (not true))))

(declare-fun lt!666138 () SeekEntryResult!13438)

(assert (=> b!1542552 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666135 vacantIndex!5 (select (store (arr!49417 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102429 (store (arr!49417 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49968 a!2792)) mask!2480) lt!666138)))

(declare-datatypes ((Unit!51349 0))(
  ( (Unit!51350) )
))
(declare-fun lt!666136 () Unit!51349)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51349)

(assert (=> b!1542552 (= lt!666136 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666135 vacantIndex!5 mask!2480))))

(declare-fun b!1542553 () Bool)

(declare-fun res!1057671 () Bool)

(assert (=> b!1542553 (=> (not res!1057671) (not e!858097))))

(assert (=> b!1542553 (= res!1057671 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49968 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49968 a!2792)) (= (select (arr!49417 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542554 () Bool)

(declare-fun res!1057662 () Bool)

(assert (=> b!1542554 (=> (not res!1057662) (not e!858097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102428 (_ BitVec 32)) Bool)

(assert (=> b!1542554 (= res!1057662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542555 () Bool)

(assert (=> b!1542555 (= e!858100 e!858098)))

(declare-fun res!1057670 () Bool)

(assert (=> b!1542555 (=> (not res!1057670) (not e!858098))))

(assert (=> b!1542555 (= res!1057670 (= lt!666138 lt!666137))))

(assert (=> b!1542555 (= lt!666138 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666135 vacantIndex!5 (select (arr!49417 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1542557 () Bool)

(declare-fun res!1057665 () Bool)

(assert (=> b!1542557 (=> (not res!1057665) (not e!858097))))

(assert (=> b!1542557 (= res!1057665 (and (= (size!49968 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49968 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49968 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542556 () Bool)

(declare-fun res!1057666 () Bool)

(assert (=> b!1542556 (=> (not res!1057666) (not e!858097))))

(assert (=> b!1542556 (= res!1057666 (validKeyInArray!0 (select (arr!49417 a!2792) j!64)))))

(declare-fun res!1057664 () Bool)

(assert (=> start!131772 (=> (not res!1057664) (not e!858097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131772 (= res!1057664 (validMask!0 mask!2480))))

(assert (=> start!131772 e!858097))

(assert (=> start!131772 true))

(declare-fun array_inv!38698 (array!102428) Bool)

(assert (=> start!131772 (array_inv!38698 a!2792)))

(assert (= (and start!131772 res!1057664) b!1542557))

(assert (= (and b!1542557 res!1057665) b!1542549))

(assert (= (and b!1542549 res!1057667) b!1542556))

(assert (= (and b!1542556 res!1057666) b!1542554))

(assert (= (and b!1542554 res!1057662) b!1542550))

(assert (= (and b!1542550 res!1057661) b!1542553))

(assert (= (and b!1542553 res!1057671) b!1542547))

(assert (= (and b!1542547 res!1057669) b!1542548))

(assert (= (and b!1542548 res!1057668) b!1542551))

(assert (= (and b!1542551 res!1057663) b!1542555))

(assert (= (and b!1542555 res!1057670) b!1542552))

(declare-fun m!1424465 () Bool)

(assert (=> b!1542549 m!1424465))

(assert (=> b!1542549 m!1424465))

(declare-fun m!1424467 () Bool)

(assert (=> b!1542549 m!1424467))

(declare-fun m!1424469 () Bool)

(assert (=> b!1542547 m!1424469))

(assert (=> b!1542547 m!1424469))

(declare-fun m!1424471 () Bool)

(assert (=> b!1542547 m!1424471))

(declare-fun m!1424473 () Bool)

(assert (=> b!1542550 m!1424473))

(declare-fun m!1424475 () Bool)

(assert (=> start!131772 m!1424475))

(declare-fun m!1424477 () Bool)

(assert (=> start!131772 m!1424477))

(assert (=> b!1542556 m!1424469))

(assert (=> b!1542556 m!1424469))

(declare-fun m!1424479 () Bool)

(assert (=> b!1542556 m!1424479))

(declare-fun m!1424481 () Bool)

(assert (=> b!1542551 m!1424481))

(declare-fun m!1424483 () Bool)

(assert (=> b!1542548 m!1424483))

(assert (=> b!1542548 m!1424469))

(declare-fun m!1424485 () Bool)

(assert (=> b!1542552 m!1424485))

(declare-fun m!1424487 () Bool)

(assert (=> b!1542552 m!1424487))

(assert (=> b!1542552 m!1424487))

(declare-fun m!1424489 () Bool)

(assert (=> b!1542552 m!1424489))

(declare-fun m!1424491 () Bool)

(assert (=> b!1542552 m!1424491))

(assert (=> b!1542555 m!1424469))

(assert (=> b!1542555 m!1424469))

(declare-fun m!1424493 () Bool)

(assert (=> b!1542555 m!1424493))

(declare-fun m!1424495 () Bool)

(assert (=> b!1542553 m!1424495))

(declare-fun m!1424497 () Bool)

(assert (=> b!1542554 m!1424497))

(check-sat (not b!1542552) (not b!1542551) (not b!1542556) (not b!1542550) (not start!131772) (not b!1542547) (not b!1542554) (not b!1542555) (not b!1542549))
(check-sat)
