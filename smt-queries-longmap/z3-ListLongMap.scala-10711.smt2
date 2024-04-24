; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125682 () Bool)

(assert start!125682)

(declare-fun b!1468513 () Bool)

(declare-fun res!996069 () Bool)

(declare-fun e!825073 () Bool)

(assert (=> b!1468513 (=> (not res!996069) (not e!825073))))

(declare-fun e!825067 () Bool)

(assert (=> b!1468513 (= res!996069 e!825067)))

(declare-fun c!135751 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1468513 (= c!135751 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1468514 () Bool)

(declare-fun e!825075 () Bool)

(assert (=> b!1468514 (= e!825075 e!825073)))

(declare-fun res!996070 () Bool)

(assert (=> b!1468514 (=> (not res!996070) (not e!825073))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11916 0))(
  ( (MissingZero!11916 (index!50056 (_ BitVec 32))) (Found!11916 (index!50057 (_ BitVec 32))) (Intermediate!11916 (undefined!12728 Bool) (index!50058 (_ BitVec 32)) (x!131814 (_ BitVec 32))) (Undefined!11916) (MissingVacant!11916 (index!50059 (_ BitVec 32))) )
))
(declare-fun lt!642522 () SeekEntryResult!11916)

(assert (=> b!1468514 (= res!996070 (= lt!642522 (Intermediate!11916 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98968 0))(
  ( (array!98969 (arr!47767 (Array (_ BitVec 32) (_ BitVec 64))) (size!48318 (_ BitVec 32))) )
))
(declare-fun lt!642525 () array!98968)

(declare-fun lt!642523 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!11916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468514 (= lt!642522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642523 mask!2687) lt!642523 lt!642525 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98968)

(assert (=> b!1468514 (= lt!642523 (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1468515 () Bool)

(declare-fun res!996066 () Bool)

(declare-fun e!825070 () Bool)

(assert (=> b!1468515 (=> (not res!996066) (not e!825070))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468515 (= res!996066 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48318 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48318 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48318 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!996065 () Bool)

(assert (=> start!125682 (=> (not res!996065) (not e!825070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125682 (= res!996065 (validMask!0 mask!2687))))

(assert (=> start!125682 e!825070))

(assert (=> start!125682 true))

(declare-fun array_inv!37048 (array!98968) Bool)

(assert (=> start!125682 (array_inv!37048 a!2862)))

(declare-fun b!1468516 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!11916)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!11916)

(assert (=> b!1468516 (= e!825067 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642523 lt!642525 mask!2687) (seekEntryOrOpen!0 lt!642523 lt!642525 mask!2687)))))

(declare-fun b!1468517 () Bool)

(declare-fun res!996059 () Bool)

(assert (=> b!1468517 (=> (not res!996059) (not e!825070))))

(assert (=> b!1468517 (= res!996059 (and (= (size!48318 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48318 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48318 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!825068 () Bool)

(declare-fun b!1468518 () Bool)

(declare-fun lt!642528 () (_ BitVec 32))

(assert (=> b!1468518 (= e!825068 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642528 intermediateAfterIndex!19 lt!642523 lt!642525 mask!2687) (seekEntryOrOpen!0 lt!642523 lt!642525 mask!2687))))))

(declare-fun b!1468519 () Bool)

(declare-fun e!825069 () Bool)

(assert (=> b!1468519 (= e!825069 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!642526 () SeekEntryResult!11916)

(assert (=> b!1468519 (= lt!642526 (seekEntryOrOpen!0 lt!642523 lt!642525 mask!2687))))

(declare-datatypes ((Unit!49361 0))(
  ( (Unit!49362) )
))
(declare-fun lt!642529 () Unit!49361)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49361)

(assert (=> b!1468519 (= lt!642529 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642528 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1468520 () Bool)

(declare-fun res!996062 () Bool)

(assert (=> b!1468520 (=> (not res!996062) (not e!825070))))

(declare-datatypes ((List!34255 0))(
  ( (Nil!34252) (Cons!34251 (h!35615 (_ BitVec 64)) (t!48941 List!34255)) )
))
(declare-fun arrayNoDuplicates!0 (array!98968 (_ BitVec 32) List!34255) Bool)

(assert (=> b!1468520 (= res!996062 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34252))))

(declare-fun b!1468521 () Bool)

(declare-fun res!996063 () Bool)

(assert (=> b!1468521 (=> (not res!996063) (not e!825070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468521 (= res!996063 (validKeyInArray!0 (select (arr!47767 a!2862) j!93)))))

(declare-fun b!1468522 () Bool)

(declare-fun e!825072 () Bool)

(assert (=> b!1468522 (= e!825072 e!825075)))

(declare-fun res!996060 () Bool)

(assert (=> b!1468522 (=> (not res!996060) (not e!825075))))

(declare-fun lt!642524 () SeekEntryResult!11916)

(assert (=> b!1468522 (= res!996060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47767 a!2862) j!93) mask!2687) (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642524))))

(assert (=> b!1468522 (= lt!642524 (Intermediate!11916 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468523 () Bool)

(declare-fun res!996061 () Bool)

(assert (=> b!1468523 (=> res!996061 e!825069)))

(assert (=> b!1468523 (= res!996061 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642528 (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642524)))))

(declare-fun b!1468524 () Bool)

(declare-fun e!825074 () Bool)

(assert (=> b!1468524 (= e!825074 e!825069)))

(declare-fun res!996071 () Bool)

(assert (=> b!1468524 (=> res!996071 e!825069)))

(assert (=> b!1468524 (= res!996071 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642528 #b00000000000000000000000000000000) (bvsge lt!642528 (size!48318 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468524 (= lt!642528 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1468525 () Bool)

(assert (=> b!1468525 (= e!825067 (= lt!642522 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642523 lt!642525 mask!2687)))))

(declare-fun b!1468526 () Bool)

(declare-fun res!996056 () Bool)

(assert (=> b!1468526 (=> res!996056 e!825069)))

(assert (=> b!1468526 (= res!996056 e!825068)))

(declare-fun c!135750 () Bool)

(assert (=> b!1468526 (= c!135750 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1468527 () Bool)

(declare-fun res!996054 () Bool)

(assert (=> b!1468527 (=> (not res!996054) (not e!825070))))

(assert (=> b!1468527 (= res!996054 (validKeyInArray!0 (select (arr!47767 a!2862) i!1006)))))

(declare-fun b!1468528 () Bool)

(declare-fun res!996058 () Bool)

(assert (=> b!1468528 (=> (not res!996058) (not e!825070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98968 (_ BitVec 32)) Bool)

(assert (=> b!1468528 (= res!996058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468529 () Bool)

(declare-fun res!996068 () Bool)

(assert (=> b!1468529 (=> (not res!996068) (not e!825075))))

(assert (=> b!1468529 (= res!996068 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642524))))

(declare-fun b!1468530 () Bool)

(declare-fun res!996064 () Bool)

(assert (=> b!1468530 (=> (not res!996064) (not e!825073))))

(assert (=> b!1468530 (= res!996064 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1468531 () Bool)

(assert (=> b!1468531 (= e!825070 e!825072)))

(declare-fun res!996057 () Bool)

(assert (=> b!1468531 (=> (not res!996057) (not e!825072))))

(assert (=> b!1468531 (= res!996057 (= (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1468531 (= lt!642525 (array!98969 (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48318 a!2862)))))

(declare-fun b!1468532 () Bool)

(assert (=> b!1468532 (= e!825073 (not e!825074))))

(declare-fun res!996055 () Bool)

(assert (=> b!1468532 (=> res!996055 e!825074)))

(assert (=> b!1468532 (= res!996055 (or (and (= (select (arr!47767 a!2862) index!646) (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47767 a!2862) index!646) (select (arr!47767 a!2862) j!93))) (= (select (arr!47767 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1468532 (and (= lt!642526 (Found!11916 j!93)) (or (= (select (arr!47767 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47767 a!2862) intermediateBeforeIndex!19) (select (arr!47767 a!2862) j!93))))))

(assert (=> b!1468532 (= lt!642526 (seekEntryOrOpen!0 (select (arr!47767 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1468532 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642527 () Unit!49361)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49361)

(assert (=> b!1468532 (= lt!642527 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1468533 () Bool)

(declare-fun res!996067 () Bool)

(assert (=> b!1468533 (=> res!996067 e!825069)))

(assert (=> b!1468533 (= res!996067 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1468534 () Bool)

(assert (=> b!1468534 (= e!825068 (not (= lt!642522 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642528 lt!642523 lt!642525 mask!2687))))))

(assert (= (and start!125682 res!996065) b!1468517))

(assert (= (and b!1468517 res!996059) b!1468527))

(assert (= (and b!1468527 res!996054) b!1468521))

(assert (= (and b!1468521 res!996063) b!1468528))

(assert (= (and b!1468528 res!996058) b!1468520))

(assert (= (and b!1468520 res!996062) b!1468515))

(assert (= (and b!1468515 res!996066) b!1468531))

(assert (= (and b!1468531 res!996057) b!1468522))

(assert (= (and b!1468522 res!996060) b!1468529))

(assert (= (and b!1468529 res!996068) b!1468514))

(assert (= (and b!1468514 res!996070) b!1468513))

(assert (= (and b!1468513 c!135751) b!1468525))

(assert (= (and b!1468513 (not c!135751)) b!1468516))

(assert (= (and b!1468513 res!996069) b!1468530))

(assert (= (and b!1468530 res!996064) b!1468532))

(assert (= (and b!1468532 (not res!996055)) b!1468524))

(assert (= (and b!1468524 (not res!996071)) b!1468523))

(assert (= (and b!1468523 (not res!996061)) b!1468526))

(assert (= (and b!1468526 c!135750) b!1468534))

(assert (= (and b!1468526 (not c!135750)) b!1468518))

(assert (= (and b!1468526 (not res!996056)) b!1468533))

(assert (= (and b!1468533 (not res!996067)) b!1468519))

(declare-fun m!1355449 () Bool)

(assert (=> b!1468519 m!1355449))

(declare-fun m!1355451 () Bool)

(assert (=> b!1468519 m!1355451))

(declare-fun m!1355453 () Bool)

(assert (=> b!1468522 m!1355453))

(assert (=> b!1468522 m!1355453))

(declare-fun m!1355455 () Bool)

(assert (=> b!1468522 m!1355455))

(assert (=> b!1468522 m!1355455))

(assert (=> b!1468522 m!1355453))

(declare-fun m!1355457 () Bool)

(assert (=> b!1468522 m!1355457))

(declare-fun m!1355459 () Bool)

(assert (=> b!1468525 m!1355459))

(declare-fun m!1355461 () Bool)

(assert (=> b!1468520 m!1355461))

(declare-fun m!1355463 () Bool)

(assert (=> b!1468518 m!1355463))

(assert (=> b!1468518 m!1355449))

(declare-fun m!1355465 () Bool)

(assert (=> start!125682 m!1355465))

(declare-fun m!1355467 () Bool)

(assert (=> start!125682 m!1355467))

(declare-fun m!1355469 () Bool)

(assert (=> b!1468532 m!1355469))

(declare-fun m!1355471 () Bool)

(assert (=> b!1468532 m!1355471))

(declare-fun m!1355473 () Bool)

(assert (=> b!1468532 m!1355473))

(declare-fun m!1355475 () Bool)

(assert (=> b!1468532 m!1355475))

(declare-fun m!1355477 () Bool)

(assert (=> b!1468532 m!1355477))

(assert (=> b!1468532 m!1355453))

(declare-fun m!1355479 () Bool)

(assert (=> b!1468532 m!1355479))

(declare-fun m!1355481 () Bool)

(assert (=> b!1468532 m!1355481))

(assert (=> b!1468532 m!1355453))

(assert (=> b!1468521 m!1355453))

(assert (=> b!1468521 m!1355453))

(declare-fun m!1355483 () Bool)

(assert (=> b!1468521 m!1355483))

(declare-fun m!1355485 () Bool)

(assert (=> b!1468534 m!1355485))

(assert (=> b!1468531 m!1355471))

(declare-fun m!1355487 () Bool)

(assert (=> b!1468531 m!1355487))

(declare-fun m!1355489 () Bool)

(assert (=> b!1468514 m!1355489))

(assert (=> b!1468514 m!1355489))

(declare-fun m!1355491 () Bool)

(assert (=> b!1468514 m!1355491))

(assert (=> b!1468514 m!1355471))

(declare-fun m!1355493 () Bool)

(assert (=> b!1468514 m!1355493))

(declare-fun m!1355495 () Bool)

(assert (=> b!1468516 m!1355495))

(assert (=> b!1468516 m!1355449))

(declare-fun m!1355497 () Bool)

(assert (=> b!1468524 m!1355497))

(declare-fun m!1355499 () Bool)

(assert (=> b!1468528 m!1355499))

(declare-fun m!1355501 () Bool)

(assert (=> b!1468527 m!1355501))

(assert (=> b!1468527 m!1355501))

(declare-fun m!1355503 () Bool)

(assert (=> b!1468527 m!1355503))

(assert (=> b!1468523 m!1355453))

(assert (=> b!1468523 m!1355453))

(declare-fun m!1355505 () Bool)

(assert (=> b!1468523 m!1355505))

(assert (=> b!1468529 m!1355453))

(assert (=> b!1468529 m!1355453))

(declare-fun m!1355507 () Bool)

(assert (=> b!1468529 m!1355507))

(check-sat (not b!1468519) (not b!1468528) (not b!1468524) (not start!125682) (not b!1468522) (not b!1468520) (not b!1468534) (not b!1468525) (not b!1468518) (not b!1468521) (not b!1468523) (not b!1468516) (not b!1468532) (not b!1468527) (not b!1468529) (not b!1468514))
(check-sat)
