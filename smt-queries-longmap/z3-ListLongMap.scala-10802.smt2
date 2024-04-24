; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126678 () Bool)

(assert start!126678)

(declare-fun b!1483734 () Bool)

(declare-fun res!1007895 () Bool)

(declare-fun e!832179 () Bool)

(assert (=> b!1483734 (=> (not res!1007895) (not e!832179))))

(declare-datatypes ((array!99535 0))(
  ( (array!99536 (arr!48040 (Array (_ BitVec 32) (_ BitVec 64))) (size!48591 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99535)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483734 (= res!1007895 (validKeyInArray!0 (select (arr!48040 a!2862) j!93)))))

(declare-fun b!1483735 () Bool)

(declare-fun res!1007905 () Bool)

(declare-fun e!832185 () Bool)

(assert (=> b!1483735 (=> (not res!1007905) (not e!832185))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12177 0))(
  ( (MissingZero!12177 (index!51100 (_ BitVec 32))) (Found!12177 (index!51101 (_ BitVec 32))) (Intermediate!12177 (undefined!12989 Bool) (index!51102 (_ BitVec 32)) (x!132869 (_ BitVec 32))) (Undefined!12177) (MissingVacant!12177 (index!51103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99535 (_ BitVec 32)) SeekEntryResult!12177)

(assert (=> b!1483735 (= res!1007905 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) (Found!12177 j!93)))))

(declare-fun res!1007901 () Bool)

(assert (=> start!126678 (=> (not res!1007901) (not e!832179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126678 (= res!1007901 (validMask!0 mask!2687))))

(assert (=> start!126678 e!832179))

(assert (=> start!126678 true))

(declare-fun array_inv!37321 (array!99535) Bool)

(assert (=> start!126678 (array_inv!37321 a!2862)))

(declare-fun b!1483736 () Bool)

(declare-fun res!1007896 () Bool)

(declare-fun e!832180 () Bool)

(assert (=> b!1483736 (=> (not res!1007896) (not e!832180))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647586 () SeekEntryResult!12177)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99535 (_ BitVec 32)) SeekEntryResult!12177)

(assert (=> b!1483736 (= res!1007896 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!647586))))

(declare-fun b!1483737 () Bool)

(declare-fun e!832184 () Bool)

(assert (=> b!1483737 (= e!832184 (not true))))

(assert (=> b!1483737 e!832185))

(declare-fun res!1007897 () Bool)

(assert (=> b!1483737 (=> (not res!1007897) (not e!832185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99535 (_ BitVec 32)) Bool)

(assert (=> b!1483737 (= res!1007897 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49727 0))(
  ( (Unit!49728) )
))
(declare-fun lt!647590 () Unit!49727)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49727)

(assert (=> b!1483737 (= lt!647590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483738 () Bool)

(declare-fun res!1007892 () Bool)

(assert (=> b!1483738 (=> (not res!1007892) (not e!832179))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483738 (= res!1007892 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48591 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48591 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48591 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483739 () Bool)

(declare-fun e!832181 () Bool)

(assert (=> b!1483739 (= e!832179 e!832181)))

(declare-fun res!1007893 () Bool)

(assert (=> b!1483739 (=> (not res!1007893) (not e!832181))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483739 (= res!1007893 (= (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647589 () array!99535)

(assert (=> b!1483739 (= lt!647589 (array!99536 (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48591 a!2862)))))

(declare-fun b!1483740 () Bool)

(declare-fun res!1007902 () Bool)

(assert (=> b!1483740 (=> (not res!1007902) (not e!832179))))

(declare-datatypes ((List!34528 0))(
  ( (Nil!34525) (Cons!34524 (h!35909 (_ BitVec 64)) (t!49214 List!34528)) )
))
(declare-fun arrayNoDuplicates!0 (array!99535 (_ BitVec 32) List!34528) Bool)

(assert (=> b!1483740 (= res!1007902 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34525))))

(declare-fun b!1483741 () Bool)

(assert (=> b!1483741 (= e!832185 (and (or (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) (select (arr!48040 a!2862) j!93))) (or (and (= (select (arr!48040 a!2862) index!646) (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48040 a!2862) index!646) (select (arr!48040 a!2862) j!93))) (= (select (arr!48040 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1483742 () Bool)

(declare-fun res!1007894 () Bool)

(assert (=> b!1483742 (=> (not res!1007894) (not e!832179))))

(assert (=> b!1483742 (= res!1007894 (validKeyInArray!0 (select (arr!48040 a!2862) i!1006)))))

(declare-fun b!1483743 () Bool)

(declare-fun res!1007904 () Bool)

(assert (=> b!1483743 (=> (not res!1007904) (not e!832184))))

(declare-fun e!832182 () Bool)

(assert (=> b!1483743 (= res!1007904 e!832182)))

(declare-fun c!137452 () Bool)

(assert (=> b!1483743 (= c!137452 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483744 () Bool)

(assert (=> b!1483744 (= e!832181 e!832180)))

(declare-fun res!1007900 () Bool)

(assert (=> b!1483744 (=> (not res!1007900) (not e!832180))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483744 (= res!1007900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!647586))))

(assert (=> b!1483744 (= lt!647586 (Intermediate!12177 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483745 () Bool)

(declare-fun res!1007898 () Bool)

(assert (=> b!1483745 (=> (not res!1007898) (not e!832179))))

(assert (=> b!1483745 (= res!1007898 (and (= (size!48591 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48591 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48591 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483746 () Bool)

(declare-fun res!1007906 () Bool)

(assert (=> b!1483746 (=> (not res!1007906) (not e!832184))))

(assert (=> b!1483746 (= res!1007906 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483747 () Bool)

(assert (=> b!1483747 (= e!832180 e!832184)))

(declare-fun res!1007903 () Bool)

(assert (=> b!1483747 (=> (not res!1007903) (not e!832184))))

(declare-fun lt!647588 () SeekEntryResult!12177)

(assert (=> b!1483747 (= res!1007903 (= lt!647588 (Intermediate!12177 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647587 () (_ BitVec 64))

(assert (=> b!1483747 (= lt!647588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647587 mask!2687) lt!647587 lt!647589 mask!2687))))

(assert (=> b!1483747 (= lt!647587 (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483748 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99535 (_ BitVec 32)) SeekEntryResult!12177)

(assert (=> b!1483748 (= e!832182 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647587 lt!647589 mask!2687) (seekEntryOrOpen!0 lt!647587 lt!647589 mask!2687)))))

(declare-fun b!1483749 () Bool)

(assert (=> b!1483749 (= e!832182 (= lt!647588 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647587 lt!647589 mask!2687)))))

(declare-fun b!1483750 () Bool)

(declare-fun res!1007899 () Bool)

(assert (=> b!1483750 (=> (not res!1007899) (not e!832179))))

(assert (=> b!1483750 (= res!1007899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126678 res!1007901) b!1483745))

(assert (= (and b!1483745 res!1007898) b!1483742))

(assert (= (and b!1483742 res!1007894) b!1483734))

(assert (= (and b!1483734 res!1007895) b!1483750))

(assert (= (and b!1483750 res!1007899) b!1483740))

(assert (= (and b!1483740 res!1007902) b!1483738))

(assert (= (and b!1483738 res!1007892) b!1483739))

(assert (= (and b!1483739 res!1007893) b!1483744))

(assert (= (and b!1483744 res!1007900) b!1483736))

(assert (= (and b!1483736 res!1007896) b!1483747))

(assert (= (and b!1483747 res!1007903) b!1483743))

(assert (= (and b!1483743 c!137452) b!1483749))

(assert (= (and b!1483743 (not c!137452)) b!1483748))

(assert (= (and b!1483743 res!1007904) b!1483746))

(assert (= (and b!1483746 res!1007906) b!1483737))

(assert (= (and b!1483737 res!1007897) b!1483735))

(assert (= (and b!1483735 res!1007905) b!1483741))

(declare-fun m!1369441 () Bool)

(assert (=> b!1483748 m!1369441))

(declare-fun m!1369443 () Bool)

(assert (=> b!1483748 m!1369443))

(declare-fun m!1369445 () Bool)

(assert (=> b!1483750 m!1369445))

(declare-fun m!1369447 () Bool)

(assert (=> b!1483734 m!1369447))

(assert (=> b!1483734 m!1369447))

(declare-fun m!1369449 () Bool)

(assert (=> b!1483734 m!1369449))

(declare-fun m!1369451 () Bool)

(assert (=> b!1483747 m!1369451))

(assert (=> b!1483747 m!1369451))

(declare-fun m!1369453 () Bool)

(assert (=> b!1483747 m!1369453))

(declare-fun m!1369455 () Bool)

(assert (=> b!1483747 m!1369455))

(declare-fun m!1369457 () Bool)

(assert (=> b!1483747 m!1369457))

(assert (=> b!1483735 m!1369447))

(assert (=> b!1483735 m!1369447))

(declare-fun m!1369459 () Bool)

(assert (=> b!1483735 m!1369459))

(declare-fun m!1369461 () Bool)

(assert (=> b!1483737 m!1369461))

(declare-fun m!1369463 () Bool)

(assert (=> b!1483737 m!1369463))

(declare-fun m!1369465 () Bool)

(assert (=> b!1483742 m!1369465))

(assert (=> b!1483742 m!1369465))

(declare-fun m!1369467 () Bool)

(assert (=> b!1483742 m!1369467))

(assert (=> b!1483736 m!1369447))

(assert (=> b!1483736 m!1369447))

(declare-fun m!1369469 () Bool)

(assert (=> b!1483736 m!1369469))

(declare-fun m!1369471 () Bool)

(assert (=> b!1483740 m!1369471))

(declare-fun m!1369473 () Bool)

(assert (=> b!1483749 m!1369473))

(assert (=> b!1483739 m!1369455))

(declare-fun m!1369475 () Bool)

(assert (=> b!1483739 m!1369475))

(assert (=> b!1483741 m!1369455))

(declare-fun m!1369477 () Bool)

(assert (=> b!1483741 m!1369477))

(declare-fun m!1369479 () Bool)

(assert (=> b!1483741 m!1369479))

(declare-fun m!1369481 () Bool)

(assert (=> b!1483741 m!1369481))

(assert (=> b!1483741 m!1369447))

(declare-fun m!1369483 () Bool)

(assert (=> start!126678 m!1369483))

(declare-fun m!1369485 () Bool)

(assert (=> start!126678 m!1369485))

(assert (=> b!1483744 m!1369447))

(assert (=> b!1483744 m!1369447))

(declare-fun m!1369487 () Bool)

(assert (=> b!1483744 m!1369487))

(assert (=> b!1483744 m!1369487))

(assert (=> b!1483744 m!1369447))

(declare-fun m!1369489 () Bool)

(assert (=> b!1483744 m!1369489))

(check-sat (not b!1483750) (not b!1483748) (not b!1483740) (not b!1483742) (not b!1483735) (not b!1483737) (not b!1483749) (not b!1483744) (not b!1483736) (not b!1483734) (not b!1483747) (not start!126678))
(check-sat)
