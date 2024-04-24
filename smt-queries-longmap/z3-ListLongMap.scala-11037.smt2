; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129356 () Bool)

(assert start!129356)

(declare-fun b!1515615 () Bool)

(declare-fun res!1034351 () Bool)

(declare-fun e!845976 () Bool)

(assert (=> b!1515615 (=> (not res!1034351) (not e!845976))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101026 0))(
  ( (array!101027 (arr!48745 (Array (_ BitVec 32) (_ BitVec 64))) (size!49296 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101026)

(declare-datatypes ((SeekEntryResult!12809 0))(
  ( (MissingZero!12809 (index!53631 (_ BitVec 32))) (Found!12809 (index!53632 (_ BitVec 32))) (Intermediate!12809 (undefined!13621 Bool) (index!53633 (_ BitVec 32)) (x!135548 (_ BitVec 32))) (Undefined!12809) (MissingVacant!12809 (index!53634 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12809)

(assert (=> b!1515615 (= res!1034351 (= (seekEntry!0 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) (Found!12809 j!70)))))

(declare-fun b!1515616 () Bool)

(declare-fun e!845981 () Bool)

(assert (=> b!1515616 (= e!845981 (not true))))

(assert (=> b!1515616 e!845976))

(declare-fun res!1034344 () Bool)

(assert (=> b!1515616 (=> (not res!1034344) (not e!845976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101026 (_ BitVec 32)) Bool)

(assert (=> b!1515616 (= res!1034344 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50521 0))(
  ( (Unit!50522) )
))
(declare-fun lt!656767 () Unit!50521)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50521)

(assert (=> b!1515616 (= lt!656767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515617 () Bool)

(declare-fun e!845978 () Bool)

(assert (=> b!1515617 (= e!845978 e!845981)))

(declare-fun res!1034354 () Bool)

(assert (=> b!1515617 (=> (not res!1034354) (not e!845981))))

(declare-fun lt!656764 () array!101026)

(declare-fun lt!656763 () SeekEntryResult!12809)

(declare-fun lt!656766 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515617 (= res!1034354 (= lt!656763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656766 mask!2512) lt!656766 lt!656764 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515617 (= lt!656766 (select (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515617 (= lt!656764 (array!101027 (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49296 a!2804)))))

(declare-fun b!1515618 () Bool)

(declare-fun res!1034342 () Bool)

(declare-fun e!845982 () Bool)

(assert (=> b!1515618 (=> (not res!1034342) (not e!845982))))

(declare-datatypes ((List!35215 0))(
  ( (Nil!35212) (Cons!35211 (h!36638 (_ BitVec 64)) (t!49901 List!35215)) )
))
(declare-fun arrayNoDuplicates!0 (array!101026 (_ BitVec 32) List!35215) Bool)

(assert (=> b!1515618 (= res!1034342 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35212))))

(declare-fun b!1515619 () Bool)

(declare-fun res!1034348 () Bool)

(assert (=> b!1515619 (=> (not res!1034348) (not e!845982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515619 (= res!1034348 (validKeyInArray!0 (select (arr!48745 a!2804) j!70)))))

(declare-fun b!1515620 () Bool)

(declare-fun res!1034347 () Bool)

(assert (=> b!1515620 (=> (not res!1034347) (not e!845982))))

(assert (=> b!1515620 (= res!1034347 (validKeyInArray!0 (select (arr!48745 a!2804) i!961)))))

(declare-fun b!1515621 () Bool)

(declare-fun res!1034353 () Bool)

(assert (=> b!1515621 (=> (not res!1034353) (not e!845982))))

(assert (=> b!1515621 (= res!1034353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515622 () Bool)

(declare-fun res!1034346 () Bool)

(assert (=> b!1515622 (=> (not res!1034346) (not e!845982))))

(assert (=> b!1515622 (= res!1034346 (and (= (size!49296 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49296 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49296 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515623 () Bool)

(declare-fun e!845979 () Bool)

(assert (=> b!1515623 (= e!845976 e!845979)))

(declare-fun res!1034352 () Bool)

(assert (=> b!1515623 (=> res!1034352 e!845979)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515623 (= res!1034352 (or (not (= (select (arr!48745 a!2804) j!70) lt!656766)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48745 a!2804) index!487) (select (arr!48745 a!2804) j!70)) (not (= (select (arr!48745 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515624 () Bool)

(declare-fun res!1034341 () Bool)

(assert (=> b!1515624 (=> (not res!1034341) (not e!845982))))

(assert (=> b!1515624 (= res!1034341 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49296 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49296 a!2804))))))

(declare-fun e!845977 () Bool)

(declare-fun b!1515625 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12809)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12809)

(assert (=> b!1515625 (= e!845977 (= (seekEntryOrOpen!0 lt!656766 lt!656764 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656766 lt!656764 mask!2512)))))

(declare-fun b!1515626 () Bool)

(assert (=> b!1515626 (= e!845979 e!845977)))

(declare-fun res!1034349 () Bool)

(assert (=> b!1515626 (=> (not res!1034349) (not e!845977))))

(assert (=> b!1515626 (= res!1034349 (= (seekEntryOrOpen!0 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48745 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1034345 () Bool)

(assert (=> start!129356 (=> (not res!1034345) (not e!845982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129356 (= res!1034345 (validMask!0 mask!2512))))

(assert (=> start!129356 e!845982))

(assert (=> start!129356 true))

(declare-fun array_inv!38026 (array!101026) Bool)

(assert (=> start!129356 (array_inv!38026 a!2804)))

(declare-fun b!1515627 () Bool)

(declare-fun res!1034350 () Bool)

(assert (=> b!1515627 (=> (not res!1034350) (not e!845978))))

(declare-fun lt!656765 () SeekEntryResult!12809)

(assert (=> b!1515627 (= res!1034350 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) lt!656765))))

(declare-fun b!1515628 () Bool)

(assert (=> b!1515628 (= e!845982 e!845978)))

(declare-fun res!1034343 () Bool)

(assert (=> b!1515628 (=> (not res!1034343) (not e!845978))))

(assert (=> b!1515628 (= res!1034343 (= lt!656763 lt!656765))))

(assert (=> b!1515628 (= lt!656765 (Intermediate!12809 false resIndex!21 resX!21))))

(assert (=> b!1515628 (= lt!656763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48745 a!2804) j!70) mask!2512) (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129356 res!1034345) b!1515622))

(assert (= (and b!1515622 res!1034346) b!1515620))

(assert (= (and b!1515620 res!1034347) b!1515619))

(assert (= (and b!1515619 res!1034348) b!1515621))

(assert (= (and b!1515621 res!1034353) b!1515618))

(assert (= (and b!1515618 res!1034342) b!1515624))

(assert (= (and b!1515624 res!1034341) b!1515628))

(assert (= (and b!1515628 res!1034343) b!1515627))

(assert (= (and b!1515627 res!1034350) b!1515617))

(assert (= (and b!1515617 res!1034354) b!1515616))

(assert (= (and b!1515616 res!1034344) b!1515615))

(assert (= (and b!1515615 res!1034351) b!1515623))

(assert (= (and b!1515623 (not res!1034352)) b!1515626))

(assert (= (and b!1515626 res!1034349) b!1515625))

(declare-fun m!1398471 () Bool)

(assert (=> b!1515627 m!1398471))

(assert (=> b!1515627 m!1398471))

(declare-fun m!1398473 () Bool)

(assert (=> b!1515627 m!1398473))

(assert (=> b!1515628 m!1398471))

(assert (=> b!1515628 m!1398471))

(declare-fun m!1398475 () Bool)

(assert (=> b!1515628 m!1398475))

(assert (=> b!1515628 m!1398475))

(assert (=> b!1515628 m!1398471))

(declare-fun m!1398477 () Bool)

(assert (=> b!1515628 m!1398477))

(declare-fun m!1398479 () Bool)

(assert (=> b!1515621 m!1398479))

(declare-fun m!1398481 () Bool)

(assert (=> b!1515616 m!1398481))

(declare-fun m!1398483 () Bool)

(assert (=> b!1515616 m!1398483))

(assert (=> b!1515615 m!1398471))

(assert (=> b!1515615 m!1398471))

(declare-fun m!1398485 () Bool)

(assert (=> b!1515615 m!1398485))

(declare-fun m!1398487 () Bool)

(assert (=> b!1515625 m!1398487))

(declare-fun m!1398489 () Bool)

(assert (=> b!1515625 m!1398489))

(declare-fun m!1398491 () Bool)

(assert (=> b!1515620 m!1398491))

(assert (=> b!1515620 m!1398491))

(declare-fun m!1398493 () Bool)

(assert (=> b!1515620 m!1398493))

(declare-fun m!1398495 () Bool)

(assert (=> start!129356 m!1398495))

(declare-fun m!1398497 () Bool)

(assert (=> start!129356 m!1398497))

(declare-fun m!1398499 () Bool)

(assert (=> b!1515618 m!1398499))

(assert (=> b!1515619 m!1398471))

(assert (=> b!1515619 m!1398471))

(declare-fun m!1398501 () Bool)

(assert (=> b!1515619 m!1398501))

(assert (=> b!1515626 m!1398471))

(assert (=> b!1515626 m!1398471))

(declare-fun m!1398503 () Bool)

(assert (=> b!1515626 m!1398503))

(assert (=> b!1515626 m!1398471))

(declare-fun m!1398505 () Bool)

(assert (=> b!1515626 m!1398505))

(declare-fun m!1398507 () Bool)

(assert (=> b!1515617 m!1398507))

(assert (=> b!1515617 m!1398507))

(declare-fun m!1398509 () Bool)

(assert (=> b!1515617 m!1398509))

(declare-fun m!1398511 () Bool)

(assert (=> b!1515617 m!1398511))

(declare-fun m!1398513 () Bool)

(assert (=> b!1515617 m!1398513))

(assert (=> b!1515623 m!1398471))

(declare-fun m!1398515 () Bool)

(assert (=> b!1515623 m!1398515))

(check-sat (not b!1515621) (not b!1515627) (not b!1515615) (not b!1515616) (not b!1515625) (not b!1515618) (not b!1515619) (not b!1515626) (not b!1515620) (not b!1515617) (not b!1515628) (not start!129356))
(check-sat)
