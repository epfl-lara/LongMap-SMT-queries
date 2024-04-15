; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124762 () Bool)

(assert start!124762)

(declare-fun b!1447605 () Bool)

(declare-fun res!979350 () Bool)

(declare-fun e!815265 () Bool)

(assert (=> b!1447605 (=> (not res!979350) (not e!815265))))

(declare-datatypes ((array!98188 0))(
  ( (array!98189 (arr!47383 (Array (_ BitVec 32) (_ BitVec 64))) (size!47935 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98188)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98188 (_ BitVec 32)) Bool)

(assert (=> b!1447605 (= res!979350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447606 () Bool)

(declare-fun e!815260 () Bool)

(declare-fun e!815266 () Bool)

(assert (=> b!1447606 (= e!815260 e!815266)))

(declare-fun res!979337 () Bool)

(assert (=> b!1447606 (=> (not res!979337) (not e!815266))))

(declare-datatypes ((SeekEntryResult!11660 0))(
  ( (MissingZero!11660 (index!49032 (_ BitVec 32))) (Found!11660 (index!49033 (_ BitVec 32))) (Intermediate!11660 (undefined!12472 Bool) (index!49034 (_ BitVec 32)) (x!130704 (_ BitVec 32))) (Undefined!11660) (MissingVacant!11660 (index!49035 (_ BitVec 32))) )
))
(declare-fun lt!635062 () SeekEntryResult!11660)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447606 (= res!979337 (= lt!635062 (Intermediate!11660 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635064 () (_ BitVec 64))

(declare-fun lt!635066 () array!98188)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447606 (= lt!635062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635064 mask!2687) lt!635064 lt!635066 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447606 (= lt!635064 (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447607 () Bool)

(declare-fun res!979343 () Bool)

(assert (=> b!1447607 (=> (not res!979343) (not e!815265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447607 (= res!979343 (validKeyInArray!0 (select (arr!47383 a!2862) i!1006)))))

(declare-fun b!1447608 () Bool)

(declare-fun res!979341 () Bool)

(assert (=> b!1447608 (=> (not res!979341) (not e!815260))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635065 () SeekEntryResult!11660)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1447608 (= res!979341 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!635065))))

(declare-fun b!1447609 () Bool)

(declare-fun e!815259 () Bool)

(declare-fun e!815268 () Bool)

(assert (=> b!1447609 (= e!815259 e!815268)))

(declare-fun res!979349 () Bool)

(assert (=> b!1447609 (=> (not res!979349) (not e!815268))))

(declare-fun lt!635063 () SeekEntryResult!11660)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11660)

(assert (=> b!1447609 (= res!979349 (= lt!635063 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47383 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!979345 () Bool)

(assert (=> start!124762 (=> (not res!979345) (not e!815265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124762 (= res!979345 (validMask!0 mask!2687))))

(assert (=> start!124762 e!815265))

(assert (=> start!124762 true))

(declare-fun array_inv!36616 (array!98188) Bool)

(assert (=> start!124762 (array_inv!36616 a!2862)))

(declare-fun b!1447610 () Bool)

(declare-fun res!979342 () Bool)

(assert (=> b!1447610 (=> (not res!979342) (not e!815266))))

(declare-fun e!815263 () Bool)

(assert (=> b!1447610 (= res!979342 e!815263)))

(declare-fun c!133648 () Bool)

(assert (=> b!1447610 (= c!133648 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447611 () Bool)

(declare-fun res!979336 () Bool)

(assert (=> b!1447611 (=> (not res!979336) (not e!815265))))

(declare-datatypes ((List!33962 0))(
  ( (Nil!33959) (Cons!33958 (h!35308 (_ BitVec 64)) (t!48648 List!33962)) )
))
(declare-fun arrayNoDuplicates!0 (array!98188 (_ BitVec 32) List!33962) Bool)

(assert (=> b!1447611 (= res!979336 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33959))))

(declare-fun b!1447612 () Bool)

(declare-fun e!815261 () Bool)

(assert (=> b!1447612 (= e!815266 (not e!815261))))

(declare-fun res!979335 () Bool)

(assert (=> b!1447612 (=> res!979335 e!815261)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1447612 (= res!979335 (or (and (= (select (arr!47383 a!2862) index!646) (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47383 a!2862) index!646) (select (arr!47383 a!2862) j!93))) (not (= (select (arr!47383 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815264 () Bool)

(assert (=> b!1447612 e!815264))

(declare-fun res!979346 () Bool)

(assert (=> b!1447612 (=> (not res!979346) (not e!815264))))

(assert (=> b!1447612 (= res!979346 (and (= lt!635063 (Found!11660 j!93)) (or (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) (select (arr!47383 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11660)

(assert (=> b!1447612 (= lt!635063 (seekEntryOrOpen!0 (select (arr!47383 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447612 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48657 0))(
  ( (Unit!48658) )
))
(declare-fun lt!635061 () Unit!48657)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48657)

(assert (=> b!1447612 (= lt!635061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447613 () Bool)

(declare-fun res!979338 () Bool)

(assert (=> b!1447613 (=> (not res!979338) (not e!815265))))

(assert (=> b!1447613 (= res!979338 (and (= (size!47935 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47935 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47935 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447614 () Bool)

(assert (=> b!1447614 (= e!815263 (= lt!635062 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635064 lt!635066 mask!2687)))))

(declare-fun b!1447615 () Bool)

(declare-fun e!815267 () Bool)

(assert (=> b!1447615 (= e!815267 e!815260)))

(declare-fun res!979351 () Bool)

(assert (=> b!1447615 (=> (not res!979351) (not e!815260))))

(assert (=> b!1447615 (= res!979351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47383 a!2862) j!93) mask!2687) (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!635065))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447615 (= lt!635065 (Intermediate!11660 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447616 () Bool)

(declare-fun res!979339 () Bool)

(assert (=> b!1447616 (=> (not res!979339) (not e!815266))))

(assert (=> b!1447616 (= res!979339 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447617 () Bool)

(declare-fun res!979347 () Bool)

(assert (=> b!1447617 (=> (not res!979347) (not e!815265))))

(assert (=> b!1447617 (= res!979347 (validKeyInArray!0 (select (arr!47383 a!2862) j!93)))))

(declare-fun b!1447618 () Bool)

(assert (=> b!1447618 (= e!815261 true)))

(declare-fun lt!635067 () SeekEntryResult!11660)

(assert (=> b!1447618 (= lt!635067 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47383 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447619 () Bool)

(declare-fun res!979348 () Bool)

(assert (=> b!1447619 (=> (not res!979348) (not e!815265))))

(assert (=> b!1447619 (= res!979348 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47935 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47935 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47935 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447620 () Bool)

(assert (=> b!1447620 (= e!815264 e!815259)))

(declare-fun res!979340 () Bool)

(assert (=> b!1447620 (=> res!979340 e!815259)))

(assert (=> b!1447620 (= res!979340 (or (and (= (select (arr!47383 a!2862) index!646) (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47383 a!2862) index!646) (select (arr!47383 a!2862) j!93))) (not (= (select (arr!47383 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447621 () Bool)

(assert (=> b!1447621 (= e!815265 e!815267)))

(declare-fun res!979344 () Bool)

(assert (=> b!1447621 (=> (not res!979344) (not e!815267))))

(assert (=> b!1447621 (= res!979344 (= (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447621 (= lt!635066 (array!98189 (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47935 a!2862)))))

(declare-fun b!1447622 () Bool)

(assert (=> b!1447622 (= e!815263 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635064 lt!635066 mask!2687) (seekEntryOrOpen!0 lt!635064 lt!635066 mask!2687)))))

(declare-fun b!1447623 () Bool)

(assert (=> b!1447623 (= e!815268 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124762 res!979345) b!1447613))

(assert (= (and b!1447613 res!979338) b!1447607))

(assert (= (and b!1447607 res!979343) b!1447617))

(assert (= (and b!1447617 res!979347) b!1447605))

(assert (= (and b!1447605 res!979350) b!1447611))

(assert (= (and b!1447611 res!979336) b!1447619))

(assert (= (and b!1447619 res!979348) b!1447621))

(assert (= (and b!1447621 res!979344) b!1447615))

(assert (= (and b!1447615 res!979351) b!1447608))

(assert (= (and b!1447608 res!979341) b!1447606))

(assert (= (and b!1447606 res!979337) b!1447610))

(assert (= (and b!1447610 c!133648) b!1447614))

(assert (= (and b!1447610 (not c!133648)) b!1447622))

(assert (= (and b!1447610 res!979342) b!1447616))

(assert (= (and b!1447616 res!979339) b!1447612))

(assert (= (and b!1447612 res!979346) b!1447620))

(assert (= (and b!1447620 (not res!979340)) b!1447609))

(assert (= (and b!1447609 res!979349) b!1447623))

(assert (= (and b!1447612 (not res!979335)) b!1447618))

(declare-fun m!1335921 () Bool)

(assert (=> b!1447621 m!1335921))

(declare-fun m!1335923 () Bool)

(assert (=> b!1447621 m!1335923))

(declare-fun m!1335925 () Bool)

(assert (=> b!1447622 m!1335925))

(declare-fun m!1335927 () Bool)

(assert (=> b!1447622 m!1335927))

(declare-fun m!1335929 () Bool)

(assert (=> b!1447605 m!1335929))

(declare-fun m!1335931 () Bool)

(assert (=> b!1447617 m!1335931))

(assert (=> b!1447617 m!1335931))

(declare-fun m!1335933 () Bool)

(assert (=> b!1447617 m!1335933))

(declare-fun m!1335935 () Bool)

(assert (=> b!1447614 m!1335935))

(declare-fun m!1335937 () Bool)

(assert (=> b!1447607 m!1335937))

(assert (=> b!1447607 m!1335937))

(declare-fun m!1335939 () Bool)

(assert (=> b!1447607 m!1335939))

(declare-fun m!1335941 () Bool)

(assert (=> b!1447611 m!1335941))

(declare-fun m!1335943 () Bool)

(assert (=> b!1447612 m!1335943))

(assert (=> b!1447612 m!1335921))

(declare-fun m!1335945 () Bool)

(assert (=> b!1447612 m!1335945))

(declare-fun m!1335947 () Bool)

(assert (=> b!1447612 m!1335947))

(declare-fun m!1335949 () Bool)

(assert (=> b!1447612 m!1335949))

(assert (=> b!1447612 m!1335931))

(declare-fun m!1335951 () Bool)

(assert (=> b!1447612 m!1335951))

(declare-fun m!1335953 () Bool)

(assert (=> b!1447612 m!1335953))

(assert (=> b!1447612 m!1335931))

(declare-fun m!1335955 () Bool)

(assert (=> start!124762 m!1335955))

(declare-fun m!1335957 () Bool)

(assert (=> start!124762 m!1335957))

(assert (=> b!1447608 m!1335931))

(assert (=> b!1447608 m!1335931))

(declare-fun m!1335959 () Bool)

(assert (=> b!1447608 m!1335959))

(assert (=> b!1447618 m!1335931))

(assert (=> b!1447618 m!1335931))

(declare-fun m!1335961 () Bool)

(assert (=> b!1447618 m!1335961))

(assert (=> b!1447620 m!1335949))

(assert (=> b!1447620 m!1335921))

(assert (=> b!1447620 m!1335947))

(assert (=> b!1447620 m!1335931))

(declare-fun m!1335963 () Bool)

(assert (=> b!1447606 m!1335963))

(assert (=> b!1447606 m!1335963))

(declare-fun m!1335965 () Bool)

(assert (=> b!1447606 m!1335965))

(assert (=> b!1447606 m!1335921))

(declare-fun m!1335967 () Bool)

(assert (=> b!1447606 m!1335967))

(assert (=> b!1447615 m!1335931))

(assert (=> b!1447615 m!1335931))

(declare-fun m!1335969 () Bool)

(assert (=> b!1447615 m!1335969))

(assert (=> b!1447615 m!1335969))

(assert (=> b!1447615 m!1335931))

(declare-fun m!1335971 () Bool)

(assert (=> b!1447615 m!1335971))

(assert (=> b!1447609 m!1335931))

(assert (=> b!1447609 m!1335931))

(declare-fun m!1335973 () Bool)

(assert (=> b!1447609 m!1335973))

(check-sat (not b!1447605) (not b!1447617) (not b!1447608) (not b!1447611) (not b!1447618) (not start!124762) (not b!1447614) (not b!1447606) (not b!1447615) (not b!1447607) (not b!1447609) (not b!1447622) (not b!1447612))
(check-sat)
