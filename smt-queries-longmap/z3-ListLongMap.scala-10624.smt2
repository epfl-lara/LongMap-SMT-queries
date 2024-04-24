; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125100 () Bool)

(assert start!125100)

(declare-fun b!1451730 () Bool)

(declare-fun res!982249 () Bool)

(declare-fun e!817570 () Bool)

(assert (=> b!1451730 (=> (not res!982249) (not e!817570))))

(declare-datatypes ((SeekEntryResult!11655 0))(
  ( (MissingZero!11655 (index!49012 (_ BitVec 32))) (Found!11655 (index!49013 (_ BitVec 32))) (Intermediate!11655 (undefined!12467 Bool) (index!49014 (_ BitVec 32)) (x!130848 (_ BitVec 32))) (Undefined!11655) (MissingVacant!11655 (index!49015 (_ BitVec 32))) )
))
(declare-fun lt!636759 () SeekEntryResult!11655)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98443 0))(
  ( (array!98444 (arr!47506 (Array (_ BitVec 32) (_ BitVec 64))) (size!48057 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98443)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98443 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1451730 (= res!982249 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!636759))))

(declare-fun b!1451731 () Bool)

(declare-fun e!817563 () Bool)

(assert (=> b!1451731 (= e!817563 e!817570)))

(declare-fun res!982261 () Bool)

(assert (=> b!1451731 (=> (not res!982261) (not e!817570))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451731 (= res!982261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47506 a!2862) j!93) mask!2687) (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!636759))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451731 (= lt!636759 (Intermediate!11655 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451732 () Bool)

(declare-fun res!982258 () Bool)

(declare-fun e!817569 () Bool)

(assert (=> b!1451732 (=> (not res!982258) (not e!817569))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451732 (= res!982258 (validKeyInArray!0 (select (arr!47506 a!2862) i!1006)))))

(declare-fun b!1451733 () Bool)

(declare-fun e!817572 () Bool)

(declare-fun e!817568 () Bool)

(assert (=> b!1451733 (= e!817572 e!817568)))

(declare-fun res!982257 () Bool)

(assert (=> b!1451733 (=> res!982257 e!817568)))

(assert (=> b!1451733 (= res!982257 (or (and (= (select (arr!47506 a!2862) index!646) (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (not (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451734 () Bool)

(declare-fun res!982253 () Bool)

(assert (=> b!1451734 (=> (not res!982253) (not e!817569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98443 (_ BitVec 32)) Bool)

(assert (=> b!1451734 (= res!982253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451735 () Bool)

(declare-fun res!982262 () Bool)

(assert (=> b!1451735 (=> (not res!982262) (not e!817569))))

(assert (=> b!1451735 (= res!982262 (and (= (size!48057 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48057 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48057 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451736 () Bool)

(declare-fun res!982251 () Bool)

(assert (=> b!1451736 (=> (not res!982251) (not e!817569))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451736 (= res!982251 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48057 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48057 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48057 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451737 () Bool)

(declare-fun e!817567 () Bool)

(assert (=> b!1451737 (= e!817567 true)))

(declare-fun lt!636763 () (_ BitVec 64))

(declare-fun lt!636756 () SeekEntryResult!11655)

(declare-fun lt!636760 () array!98443)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98443 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1451737 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636763 lt!636760 mask!2687) lt!636756)))

(declare-datatypes ((Unit!48839 0))(
  ( (Unit!48840) )
))
(declare-fun lt!636757 () Unit!48839)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48839)

(assert (=> b!1451737 (= lt!636757 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun res!982263 () Bool)

(assert (=> start!125100 (=> (not res!982263) (not e!817569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125100 (= res!982263 (validMask!0 mask!2687))))

(assert (=> start!125100 e!817569))

(assert (=> start!125100 true))

(declare-fun array_inv!36787 (array!98443) Bool)

(assert (=> start!125100 (array_inv!36787 a!2862)))

(declare-fun b!1451738 () Bool)

(declare-fun res!982259 () Bool)

(assert (=> b!1451738 (=> (not res!982259) (not e!817569))))

(declare-datatypes ((List!33994 0))(
  ( (Nil!33991) (Cons!33990 (h!35351 (_ BitVec 64)) (t!48680 List!33994)) )
))
(declare-fun arrayNoDuplicates!0 (array!98443 (_ BitVec 32) List!33994) Bool)

(assert (=> b!1451738 (= res!982259 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33991))))

(declare-fun b!1451739 () Bool)

(declare-fun e!817571 () Bool)

(assert (=> b!1451739 (= e!817570 e!817571)))

(declare-fun res!982264 () Bool)

(assert (=> b!1451739 (=> (not res!982264) (not e!817571))))

(declare-fun lt!636758 () SeekEntryResult!11655)

(assert (=> b!1451739 (= res!982264 (= lt!636758 (Intermediate!11655 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451739 (= lt!636758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636763 mask!2687) lt!636763 lt!636760 mask!2687))))

(assert (=> b!1451739 (= lt!636763 (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!817565 () Bool)

(declare-fun b!1451740 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98443 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1451740 (= e!817565 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636763 lt!636760 mask!2687) (seekEntryOrOpen!0 lt!636763 lt!636760 mask!2687)))))

(declare-fun b!1451741 () Bool)

(declare-fun res!982254 () Bool)

(assert (=> b!1451741 (=> res!982254 e!817567)))

(assert (=> b!1451741 (= res!982254 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!636756)))))

(declare-fun b!1451742 () Bool)

(declare-fun res!982255 () Bool)

(assert (=> b!1451742 (=> (not res!982255) (not e!817571))))

(assert (=> b!1451742 (= res!982255 e!817565)))

(declare-fun c!134260 () Bool)

(assert (=> b!1451742 (= c!134260 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451743 () Bool)

(assert (=> b!1451743 (= e!817569 e!817563)))

(declare-fun res!982252 () Bool)

(assert (=> b!1451743 (=> (not res!982252) (not e!817563))))

(assert (=> b!1451743 (= res!982252 (= (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451743 (= lt!636760 (array!98444 (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48057 a!2862)))))

(declare-fun e!817566 () Bool)

(declare-fun b!1451744 () Bool)

(assert (=> b!1451744 (= e!817566 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451745 () Bool)

(assert (=> b!1451745 (= e!817571 (not e!817567))))

(declare-fun res!982250 () Bool)

(assert (=> b!1451745 (=> res!982250 e!817567)))

(assert (=> b!1451745 (= res!982250 (or (and (= (select (arr!47506 a!2862) index!646) (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (not (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1451745 e!817572))

(declare-fun res!982256 () Bool)

(assert (=> b!1451745 (=> (not res!982256) (not e!817572))))

(declare-fun lt!636761 () SeekEntryResult!11655)

(assert (=> b!1451745 (= res!982256 (and (= lt!636761 lt!636756) (or (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) (select (arr!47506 a!2862) j!93)))))))

(assert (=> b!1451745 (= lt!636756 (Found!11655 j!93))))

(assert (=> b!1451745 (= lt!636761 (seekEntryOrOpen!0 (select (arr!47506 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1451745 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636762 () Unit!48839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48839)

(assert (=> b!1451745 (= lt!636762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451746 () Bool)

(assert (=> b!1451746 (= e!817568 e!817566)))

(declare-fun res!982248 () Bool)

(assert (=> b!1451746 (=> (not res!982248) (not e!817566))))

(assert (=> b!1451746 (= res!982248 (= lt!636761 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47506 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451747 () Bool)

(declare-fun res!982265 () Bool)

(assert (=> b!1451747 (=> (not res!982265) (not e!817571))))

(assert (=> b!1451747 (= res!982265 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451748 () Bool)

(declare-fun res!982260 () Bool)

(assert (=> b!1451748 (=> (not res!982260) (not e!817569))))

(assert (=> b!1451748 (= res!982260 (validKeyInArray!0 (select (arr!47506 a!2862) j!93)))))

(declare-fun b!1451749 () Bool)

(assert (=> b!1451749 (= e!817565 (= lt!636758 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636763 lt!636760 mask!2687)))))

(assert (= (and start!125100 res!982263) b!1451735))

(assert (= (and b!1451735 res!982262) b!1451732))

(assert (= (and b!1451732 res!982258) b!1451748))

(assert (= (and b!1451748 res!982260) b!1451734))

(assert (= (and b!1451734 res!982253) b!1451738))

(assert (= (and b!1451738 res!982259) b!1451736))

(assert (= (and b!1451736 res!982251) b!1451743))

(assert (= (and b!1451743 res!982252) b!1451731))

(assert (= (and b!1451731 res!982261) b!1451730))

(assert (= (and b!1451730 res!982249) b!1451739))

(assert (= (and b!1451739 res!982264) b!1451742))

(assert (= (and b!1451742 c!134260) b!1451749))

(assert (= (and b!1451742 (not c!134260)) b!1451740))

(assert (= (and b!1451742 res!982255) b!1451747))

(assert (= (and b!1451747 res!982265) b!1451745))

(assert (= (and b!1451745 res!982256) b!1451733))

(assert (= (and b!1451733 (not res!982257)) b!1451746))

(assert (= (and b!1451746 res!982248) b!1451744))

(assert (= (and b!1451745 (not res!982250)) b!1451741))

(assert (= (and b!1451741 (not res!982254)) b!1451737))

(declare-fun m!1340491 () Bool)

(assert (=> b!1451740 m!1340491))

(declare-fun m!1340493 () Bool)

(assert (=> b!1451740 m!1340493))

(assert (=> b!1451737 m!1340491))

(declare-fun m!1340495 () Bool)

(assert (=> b!1451737 m!1340495))

(declare-fun m!1340497 () Bool)

(assert (=> b!1451739 m!1340497))

(assert (=> b!1451739 m!1340497))

(declare-fun m!1340499 () Bool)

(assert (=> b!1451739 m!1340499))

(declare-fun m!1340501 () Bool)

(assert (=> b!1451739 m!1340501))

(declare-fun m!1340503 () Bool)

(assert (=> b!1451739 m!1340503))

(declare-fun m!1340505 () Bool)

(assert (=> b!1451746 m!1340505))

(assert (=> b!1451746 m!1340505))

(declare-fun m!1340507 () Bool)

(assert (=> b!1451746 m!1340507))

(declare-fun m!1340509 () Bool)

(assert (=> b!1451732 m!1340509))

(assert (=> b!1451732 m!1340509))

(declare-fun m!1340511 () Bool)

(assert (=> b!1451732 m!1340511))

(assert (=> b!1451741 m!1340505))

(assert (=> b!1451741 m!1340505))

(declare-fun m!1340513 () Bool)

(assert (=> b!1451741 m!1340513))

(declare-fun m!1340515 () Bool)

(assert (=> start!125100 m!1340515))

(declare-fun m!1340517 () Bool)

(assert (=> start!125100 m!1340517))

(declare-fun m!1340519 () Bool)

(assert (=> b!1451738 m!1340519))

(declare-fun m!1340521 () Bool)

(assert (=> b!1451733 m!1340521))

(assert (=> b!1451733 m!1340501))

(declare-fun m!1340523 () Bool)

(assert (=> b!1451733 m!1340523))

(assert (=> b!1451733 m!1340505))

(assert (=> b!1451748 m!1340505))

(assert (=> b!1451748 m!1340505))

(declare-fun m!1340525 () Bool)

(assert (=> b!1451748 m!1340525))

(assert (=> b!1451743 m!1340501))

(declare-fun m!1340527 () Bool)

(assert (=> b!1451743 m!1340527))

(declare-fun m!1340529 () Bool)

(assert (=> b!1451734 m!1340529))

(declare-fun m!1340531 () Bool)

(assert (=> b!1451749 m!1340531))

(assert (=> b!1451731 m!1340505))

(assert (=> b!1451731 m!1340505))

(declare-fun m!1340533 () Bool)

(assert (=> b!1451731 m!1340533))

(assert (=> b!1451731 m!1340533))

(assert (=> b!1451731 m!1340505))

(declare-fun m!1340535 () Bool)

(assert (=> b!1451731 m!1340535))

(assert (=> b!1451730 m!1340505))

(assert (=> b!1451730 m!1340505))

(declare-fun m!1340537 () Bool)

(assert (=> b!1451730 m!1340537))

(declare-fun m!1340539 () Bool)

(assert (=> b!1451745 m!1340539))

(assert (=> b!1451745 m!1340501))

(declare-fun m!1340541 () Bool)

(assert (=> b!1451745 m!1340541))

(assert (=> b!1451745 m!1340523))

(assert (=> b!1451745 m!1340521))

(assert (=> b!1451745 m!1340505))

(declare-fun m!1340543 () Bool)

(assert (=> b!1451745 m!1340543))

(declare-fun m!1340545 () Bool)

(assert (=> b!1451745 m!1340545))

(assert (=> b!1451745 m!1340505))

(check-sat (not b!1451738) (not b!1451731) (not b!1451734) (not b!1451741) (not b!1451749) (not start!125100) (not b!1451730) (not b!1451732) (not b!1451739) (not b!1451740) (not b!1451746) (not b!1451748) (not b!1451737) (not b!1451745))
(check-sat)
