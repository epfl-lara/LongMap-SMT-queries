; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126156 () Bool)

(assert start!126156)

(declare-fun b!1477192 () Bool)

(declare-fun res!1003353 () Bool)

(declare-fun e!828725 () Bool)

(assert (=> b!1477192 (=> (not res!1003353) (not e!828725))))

(declare-datatypes ((array!99262 0))(
  ( (array!99263 (arr!47910 (Array (_ BitVec 32) (_ BitVec 64))) (size!48460 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99262)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477192 (= res!1003353 (validKeyInArray!0 (select (arr!47910 a!2862) j!93)))))

(declare-fun b!1477193 () Bool)

(declare-fun e!828724 () Bool)

(declare-fun e!828720 () Bool)

(assert (=> b!1477193 (= e!828724 e!828720)))

(declare-fun res!1003357 () Bool)

(assert (=> b!1477193 (=> (not res!1003357) (not e!828720))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12150 0))(
  ( (MissingZero!12150 (index!50992 (_ BitVec 32))) (Found!12150 (index!50993 (_ BitVec 32))) (Intermediate!12150 (undefined!12962 Bool) (index!50994 (_ BitVec 32)) (x!132589 (_ BitVec 32))) (Undefined!12150) (MissingVacant!12150 (index!50995 (_ BitVec 32))) )
))
(declare-fun lt!645269 () SeekEntryResult!12150)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12150)

(assert (=> b!1477193 (= res!1003357 (= lt!645269 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47910 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477194 () Bool)

(declare-fun res!1003355 () Bool)

(declare-fun e!828728 () Bool)

(assert (=> b!1477194 (=> (not res!1003355) (not e!828728))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477194 (= res!1003355 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1477195 () Bool)

(assert (=> b!1477195 (= e!828720 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477196 () Bool)

(declare-fun res!1003354 () Bool)

(assert (=> b!1477196 (=> (not res!1003354) (not e!828725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99262 (_ BitVec 32)) Bool)

(assert (=> b!1477196 (= res!1003354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477197 () Bool)

(declare-fun res!1003352 () Bool)

(assert (=> b!1477197 (=> (not res!1003352) (not e!828725))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477197 (= res!1003352 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48460 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48460 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48460 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477198 () Bool)

(assert (=> b!1477198 (= e!828728 (not true))))

(declare-fun e!828727 () Bool)

(assert (=> b!1477198 e!828727))

(declare-fun res!1003350 () Bool)

(assert (=> b!1477198 (=> (not res!1003350) (not e!828727))))

(assert (=> b!1477198 (= res!1003350 (and (= lt!645269 (Found!12150 j!93)) (or (= (select (arr!47910 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47910 a!2862) intermediateBeforeIndex!19) (select (arr!47910 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12150)

(assert (=> b!1477198 (= lt!645269 (seekEntryOrOpen!0 (select (arr!47910 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477198 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49640 0))(
  ( (Unit!49641) )
))
(declare-fun lt!645266 () Unit!49640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49640)

(assert (=> b!1477198 (= lt!645266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477199 () Bool)

(declare-fun res!1003358 () Bool)

(assert (=> b!1477199 (=> (not res!1003358) (not e!828725))))

(assert (=> b!1477199 (= res!1003358 (validKeyInArray!0 (select (arr!47910 a!2862) i!1006)))))

(declare-fun b!1477200 () Bool)

(declare-fun e!828722 () Bool)

(assert (=> b!1477200 (= e!828725 e!828722)))

(declare-fun res!1003348 () Bool)

(assert (=> b!1477200 (=> (not res!1003348) (not e!828722))))

(assert (=> b!1477200 (= res!1003348 (= (select (store (arr!47910 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645268 () array!99262)

(assert (=> b!1477200 (= lt!645268 (array!99263 (store (arr!47910 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48460 a!2862)))))

(declare-fun res!1003356 () Bool)

(assert (=> start!126156 (=> (not res!1003356) (not e!828725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126156 (= res!1003356 (validMask!0 mask!2687))))

(assert (=> start!126156 e!828725))

(assert (=> start!126156 true))

(declare-fun array_inv!36938 (array!99262) Bool)

(assert (=> start!126156 (array_inv!36938 a!2862)))

(declare-fun lt!645265 () (_ BitVec 64))

(declare-fun e!828721 () Bool)

(declare-fun b!1477201 () Bool)

(assert (=> b!1477201 (= e!828721 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645265 lt!645268 mask!2687) (seekEntryOrOpen!0 lt!645265 lt!645268 mask!2687)))))

(declare-fun b!1477202 () Bool)

(declare-fun res!1003351 () Bool)

(assert (=> b!1477202 (=> (not res!1003351) (not e!828725))))

(assert (=> b!1477202 (= res!1003351 (and (= (size!48460 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48460 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48460 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477203 () Bool)

(declare-fun e!828726 () Bool)

(assert (=> b!1477203 (= e!828726 e!828728)))

(declare-fun res!1003345 () Bool)

(assert (=> b!1477203 (=> (not res!1003345) (not e!828728))))

(declare-fun lt!645267 () SeekEntryResult!12150)

(assert (=> b!1477203 (= res!1003345 (= lt!645267 (Intermediate!12150 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477203 (= lt!645267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645265 mask!2687) lt!645265 lt!645268 mask!2687))))

(assert (=> b!1477203 (= lt!645265 (select (store (arr!47910 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477204 () Bool)

(declare-fun res!1003359 () Bool)

(assert (=> b!1477204 (=> (not res!1003359) (not e!828726))))

(declare-fun lt!645270 () SeekEntryResult!12150)

(assert (=> b!1477204 (= res!1003359 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47910 a!2862) j!93) a!2862 mask!2687) lt!645270))))

(declare-fun b!1477205 () Bool)

(assert (=> b!1477205 (= e!828722 e!828726)))

(declare-fun res!1003347 () Bool)

(assert (=> b!1477205 (=> (not res!1003347) (not e!828726))))

(assert (=> b!1477205 (= res!1003347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47910 a!2862) j!93) mask!2687) (select (arr!47910 a!2862) j!93) a!2862 mask!2687) lt!645270))))

(assert (=> b!1477205 (= lt!645270 (Intermediate!12150 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477206 () Bool)

(declare-fun res!1003360 () Bool)

(assert (=> b!1477206 (=> (not res!1003360) (not e!828728))))

(assert (=> b!1477206 (= res!1003360 e!828721)))

(declare-fun c!136443 () Bool)

(assert (=> b!1477206 (= c!136443 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477207 () Bool)

(assert (=> b!1477207 (= e!828727 e!828724)))

(declare-fun res!1003349 () Bool)

(assert (=> b!1477207 (=> res!1003349 e!828724)))

(assert (=> b!1477207 (= res!1003349 (or (and (= (select (arr!47910 a!2862) index!646) (select (store (arr!47910 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47910 a!2862) index!646) (select (arr!47910 a!2862) j!93))) (not (= (select (arr!47910 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477208 () Bool)

(declare-fun res!1003346 () Bool)

(assert (=> b!1477208 (=> (not res!1003346) (not e!828725))))

(declare-datatypes ((List!34411 0))(
  ( (Nil!34408) (Cons!34407 (h!35775 (_ BitVec 64)) (t!49105 List!34411)) )
))
(declare-fun arrayNoDuplicates!0 (array!99262 (_ BitVec 32) List!34411) Bool)

(assert (=> b!1477208 (= res!1003346 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34408))))

(declare-fun b!1477209 () Bool)

(assert (=> b!1477209 (= e!828721 (= lt!645267 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645265 lt!645268 mask!2687)))))

(assert (= (and start!126156 res!1003356) b!1477202))

(assert (= (and b!1477202 res!1003351) b!1477199))

(assert (= (and b!1477199 res!1003358) b!1477192))

(assert (= (and b!1477192 res!1003353) b!1477196))

(assert (= (and b!1477196 res!1003354) b!1477208))

(assert (= (and b!1477208 res!1003346) b!1477197))

(assert (= (and b!1477197 res!1003352) b!1477200))

(assert (= (and b!1477200 res!1003348) b!1477205))

(assert (= (and b!1477205 res!1003347) b!1477204))

(assert (= (and b!1477204 res!1003359) b!1477203))

(assert (= (and b!1477203 res!1003345) b!1477206))

(assert (= (and b!1477206 c!136443) b!1477209))

(assert (= (and b!1477206 (not c!136443)) b!1477201))

(assert (= (and b!1477206 res!1003360) b!1477194))

(assert (= (and b!1477194 res!1003355) b!1477198))

(assert (= (and b!1477198 res!1003350) b!1477207))

(assert (= (and b!1477207 (not res!1003349)) b!1477193))

(assert (= (and b!1477193 res!1003357) b!1477195))

(declare-fun m!1363151 () Bool)

(assert (=> start!126156 m!1363151))

(declare-fun m!1363153 () Bool)

(assert (=> start!126156 m!1363153))

(declare-fun m!1363155 () Bool)

(assert (=> b!1477193 m!1363155))

(assert (=> b!1477193 m!1363155))

(declare-fun m!1363157 () Bool)

(assert (=> b!1477193 m!1363157))

(declare-fun m!1363159 () Bool)

(assert (=> b!1477196 m!1363159))

(declare-fun m!1363161 () Bool)

(assert (=> b!1477208 m!1363161))

(assert (=> b!1477192 m!1363155))

(assert (=> b!1477192 m!1363155))

(declare-fun m!1363163 () Bool)

(assert (=> b!1477192 m!1363163))

(assert (=> b!1477205 m!1363155))

(assert (=> b!1477205 m!1363155))

(declare-fun m!1363165 () Bool)

(assert (=> b!1477205 m!1363165))

(assert (=> b!1477205 m!1363165))

(assert (=> b!1477205 m!1363155))

(declare-fun m!1363167 () Bool)

(assert (=> b!1477205 m!1363167))

(declare-fun m!1363169 () Bool)

(assert (=> b!1477203 m!1363169))

(assert (=> b!1477203 m!1363169))

(declare-fun m!1363171 () Bool)

(assert (=> b!1477203 m!1363171))

(declare-fun m!1363173 () Bool)

(assert (=> b!1477203 m!1363173))

(declare-fun m!1363175 () Bool)

(assert (=> b!1477203 m!1363175))

(declare-fun m!1363177 () Bool)

(assert (=> b!1477199 m!1363177))

(assert (=> b!1477199 m!1363177))

(declare-fun m!1363179 () Bool)

(assert (=> b!1477199 m!1363179))

(declare-fun m!1363181 () Bool)

(assert (=> b!1477207 m!1363181))

(assert (=> b!1477207 m!1363173))

(declare-fun m!1363183 () Bool)

(assert (=> b!1477207 m!1363183))

(assert (=> b!1477207 m!1363155))

(declare-fun m!1363185 () Bool)

(assert (=> b!1477209 m!1363185))

(declare-fun m!1363187 () Bool)

(assert (=> b!1477201 m!1363187))

(declare-fun m!1363189 () Bool)

(assert (=> b!1477201 m!1363189))

(assert (=> b!1477200 m!1363173))

(declare-fun m!1363191 () Bool)

(assert (=> b!1477200 m!1363191))

(assert (=> b!1477204 m!1363155))

(assert (=> b!1477204 m!1363155))

(declare-fun m!1363193 () Bool)

(assert (=> b!1477204 m!1363193))

(declare-fun m!1363195 () Bool)

(assert (=> b!1477198 m!1363195))

(declare-fun m!1363197 () Bool)

(assert (=> b!1477198 m!1363197))

(assert (=> b!1477198 m!1363155))

(declare-fun m!1363199 () Bool)

(assert (=> b!1477198 m!1363199))

(declare-fun m!1363201 () Bool)

(assert (=> b!1477198 m!1363201))

(assert (=> b!1477198 m!1363155))

(check-sat (not b!1477198) (not b!1477192) (not b!1477196) (not b!1477201) (not b!1477203) (not b!1477199) (not start!126156) (not b!1477205) (not b!1477208) (not b!1477209) (not b!1477193) (not b!1477204))
(check-sat)
