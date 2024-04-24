; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125082 () Bool)

(assert start!125082)

(declare-fun b!1451190 () Bool)

(declare-fun res!981776 () Bool)

(declare-fun e!817299 () Bool)

(assert (=> b!1451190 (=> (not res!981776) (not e!817299))))

(declare-datatypes ((array!98425 0))(
  ( (array!98426 (arr!47497 (Array (_ BitVec 32) (_ BitVec 64))) (size!48048 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98425)

(declare-datatypes ((List!33985 0))(
  ( (Nil!33982) (Cons!33981 (h!35342 (_ BitVec 64)) (t!48671 List!33985)) )
))
(declare-fun arrayNoDuplicates!0 (array!98425 (_ BitVec 32) List!33985) Bool)

(assert (=> b!1451190 (= res!981776 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33982))))

(declare-fun b!1451191 () Bool)

(declare-fun e!817302 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1451191 (= e!817302 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!11646 0))(
  ( (MissingZero!11646 (index!48976 (_ BitVec 32))) (Found!11646 (index!48977 (_ BitVec 32))) (Intermediate!11646 (undefined!12458 Bool) (index!48978 (_ BitVec 32)) (x!130815 (_ BitVec 32))) (Undefined!11646) (MissingVacant!11646 (index!48979 (_ BitVec 32))) )
))
(declare-fun lt!636540 () SeekEntryResult!11646)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636547 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636543 () array!98425)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98425 (_ BitVec 32)) SeekEntryResult!11646)

(assert (=> b!1451191 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636547 lt!636543 mask!2687) lt!636540)))

(declare-datatypes ((Unit!48821 0))(
  ( (Unit!48822) )
))
(declare-fun lt!636544 () Unit!48821)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48821)

(assert (=> b!1451191 (= lt!636544 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451192 () Bool)

(declare-fun res!981762 () Bool)

(assert (=> b!1451192 (=> (not res!981762) (not e!817299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451192 (= res!981762 (validKeyInArray!0 (select (arr!47497 a!2862) j!93)))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1451193 () Bool)

(declare-fun e!817296 () Bool)

(assert (=> b!1451193 (= e!817296 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451194 () Bool)

(declare-fun e!817295 () Bool)

(assert (=> b!1451194 (= e!817295 e!817296)))

(declare-fun res!981777 () Bool)

(assert (=> b!1451194 (=> (not res!981777) (not e!817296))))

(declare-fun lt!636541 () SeekEntryResult!11646)

(assert (=> b!1451194 (= res!981777 (= lt!636541 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47497 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451195 () Bool)

(declare-fun e!817301 () Bool)

(declare-fun e!817297 () Bool)

(assert (=> b!1451195 (= e!817301 e!817297)))

(declare-fun res!981767 () Bool)

(assert (=> b!1451195 (=> (not res!981767) (not e!817297))))

(declare-fun lt!636546 () SeekEntryResult!11646)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98425 (_ BitVec 32)) SeekEntryResult!11646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451195 (= res!981767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47497 a!2862) j!93) mask!2687) (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!636546))))

(assert (=> b!1451195 (= lt!636546 (Intermediate!11646 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!817293 () Bool)

(declare-fun b!1451196 () Bool)

(declare-fun lt!636542 () SeekEntryResult!11646)

(assert (=> b!1451196 (= e!817293 (= lt!636542 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636547 lt!636543 mask!2687)))))

(declare-fun b!1451197 () Bool)

(declare-fun e!817300 () Bool)

(assert (=> b!1451197 (= e!817300 e!817295)))

(declare-fun res!981774 () Bool)

(assert (=> b!1451197 (=> res!981774 e!817295)))

(assert (=> b!1451197 (= res!981774 (or (and (= (select (arr!47497 a!2862) index!646) (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47497 a!2862) index!646) (select (arr!47497 a!2862) j!93))) (not (= (select (arr!47497 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451198 () Bool)

(declare-fun res!981770 () Bool)

(assert (=> b!1451198 (=> (not res!981770) (not e!817297))))

(assert (=> b!1451198 (= res!981770 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!636546))))

(declare-fun b!1451199 () Bool)

(declare-fun e!817294 () Bool)

(assert (=> b!1451199 (= e!817297 e!817294)))

(declare-fun res!981766 () Bool)

(assert (=> b!1451199 (=> (not res!981766) (not e!817294))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451199 (= res!981766 (= lt!636542 (Intermediate!11646 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451199 (= lt!636542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636547 mask!2687) lt!636547 lt!636543 mask!2687))))

(assert (=> b!1451199 (= lt!636547 (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451200 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98425 (_ BitVec 32)) SeekEntryResult!11646)

(assert (=> b!1451200 (= e!817293 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636547 lt!636543 mask!2687) (seekEntryOrOpen!0 lt!636547 lt!636543 mask!2687)))))

(declare-fun b!1451201 () Bool)

(declare-fun res!981775 () Bool)

(assert (=> b!1451201 (=> (not res!981775) (not e!817294))))

(assert (=> b!1451201 (= res!981775 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451202 () Bool)

(assert (=> b!1451202 (= e!817299 e!817301)))

(declare-fun res!981771 () Bool)

(assert (=> b!1451202 (=> (not res!981771) (not e!817301))))

(assert (=> b!1451202 (= res!981771 (= (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451202 (= lt!636543 (array!98426 (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48048 a!2862)))))

(declare-fun b!1451203 () Bool)

(declare-fun res!981778 () Bool)

(assert (=> b!1451203 (=> (not res!981778) (not e!817299))))

(assert (=> b!1451203 (= res!981778 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48048 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48048 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48048 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451204 () Bool)

(declare-fun res!981764 () Bool)

(assert (=> b!1451204 (=> (not res!981764) (not e!817299))))

(assert (=> b!1451204 (= res!981764 (and (= (size!48048 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48048 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48048 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451205 () Bool)

(declare-fun res!981765 () Bool)

(assert (=> b!1451205 (=> (not res!981765) (not e!817299))))

(assert (=> b!1451205 (= res!981765 (validKeyInArray!0 (select (arr!47497 a!2862) i!1006)))))

(declare-fun b!1451206 () Bool)

(declare-fun res!981769 () Bool)

(assert (=> b!1451206 (=> (not res!981769) (not e!817299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98425 (_ BitVec 32)) Bool)

(assert (=> b!1451206 (= res!981769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451207 () Bool)

(assert (=> b!1451207 (= e!817294 (not e!817302))))

(declare-fun res!981773 () Bool)

(assert (=> b!1451207 (=> res!981773 e!817302)))

(assert (=> b!1451207 (= res!981773 (or (and (= (select (arr!47497 a!2862) index!646) (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47497 a!2862) index!646) (select (arr!47497 a!2862) j!93))) (not (= (select (arr!47497 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1451207 e!817300))

(declare-fun res!981763 () Bool)

(assert (=> b!1451207 (=> (not res!981763) (not e!817300))))

(assert (=> b!1451207 (= res!981763 (and (= lt!636541 lt!636540) (or (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) (select (arr!47497 a!2862) j!93)))))))

(assert (=> b!1451207 (= lt!636540 (Found!11646 j!93))))

(assert (=> b!1451207 (= lt!636541 (seekEntryOrOpen!0 (select (arr!47497 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1451207 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636545 () Unit!48821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48821)

(assert (=> b!1451207 (= lt!636545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!981779 () Bool)

(assert (=> start!125082 (=> (not res!981779) (not e!817299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125082 (= res!981779 (validMask!0 mask!2687))))

(assert (=> start!125082 e!817299))

(assert (=> start!125082 true))

(declare-fun array_inv!36778 (array!98425) Bool)

(assert (=> start!125082 (array_inv!36778 a!2862)))

(declare-fun b!1451208 () Bool)

(declare-fun res!981772 () Bool)

(assert (=> b!1451208 (=> res!981772 e!817302)))

(assert (=> b!1451208 (= res!981772 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!636540)))))

(declare-fun b!1451209 () Bool)

(declare-fun res!981768 () Bool)

(assert (=> b!1451209 (=> (not res!981768) (not e!817294))))

(assert (=> b!1451209 (= res!981768 e!817293)))

(declare-fun c!134233 () Bool)

(assert (=> b!1451209 (= c!134233 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125082 res!981779) b!1451204))

(assert (= (and b!1451204 res!981764) b!1451205))

(assert (= (and b!1451205 res!981765) b!1451192))

(assert (= (and b!1451192 res!981762) b!1451206))

(assert (= (and b!1451206 res!981769) b!1451190))

(assert (= (and b!1451190 res!981776) b!1451203))

(assert (= (and b!1451203 res!981778) b!1451202))

(assert (= (and b!1451202 res!981771) b!1451195))

(assert (= (and b!1451195 res!981767) b!1451198))

(assert (= (and b!1451198 res!981770) b!1451199))

(assert (= (and b!1451199 res!981766) b!1451209))

(assert (= (and b!1451209 c!134233) b!1451196))

(assert (= (and b!1451209 (not c!134233)) b!1451200))

(assert (= (and b!1451209 res!981768) b!1451201))

(assert (= (and b!1451201 res!981775) b!1451207))

(assert (= (and b!1451207 res!981763) b!1451197))

(assert (= (and b!1451197 (not res!981774)) b!1451194))

(assert (= (and b!1451194 res!981777) b!1451193))

(assert (= (and b!1451207 (not res!981773)) b!1451208))

(assert (= (and b!1451208 (not res!981772)) b!1451191))

(declare-fun m!1339987 () Bool)

(assert (=> b!1451202 m!1339987))

(declare-fun m!1339989 () Bool)

(assert (=> b!1451202 m!1339989))

(declare-fun m!1339991 () Bool)

(assert (=> b!1451191 m!1339991))

(declare-fun m!1339993 () Bool)

(assert (=> b!1451191 m!1339993))

(declare-fun m!1339995 () Bool)

(assert (=> start!125082 m!1339995))

(declare-fun m!1339997 () Bool)

(assert (=> start!125082 m!1339997))

(declare-fun m!1339999 () Bool)

(assert (=> b!1451194 m!1339999))

(assert (=> b!1451194 m!1339999))

(declare-fun m!1340001 () Bool)

(assert (=> b!1451194 m!1340001))

(declare-fun m!1340003 () Bool)

(assert (=> b!1451205 m!1340003))

(assert (=> b!1451205 m!1340003))

(declare-fun m!1340005 () Bool)

(assert (=> b!1451205 m!1340005))

(assert (=> b!1451192 m!1339999))

(assert (=> b!1451192 m!1339999))

(declare-fun m!1340007 () Bool)

(assert (=> b!1451192 m!1340007))

(declare-fun m!1340009 () Bool)

(assert (=> b!1451190 m!1340009))

(declare-fun m!1340011 () Bool)

(assert (=> b!1451196 m!1340011))

(assert (=> b!1451198 m!1339999))

(assert (=> b!1451198 m!1339999))

(declare-fun m!1340013 () Bool)

(assert (=> b!1451198 m!1340013))

(assert (=> b!1451208 m!1339999))

(assert (=> b!1451208 m!1339999))

(declare-fun m!1340015 () Bool)

(assert (=> b!1451208 m!1340015))

(declare-fun m!1340017 () Bool)

(assert (=> b!1451199 m!1340017))

(assert (=> b!1451199 m!1340017))

(declare-fun m!1340019 () Bool)

(assert (=> b!1451199 m!1340019))

(assert (=> b!1451199 m!1339987))

(declare-fun m!1340021 () Bool)

(assert (=> b!1451199 m!1340021))

(declare-fun m!1340023 () Bool)

(assert (=> b!1451197 m!1340023))

(assert (=> b!1451197 m!1339987))

(declare-fun m!1340025 () Bool)

(assert (=> b!1451197 m!1340025))

(assert (=> b!1451197 m!1339999))

(assert (=> b!1451195 m!1339999))

(assert (=> b!1451195 m!1339999))

(declare-fun m!1340027 () Bool)

(assert (=> b!1451195 m!1340027))

(assert (=> b!1451195 m!1340027))

(assert (=> b!1451195 m!1339999))

(declare-fun m!1340029 () Bool)

(assert (=> b!1451195 m!1340029))

(assert (=> b!1451200 m!1339991))

(declare-fun m!1340031 () Bool)

(assert (=> b!1451200 m!1340031))

(declare-fun m!1340033 () Bool)

(assert (=> b!1451207 m!1340033))

(assert (=> b!1451207 m!1339987))

(declare-fun m!1340035 () Bool)

(assert (=> b!1451207 m!1340035))

(assert (=> b!1451207 m!1340025))

(assert (=> b!1451207 m!1340023))

(assert (=> b!1451207 m!1339999))

(declare-fun m!1340037 () Bool)

(assert (=> b!1451207 m!1340037))

(declare-fun m!1340039 () Bool)

(assert (=> b!1451207 m!1340039))

(assert (=> b!1451207 m!1339999))

(declare-fun m!1340041 () Bool)

(assert (=> b!1451206 m!1340041))

(check-sat (not b!1451206) (not b!1451200) (not b!1451196) (not b!1451195) (not b!1451191) (not b!1451198) (not b!1451192) (not b!1451190) (not b!1451207) (not b!1451205) (not start!125082) (not b!1451208) (not b!1451194) (not b!1451199))
(check-sat)
