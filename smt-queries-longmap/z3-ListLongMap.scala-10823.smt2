; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126654 () Bool)

(assert start!126654)

(declare-fun b!1486693 () Bool)

(declare-fun res!1011020 () Bool)

(declare-fun e!833395 () Bool)

(assert (=> b!1486693 (=> (not res!1011020) (not e!833395))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486693 (= res!1011020 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486694 () Bool)

(declare-fun e!833400 () Bool)

(assert (=> b!1486694 (= e!833400 true)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648554 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486694 (= lt!648554 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486695 () Bool)

(declare-fun res!1011034 () Bool)

(declare-fun e!833397 () Bool)

(assert (=> b!1486695 (=> (not res!1011034) (not e!833397))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99553 0))(
  ( (array!99554 (arr!48051 (Array (_ BitVec 32) (_ BitVec 64))) (size!48601 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99553)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486695 (= res!1011034 (or (= (select (arr!48051 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48051 a!2862) intermediateBeforeIndex!19) (select (arr!48051 a!2862) j!93))))))

(declare-fun b!1486696 () Bool)

(declare-fun lt!648557 () (_ BitVec 64))

(declare-fun e!833401 () Bool)

(declare-fun lt!648552 () array!99553)

(declare-datatypes ((SeekEntryResult!12291 0))(
  ( (MissingZero!12291 (index!51556 (_ BitVec 32))) (Found!12291 (index!51557 (_ BitVec 32))) (Intermediate!12291 (undefined!13103 Bool) (index!51558 (_ BitVec 32)) (x!133139 (_ BitVec 32))) (Undefined!12291) (MissingVacant!12291 (index!51559 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12291)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12291)

(assert (=> b!1486696 (= e!833401 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648557 lt!648552 mask!2687) (seekEntryOrOpen!0 lt!648557 lt!648552 mask!2687)))))

(declare-fun b!1486697 () Bool)

(declare-fun res!1011029 () Bool)

(declare-fun e!833402 () Bool)

(assert (=> b!1486697 (=> (not res!1011029) (not e!833402))))

(declare-datatypes ((List!34552 0))(
  ( (Nil!34549) (Cons!34548 (h!35925 (_ BitVec 64)) (t!49246 List!34552)) )
))
(declare-fun arrayNoDuplicates!0 (array!99553 (_ BitVec 32) List!34552) Bool)

(assert (=> b!1486697 (= res!1011029 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34549))))

(declare-fun b!1486698 () Bool)

(assert (=> b!1486698 (= e!833395 (not e!833400))))

(declare-fun res!1011026 () Bool)

(assert (=> b!1486698 (=> res!1011026 e!833400)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486698 (= res!1011026 (or (and (= (select (arr!48051 a!2862) index!646) (select (store (arr!48051 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48051 a!2862) index!646) (select (arr!48051 a!2862) j!93))) (= (select (arr!48051 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486698 e!833397))

(declare-fun res!1011035 () Bool)

(assert (=> b!1486698 (=> (not res!1011035) (not e!833397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99553 (_ BitVec 32)) Bool)

(assert (=> b!1486698 (= res!1011035 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49922 0))(
  ( (Unit!49923) )
))
(declare-fun lt!648555 () Unit!49922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49922)

(assert (=> b!1486698 (= lt!648555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486699 () Bool)

(declare-fun res!1011028 () Bool)

(assert (=> b!1486699 (=> (not res!1011028) (not e!833397))))

(assert (=> b!1486699 (= res!1011028 (= (seekEntryOrOpen!0 (select (arr!48051 a!2862) j!93) a!2862 mask!2687) (Found!12291 j!93)))))

(declare-fun b!1486700 () Bool)

(declare-fun res!1011032 () Bool)

(assert (=> b!1486700 (=> (not res!1011032) (not e!833402))))

(assert (=> b!1486700 (= res!1011032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!648558 () SeekEntryResult!12291)

(declare-fun b!1486701 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12291)

(assert (=> b!1486701 (= e!833401 (= lt!648558 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648557 lt!648552 mask!2687)))))

(declare-fun b!1486702 () Bool)

(declare-fun res!1011019 () Bool)

(declare-fun e!833393 () Bool)

(assert (=> b!1486702 (=> (not res!1011019) (not e!833393))))

(declare-fun lt!648553 () SeekEntryResult!12291)

(assert (=> b!1486702 (= res!1011019 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48051 a!2862) j!93) a!2862 mask!2687) lt!648553))))

(declare-fun b!1486703 () Bool)

(declare-fun e!833399 () Bool)

(assert (=> b!1486703 (= e!833399 e!833393)))

(declare-fun res!1011024 () Bool)

(assert (=> b!1486703 (=> (not res!1011024) (not e!833393))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486703 (= res!1011024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48051 a!2862) j!93) mask!2687) (select (arr!48051 a!2862) j!93) a!2862 mask!2687) lt!648553))))

(assert (=> b!1486703 (= lt!648553 (Intermediate!12291 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486704 () Bool)

(declare-fun res!1011027 () Bool)

(assert (=> b!1486704 (=> (not res!1011027) (not e!833395))))

(assert (=> b!1486704 (= res!1011027 e!833401)))

(declare-fun c!137361 () Bool)

(assert (=> b!1486704 (= c!137361 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486705 () Bool)

(assert (=> b!1486705 (= e!833402 e!833399)))

(declare-fun res!1011021 () Bool)

(assert (=> b!1486705 (=> (not res!1011021) (not e!833399))))

(assert (=> b!1486705 (= res!1011021 (= (select (store (arr!48051 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486705 (= lt!648552 (array!99554 (store (arr!48051 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48601 a!2862)))))

(declare-fun b!1486706 () Bool)

(declare-fun e!833396 () Bool)

(declare-fun e!833394 () Bool)

(assert (=> b!1486706 (= e!833396 e!833394)))

(declare-fun res!1011037 () Bool)

(assert (=> b!1486706 (=> (not res!1011037) (not e!833394))))

(declare-fun lt!648556 () (_ BitVec 64))

(assert (=> b!1486706 (= res!1011037 (and (= index!646 intermediateAfterIndex!19) (= lt!648556 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486707 () Bool)

(assert (=> b!1486707 (= e!833394 (= (seekEntryOrOpen!0 lt!648557 lt!648552 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648557 lt!648552 mask!2687)))))

(declare-fun b!1486709 () Bool)

(declare-fun res!1011022 () Bool)

(assert (=> b!1486709 (=> (not res!1011022) (not e!833402))))

(assert (=> b!1486709 (= res!1011022 (and (= (size!48601 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48601 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48601 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486710 () Bool)

(declare-fun res!1011025 () Bool)

(assert (=> b!1486710 (=> (not res!1011025) (not e!833402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486710 (= res!1011025 (validKeyInArray!0 (select (arr!48051 a!2862) i!1006)))))

(declare-fun b!1486711 () Bool)

(assert (=> b!1486711 (= e!833397 e!833396)))

(declare-fun res!1011031 () Bool)

(assert (=> b!1486711 (=> res!1011031 e!833396)))

(assert (=> b!1486711 (= res!1011031 (or (and (= (select (arr!48051 a!2862) index!646) lt!648556) (= (select (arr!48051 a!2862) index!646) (select (arr!48051 a!2862) j!93))) (= (select (arr!48051 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486711 (= lt!648556 (select (store (arr!48051 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486712 () Bool)

(assert (=> b!1486712 (= e!833393 e!833395)))

(declare-fun res!1011033 () Bool)

(assert (=> b!1486712 (=> (not res!1011033) (not e!833395))))

(assert (=> b!1486712 (= res!1011033 (= lt!648558 (Intermediate!12291 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486712 (= lt!648558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648557 mask!2687) lt!648557 lt!648552 mask!2687))))

(assert (=> b!1486712 (= lt!648557 (select (store (arr!48051 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486713 () Bool)

(declare-fun res!1011030 () Bool)

(assert (=> b!1486713 (=> (not res!1011030) (not e!833402))))

(assert (=> b!1486713 (= res!1011030 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48601 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48601 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48601 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1011036 () Bool)

(assert (=> start!126654 (=> (not res!1011036) (not e!833402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126654 (= res!1011036 (validMask!0 mask!2687))))

(assert (=> start!126654 e!833402))

(assert (=> start!126654 true))

(declare-fun array_inv!37079 (array!99553) Bool)

(assert (=> start!126654 (array_inv!37079 a!2862)))

(declare-fun b!1486708 () Bool)

(declare-fun res!1011023 () Bool)

(assert (=> b!1486708 (=> (not res!1011023) (not e!833402))))

(assert (=> b!1486708 (= res!1011023 (validKeyInArray!0 (select (arr!48051 a!2862) j!93)))))

(assert (= (and start!126654 res!1011036) b!1486709))

(assert (= (and b!1486709 res!1011022) b!1486710))

(assert (= (and b!1486710 res!1011025) b!1486708))

(assert (= (and b!1486708 res!1011023) b!1486700))

(assert (= (and b!1486700 res!1011032) b!1486697))

(assert (= (and b!1486697 res!1011029) b!1486713))

(assert (= (and b!1486713 res!1011030) b!1486705))

(assert (= (and b!1486705 res!1011021) b!1486703))

(assert (= (and b!1486703 res!1011024) b!1486702))

(assert (= (and b!1486702 res!1011019) b!1486712))

(assert (= (and b!1486712 res!1011033) b!1486704))

(assert (= (and b!1486704 c!137361) b!1486701))

(assert (= (and b!1486704 (not c!137361)) b!1486696))

(assert (= (and b!1486704 res!1011027) b!1486693))

(assert (= (and b!1486693 res!1011020) b!1486698))

(assert (= (and b!1486698 res!1011035) b!1486699))

(assert (= (and b!1486699 res!1011028) b!1486695))

(assert (= (and b!1486695 res!1011034) b!1486711))

(assert (= (and b!1486711 (not res!1011031)) b!1486706))

(assert (= (and b!1486706 res!1011037) b!1486707))

(assert (= (and b!1486698 (not res!1011026)) b!1486694))

(declare-fun m!1371527 () Bool)

(assert (=> b!1486702 m!1371527))

(assert (=> b!1486702 m!1371527))

(declare-fun m!1371529 () Bool)

(assert (=> b!1486702 m!1371529))

(assert (=> b!1486703 m!1371527))

(assert (=> b!1486703 m!1371527))

(declare-fun m!1371531 () Bool)

(assert (=> b!1486703 m!1371531))

(assert (=> b!1486703 m!1371531))

(assert (=> b!1486703 m!1371527))

(declare-fun m!1371533 () Bool)

(assert (=> b!1486703 m!1371533))

(declare-fun m!1371535 () Bool)

(assert (=> b!1486696 m!1371535))

(declare-fun m!1371537 () Bool)

(assert (=> b!1486696 m!1371537))

(assert (=> b!1486708 m!1371527))

(assert (=> b!1486708 m!1371527))

(declare-fun m!1371539 () Bool)

(assert (=> b!1486708 m!1371539))

(declare-fun m!1371541 () Bool)

(assert (=> b!1486697 m!1371541))

(declare-fun m!1371543 () Bool)

(assert (=> b!1486694 m!1371543))

(assert (=> b!1486699 m!1371527))

(assert (=> b!1486699 m!1371527))

(declare-fun m!1371545 () Bool)

(assert (=> b!1486699 m!1371545))

(declare-fun m!1371547 () Bool)

(assert (=> b!1486700 m!1371547))

(declare-fun m!1371549 () Bool)

(assert (=> b!1486701 m!1371549))

(declare-fun m!1371551 () Bool)

(assert (=> b!1486712 m!1371551))

(assert (=> b!1486712 m!1371551))

(declare-fun m!1371553 () Bool)

(assert (=> b!1486712 m!1371553))

(declare-fun m!1371555 () Bool)

(assert (=> b!1486712 m!1371555))

(declare-fun m!1371557 () Bool)

(assert (=> b!1486712 m!1371557))

(declare-fun m!1371559 () Bool)

(assert (=> b!1486711 m!1371559))

(assert (=> b!1486711 m!1371527))

(assert (=> b!1486711 m!1371555))

(declare-fun m!1371561 () Bool)

(assert (=> b!1486711 m!1371561))

(assert (=> b!1486705 m!1371555))

(declare-fun m!1371563 () Bool)

(assert (=> b!1486705 m!1371563))

(declare-fun m!1371565 () Bool)

(assert (=> start!126654 m!1371565))

(declare-fun m!1371567 () Bool)

(assert (=> start!126654 m!1371567))

(declare-fun m!1371569 () Bool)

(assert (=> b!1486695 m!1371569))

(assert (=> b!1486695 m!1371527))

(declare-fun m!1371571 () Bool)

(assert (=> b!1486698 m!1371571))

(assert (=> b!1486698 m!1371555))

(assert (=> b!1486698 m!1371561))

(assert (=> b!1486698 m!1371559))

(declare-fun m!1371573 () Bool)

(assert (=> b!1486698 m!1371573))

(assert (=> b!1486698 m!1371527))

(assert (=> b!1486707 m!1371537))

(assert (=> b!1486707 m!1371535))

(declare-fun m!1371575 () Bool)

(assert (=> b!1486710 m!1371575))

(assert (=> b!1486710 m!1371575))

(declare-fun m!1371577 () Bool)

(assert (=> b!1486710 m!1371577))

(check-sat (not b!1486707) (not b!1486700) (not b!1486701) (not b!1486697) (not b!1486696) (not b!1486702) (not b!1486694) (not start!126654) (not b!1486710) (not b!1486699) (not b!1486712) (not b!1486698) (not b!1486708) (not b!1486703))
(check-sat)
