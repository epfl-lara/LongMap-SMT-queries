; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125368 () Bool)

(assert start!125368)

(declare-fun b!1466412 () Bool)

(declare-fun res!995212 () Bool)

(declare-fun e!823808 () Bool)

(assert (=> b!1466412 (=> (not res!995212) (not e!823808))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98794 0))(
  ( (array!98795 (arr!47686 (Array (_ BitVec 32) (_ BitVec 64))) (size!48238 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98794)

(assert (=> b!1466412 (= res!995212 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48238 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48238 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48238 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466413 () Bool)

(declare-fun res!995216 () Bool)

(assert (=> b!1466413 (=> (not res!995216) (not e!823808))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98794 (_ BitVec 32)) Bool)

(assert (=> b!1466413 (= res!995216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!823807 () Bool)

(declare-fun b!1466414 () Bool)

(declare-fun lt!641581 () array!98794)

(declare-fun lt!641585 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11963 0))(
  ( (MissingZero!11963 (index!50244 (_ BitVec 32))) (Found!11963 (index!50245 (_ BitVec 32))) (Intermediate!11963 (undefined!12775 Bool) (index!50246 (_ BitVec 32)) (x!131815 (_ BitVec 32))) (Undefined!11963) (MissingVacant!11963 (index!50247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11963)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11963)

(assert (=> b!1466414 (= e!823807 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641585 lt!641581 mask!2687) (seekEntryOrOpen!0 lt!641585 lt!641581 mask!2687)))))

(declare-fun b!1466415 () Bool)

(declare-fun res!995210 () Bool)

(declare-fun e!823810 () Bool)

(assert (=> b!1466415 (=> (not res!995210) (not e!823810))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!641580 () SeekEntryResult!11963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11963)

(assert (=> b!1466415 (= res!995210 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641580))))

(declare-fun b!1466416 () Bool)

(declare-fun res!995211 () Bool)

(declare-fun e!823815 () Bool)

(assert (=> b!1466416 (=> (not res!995211) (not e!823815))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466416 (= res!995211 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!995221 () Bool)

(assert (=> start!125368 (=> (not res!995221) (not e!823808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125368 (= res!995221 (validMask!0 mask!2687))))

(assert (=> start!125368 e!823808))

(assert (=> start!125368 true))

(declare-fun array_inv!36919 (array!98794) Bool)

(assert (=> start!125368 (array_inv!36919 a!2862)))

(declare-fun b!1466417 () Bool)

(declare-fun res!995205 () Bool)

(assert (=> b!1466417 (=> (not res!995205) (not e!823808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466417 (= res!995205 (validKeyInArray!0 (select (arr!47686 a!2862) i!1006)))))

(declare-fun b!1466418 () Bool)

(assert (=> b!1466418 (= e!823810 e!823815)))

(declare-fun res!995214 () Bool)

(assert (=> b!1466418 (=> (not res!995214) (not e!823815))))

(declare-fun lt!641582 () SeekEntryResult!11963)

(assert (=> b!1466418 (= res!995214 (= lt!641582 (Intermediate!11963 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466418 (= lt!641582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641585 mask!2687) lt!641585 lt!641581 mask!2687))))

(assert (=> b!1466418 (= lt!641585 (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466419 () Bool)

(declare-fun e!823811 () Bool)

(assert (=> b!1466419 (= e!823811 true)))

(declare-fun lt!641583 () SeekEntryResult!11963)

(assert (=> b!1466419 (= lt!641583 (seekEntryOrOpen!0 lt!641585 lt!641581 mask!2687))))

(declare-fun lt!641584 () (_ BitVec 32))

(declare-datatypes ((Unit!49263 0))(
  ( (Unit!49264) )
))
(declare-fun lt!641579 () Unit!49263)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49263)

(assert (=> b!1466419 (= lt!641579 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641584 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun e!823809 () Bool)

(declare-fun b!1466420 () Bool)

(assert (=> b!1466420 (= e!823809 (not (= lt!641582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641584 lt!641585 lt!641581 mask!2687))))))

(declare-fun b!1466421 () Bool)

(declare-fun e!823812 () Bool)

(assert (=> b!1466421 (= e!823812 e!823810)))

(declare-fun res!995217 () Bool)

(assert (=> b!1466421 (=> (not res!995217) (not e!823810))))

(assert (=> b!1466421 (= res!995217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47686 a!2862) j!93) mask!2687) (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641580))))

(assert (=> b!1466421 (= lt!641580 (Intermediate!11963 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466422 () Bool)

(assert (=> b!1466422 (= e!823808 e!823812)))

(declare-fun res!995213 () Bool)

(assert (=> b!1466422 (=> (not res!995213) (not e!823812))))

(assert (=> b!1466422 (= res!995213 (= (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466422 (= lt!641581 (array!98795 (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48238 a!2862)))))

(declare-fun b!1466423 () Bool)

(declare-fun e!823813 () Bool)

(assert (=> b!1466423 (= e!823815 (not e!823813))))

(declare-fun res!995215 () Bool)

(assert (=> b!1466423 (=> res!995215 e!823813)))

(assert (=> b!1466423 (= res!995215 (or (and (= (select (arr!47686 a!2862) index!646) (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47686 a!2862) index!646) (select (arr!47686 a!2862) j!93))) (= (select (arr!47686 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466423 (and (= lt!641583 (Found!11963 j!93)) (or (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) (select (arr!47686 a!2862) j!93))))))

(assert (=> b!1466423 (= lt!641583 (seekEntryOrOpen!0 (select (arr!47686 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466423 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641586 () Unit!49263)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49263)

(assert (=> b!1466423 (= lt!641586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466424 () Bool)

(assert (=> b!1466424 (= e!823807 (= lt!641582 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641585 lt!641581 mask!2687)))))

(declare-fun b!1466425 () Bool)

(declare-fun res!995208 () Bool)

(assert (=> b!1466425 (=> (not res!995208) (not e!823808))))

(assert (=> b!1466425 (= res!995208 (and (= (size!48238 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48238 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48238 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466426 () Bool)

(assert (=> b!1466426 (= e!823809 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641584 intermediateAfterIndex!19 lt!641585 lt!641581 mask!2687) (seekEntryOrOpen!0 lt!641585 lt!641581 mask!2687))))))

(declare-fun b!1466427 () Bool)

(assert (=> b!1466427 (= e!823813 e!823811)))

(declare-fun res!995207 () Bool)

(assert (=> b!1466427 (=> res!995207 e!823811)))

(assert (=> b!1466427 (= res!995207 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641584 #b00000000000000000000000000000000) (bvsge lt!641584 (size!48238 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466427 (= lt!641584 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466428 () Bool)

(declare-fun res!995206 () Bool)

(assert (=> b!1466428 (=> (not res!995206) (not e!823808))))

(assert (=> b!1466428 (= res!995206 (validKeyInArray!0 (select (arr!47686 a!2862) j!93)))))

(declare-fun b!1466429 () Bool)

(declare-fun res!995220 () Bool)

(assert (=> b!1466429 (=> res!995220 e!823811)))

(assert (=> b!1466429 (= res!995220 e!823809)))

(declare-fun c!135117 () Bool)

(assert (=> b!1466429 (= c!135117 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466430 () Bool)

(declare-fun res!995209 () Bool)

(assert (=> b!1466430 (=> (not res!995209) (not e!823815))))

(assert (=> b!1466430 (= res!995209 e!823807)))

(declare-fun c!135118 () Bool)

(assert (=> b!1466430 (= c!135118 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466431 () Bool)

(declare-fun res!995204 () Bool)

(assert (=> b!1466431 (=> res!995204 e!823811)))

(assert (=> b!1466431 (= res!995204 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641584 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641580)))))

(declare-fun b!1466432 () Bool)

(declare-fun res!995218 () Bool)

(assert (=> b!1466432 (=> res!995218 e!823811)))

(assert (=> b!1466432 (= res!995218 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466433 () Bool)

(declare-fun res!995219 () Bool)

(assert (=> b!1466433 (=> (not res!995219) (not e!823808))))

(declare-datatypes ((List!34265 0))(
  ( (Nil!34262) (Cons!34261 (h!35611 (_ BitVec 64)) (t!48951 List!34265)) )
))
(declare-fun arrayNoDuplicates!0 (array!98794 (_ BitVec 32) List!34265) Bool)

(assert (=> b!1466433 (= res!995219 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34262))))

(assert (= (and start!125368 res!995221) b!1466425))

(assert (= (and b!1466425 res!995208) b!1466417))

(assert (= (and b!1466417 res!995205) b!1466428))

(assert (= (and b!1466428 res!995206) b!1466413))

(assert (= (and b!1466413 res!995216) b!1466433))

(assert (= (and b!1466433 res!995219) b!1466412))

(assert (= (and b!1466412 res!995212) b!1466422))

(assert (= (and b!1466422 res!995213) b!1466421))

(assert (= (and b!1466421 res!995217) b!1466415))

(assert (= (and b!1466415 res!995210) b!1466418))

(assert (= (and b!1466418 res!995214) b!1466430))

(assert (= (and b!1466430 c!135118) b!1466424))

(assert (= (and b!1466430 (not c!135118)) b!1466414))

(assert (= (and b!1466430 res!995209) b!1466416))

(assert (= (and b!1466416 res!995211) b!1466423))

(assert (= (and b!1466423 (not res!995215)) b!1466427))

(assert (= (and b!1466427 (not res!995207)) b!1466431))

(assert (= (and b!1466431 (not res!995204)) b!1466429))

(assert (= (and b!1466429 c!135117) b!1466420))

(assert (= (and b!1466429 (not c!135117)) b!1466426))

(assert (= (and b!1466429 (not res!995220)) b!1466432))

(assert (= (and b!1466432 (not res!995218)) b!1466419))

(declare-fun m!1352907 () Bool)

(assert (=> b!1466414 m!1352907))

(declare-fun m!1352909 () Bool)

(assert (=> b!1466414 m!1352909))

(declare-fun m!1352911 () Bool)

(assert (=> b!1466431 m!1352911))

(assert (=> b!1466431 m!1352911))

(declare-fun m!1352913 () Bool)

(assert (=> b!1466431 m!1352913))

(declare-fun m!1352915 () Bool)

(assert (=> b!1466433 m!1352915))

(declare-fun m!1352917 () Bool)

(assert (=> b!1466422 m!1352917))

(declare-fun m!1352919 () Bool)

(assert (=> b!1466422 m!1352919))

(assert (=> b!1466415 m!1352911))

(assert (=> b!1466415 m!1352911))

(declare-fun m!1352921 () Bool)

(assert (=> b!1466415 m!1352921))

(declare-fun m!1352923 () Bool)

(assert (=> b!1466420 m!1352923))

(assert (=> b!1466428 m!1352911))

(assert (=> b!1466428 m!1352911))

(declare-fun m!1352925 () Bool)

(assert (=> b!1466428 m!1352925))

(declare-fun m!1352927 () Bool)

(assert (=> b!1466426 m!1352927))

(assert (=> b!1466426 m!1352909))

(declare-fun m!1352929 () Bool)

(assert (=> b!1466427 m!1352929))

(declare-fun m!1352931 () Bool)

(assert (=> start!125368 m!1352931))

(declare-fun m!1352933 () Bool)

(assert (=> start!125368 m!1352933))

(declare-fun m!1352935 () Bool)

(assert (=> b!1466413 m!1352935))

(assert (=> b!1466421 m!1352911))

(assert (=> b!1466421 m!1352911))

(declare-fun m!1352937 () Bool)

(assert (=> b!1466421 m!1352937))

(assert (=> b!1466421 m!1352937))

(assert (=> b!1466421 m!1352911))

(declare-fun m!1352939 () Bool)

(assert (=> b!1466421 m!1352939))

(declare-fun m!1352941 () Bool)

(assert (=> b!1466417 m!1352941))

(assert (=> b!1466417 m!1352941))

(declare-fun m!1352943 () Bool)

(assert (=> b!1466417 m!1352943))

(declare-fun m!1352945 () Bool)

(assert (=> b!1466418 m!1352945))

(assert (=> b!1466418 m!1352945))

(declare-fun m!1352947 () Bool)

(assert (=> b!1466418 m!1352947))

(assert (=> b!1466418 m!1352917))

(declare-fun m!1352949 () Bool)

(assert (=> b!1466418 m!1352949))

(declare-fun m!1352951 () Bool)

(assert (=> b!1466424 m!1352951))

(assert (=> b!1466419 m!1352909))

(declare-fun m!1352953 () Bool)

(assert (=> b!1466419 m!1352953))

(declare-fun m!1352955 () Bool)

(assert (=> b!1466423 m!1352955))

(assert (=> b!1466423 m!1352917))

(declare-fun m!1352957 () Bool)

(assert (=> b!1466423 m!1352957))

(declare-fun m!1352959 () Bool)

(assert (=> b!1466423 m!1352959))

(declare-fun m!1352961 () Bool)

(assert (=> b!1466423 m!1352961))

(assert (=> b!1466423 m!1352911))

(declare-fun m!1352963 () Bool)

(assert (=> b!1466423 m!1352963))

(declare-fun m!1352965 () Bool)

(assert (=> b!1466423 m!1352965))

(assert (=> b!1466423 m!1352911))

(check-sat (not b!1466418) (not b!1466424) (not b!1466417) (not b!1466414) (not b!1466419) (not b!1466433) (not b!1466421) (not b!1466413) (not b!1466423) (not b!1466426) (not start!125368) (not b!1466428) (not b!1466427) (not b!1466415) (not b!1466420) (not b!1466431))
(check-sat)
