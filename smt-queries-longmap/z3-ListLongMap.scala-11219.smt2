; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131364 () Bool)

(assert start!131364)

(declare-fun b!1538471 () Bool)

(declare-fun res!1053987 () Bool)

(declare-fun e!856507 () Bool)

(assert (=> b!1538471 (=> (not res!1053987) (not e!856507))))

(declare-datatypes ((array!102166 0))(
  ( (array!102167 (arr!49291 (Array (_ BitVec 32) (_ BitVec 64))) (size!49842 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102166)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538471 (= res!1053987 (validKeyInArray!0 (select (arr!49291 a!2792) i!951)))))

(declare-fun b!1538472 () Bool)

(declare-fun e!856503 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1538472 (= e!856503 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13318 0))(
  ( (MissingZero!13318 (index!55667 (_ BitVec 32))) (Found!13318 (index!55668 (_ BitVec 32))) (Intermediate!13318 (undefined!14130 Bool) (index!55669 (_ BitVec 32)) (x!137618 (_ BitVec 32))) (Undefined!13318) (MissingVacant!13318 (index!55670 (_ BitVec 32))) )
))
(declare-fun lt!665109 () SeekEntryResult!13318)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665110 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102166 (_ BitVec 32)) SeekEntryResult!13318)

(assert (=> b!1538472 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665110 vacantIndex!5 (select (store (arr!49291 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102167 (store (arr!49291 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49842 a!2792)) mask!2480) lt!665109)))

(declare-datatypes ((Unit!51245 0))(
  ( (Unit!51246) )
))
(declare-fun lt!665111 () Unit!51245)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51245)

(assert (=> b!1538472 (= lt!665111 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665110 vacantIndex!5 mask!2480))))

(declare-fun b!1538473 () Bool)

(declare-fun e!856504 () Bool)

(declare-fun e!856505 () Bool)

(assert (=> b!1538473 (= e!856504 e!856505)))

(declare-fun res!1053980 () Bool)

(assert (=> b!1538473 (=> (not res!1053980) (not e!856505))))

(assert (=> b!1538473 (= res!1053980 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665110 #b00000000000000000000000000000000) (bvslt lt!665110 (size!49842 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538473 (= lt!665110 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538474 () Bool)

(assert (=> b!1538474 (= e!856505 e!856503)))

(declare-fun res!1053986 () Bool)

(assert (=> b!1538474 (=> (not res!1053986) (not e!856503))))

(declare-fun lt!665112 () SeekEntryResult!13318)

(assert (=> b!1538474 (= res!1053986 (= lt!665109 lt!665112))))

(assert (=> b!1538474 (= lt!665109 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665110 vacantIndex!5 (select (arr!49291 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538475 () Bool)

(declare-fun res!1053988 () Bool)

(assert (=> b!1538475 (=> (not res!1053988) (not e!856507))))

(assert (=> b!1538475 (= res!1053988 (and (= (size!49842 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49842 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49842 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538476 () Bool)

(declare-fun res!1053981 () Bool)

(assert (=> b!1538476 (=> (not res!1053981) (not e!856507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102166 (_ BitVec 32)) Bool)

(assert (=> b!1538476 (= res!1053981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538477 () Bool)

(assert (=> b!1538477 (= e!856507 e!856504)))

(declare-fun res!1053989 () Bool)

(assert (=> b!1538477 (=> (not res!1053989) (not e!856504))))

(assert (=> b!1538477 (= res!1053989 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49291 a!2792) j!64) a!2792 mask!2480) lt!665112))))

(assert (=> b!1538477 (= lt!665112 (Found!13318 j!64))))

(declare-fun b!1538478 () Bool)

(declare-fun res!1053983 () Bool)

(assert (=> b!1538478 (=> (not res!1053983) (not e!856507))))

(assert (=> b!1538478 (= res!1053983 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49842 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49842 a!2792)) (= (select (arr!49291 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538470 () Bool)

(declare-fun res!1053990 () Bool)

(assert (=> b!1538470 (=> (not res!1053990) (not e!856507))))

(declare-datatypes ((List!35752 0))(
  ( (Nil!35749) (Cons!35748 (h!37211 (_ BitVec 64)) (t!50438 List!35752)) )
))
(declare-fun arrayNoDuplicates!0 (array!102166 (_ BitVec 32) List!35752) Bool)

(assert (=> b!1538470 (= res!1053990 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35749))))

(declare-fun res!1053984 () Bool)

(assert (=> start!131364 (=> (not res!1053984) (not e!856507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131364 (= res!1053984 (validMask!0 mask!2480))))

(assert (=> start!131364 e!856507))

(assert (=> start!131364 true))

(declare-fun array_inv!38572 (array!102166) Bool)

(assert (=> start!131364 (array_inv!38572 a!2792)))

(declare-fun b!1538479 () Bool)

(declare-fun res!1053985 () Bool)

(assert (=> b!1538479 (=> (not res!1053985) (not e!856507))))

(assert (=> b!1538479 (= res!1053985 (validKeyInArray!0 (select (arr!49291 a!2792) j!64)))))

(declare-fun b!1538480 () Bool)

(declare-fun res!1053982 () Bool)

(assert (=> b!1538480 (=> (not res!1053982) (not e!856504))))

(assert (=> b!1538480 (= res!1053982 (not (= (select (arr!49291 a!2792) index!463) (select (arr!49291 a!2792) j!64))))))

(assert (= (and start!131364 res!1053984) b!1538475))

(assert (= (and b!1538475 res!1053988) b!1538471))

(assert (= (and b!1538471 res!1053987) b!1538479))

(assert (= (and b!1538479 res!1053985) b!1538476))

(assert (= (and b!1538476 res!1053981) b!1538470))

(assert (= (and b!1538470 res!1053990) b!1538478))

(assert (= (and b!1538478 res!1053983) b!1538477))

(assert (= (and b!1538477 res!1053989) b!1538480))

(assert (= (and b!1538480 res!1053982) b!1538473))

(assert (= (and b!1538473 res!1053980) b!1538474))

(assert (= (and b!1538474 res!1053986) b!1538472))

(declare-fun m!1420723 () Bool)

(assert (=> b!1538471 m!1420723))

(assert (=> b!1538471 m!1420723))

(declare-fun m!1420725 () Bool)

(assert (=> b!1538471 m!1420725))

(declare-fun m!1420727 () Bool)

(assert (=> b!1538474 m!1420727))

(assert (=> b!1538474 m!1420727))

(declare-fun m!1420729 () Bool)

(assert (=> b!1538474 m!1420729))

(assert (=> b!1538477 m!1420727))

(assert (=> b!1538477 m!1420727))

(declare-fun m!1420731 () Bool)

(assert (=> b!1538477 m!1420731))

(declare-fun m!1420733 () Bool)

(assert (=> b!1538470 m!1420733))

(declare-fun m!1420735 () Bool)

(assert (=> b!1538476 m!1420735))

(declare-fun m!1420737 () Bool)

(assert (=> b!1538478 m!1420737))

(declare-fun m!1420739 () Bool)

(assert (=> b!1538473 m!1420739))

(declare-fun m!1420741 () Bool)

(assert (=> b!1538480 m!1420741))

(assert (=> b!1538480 m!1420727))

(declare-fun m!1420743 () Bool)

(assert (=> start!131364 m!1420743))

(declare-fun m!1420745 () Bool)

(assert (=> start!131364 m!1420745))

(assert (=> b!1538479 m!1420727))

(assert (=> b!1538479 m!1420727))

(declare-fun m!1420747 () Bool)

(assert (=> b!1538479 m!1420747))

(declare-fun m!1420749 () Bool)

(assert (=> b!1538472 m!1420749))

(declare-fun m!1420751 () Bool)

(assert (=> b!1538472 m!1420751))

(assert (=> b!1538472 m!1420751))

(declare-fun m!1420753 () Bool)

(assert (=> b!1538472 m!1420753))

(declare-fun m!1420755 () Bool)

(assert (=> b!1538472 m!1420755))

(check-sat (not b!1538471) (not b!1538474) (not b!1538477) (not b!1538470) (not b!1538479) (not b!1538476) (not b!1538472) (not start!131364) (not b!1538473))
(check-sat)
