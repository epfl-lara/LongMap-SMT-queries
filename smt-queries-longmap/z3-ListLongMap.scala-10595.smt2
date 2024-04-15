; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124678 () Bool)

(assert start!124678)

(declare-fun b!1445315 () Bool)

(declare-fun res!977297 () Bool)

(declare-fun e!814157 () Bool)

(assert (=> b!1445315 (=> (not res!977297) (not e!814157))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98104 0))(
  ( (array!98105 (arr!47341 (Array (_ BitVec 32) (_ BitVec 64))) (size!47893 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98104)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445315 (= res!977297 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47893 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47893 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47893 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445316 () Bool)

(declare-fun e!814156 () Bool)

(declare-fun e!814160 () Bool)

(assert (=> b!1445316 (= e!814156 e!814160)))

(declare-fun res!977308 () Bool)

(assert (=> b!1445316 (=> (not res!977308) (not e!814160))))

(declare-datatypes ((SeekEntryResult!11618 0))(
  ( (MissingZero!11618 (index!48864 (_ BitVec 32))) (Found!11618 (index!48865 (_ BitVec 32))) (Intermediate!11618 (undefined!12430 Bool) (index!48866 (_ BitVec 32)) (x!130550 (_ BitVec 32))) (Undefined!11618) (MissingVacant!11618 (index!48867 (_ BitVec 32))) )
))
(declare-fun lt!634285 () SeekEntryResult!11618)

(assert (=> b!1445316 (= res!977308 (= lt!634285 (Intermediate!11618 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634287 () (_ BitVec 64))

(declare-fun lt!634286 () array!98104)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445316 (= lt!634285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634287 mask!2687) lt!634287 lt!634286 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445316 (= lt!634287 (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445317 () Bool)

(declare-fun e!814161 () Bool)

(assert (=> b!1445317 (= e!814161 (or (= (select (arr!47341 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47341 a!2862) intermediateBeforeIndex!19) (select (arr!47341 a!2862) j!93))))))

(declare-fun b!1445318 () Bool)

(declare-fun e!814158 () Bool)

(assert (=> b!1445318 (= e!814158 e!814156)))

(declare-fun res!977302 () Bool)

(assert (=> b!1445318 (=> (not res!977302) (not e!814156))))

(declare-fun lt!634284 () SeekEntryResult!11618)

(assert (=> b!1445318 (= res!977302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47341 a!2862) j!93) mask!2687) (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!634284))))

(assert (=> b!1445318 (= lt!634284 (Intermediate!11618 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445319 () Bool)

(declare-fun e!814155 () Bool)

(assert (=> b!1445319 (= e!814155 (= lt!634285 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634287 lt!634286 mask!2687)))))

(declare-fun b!1445320 () Bool)

(declare-fun res!977299 () Bool)

(assert (=> b!1445320 (=> (not res!977299) (not e!814160))))

(assert (=> b!1445320 (= res!977299 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445321 () Bool)

(assert (=> b!1445321 (= e!814160 (not true))))

(assert (=> b!1445321 e!814161))

(declare-fun res!977311 () Bool)

(assert (=> b!1445321 (=> (not res!977311) (not e!814161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98104 (_ BitVec 32)) Bool)

(assert (=> b!1445321 (= res!977311 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48573 0))(
  ( (Unit!48574) )
))
(declare-fun lt!634283 () Unit!48573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48573)

(assert (=> b!1445321 (= lt!634283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445322 () Bool)

(assert (=> b!1445322 (= e!814157 e!814158)))

(declare-fun res!977310 () Bool)

(assert (=> b!1445322 (=> (not res!977310) (not e!814158))))

(assert (=> b!1445322 (= res!977310 (= (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445322 (= lt!634286 (array!98105 (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47893 a!2862)))))

(declare-fun b!1445323 () Bool)

(declare-fun res!977305 () Bool)

(assert (=> b!1445323 (=> (not res!977305) (not e!814156))))

(assert (=> b!1445323 (= res!977305 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!634284))))

(declare-fun b!1445324 () Bool)

(declare-fun res!977306 () Bool)

(assert (=> b!1445324 (=> (not res!977306) (not e!814157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445324 (= res!977306 (validKeyInArray!0 (select (arr!47341 a!2862) j!93)))))

(declare-fun res!977301 () Bool)

(assert (=> start!124678 (=> (not res!977301) (not e!814157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124678 (= res!977301 (validMask!0 mask!2687))))

(assert (=> start!124678 e!814157))

(assert (=> start!124678 true))

(declare-fun array_inv!36574 (array!98104) Bool)

(assert (=> start!124678 (array_inv!36574 a!2862)))

(declare-fun b!1445325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11618)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11618)

(assert (=> b!1445325 (= e!814155 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634287 lt!634286 mask!2687) (seekEntryOrOpen!0 lt!634287 lt!634286 mask!2687)))))

(declare-fun b!1445326 () Bool)

(declare-fun res!977303 () Bool)

(assert (=> b!1445326 (=> (not res!977303) (not e!814160))))

(assert (=> b!1445326 (= res!977303 e!814155)))

(declare-fun c!133522 () Bool)

(assert (=> b!1445326 (= c!133522 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445327 () Bool)

(declare-fun res!977307 () Bool)

(assert (=> b!1445327 (=> (not res!977307) (not e!814157))))

(assert (=> b!1445327 (= res!977307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445328 () Bool)

(declare-fun res!977298 () Bool)

(assert (=> b!1445328 (=> (not res!977298) (not e!814157))))

(assert (=> b!1445328 (= res!977298 (validKeyInArray!0 (select (arr!47341 a!2862) i!1006)))))

(declare-fun b!1445329 () Bool)

(declare-fun res!977304 () Bool)

(assert (=> b!1445329 (=> (not res!977304) (not e!814161))))

(assert (=> b!1445329 (= res!977304 (= (seekEntryOrOpen!0 (select (arr!47341 a!2862) j!93) a!2862 mask!2687) (Found!11618 j!93)))))

(declare-fun b!1445330 () Bool)

(declare-fun res!977309 () Bool)

(assert (=> b!1445330 (=> (not res!977309) (not e!814157))))

(assert (=> b!1445330 (= res!977309 (and (= (size!47893 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47893 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47893 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445331 () Bool)

(declare-fun res!977300 () Bool)

(assert (=> b!1445331 (=> (not res!977300) (not e!814157))))

(declare-datatypes ((List!33920 0))(
  ( (Nil!33917) (Cons!33916 (h!35266 (_ BitVec 64)) (t!48606 List!33920)) )
))
(declare-fun arrayNoDuplicates!0 (array!98104 (_ BitVec 32) List!33920) Bool)

(assert (=> b!1445331 (= res!977300 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33917))))

(assert (= (and start!124678 res!977301) b!1445330))

(assert (= (and b!1445330 res!977309) b!1445328))

(assert (= (and b!1445328 res!977298) b!1445324))

(assert (= (and b!1445324 res!977306) b!1445327))

(assert (= (and b!1445327 res!977307) b!1445331))

(assert (= (and b!1445331 res!977300) b!1445315))

(assert (= (and b!1445315 res!977297) b!1445322))

(assert (= (and b!1445322 res!977310) b!1445318))

(assert (= (and b!1445318 res!977302) b!1445323))

(assert (= (and b!1445323 res!977305) b!1445316))

(assert (= (and b!1445316 res!977308) b!1445326))

(assert (= (and b!1445326 c!133522) b!1445319))

(assert (= (and b!1445326 (not c!133522)) b!1445325))

(assert (= (and b!1445326 res!977303) b!1445320))

(assert (= (and b!1445320 res!977299) b!1445321))

(assert (= (and b!1445321 res!977311) b!1445329))

(assert (= (and b!1445329 res!977304) b!1445317))

(declare-fun m!1333785 () Bool)

(assert (=> b!1445316 m!1333785))

(assert (=> b!1445316 m!1333785))

(declare-fun m!1333787 () Bool)

(assert (=> b!1445316 m!1333787))

(declare-fun m!1333789 () Bool)

(assert (=> b!1445316 m!1333789))

(declare-fun m!1333791 () Bool)

(assert (=> b!1445316 m!1333791))

(declare-fun m!1333793 () Bool)

(assert (=> b!1445327 m!1333793))

(declare-fun m!1333795 () Bool)

(assert (=> b!1445321 m!1333795))

(declare-fun m!1333797 () Bool)

(assert (=> b!1445321 m!1333797))

(declare-fun m!1333799 () Bool)

(assert (=> b!1445323 m!1333799))

(assert (=> b!1445323 m!1333799))

(declare-fun m!1333801 () Bool)

(assert (=> b!1445323 m!1333801))

(assert (=> b!1445329 m!1333799))

(assert (=> b!1445329 m!1333799))

(declare-fun m!1333803 () Bool)

(assert (=> b!1445329 m!1333803))

(declare-fun m!1333805 () Bool)

(assert (=> start!124678 m!1333805))

(declare-fun m!1333807 () Bool)

(assert (=> start!124678 m!1333807))

(assert (=> b!1445318 m!1333799))

(assert (=> b!1445318 m!1333799))

(declare-fun m!1333809 () Bool)

(assert (=> b!1445318 m!1333809))

(assert (=> b!1445318 m!1333809))

(assert (=> b!1445318 m!1333799))

(declare-fun m!1333811 () Bool)

(assert (=> b!1445318 m!1333811))

(declare-fun m!1333813 () Bool)

(assert (=> b!1445319 m!1333813))

(declare-fun m!1333815 () Bool)

(assert (=> b!1445317 m!1333815))

(assert (=> b!1445317 m!1333799))

(assert (=> b!1445322 m!1333789))

(declare-fun m!1333817 () Bool)

(assert (=> b!1445322 m!1333817))

(declare-fun m!1333819 () Bool)

(assert (=> b!1445325 m!1333819))

(declare-fun m!1333821 () Bool)

(assert (=> b!1445325 m!1333821))

(declare-fun m!1333823 () Bool)

(assert (=> b!1445328 m!1333823))

(assert (=> b!1445328 m!1333823))

(declare-fun m!1333825 () Bool)

(assert (=> b!1445328 m!1333825))

(assert (=> b!1445324 m!1333799))

(assert (=> b!1445324 m!1333799))

(declare-fun m!1333827 () Bool)

(assert (=> b!1445324 m!1333827))

(declare-fun m!1333829 () Bool)

(assert (=> b!1445331 m!1333829))

(check-sat (not b!1445321) (not b!1445323) (not b!1445325) (not b!1445328) (not b!1445324) (not start!124678) (not b!1445319) (not b!1445327) (not b!1445331) (not b!1445316) (not b!1445329) (not b!1445318))
(check-sat)
