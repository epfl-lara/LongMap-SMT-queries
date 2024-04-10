; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125386 () Bool)

(assert start!125386)

(declare-fun b!1466211 () Bool)

(declare-fun res!994963 () Bool)

(declare-fun e!823763 () Bool)

(assert (=> b!1466211 (=> (not res!994963) (not e!823763))))

(declare-fun e!823764 () Bool)

(assert (=> b!1466211 (= res!994963 e!823764)))

(declare-fun c!135138 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466211 (= c!135138 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!641670 () (_ BitVec 32))

(declare-fun e!823761 () Bool)

(declare-fun lt!641672 () (_ BitVec 64))

(declare-datatypes ((array!98834 0))(
  ( (array!98835 (arr!47705 (Array (_ BitVec 32) (_ BitVec 64))) (size!48255 (_ BitVec 32))) )
))
(declare-fun lt!641675 () array!98834)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11957 0))(
  ( (MissingZero!11957 (index!50220 (_ BitVec 32))) (Found!11957 (index!50221 (_ BitVec 32))) (Intermediate!11957 (undefined!12769 Bool) (index!50222 (_ BitVec 32)) (x!131798 (_ BitVec 32))) (Undefined!11957) (MissingVacant!11957 (index!50223 (_ BitVec 32))) )
))
(declare-fun lt!641676 () SeekEntryResult!11957)

(declare-fun b!1466212 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98834 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466212 (= e!823761 (not (= lt!641676 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641670 lt!641672 lt!641675 mask!2687))))))

(declare-fun b!1466213 () Bool)

(declare-fun e!823768 () Bool)

(declare-fun e!823767 () Bool)

(assert (=> b!1466213 (= e!823768 e!823767)))

(declare-fun res!994966 () Bool)

(assert (=> b!1466213 (=> (not res!994966) (not e!823767))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98834)

(assert (=> b!1466213 (= res!994966 (= (select (store (arr!47705 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466213 (= lt!641675 (array!98835 (store (arr!47705 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48255 a!2862)))))

(declare-fun b!1466214 () Bool)

(declare-fun e!823765 () Bool)

(assert (=> b!1466214 (= e!823765 true)))

(declare-fun lt!641671 () SeekEntryResult!11957)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98834 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466214 (= lt!641671 (seekEntryOrOpen!0 lt!641672 lt!641675 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((Unit!49410 0))(
  ( (Unit!49411) )
))
(declare-fun lt!641669 () Unit!49410)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49410)

(assert (=> b!1466214 (= lt!641669 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641670 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466215 () Bool)

(declare-fun e!823762 () Bool)

(assert (=> b!1466215 (= e!823762 e!823763)))

(declare-fun res!994973 () Bool)

(assert (=> b!1466215 (=> (not res!994973) (not e!823763))))

(assert (=> b!1466215 (= res!994973 (= lt!641676 (Intermediate!11957 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466215 (= lt!641676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641672 mask!2687) lt!641672 lt!641675 mask!2687))))

(assert (=> b!1466215 (= lt!641672 (select (store (arr!47705 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!994968 () Bool)

(assert (=> start!125386 (=> (not res!994968) (not e!823768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125386 (= res!994968 (validMask!0 mask!2687))))

(assert (=> start!125386 e!823768))

(assert (=> start!125386 true))

(declare-fun array_inv!36733 (array!98834) Bool)

(assert (=> start!125386 (array_inv!36733 a!2862)))

(declare-fun b!1466216 () Bool)

(declare-fun res!994962 () Bool)

(assert (=> b!1466216 (=> res!994962 e!823765)))

(assert (=> b!1466216 (= res!994962 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466217 () Bool)

(declare-fun res!994974 () Bool)

(assert (=> b!1466217 (=> (not res!994974) (not e!823768))))

(declare-datatypes ((List!34206 0))(
  ( (Nil!34203) (Cons!34202 (h!35552 (_ BitVec 64)) (t!48900 List!34206)) )
))
(declare-fun arrayNoDuplicates!0 (array!98834 (_ BitVec 32) List!34206) Bool)

(assert (=> b!1466217 (= res!994974 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34203))))

(declare-fun b!1466218 () Bool)

(declare-fun res!994971 () Bool)

(assert (=> b!1466218 (=> res!994971 e!823765)))

(assert (=> b!1466218 (= res!994971 e!823761)))

(declare-fun c!135137 () Bool)

(assert (=> b!1466218 (= c!135137 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466219 () Bool)

(assert (=> b!1466219 (= e!823767 e!823762)))

(declare-fun res!994960 () Bool)

(assert (=> b!1466219 (=> (not res!994960) (not e!823762))))

(declare-fun lt!641674 () SeekEntryResult!11957)

(assert (=> b!1466219 (= res!994960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47705 a!2862) j!93) mask!2687) (select (arr!47705 a!2862) j!93) a!2862 mask!2687) lt!641674))))

(assert (=> b!1466219 (= lt!641674 (Intermediate!11957 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466220 () Bool)

(declare-fun e!823766 () Bool)

(assert (=> b!1466220 (= e!823763 (not e!823766))))

(declare-fun res!994969 () Bool)

(assert (=> b!1466220 (=> res!994969 e!823766)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466220 (= res!994969 (or (and (= (select (arr!47705 a!2862) index!646) (select (store (arr!47705 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47705 a!2862) index!646) (select (arr!47705 a!2862) j!93))) (= (select (arr!47705 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466220 (and (= lt!641671 (Found!11957 j!93)) (or (= (select (arr!47705 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47705 a!2862) intermediateBeforeIndex!19) (select (arr!47705 a!2862) j!93))))))

(assert (=> b!1466220 (= lt!641671 (seekEntryOrOpen!0 (select (arr!47705 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98834 (_ BitVec 32)) Bool)

(assert (=> b!1466220 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641673 () Unit!49410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49410)

(assert (=> b!1466220 (= lt!641673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466221 () Bool)

(declare-fun res!994959 () Bool)

(assert (=> b!1466221 (=> (not res!994959) (not e!823768))))

(assert (=> b!1466221 (= res!994959 (and (= (size!48255 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48255 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48255 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466222 () Bool)

(declare-fun res!994970 () Bool)

(assert (=> b!1466222 (=> res!994970 e!823765)))

(assert (=> b!1466222 (= res!994970 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641670 (select (arr!47705 a!2862) j!93) a!2862 mask!2687) lt!641674)))))

(declare-fun b!1466223 () Bool)

(declare-fun res!994964 () Bool)

(assert (=> b!1466223 (=> (not res!994964) (not e!823763))))

(assert (=> b!1466223 (= res!994964 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98834 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466224 (= e!823764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641672 lt!641675 mask!2687) (seekEntryOrOpen!0 lt!641672 lt!641675 mask!2687)))))

(declare-fun b!1466225 () Bool)

(assert (=> b!1466225 (= e!823766 e!823765)))

(declare-fun res!994967 () Bool)

(assert (=> b!1466225 (=> res!994967 e!823765)))

(assert (=> b!1466225 (= res!994967 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641670 #b00000000000000000000000000000000) (bvsge lt!641670 (size!48255 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466225 (= lt!641670 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466226 () Bool)

(declare-fun res!994975 () Bool)

(assert (=> b!1466226 (=> (not res!994975) (not e!823762))))

(assert (=> b!1466226 (= res!994975 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47705 a!2862) j!93) a!2862 mask!2687) lt!641674))))

(declare-fun b!1466227 () Bool)

(declare-fun res!994972 () Bool)

(assert (=> b!1466227 (=> (not res!994972) (not e!823768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466227 (= res!994972 (validKeyInArray!0 (select (arr!47705 a!2862) j!93)))))

(declare-fun b!1466228 () Bool)

(declare-fun res!994958 () Bool)

(assert (=> b!1466228 (=> (not res!994958) (not e!823768))))

(assert (=> b!1466228 (= res!994958 (validKeyInArray!0 (select (arr!47705 a!2862) i!1006)))))

(declare-fun b!1466229 () Bool)

(declare-fun res!994961 () Bool)

(assert (=> b!1466229 (=> (not res!994961) (not e!823768))))

(assert (=> b!1466229 (= res!994961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466230 () Bool)

(assert (=> b!1466230 (= e!823761 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641670 intermediateAfterIndex!19 lt!641672 lt!641675 mask!2687) (seekEntryOrOpen!0 lt!641672 lt!641675 mask!2687))))))

(declare-fun b!1466231 () Bool)

(declare-fun res!994965 () Bool)

(assert (=> b!1466231 (=> (not res!994965) (not e!823768))))

(assert (=> b!1466231 (= res!994965 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48255 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48255 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48255 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466232 () Bool)

(assert (=> b!1466232 (= e!823764 (= lt!641676 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641672 lt!641675 mask!2687)))))

(assert (= (and start!125386 res!994968) b!1466221))

(assert (= (and b!1466221 res!994959) b!1466228))

(assert (= (and b!1466228 res!994958) b!1466227))

(assert (= (and b!1466227 res!994972) b!1466229))

(assert (= (and b!1466229 res!994961) b!1466217))

(assert (= (and b!1466217 res!994974) b!1466231))

(assert (= (and b!1466231 res!994965) b!1466213))

(assert (= (and b!1466213 res!994966) b!1466219))

(assert (= (and b!1466219 res!994960) b!1466226))

(assert (= (and b!1466226 res!994975) b!1466215))

(assert (= (and b!1466215 res!994973) b!1466211))

(assert (= (and b!1466211 c!135138) b!1466232))

(assert (= (and b!1466211 (not c!135138)) b!1466224))

(assert (= (and b!1466211 res!994963) b!1466223))

(assert (= (and b!1466223 res!994964) b!1466220))

(assert (= (and b!1466220 (not res!994969)) b!1466225))

(assert (= (and b!1466225 (not res!994967)) b!1466222))

(assert (= (and b!1466222 (not res!994970)) b!1466218))

(assert (= (and b!1466218 c!135137) b!1466212))

(assert (= (and b!1466218 (not c!135137)) b!1466230))

(assert (= (and b!1466218 (not res!994971)) b!1466216))

(assert (= (and b!1466216 (not res!994962)) b!1466214))

(declare-fun m!1353223 () Bool)

(assert (=> b!1466222 m!1353223))

(assert (=> b!1466222 m!1353223))

(declare-fun m!1353225 () Bool)

(assert (=> b!1466222 m!1353225))

(declare-fun m!1353227 () Bool)

(assert (=> b!1466212 m!1353227))

(assert (=> b!1466219 m!1353223))

(assert (=> b!1466219 m!1353223))

(declare-fun m!1353229 () Bool)

(assert (=> b!1466219 m!1353229))

(assert (=> b!1466219 m!1353229))

(assert (=> b!1466219 m!1353223))

(declare-fun m!1353231 () Bool)

(assert (=> b!1466219 m!1353231))

(declare-fun m!1353233 () Bool)

(assert (=> b!1466213 m!1353233))

(declare-fun m!1353235 () Bool)

(assert (=> b!1466213 m!1353235))

(assert (=> b!1466226 m!1353223))

(assert (=> b!1466226 m!1353223))

(declare-fun m!1353237 () Bool)

(assert (=> b!1466226 m!1353237))

(declare-fun m!1353239 () Bool)

(assert (=> b!1466230 m!1353239))

(declare-fun m!1353241 () Bool)

(assert (=> b!1466230 m!1353241))

(assert (=> b!1466227 m!1353223))

(assert (=> b!1466227 m!1353223))

(declare-fun m!1353243 () Bool)

(assert (=> b!1466227 m!1353243))

(declare-fun m!1353245 () Bool)

(assert (=> b!1466217 m!1353245))

(declare-fun m!1353247 () Bool)

(assert (=> b!1466225 m!1353247))

(declare-fun m!1353249 () Bool)

(assert (=> b!1466232 m!1353249))

(declare-fun m!1353251 () Bool)

(assert (=> b!1466215 m!1353251))

(assert (=> b!1466215 m!1353251))

(declare-fun m!1353253 () Bool)

(assert (=> b!1466215 m!1353253))

(assert (=> b!1466215 m!1353233))

(declare-fun m!1353255 () Bool)

(assert (=> b!1466215 m!1353255))

(declare-fun m!1353257 () Bool)

(assert (=> start!125386 m!1353257))

(declare-fun m!1353259 () Bool)

(assert (=> start!125386 m!1353259))

(declare-fun m!1353261 () Bool)

(assert (=> b!1466229 m!1353261))

(assert (=> b!1466214 m!1353241))

(declare-fun m!1353263 () Bool)

(assert (=> b!1466214 m!1353263))

(declare-fun m!1353265 () Bool)

(assert (=> b!1466220 m!1353265))

(assert (=> b!1466220 m!1353233))

(declare-fun m!1353267 () Bool)

(assert (=> b!1466220 m!1353267))

(declare-fun m!1353269 () Bool)

(assert (=> b!1466220 m!1353269))

(declare-fun m!1353271 () Bool)

(assert (=> b!1466220 m!1353271))

(assert (=> b!1466220 m!1353223))

(declare-fun m!1353273 () Bool)

(assert (=> b!1466220 m!1353273))

(declare-fun m!1353275 () Bool)

(assert (=> b!1466220 m!1353275))

(assert (=> b!1466220 m!1353223))

(declare-fun m!1353277 () Bool)

(assert (=> b!1466228 m!1353277))

(assert (=> b!1466228 m!1353277))

(declare-fun m!1353279 () Bool)

(assert (=> b!1466228 m!1353279))

(declare-fun m!1353281 () Bool)

(assert (=> b!1466224 m!1353281))

(assert (=> b!1466224 m!1353241))

(push 1)

