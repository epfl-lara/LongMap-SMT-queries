; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126816 () Bool)

(assert start!126816)

(declare-fun b!1486445 () Bool)

(declare-fun res!1010114 () Bool)

(declare-fun e!833482 () Bool)

(assert (=> b!1486445 (=> (not res!1010114) (not e!833482))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99616 0))(
  ( (array!99617 (arr!48079 (Array (_ BitVec 32) (_ BitVec 64))) (size!48630 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99616)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12216 0))(
  ( (MissingZero!12216 (index!51256 (_ BitVec 32))) (Found!12216 (index!51257 (_ BitVec 32))) (Intermediate!12216 (undefined!13028 Bool) (index!51258 (_ BitVec 32)) (x!133021 (_ BitVec 32))) (Undefined!12216) (MissingVacant!12216 (index!51259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99616 (_ BitVec 32)) SeekEntryResult!12216)

(assert (=> b!1486445 (= res!1010114 (= (seekEntryOrOpen!0 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) (Found!12216 j!93)))))

(declare-fun b!1486446 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648496 () array!99616)

(declare-fun lt!648499 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648500 () SeekEntryResult!12216)

(declare-fun e!833483 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99616 (_ BitVec 32)) SeekEntryResult!12216)

(assert (=> b!1486446 (= e!833483 (= lt!648500 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648499 lt!648496 mask!2687)))))

(declare-fun b!1486447 () Bool)

(declare-fun e!833488 () Bool)

(assert (=> b!1486447 (= e!833482 e!833488)))

(declare-fun res!1010103 () Bool)

(assert (=> b!1486447 (=> res!1010103 e!833488)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648501 () (_ BitVec 64))

(assert (=> b!1486447 (= res!1010103 (or (and (= (select (arr!48079 a!2862) index!646) lt!648501) (= (select (arr!48079 a!2862) index!646) (select (arr!48079 a!2862) j!93))) (= (select (arr!48079 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486447 (= lt!648501 (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486448 () Bool)

(declare-fun e!833487 () Bool)

(assert (=> b!1486448 (= e!833487 true)))

(declare-fun lt!648502 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486448 (= lt!648502 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1486449 () Bool)

(declare-fun e!833481 () Bool)

(assert (=> b!1486449 (= e!833481 (not e!833487))))

(declare-fun res!1010100 () Bool)

(assert (=> b!1486449 (=> res!1010100 e!833487)))

(assert (=> b!1486449 (= res!1010100 (or (and (= (select (arr!48079 a!2862) index!646) (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48079 a!2862) index!646) (select (arr!48079 a!2862) j!93))) (= (select (arr!48079 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486449 e!833482))

(declare-fun res!1010108 () Bool)

(assert (=> b!1486449 (=> (not res!1010108) (not e!833482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99616 (_ BitVec 32)) Bool)

(assert (=> b!1486449 (= res!1010108 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49805 0))(
  ( (Unit!49806) )
))
(declare-fun lt!648498 () Unit!49805)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49805)

(assert (=> b!1486449 (= lt!648498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486450 () Bool)

(declare-fun e!833486 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99616 (_ BitVec 32)) SeekEntryResult!12216)

(assert (=> b!1486450 (= e!833486 (= (seekEntryOrOpen!0 lt!648499 lt!648496 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648499 lt!648496 mask!2687)))))

(declare-fun b!1486451 () Bool)

(declare-fun e!833490 () Bool)

(declare-fun e!833484 () Bool)

(assert (=> b!1486451 (= e!833490 e!833484)))

(declare-fun res!1010106 () Bool)

(assert (=> b!1486451 (=> (not res!1010106) (not e!833484))))

(assert (=> b!1486451 (= res!1010106 (= (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486451 (= lt!648496 (array!99617 (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48630 a!2862)))))

(declare-fun b!1486452 () Bool)

(declare-fun res!1010097 () Bool)

(assert (=> b!1486452 (=> (not res!1010097) (not e!833481))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486452 (= res!1010097 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486453 () Bool)

(declare-fun res!1010113 () Bool)

(assert (=> b!1486453 (=> (not res!1010113) (not e!833490))))

(assert (=> b!1486453 (= res!1010113 (and (= (size!48630 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48630 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48630 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486454 () Bool)

(declare-fun res!1010102 () Bool)

(declare-fun e!833485 () Bool)

(assert (=> b!1486454 (=> (not res!1010102) (not e!833485))))

(declare-fun lt!648497 () SeekEntryResult!12216)

(assert (=> b!1486454 (= res!1010102 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!648497))))

(declare-fun res!1010109 () Bool)

(assert (=> start!126816 (=> (not res!1010109) (not e!833490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126816 (= res!1010109 (validMask!0 mask!2687))))

(assert (=> start!126816 e!833490))

(assert (=> start!126816 true))

(declare-fun array_inv!37360 (array!99616) Bool)

(assert (=> start!126816 (array_inv!37360 a!2862)))

(declare-fun b!1486455 () Bool)

(assert (=> b!1486455 (= e!833484 e!833485)))

(declare-fun res!1010101 () Bool)

(assert (=> b!1486455 (=> (not res!1010101) (not e!833485))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486455 (= res!1010101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48079 a!2862) j!93) mask!2687) (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!648497))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486455 (= lt!648497 (Intermediate!12216 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486456 () Bool)

(declare-fun res!1010105 () Bool)

(assert (=> b!1486456 (=> (not res!1010105) (not e!833490))))

(assert (=> b!1486456 (= res!1010105 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48630 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48630 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48630 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486457 () Bool)

(declare-fun res!1010098 () Bool)

(assert (=> b!1486457 (=> (not res!1010098) (not e!833490))))

(declare-datatypes ((List!34567 0))(
  ( (Nil!34564) (Cons!34563 (h!35951 (_ BitVec 64)) (t!49253 List!34567)) )
))
(declare-fun arrayNoDuplicates!0 (array!99616 (_ BitVec 32) List!34567) Bool)

(assert (=> b!1486457 (= res!1010098 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34564))))

(declare-fun b!1486458 () Bool)

(assert (=> b!1486458 (= e!833485 e!833481)))

(declare-fun res!1010096 () Bool)

(assert (=> b!1486458 (=> (not res!1010096) (not e!833481))))

(assert (=> b!1486458 (= res!1010096 (= lt!648500 (Intermediate!12216 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486458 (= lt!648500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648499 mask!2687) lt!648499 lt!648496 mask!2687))))

(assert (=> b!1486458 (= lt!648499 (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486459 () Bool)

(declare-fun res!1010104 () Bool)

(assert (=> b!1486459 (=> (not res!1010104) (not e!833490))))

(assert (=> b!1486459 (= res!1010104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486460 () Bool)

(declare-fun res!1010110 () Bool)

(assert (=> b!1486460 (=> (not res!1010110) (not e!833490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486460 (= res!1010110 (validKeyInArray!0 (select (arr!48079 a!2862) i!1006)))))

(declare-fun b!1486461 () Bool)

(declare-fun res!1010107 () Bool)

(assert (=> b!1486461 (=> (not res!1010107) (not e!833482))))

(assert (=> b!1486461 (= res!1010107 (or (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) (select (arr!48079 a!2862) j!93))))))

(declare-fun b!1486462 () Bool)

(assert (=> b!1486462 (= e!833483 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648499 lt!648496 mask!2687) (seekEntryOrOpen!0 lt!648499 lt!648496 mask!2687)))))

(declare-fun b!1486463 () Bool)

(declare-fun res!1010112 () Bool)

(assert (=> b!1486463 (=> (not res!1010112) (not e!833481))))

(assert (=> b!1486463 (= res!1010112 e!833483)))

(declare-fun c!137707 () Bool)

(assert (=> b!1486463 (= c!137707 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486464 () Bool)

(declare-fun res!1010111 () Bool)

(assert (=> b!1486464 (=> (not res!1010111) (not e!833490))))

(assert (=> b!1486464 (= res!1010111 (validKeyInArray!0 (select (arr!48079 a!2862) j!93)))))

(declare-fun b!1486465 () Bool)

(assert (=> b!1486465 (= e!833488 e!833486)))

(declare-fun res!1010099 () Bool)

(assert (=> b!1486465 (=> (not res!1010099) (not e!833486))))

(assert (=> b!1486465 (= res!1010099 (and (= index!646 intermediateAfterIndex!19) (= lt!648501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!126816 res!1010109) b!1486453))

(assert (= (and b!1486453 res!1010113) b!1486460))

(assert (= (and b!1486460 res!1010110) b!1486464))

(assert (= (and b!1486464 res!1010111) b!1486459))

(assert (= (and b!1486459 res!1010104) b!1486457))

(assert (= (and b!1486457 res!1010098) b!1486456))

(assert (= (and b!1486456 res!1010105) b!1486451))

(assert (= (and b!1486451 res!1010106) b!1486455))

(assert (= (and b!1486455 res!1010101) b!1486454))

(assert (= (and b!1486454 res!1010102) b!1486458))

(assert (= (and b!1486458 res!1010096) b!1486463))

(assert (= (and b!1486463 c!137707) b!1486446))

(assert (= (and b!1486463 (not c!137707)) b!1486462))

(assert (= (and b!1486463 res!1010112) b!1486452))

(assert (= (and b!1486452 res!1010097) b!1486449))

(assert (= (and b!1486449 res!1010108) b!1486445))

(assert (= (and b!1486445 res!1010114) b!1486461))

(assert (= (and b!1486461 res!1010107) b!1486447))

(assert (= (and b!1486447 (not res!1010103)) b!1486465))

(assert (= (and b!1486465 res!1010099) b!1486450))

(assert (= (and b!1486449 (not res!1010100)) b!1486448))

(declare-fun m!1371679 () Bool)

(assert (=> b!1486447 m!1371679))

(declare-fun m!1371681 () Bool)

(assert (=> b!1486447 m!1371681))

(declare-fun m!1371683 () Bool)

(assert (=> b!1486447 m!1371683))

(declare-fun m!1371685 () Bool)

(assert (=> b!1486447 m!1371685))

(declare-fun m!1371687 () Bool)

(assert (=> b!1486449 m!1371687))

(assert (=> b!1486449 m!1371683))

(assert (=> b!1486449 m!1371685))

(assert (=> b!1486449 m!1371679))

(declare-fun m!1371689 () Bool)

(assert (=> b!1486449 m!1371689))

(assert (=> b!1486449 m!1371681))

(declare-fun m!1371691 () Bool)

(assert (=> b!1486457 m!1371691))

(declare-fun m!1371693 () Bool)

(assert (=> start!126816 m!1371693))

(declare-fun m!1371695 () Bool)

(assert (=> start!126816 m!1371695))

(declare-fun m!1371697 () Bool)

(assert (=> b!1486460 m!1371697))

(assert (=> b!1486460 m!1371697))

(declare-fun m!1371699 () Bool)

(assert (=> b!1486460 m!1371699))

(declare-fun m!1371701 () Bool)

(assert (=> b!1486446 m!1371701))

(declare-fun m!1371703 () Bool)

(assert (=> b!1486462 m!1371703))

(declare-fun m!1371705 () Bool)

(assert (=> b!1486462 m!1371705))

(assert (=> b!1486464 m!1371681))

(assert (=> b!1486464 m!1371681))

(declare-fun m!1371707 () Bool)

(assert (=> b!1486464 m!1371707))

(declare-fun m!1371709 () Bool)

(assert (=> b!1486458 m!1371709))

(assert (=> b!1486458 m!1371709))

(declare-fun m!1371711 () Bool)

(assert (=> b!1486458 m!1371711))

(assert (=> b!1486458 m!1371683))

(declare-fun m!1371713 () Bool)

(assert (=> b!1486458 m!1371713))

(declare-fun m!1371715 () Bool)

(assert (=> b!1486459 m!1371715))

(assert (=> b!1486454 m!1371681))

(assert (=> b!1486454 m!1371681))

(declare-fun m!1371717 () Bool)

(assert (=> b!1486454 m!1371717))

(assert (=> b!1486451 m!1371683))

(declare-fun m!1371719 () Bool)

(assert (=> b!1486451 m!1371719))

(assert (=> b!1486450 m!1371705))

(assert (=> b!1486450 m!1371703))

(declare-fun m!1371721 () Bool)

(assert (=> b!1486461 m!1371721))

(assert (=> b!1486461 m!1371681))

(declare-fun m!1371723 () Bool)

(assert (=> b!1486448 m!1371723))

(assert (=> b!1486455 m!1371681))

(assert (=> b!1486455 m!1371681))

(declare-fun m!1371725 () Bool)

(assert (=> b!1486455 m!1371725))

(assert (=> b!1486455 m!1371725))

(assert (=> b!1486455 m!1371681))

(declare-fun m!1371727 () Bool)

(assert (=> b!1486455 m!1371727))

(assert (=> b!1486445 m!1371681))

(assert (=> b!1486445 m!1371681))

(declare-fun m!1371729 () Bool)

(assert (=> b!1486445 m!1371729))

(check-sat (not b!1486458) (not b!1486462) (not b!1486460) (not b!1486448) (not b!1486454) (not b!1486464) (not b!1486449) (not b!1486450) (not b!1486445) (not b!1486446) (not b!1486459) (not b!1486457) (not start!126816) (not b!1486455))
(check-sat)
