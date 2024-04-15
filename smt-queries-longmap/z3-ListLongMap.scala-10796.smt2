; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126314 () Bool)

(assert start!126314)

(declare-fun e!830511 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1480739 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646379 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12209 0))(
  ( (MissingZero!12209 (index!51228 (_ BitVec 32))) (Found!12209 (index!51229 (_ BitVec 32))) (Intermediate!12209 (undefined!13021 Bool) (index!51230 (_ BitVec 32)) (x!132813 (_ BitVec 32))) (Undefined!12209) (MissingVacant!12209 (index!51231 (_ BitVec 32))) )
))
(declare-fun lt!646376 () SeekEntryResult!12209)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99331 0))(
  ( (array!99332 (arr!47944 (Array (_ BitVec 32) (_ BitVec 64))) (size!48496 (_ BitVec 32))) )
))
(declare-fun lt!646377 () array!99331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99331 (_ BitVec 32)) SeekEntryResult!12209)

(assert (=> b!1480739 (= e!830511 (= lt!646376 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646379 lt!646377 mask!2687)))))

(declare-fun b!1480740 () Bool)

(declare-fun res!1006331 () Bool)

(declare-fun e!830510 () Bool)

(assert (=> b!1480740 (=> (not res!1006331) (not e!830510))))

(declare-fun a!2862 () array!99331)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480740 (= res!1006331 (validKeyInArray!0 (select (arr!47944 a!2862) i!1006)))))

(declare-fun b!1480741 () Bool)

(declare-fun res!1006339 () Bool)

(declare-fun e!830516 () Bool)

(assert (=> b!1480741 (=> (not res!1006339) (not e!830516))))

(assert (=> b!1480741 (= res!1006339 e!830511)))

(declare-fun c!136729 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480741 (= c!136729 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480742 () Bool)

(declare-fun res!1006333 () Bool)

(declare-fun e!830513 () Bool)

(assert (=> b!1480742 (=> (not res!1006333) (not e!830513))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!646378 () SeekEntryResult!12209)

(assert (=> b!1480742 (= res!1006333 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!646378))))

(declare-fun b!1480743 () Bool)

(declare-fun res!1006332 () Bool)

(assert (=> b!1480743 (=> (not res!1006332) (not e!830510))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1480743 (= res!1006332 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48496 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48496 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48496 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480744 () Bool)

(declare-fun res!1006338 () Bool)

(declare-fun e!830515 () Bool)

(assert (=> b!1480744 (=> (not res!1006338) (not e!830515))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99331 (_ BitVec 32)) SeekEntryResult!12209)

(assert (=> b!1480744 (= res!1006338 (= (seekEntryOrOpen!0 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) (Found!12209 j!93)))))

(declare-fun b!1480745 () Bool)

(assert (=> b!1480745 (= e!830513 e!830516)))

(declare-fun res!1006330 () Bool)

(assert (=> b!1480745 (=> (not res!1006330) (not e!830516))))

(assert (=> b!1480745 (= res!1006330 (= lt!646376 (Intermediate!12209 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480745 (= lt!646376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646379 mask!2687) lt!646379 lt!646377 mask!2687))))

(assert (=> b!1480745 (= lt!646379 (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480746 () Bool)

(declare-fun e!830512 () Bool)

(assert (=> b!1480746 (= e!830512 e!830513)))

(declare-fun res!1006328 () Bool)

(assert (=> b!1480746 (=> (not res!1006328) (not e!830513))))

(assert (=> b!1480746 (= res!1006328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!646378))))

(assert (=> b!1480746 (= lt!646378 (Intermediate!12209 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480747 () Bool)

(declare-fun res!1006342 () Bool)

(assert (=> b!1480747 (=> (not res!1006342) (not e!830510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99331 (_ BitVec 32)) Bool)

(assert (=> b!1480747 (= res!1006342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480748 () Bool)

(declare-fun res!1006335 () Bool)

(assert (=> b!1480748 (=> (not res!1006335) (not e!830516))))

(assert (=> b!1480748 (= res!1006335 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480749 () Bool)

(declare-fun res!1006337 () Bool)

(assert (=> b!1480749 (=> (not res!1006337) (not e!830510))))

(assert (=> b!1480749 (= res!1006337 (and (= (size!48496 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48496 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48496 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480750 () Bool)

(assert (=> b!1480750 (= e!830510 e!830512)))

(declare-fun res!1006341 () Bool)

(assert (=> b!1480750 (=> (not res!1006341) (not e!830512))))

(assert (=> b!1480750 (= res!1006341 (= (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480750 (= lt!646377 (array!99332 (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48496 a!2862)))))

(declare-fun res!1006340 () Bool)

(assert (=> start!126314 (=> (not res!1006340) (not e!830510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126314 (= res!1006340 (validMask!0 mask!2687))))

(assert (=> start!126314 e!830510))

(assert (=> start!126314 true))

(declare-fun array_inv!37177 (array!99331) Bool)

(assert (=> start!126314 (array_inv!37177 a!2862)))

(declare-fun b!1480751 () Bool)

(assert (=> b!1480751 (= e!830516 (not true))))

(assert (=> b!1480751 e!830515))

(declare-fun res!1006336 () Bool)

(assert (=> b!1480751 (=> (not res!1006336) (not e!830515))))

(assert (=> b!1480751 (= res!1006336 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49599 0))(
  ( (Unit!49600) )
))
(declare-fun lt!646375 () Unit!49599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49599)

(assert (=> b!1480751 (= lt!646375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480752 () Bool)

(assert (=> b!1480752 (= e!830515 (and (or (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) (select (arr!47944 a!2862) j!93))) (or (and (= (select (arr!47944 a!2862) index!646) (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47944 a!2862) index!646) (select (arr!47944 a!2862) j!93))) (= (select (arr!47944 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1480753 () Bool)

(declare-fun res!1006334 () Bool)

(assert (=> b!1480753 (=> (not res!1006334) (not e!830510))))

(assert (=> b!1480753 (= res!1006334 (validKeyInArray!0 (select (arr!47944 a!2862) j!93)))))

(declare-fun b!1480754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99331 (_ BitVec 32)) SeekEntryResult!12209)

(assert (=> b!1480754 (= e!830511 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646379 lt!646377 mask!2687) (seekEntryOrOpen!0 lt!646379 lt!646377 mask!2687)))))

(declare-fun b!1480755 () Bool)

(declare-fun res!1006329 () Bool)

(assert (=> b!1480755 (=> (not res!1006329) (not e!830510))))

(declare-datatypes ((List!34523 0))(
  ( (Nil!34520) (Cons!34519 (h!35890 (_ BitVec 64)) (t!49209 List!34523)) )
))
(declare-fun arrayNoDuplicates!0 (array!99331 (_ BitVec 32) List!34523) Bool)

(assert (=> b!1480755 (= res!1006329 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34520))))

(assert (= (and start!126314 res!1006340) b!1480749))

(assert (= (and b!1480749 res!1006337) b!1480740))

(assert (= (and b!1480740 res!1006331) b!1480753))

(assert (= (and b!1480753 res!1006334) b!1480747))

(assert (= (and b!1480747 res!1006342) b!1480755))

(assert (= (and b!1480755 res!1006329) b!1480743))

(assert (= (and b!1480743 res!1006332) b!1480750))

(assert (= (and b!1480750 res!1006341) b!1480746))

(assert (= (and b!1480746 res!1006328) b!1480742))

(assert (= (and b!1480742 res!1006333) b!1480745))

(assert (= (and b!1480745 res!1006330) b!1480741))

(assert (= (and b!1480741 c!136729) b!1480739))

(assert (= (and b!1480741 (not c!136729)) b!1480754))

(assert (= (and b!1480741 res!1006339) b!1480748))

(assert (= (and b!1480748 res!1006335) b!1480751))

(assert (= (and b!1480751 res!1006336) b!1480744))

(assert (= (and b!1480744 res!1006338) b!1480752))

(declare-fun m!1365951 () Bool)

(assert (=> b!1480744 m!1365951))

(assert (=> b!1480744 m!1365951))

(declare-fun m!1365953 () Bool)

(assert (=> b!1480744 m!1365953))

(declare-fun m!1365955 () Bool)

(assert (=> b!1480750 m!1365955))

(declare-fun m!1365957 () Bool)

(assert (=> b!1480750 m!1365957))

(assert (=> b!1480752 m!1365955))

(declare-fun m!1365959 () Bool)

(assert (=> b!1480752 m!1365959))

(declare-fun m!1365961 () Bool)

(assert (=> b!1480752 m!1365961))

(declare-fun m!1365963 () Bool)

(assert (=> b!1480752 m!1365963))

(assert (=> b!1480752 m!1365951))

(assert (=> b!1480746 m!1365951))

(assert (=> b!1480746 m!1365951))

(declare-fun m!1365965 () Bool)

(assert (=> b!1480746 m!1365965))

(assert (=> b!1480746 m!1365965))

(assert (=> b!1480746 m!1365951))

(declare-fun m!1365967 () Bool)

(assert (=> b!1480746 m!1365967))

(declare-fun m!1365969 () Bool)

(assert (=> b!1480739 m!1365969))

(declare-fun m!1365971 () Bool)

(assert (=> b!1480755 m!1365971))

(declare-fun m!1365973 () Bool)

(assert (=> b!1480751 m!1365973))

(declare-fun m!1365975 () Bool)

(assert (=> b!1480751 m!1365975))

(declare-fun m!1365977 () Bool)

(assert (=> b!1480745 m!1365977))

(assert (=> b!1480745 m!1365977))

(declare-fun m!1365979 () Bool)

(assert (=> b!1480745 m!1365979))

(assert (=> b!1480745 m!1365955))

(declare-fun m!1365981 () Bool)

(assert (=> b!1480745 m!1365981))

(assert (=> b!1480742 m!1365951))

(assert (=> b!1480742 m!1365951))

(declare-fun m!1365983 () Bool)

(assert (=> b!1480742 m!1365983))

(assert (=> b!1480753 m!1365951))

(assert (=> b!1480753 m!1365951))

(declare-fun m!1365985 () Bool)

(assert (=> b!1480753 m!1365985))

(declare-fun m!1365987 () Bool)

(assert (=> b!1480754 m!1365987))

(declare-fun m!1365989 () Bool)

(assert (=> b!1480754 m!1365989))

(declare-fun m!1365991 () Bool)

(assert (=> start!126314 m!1365991))

(declare-fun m!1365993 () Bool)

(assert (=> start!126314 m!1365993))

(declare-fun m!1365995 () Bool)

(assert (=> b!1480740 m!1365995))

(assert (=> b!1480740 m!1365995))

(declare-fun m!1365997 () Bool)

(assert (=> b!1480740 m!1365997))

(declare-fun m!1365999 () Bool)

(assert (=> b!1480747 m!1365999))

(check-sat (not b!1480751) (not b!1480739) (not b!1480753) (not b!1480744) (not b!1480745) (not b!1480755) (not start!126314) (not b!1480746) (not b!1480754) (not b!1480742) (not b!1480740) (not b!1480747))
(check-sat)
