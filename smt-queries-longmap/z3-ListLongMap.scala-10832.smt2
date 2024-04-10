; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126840 () Bool)

(assert start!126840)

(declare-fun b!1489332 () Bool)

(declare-fun res!1012808 () Bool)

(declare-fun e!834725 () Bool)

(assert (=> b!1489332 (=> res!1012808 e!834725)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649515 () (_ BitVec 32))

(declare-datatypes ((array!99613 0))(
  ( (array!99614 (arr!48078 (Array (_ BitVec 32) (_ BitVec 64))) (size!48628 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99613)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12318 0))(
  ( (MissingZero!12318 (index!51664 (_ BitVec 32))) (Found!12318 (index!51665 (_ BitVec 32))) (Intermediate!12318 (undefined!13130 Bool) (index!51666 (_ BitVec 32)) (x!133262 (_ BitVec 32))) (Undefined!12318) (MissingVacant!12318 (index!51667 (_ BitVec 32))) )
))
(declare-fun lt!649509 () SeekEntryResult!12318)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12318)

(assert (=> b!1489332 (= res!1012808 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649515 (select (arr!48078 a!2862) j!93) a!2862 mask!2687) lt!649509)))))

(declare-fun e!834727 () Bool)

(declare-fun lt!649513 () SeekEntryResult!12318)

(declare-fun lt!649511 () array!99613)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1489333 () Bool)

(declare-fun lt!649508 () (_ BitVec 64))

(assert (=> b!1489333 (= e!834727 (= lt!649513 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649508 lt!649511 mask!2687)))))

(declare-fun b!1489334 () Bool)

(declare-fun e!834720 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649510 () SeekEntryResult!12318)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12318)

(assert (=> b!1489334 (= e!834720 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649515 intermediateAfterIndex!19 lt!649508 lt!649511 mask!2687) lt!649510)))))

(declare-fun b!1489335 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12318)

(assert (=> b!1489335 (= e!834727 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649508 lt!649511 mask!2687) (seekEntryOrOpen!0 lt!649508 lt!649511 mask!2687)))))

(declare-fun b!1489336 () Bool)

(declare-fun res!1012807 () Bool)

(declare-fun e!834724 () Bool)

(assert (=> b!1489336 (=> (not res!1012807) (not e!834724))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489336 (= res!1012807 (and (= (size!48628 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48628 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48628 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489337 () Bool)

(assert (=> b!1489337 (= e!834720 (not (= lt!649513 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649515 lt!649508 lt!649511 mask!2687))))))

(declare-fun b!1489338 () Bool)

(assert (=> b!1489338 (= e!834725 true)))

(declare-fun lt!649514 () SeekEntryResult!12318)

(assert (=> b!1489338 (= lt!649514 lt!649510)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49976 0))(
  ( (Unit!49977) )
))
(declare-fun lt!649512 () Unit!49976)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49976)

(assert (=> b!1489338 (= lt!649512 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649515 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489339 () Bool)

(declare-fun res!1012800 () Bool)

(assert (=> b!1489339 (=> (not res!1012800) (not e!834724))))

(declare-datatypes ((List!34579 0))(
  ( (Nil!34576) (Cons!34575 (h!35958 (_ BitVec 64)) (t!49273 List!34579)) )
))
(declare-fun arrayNoDuplicates!0 (array!99613 (_ BitVec 32) List!34579) Bool)

(assert (=> b!1489339 (= res!1012800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34576))))

(declare-fun b!1489340 () Bool)

(declare-fun res!1012803 () Bool)

(declare-fun e!834721 () Bool)

(assert (=> b!1489340 (=> (not res!1012803) (not e!834721))))

(assert (=> b!1489340 (= res!1012803 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489341 () Bool)

(declare-fun e!834722 () Bool)

(declare-fun e!834723 () Bool)

(assert (=> b!1489341 (= e!834722 e!834723)))

(declare-fun res!1012804 () Bool)

(assert (=> b!1489341 (=> (not res!1012804) (not e!834723))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489341 (= res!1012804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48078 a!2862) j!93) mask!2687) (select (arr!48078 a!2862) j!93) a!2862 mask!2687) lt!649509))))

(assert (=> b!1489341 (= lt!649509 (Intermediate!12318 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489342 () Bool)

(assert (=> b!1489342 (= e!834723 e!834721)))

(declare-fun res!1012797 () Bool)

(assert (=> b!1489342 (=> (not res!1012797) (not e!834721))))

(assert (=> b!1489342 (= res!1012797 (= lt!649513 (Intermediate!12318 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489342 (= lt!649513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649508 mask!2687) lt!649508 lt!649511 mask!2687))))

(assert (=> b!1489342 (= lt!649508 (select (store (arr!48078 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1012811 () Bool)

(assert (=> start!126840 (=> (not res!1012811) (not e!834724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126840 (= res!1012811 (validMask!0 mask!2687))))

(assert (=> start!126840 e!834724))

(assert (=> start!126840 true))

(declare-fun array_inv!37106 (array!99613) Bool)

(assert (=> start!126840 (array_inv!37106 a!2862)))

(declare-fun b!1489343 () Bool)

(declare-fun res!1012812 () Bool)

(assert (=> b!1489343 (=> res!1012812 e!834725)))

(assert (=> b!1489343 (= res!1012812 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489344 () Bool)

(assert (=> b!1489344 (= e!834724 e!834722)))

(declare-fun res!1012799 () Bool)

(assert (=> b!1489344 (=> (not res!1012799) (not e!834722))))

(assert (=> b!1489344 (= res!1012799 (= (select (store (arr!48078 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489344 (= lt!649511 (array!99614 (store (arr!48078 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48628 a!2862)))))

(declare-fun b!1489345 () Bool)

(declare-fun e!834728 () Bool)

(assert (=> b!1489345 (= e!834728 e!834725)))

(declare-fun res!1012809 () Bool)

(assert (=> b!1489345 (=> res!1012809 e!834725)))

(assert (=> b!1489345 (= res!1012809 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649515 #b00000000000000000000000000000000) (bvsge lt!649515 (size!48628 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489345 (= lt!649515 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489345 (= lt!649510 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649508 lt!649511 mask!2687))))

(assert (=> b!1489345 (= lt!649510 (seekEntryOrOpen!0 lt!649508 lt!649511 mask!2687))))

(declare-fun b!1489346 () Bool)

(declare-fun res!1012805 () Bool)

(assert (=> b!1489346 (=> (not res!1012805) (not e!834724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489346 (= res!1012805 (validKeyInArray!0 (select (arr!48078 a!2862) i!1006)))))

(declare-fun b!1489347 () Bool)

(declare-fun res!1012810 () Bool)

(assert (=> b!1489347 (=> (not res!1012810) (not e!834724))))

(assert (=> b!1489347 (= res!1012810 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48628 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48628 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48628 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489348 () Bool)

(declare-fun res!1012801 () Bool)

(assert (=> b!1489348 (=> (not res!1012801) (not e!834723))))

(assert (=> b!1489348 (= res!1012801 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48078 a!2862) j!93) a!2862 mask!2687) lt!649509))))

(declare-fun b!1489349 () Bool)

(declare-fun res!1012802 () Bool)

(assert (=> b!1489349 (=> (not res!1012802) (not e!834724))))

(assert (=> b!1489349 (= res!1012802 (validKeyInArray!0 (select (arr!48078 a!2862) j!93)))))

(declare-fun b!1489350 () Bool)

(declare-fun res!1012796 () Bool)

(assert (=> b!1489350 (=> res!1012796 e!834725)))

(assert (=> b!1489350 (= res!1012796 e!834720)))

(declare-fun c!137795 () Bool)

(assert (=> b!1489350 (= c!137795 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489351 () Bool)

(assert (=> b!1489351 (= e!834721 (not e!834728))))

(declare-fun res!1012806 () Bool)

(assert (=> b!1489351 (=> res!1012806 e!834728)))

(assert (=> b!1489351 (= res!1012806 (or (and (= (select (arr!48078 a!2862) index!646) (select (store (arr!48078 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48078 a!2862) index!646) (select (arr!48078 a!2862) j!93))) (= (select (arr!48078 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489351 (and (= lt!649514 (Found!12318 j!93)) (or (= (select (arr!48078 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48078 a!2862) intermediateBeforeIndex!19) (select (arr!48078 a!2862) j!93))) (let ((bdg!54708 (select (store (arr!48078 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48078 a!2862) index!646) bdg!54708) (= (select (arr!48078 a!2862) index!646) (select (arr!48078 a!2862) j!93))) (= (select (arr!48078 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54708 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489351 (= lt!649514 (seekEntryOrOpen!0 (select (arr!48078 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99613 (_ BitVec 32)) Bool)

(assert (=> b!1489351 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649507 () Unit!49976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49976)

(assert (=> b!1489351 (= lt!649507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489352 () Bool)

(declare-fun res!1012813 () Bool)

(assert (=> b!1489352 (=> (not res!1012813) (not e!834721))))

(assert (=> b!1489352 (= res!1012813 e!834727)))

(declare-fun c!137796 () Bool)

(assert (=> b!1489352 (= c!137796 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489353 () Bool)

(declare-fun res!1012798 () Bool)

(assert (=> b!1489353 (=> (not res!1012798) (not e!834724))))

(assert (=> b!1489353 (= res!1012798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126840 res!1012811) b!1489336))

(assert (= (and b!1489336 res!1012807) b!1489346))

(assert (= (and b!1489346 res!1012805) b!1489349))

(assert (= (and b!1489349 res!1012802) b!1489353))

(assert (= (and b!1489353 res!1012798) b!1489339))

(assert (= (and b!1489339 res!1012800) b!1489347))

(assert (= (and b!1489347 res!1012810) b!1489344))

(assert (= (and b!1489344 res!1012799) b!1489341))

(assert (= (and b!1489341 res!1012804) b!1489348))

(assert (= (and b!1489348 res!1012801) b!1489342))

(assert (= (and b!1489342 res!1012797) b!1489352))

(assert (= (and b!1489352 c!137796) b!1489333))

(assert (= (and b!1489352 (not c!137796)) b!1489335))

(assert (= (and b!1489352 res!1012813) b!1489340))

(assert (= (and b!1489340 res!1012803) b!1489351))

(assert (= (and b!1489351 (not res!1012806)) b!1489345))

(assert (= (and b!1489345 (not res!1012809)) b!1489332))

(assert (= (and b!1489332 (not res!1012808)) b!1489350))

(assert (= (and b!1489350 c!137795) b!1489337))

(assert (= (and b!1489350 (not c!137795)) b!1489334))

(assert (= (and b!1489350 (not res!1012796)) b!1489343))

(assert (= (and b!1489343 (not res!1012812)) b!1489338))

(declare-fun m!1373575 () Bool)

(assert (=> b!1489332 m!1373575))

(assert (=> b!1489332 m!1373575))

(declare-fun m!1373577 () Bool)

(assert (=> b!1489332 m!1373577))

(declare-fun m!1373579 () Bool)

(assert (=> b!1489337 m!1373579))

(declare-fun m!1373581 () Bool)

(assert (=> b!1489333 m!1373581))

(declare-fun m!1373583 () Bool)

(assert (=> b!1489334 m!1373583))

(assert (=> b!1489349 m!1373575))

(assert (=> b!1489349 m!1373575))

(declare-fun m!1373585 () Bool)

(assert (=> b!1489349 m!1373585))

(declare-fun m!1373587 () Bool)

(assert (=> b!1489344 m!1373587))

(declare-fun m!1373589 () Bool)

(assert (=> b!1489344 m!1373589))

(assert (=> b!1489341 m!1373575))

(assert (=> b!1489341 m!1373575))

(declare-fun m!1373591 () Bool)

(assert (=> b!1489341 m!1373591))

(assert (=> b!1489341 m!1373591))

(assert (=> b!1489341 m!1373575))

(declare-fun m!1373593 () Bool)

(assert (=> b!1489341 m!1373593))

(declare-fun m!1373595 () Bool)

(assert (=> b!1489346 m!1373595))

(assert (=> b!1489346 m!1373595))

(declare-fun m!1373597 () Bool)

(assert (=> b!1489346 m!1373597))

(declare-fun m!1373599 () Bool)

(assert (=> b!1489353 m!1373599))

(declare-fun m!1373601 () Bool)

(assert (=> b!1489335 m!1373601))

(declare-fun m!1373603 () Bool)

(assert (=> b!1489335 m!1373603))

(declare-fun m!1373605 () Bool)

(assert (=> b!1489338 m!1373605))

(declare-fun m!1373607 () Bool)

(assert (=> b!1489342 m!1373607))

(assert (=> b!1489342 m!1373607))

(declare-fun m!1373609 () Bool)

(assert (=> b!1489342 m!1373609))

(assert (=> b!1489342 m!1373587))

(declare-fun m!1373611 () Bool)

(assert (=> b!1489342 m!1373611))

(assert (=> b!1489348 m!1373575))

(assert (=> b!1489348 m!1373575))

(declare-fun m!1373613 () Bool)

(assert (=> b!1489348 m!1373613))

(declare-fun m!1373615 () Bool)

(assert (=> b!1489339 m!1373615))

(declare-fun m!1373617 () Bool)

(assert (=> b!1489345 m!1373617))

(assert (=> b!1489345 m!1373601))

(assert (=> b!1489345 m!1373603))

(declare-fun m!1373619 () Bool)

(assert (=> b!1489351 m!1373619))

(assert (=> b!1489351 m!1373587))

(declare-fun m!1373621 () Bool)

(assert (=> b!1489351 m!1373621))

(declare-fun m!1373623 () Bool)

(assert (=> b!1489351 m!1373623))

(declare-fun m!1373625 () Bool)

(assert (=> b!1489351 m!1373625))

(assert (=> b!1489351 m!1373575))

(declare-fun m!1373627 () Bool)

(assert (=> b!1489351 m!1373627))

(declare-fun m!1373629 () Bool)

(assert (=> b!1489351 m!1373629))

(assert (=> b!1489351 m!1373575))

(declare-fun m!1373631 () Bool)

(assert (=> start!126840 m!1373631))

(declare-fun m!1373633 () Bool)

(assert (=> start!126840 m!1373633))

(check-sat (not b!1489339) (not b!1489338) (not b!1489341) (not b!1489334) (not b!1489349) (not b!1489332) (not b!1489348) (not b!1489353) (not b!1489335) (not start!126840) (not b!1489333) (not b!1489351) (not b!1489346) (not b!1489345) (not b!1489337) (not b!1489342))
(check-sat)
