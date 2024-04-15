; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126464 () Bool)

(assert start!126464)

(declare-fun b!1483612 () Bool)

(declare-fun res!1008670 () Bool)

(declare-fun e!831836 () Bool)

(assert (=> b!1483612 (=> (not res!1008670) (not e!831836))))

(declare-fun e!831831 () Bool)

(assert (=> b!1483612 (= res!1008670 e!831831)))

(declare-fun c!137002 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483612 (= c!137002 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647305 () (_ BitVec 64))

(declare-datatypes ((array!99424 0))(
  ( (array!99425 (arr!47989 (Array (_ BitVec 32) (_ BitVec 64))) (size!48541 (_ BitVec 32))) )
))
(declare-fun lt!647309 () array!99424)

(declare-fun e!831838 () Bool)

(declare-fun b!1483613 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12254 0))(
  ( (MissingZero!12254 (index!51408 (_ BitVec 32))) (Found!12254 (index!51409 (_ BitVec 32))) (Intermediate!12254 (undefined!13066 Bool) (index!51410 (_ BitVec 32)) (x!132987 (_ BitVec 32))) (Undefined!12254) (MissingVacant!12254 (index!51411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12254)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12254)

(assert (=> b!1483613 (= e!831838 (= (seekEntryOrOpen!0 lt!647305 lt!647309 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647305 lt!647309 mask!2687)))))

(declare-fun b!1483614 () Bool)

(declare-fun e!831837 () Bool)

(assert (=> b!1483614 (= e!831837 true)))

(declare-fun lt!647307 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483614 (= lt!647307 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483615 () Bool)

(assert (=> b!1483615 (= e!831831 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647305 lt!647309 mask!2687) (seekEntryOrOpen!0 lt!647305 lt!647309 mask!2687)))))

(declare-fun b!1483616 () Bool)

(declare-fun res!1008674 () Bool)

(declare-fun e!831834 () Bool)

(assert (=> b!1483616 (=> (not res!1008674) (not e!831834))))

(declare-fun a!2862 () array!99424)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99424 (_ BitVec 32)) Bool)

(assert (=> b!1483616 (= res!1008674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483617 () Bool)

(declare-fun res!1008671 () Bool)

(declare-fun e!831833 () Bool)

(assert (=> b!1483617 (=> (not res!1008671) (not e!831833))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483617 (= res!1008671 (or (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) (select (arr!47989 a!2862) j!93))))))

(declare-fun b!1483618 () Bool)

(declare-fun e!831830 () Bool)

(assert (=> b!1483618 (= e!831830 e!831838)))

(declare-fun res!1008672 () Bool)

(assert (=> b!1483618 (=> (not res!1008672) (not e!831838))))

(declare-fun lt!647303 () (_ BitVec 64))

(assert (=> b!1483618 (= res!1008672 (and (= index!646 intermediateAfterIndex!19) (= lt!647303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483620 () Bool)

(declare-fun e!831839 () Bool)

(assert (=> b!1483620 (= e!831839 e!831836)))

(declare-fun res!1008675 () Bool)

(assert (=> b!1483620 (=> (not res!1008675) (not e!831836))))

(declare-fun lt!647306 () SeekEntryResult!12254)

(assert (=> b!1483620 (= res!1008675 (= lt!647306 (Intermediate!12254 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483620 (= lt!647306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647305 mask!2687) lt!647305 lt!647309 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483620 (= lt!647305 (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483621 () Bool)

(declare-fun res!1008669 () Bool)

(assert (=> b!1483621 (=> (not res!1008669) (not e!831839))))

(declare-fun lt!647304 () SeekEntryResult!12254)

(assert (=> b!1483621 (= res!1008669 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!647304))))

(declare-fun b!1483622 () Bool)

(declare-fun res!1008662 () Bool)

(assert (=> b!1483622 (=> (not res!1008662) (not e!831834))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483622 (= res!1008662 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48541 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48541 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48541 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483623 () Bool)

(declare-fun res!1008665 () Bool)

(assert (=> b!1483623 (=> (not res!1008665) (not e!831833))))

(assert (=> b!1483623 (= res!1008665 (= (seekEntryOrOpen!0 (select (arr!47989 a!2862) j!93) a!2862 mask!2687) (Found!12254 j!93)))))

(declare-fun b!1483624 () Bool)

(declare-fun res!1008664 () Bool)

(assert (=> b!1483624 (=> (not res!1008664) (not e!831836))))

(assert (=> b!1483624 (= res!1008664 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483625 () Bool)

(declare-fun e!831835 () Bool)

(assert (=> b!1483625 (= e!831834 e!831835)))

(declare-fun res!1008661 () Bool)

(assert (=> b!1483625 (=> (not res!1008661) (not e!831835))))

(assert (=> b!1483625 (= res!1008661 (= (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483625 (= lt!647309 (array!99425 (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48541 a!2862)))))

(declare-fun b!1483626 () Bool)

(assert (=> b!1483626 (= e!831836 (not e!831837))))

(declare-fun res!1008659 () Bool)

(assert (=> b!1483626 (=> res!1008659 e!831837)))

(assert (=> b!1483626 (= res!1008659 (or (and (= (select (arr!47989 a!2862) index!646) (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47989 a!2862) index!646) (select (arr!47989 a!2862) j!93))) (= (select (arr!47989 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483626 e!831833))

(declare-fun res!1008666 () Bool)

(assert (=> b!1483626 (=> (not res!1008666) (not e!831833))))

(assert (=> b!1483626 (= res!1008666 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49689 0))(
  ( (Unit!49690) )
))
(declare-fun lt!647308 () Unit!49689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49689)

(assert (=> b!1483626 (= lt!647308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483627 () Bool)

(assert (=> b!1483627 (= e!831833 e!831830)))

(declare-fun res!1008673 () Bool)

(assert (=> b!1483627 (=> res!1008673 e!831830)))

(assert (=> b!1483627 (= res!1008673 (or (and (= (select (arr!47989 a!2862) index!646) lt!647303) (= (select (arr!47989 a!2862) index!646) (select (arr!47989 a!2862) j!93))) (= (select (arr!47989 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483627 (= lt!647303 (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483628 () Bool)

(declare-fun res!1008663 () Bool)

(assert (=> b!1483628 (=> (not res!1008663) (not e!831834))))

(declare-datatypes ((List!34568 0))(
  ( (Nil!34565) (Cons!34564 (h!35938 (_ BitVec 64)) (t!49254 List!34568)) )
))
(declare-fun arrayNoDuplicates!0 (array!99424 (_ BitVec 32) List!34568) Bool)

(assert (=> b!1483628 (= res!1008663 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34565))))

(declare-fun b!1483629 () Bool)

(declare-fun res!1008668 () Bool)

(assert (=> b!1483629 (=> (not res!1008668) (not e!831834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483629 (= res!1008668 (validKeyInArray!0 (select (arr!47989 a!2862) i!1006)))))

(declare-fun b!1483630 () Bool)

(declare-fun res!1008660 () Bool)

(assert (=> b!1483630 (=> (not res!1008660) (not e!831834))))

(assert (=> b!1483630 (= res!1008660 (validKeyInArray!0 (select (arr!47989 a!2862) j!93)))))

(declare-fun b!1483631 () Bool)

(assert (=> b!1483631 (= e!831835 e!831839)))

(declare-fun res!1008667 () Bool)

(assert (=> b!1483631 (=> (not res!1008667) (not e!831839))))

(assert (=> b!1483631 (= res!1008667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47989 a!2862) j!93) mask!2687) (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!647304))))

(assert (=> b!1483631 (= lt!647304 (Intermediate!12254 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483632 () Bool)

(declare-fun res!1008676 () Bool)

(assert (=> b!1483632 (=> (not res!1008676) (not e!831834))))

(assert (=> b!1483632 (= res!1008676 (and (= (size!48541 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48541 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48541 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1008658 () Bool)

(assert (=> start!126464 (=> (not res!1008658) (not e!831834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126464 (= res!1008658 (validMask!0 mask!2687))))

(assert (=> start!126464 e!831834))

(assert (=> start!126464 true))

(declare-fun array_inv!37222 (array!99424) Bool)

(assert (=> start!126464 (array_inv!37222 a!2862)))

(declare-fun b!1483619 () Bool)

(assert (=> b!1483619 (= e!831831 (= lt!647306 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647305 lt!647309 mask!2687)))))

(assert (= (and start!126464 res!1008658) b!1483632))

(assert (= (and b!1483632 res!1008676) b!1483629))

(assert (= (and b!1483629 res!1008668) b!1483630))

(assert (= (and b!1483630 res!1008660) b!1483616))

(assert (= (and b!1483616 res!1008674) b!1483628))

(assert (= (and b!1483628 res!1008663) b!1483622))

(assert (= (and b!1483622 res!1008662) b!1483625))

(assert (= (and b!1483625 res!1008661) b!1483631))

(assert (= (and b!1483631 res!1008667) b!1483621))

(assert (= (and b!1483621 res!1008669) b!1483620))

(assert (= (and b!1483620 res!1008675) b!1483612))

(assert (= (and b!1483612 c!137002) b!1483619))

(assert (= (and b!1483612 (not c!137002)) b!1483615))

(assert (= (and b!1483612 res!1008670) b!1483624))

(assert (= (and b!1483624 res!1008664) b!1483626))

(assert (= (and b!1483626 res!1008666) b!1483623))

(assert (= (and b!1483623 res!1008665) b!1483617))

(assert (= (and b!1483617 res!1008671) b!1483627))

(assert (= (and b!1483627 (not res!1008673)) b!1483618))

(assert (= (and b!1483618 res!1008672) b!1483613))

(assert (= (and b!1483626 (not res!1008659)) b!1483614))

(declare-fun m!1368465 () Bool)

(assert (=> b!1483631 m!1368465))

(assert (=> b!1483631 m!1368465))

(declare-fun m!1368467 () Bool)

(assert (=> b!1483631 m!1368467))

(assert (=> b!1483631 m!1368467))

(assert (=> b!1483631 m!1368465))

(declare-fun m!1368469 () Bool)

(assert (=> b!1483631 m!1368469))

(declare-fun m!1368471 () Bool)

(assert (=> b!1483613 m!1368471))

(declare-fun m!1368473 () Bool)

(assert (=> b!1483613 m!1368473))

(declare-fun m!1368475 () Bool)

(assert (=> b!1483629 m!1368475))

(assert (=> b!1483629 m!1368475))

(declare-fun m!1368477 () Bool)

(assert (=> b!1483629 m!1368477))

(declare-fun m!1368479 () Bool)

(assert (=> b!1483626 m!1368479))

(declare-fun m!1368481 () Bool)

(assert (=> b!1483626 m!1368481))

(declare-fun m!1368483 () Bool)

(assert (=> b!1483626 m!1368483))

(declare-fun m!1368485 () Bool)

(assert (=> b!1483626 m!1368485))

(declare-fun m!1368487 () Bool)

(assert (=> b!1483626 m!1368487))

(assert (=> b!1483626 m!1368465))

(declare-fun m!1368489 () Bool)

(assert (=> b!1483628 m!1368489))

(assert (=> b!1483627 m!1368485))

(assert (=> b!1483627 m!1368465))

(assert (=> b!1483627 m!1368481))

(assert (=> b!1483627 m!1368483))

(assert (=> b!1483623 m!1368465))

(assert (=> b!1483623 m!1368465))

(declare-fun m!1368491 () Bool)

(assert (=> b!1483623 m!1368491))

(declare-fun m!1368493 () Bool)

(assert (=> b!1483614 m!1368493))

(declare-fun m!1368495 () Bool)

(assert (=> b!1483617 m!1368495))

(assert (=> b!1483617 m!1368465))

(assert (=> b!1483630 m!1368465))

(assert (=> b!1483630 m!1368465))

(declare-fun m!1368497 () Bool)

(assert (=> b!1483630 m!1368497))

(assert (=> b!1483621 m!1368465))

(assert (=> b!1483621 m!1368465))

(declare-fun m!1368499 () Bool)

(assert (=> b!1483621 m!1368499))

(declare-fun m!1368501 () Bool)

(assert (=> b!1483620 m!1368501))

(assert (=> b!1483620 m!1368501))

(declare-fun m!1368503 () Bool)

(assert (=> b!1483620 m!1368503))

(assert (=> b!1483620 m!1368481))

(declare-fun m!1368505 () Bool)

(assert (=> b!1483620 m!1368505))

(declare-fun m!1368507 () Bool)

(assert (=> start!126464 m!1368507))

(declare-fun m!1368509 () Bool)

(assert (=> start!126464 m!1368509))

(assert (=> b!1483615 m!1368473))

(assert (=> b!1483615 m!1368471))

(declare-fun m!1368511 () Bool)

(assert (=> b!1483616 m!1368511))

(declare-fun m!1368513 () Bool)

(assert (=> b!1483619 m!1368513))

(assert (=> b!1483625 m!1368481))

(declare-fun m!1368515 () Bool)

(assert (=> b!1483625 m!1368515))

(check-sat (not b!1483623) (not b!1483630) (not b!1483620) (not b!1483616) (not start!126464) (not b!1483629) (not b!1483619) (not b!1483631) (not b!1483614) (not b!1483615) (not b!1483621) (not b!1483626) (not b!1483613) (not b!1483628))
(check-sat)
