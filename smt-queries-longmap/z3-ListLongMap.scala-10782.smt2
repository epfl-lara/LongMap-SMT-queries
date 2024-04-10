; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126192 () Bool)

(assert start!126192)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99298 0))(
  ( (array!99299 (arr!47928 (Array (_ BitVec 32) (_ BitVec 64))) (size!48478 (_ BitVec 32))) )
))
(declare-fun lt!645589 () array!99298)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12168 0))(
  ( (MissingZero!12168 (index!51064 (_ BitVec 32))) (Found!12168 (index!51065 (_ BitVec 32))) (Intermediate!12168 (undefined!12980 Bool) (index!51066 (_ BitVec 32)) (x!132655 (_ BitVec 32))) (Undefined!12168) (MissingVacant!12168 (index!51067 (_ BitVec 32))) )
))
(declare-fun lt!645593 () SeekEntryResult!12168)

(declare-fun e!829212 () Bool)

(declare-fun b!1478164 () Bool)

(declare-fun lt!645591 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12168)

(assert (=> b!1478164 (= e!829212 (= lt!645593 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645591 lt!645589 mask!2687)))))

(declare-fun b!1478165 () Bool)

(declare-fun res!1004212 () Bool)

(declare-fun e!829211 () Bool)

(assert (=> b!1478165 (=> (not res!1004212) (not e!829211))))

(declare-fun a!2862 () array!99298)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99298 (_ BitVec 32)) Bool)

(assert (=> b!1478165 (= res!1004212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478166 () Bool)

(declare-fun e!829209 () Bool)

(declare-fun e!829207 () Bool)

(assert (=> b!1478166 (= e!829209 e!829207)))

(declare-fun res!1004215 () Bool)

(assert (=> b!1478166 (=> (not res!1004215) (not e!829207))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!645590 () SeekEntryResult!12168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478166 (= res!1004215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47928 a!2862) j!93) mask!2687) (select (arr!47928 a!2862) j!93) a!2862 mask!2687) lt!645590))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478166 (= lt!645590 (Intermediate!12168 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478167 () Bool)

(assert (=> b!1478167 (= e!829211 e!829209)))

(declare-fun res!1004223 () Bool)

(assert (=> b!1478167 (=> (not res!1004223) (not e!829209))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478167 (= res!1004223 (= (select (store (arr!47928 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478167 (= lt!645589 (array!99299 (store (arr!47928 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48478 a!2862)))))

(declare-fun b!1478168 () Bool)

(declare-fun res!1004217 () Bool)

(declare-fun e!829214 () Bool)

(assert (=> b!1478168 (=> (not res!1004217) (not e!829214))))

(assert (=> b!1478168 (= res!1004217 e!829212)))

(declare-fun c!136497 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478168 (= c!136497 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478169 () Bool)

(declare-fun res!1004213 () Bool)

(assert (=> b!1478169 (=> (not res!1004213) (not e!829211))))

(assert (=> b!1478169 (= res!1004213 (and (= (size!48478 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48478 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48478 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478170 () Bool)

(declare-fun res!1004221 () Bool)

(assert (=> b!1478170 (=> (not res!1004221) (not e!829211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478170 (= res!1004221 (validKeyInArray!0 (select (arr!47928 a!2862) j!93)))))

(declare-fun b!1478171 () Bool)

(assert (=> b!1478171 (= e!829214 (not true))))

(declare-fun e!829213 () Bool)

(assert (=> b!1478171 e!829213))

(declare-fun res!1004211 () Bool)

(assert (=> b!1478171 (=> (not res!1004211) (not e!829213))))

(declare-fun lt!645594 () SeekEntryResult!12168)

(assert (=> b!1478171 (= res!1004211 (and (= lt!645594 (Found!12168 j!93)) (or (= (select (arr!47928 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47928 a!2862) intermediateBeforeIndex!19) (select (arr!47928 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12168)

(assert (=> b!1478171 (= lt!645594 (seekEntryOrOpen!0 (select (arr!47928 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478171 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49676 0))(
  ( (Unit!49677) )
))
(declare-fun lt!645592 () Unit!49676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49676)

(assert (=> b!1478171 (= lt!645592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1004219 () Bool)

(assert (=> start!126192 (=> (not res!1004219) (not e!829211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126192 (= res!1004219 (validMask!0 mask!2687))))

(assert (=> start!126192 e!829211))

(assert (=> start!126192 true))

(declare-fun array_inv!36956 (array!99298) Bool)

(assert (=> start!126192 (array_inv!36956 a!2862)))

(declare-fun b!1478172 () Bool)

(declare-fun e!829208 () Bool)

(declare-fun e!829206 () Bool)

(assert (=> b!1478172 (= e!829208 e!829206)))

(declare-fun res!1004224 () Bool)

(assert (=> b!1478172 (=> (not res!1004224) (not e!829206))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12168)

(assert (=> b!1478172 (= res!1004224 (= lt!645594 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47928 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478173 () Bool)

(assert (=> b!1478173 (= e!829206 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478174 () Bool)

(assert (=> b!1478174 (= e!829212 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645591 lt!645589 mask!2687) (seekEntryOrOpen!0 lt!645591 lt!645589 mask!2687)))))

(declare-fun b!1478175 () Bool)

(declare-fun res!1004216 () Bool)

(assert (=> b!1478175 (=> (not res!1004216) (not e!829211))))

(declare-datatypes ((List!34429 0))(
  ( (Nil!34426) (Cons!34425 (h!35793 (_ BitVec 64)) (t!49123 List!34429)) )
))
(declare-fun arrayNoDuplicates!0 (array!99298 (_ BitVec 32) List!34429) Bool)

(assert (=> b!1478175 (= res!1004216 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34426))))

(declare-fun b!1478176 () Bool)

(declare-fun res!1004210 () Bool)

(assert (=> b!1478176 (=> (not res!1004210) (not e!829211))))

(assert (=> b!1478176 (= res!1004210 (validKeyInArray!0 (select (arr!47928 a!2862) i!1006)))))

(declare-fun b!1478177 () Bool)

(assert (=> b!1478177 (= e!829207 e!829214)))

(declare-fun res!1004218 () Bool)

(assert (=> b!1478177 (=> (not res!1004218) (not e!829214))))

(assert (=> b!1478177 (= res!1004218 (= lt!645593 (Intermediate!12168 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478177 (= lt!645593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645591 mask!2687) lt!645591 lt!645589 mask!2687))))

(assert (=> b!1478177 (= lt!645591 (select (store (arr!47928 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478178 () Bool)

(assert (=> b!1478178 (= e!829213 e!829208)))

(declare-fun res!1004209 () Bool)

(assert (=> b!1478178 (=> res!1004209 e!829208)))

(assert (=> b!1478178 (= res!1004209 (or (and (= (select (arr!47928 a!2862) index!646) (select (store (arr!47928 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47928 a!2862) index!646) (select (arr!47928 a!2862) j!93))) (not (= (select (arr!47928 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478179 () Bool)

(declare-fun res!1004214 () Bool)

(assert (=> b!1478179 (=> (not res!1004214) (not e!829207))))

(assert (=> b!1478179 (= res!1004214 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47928 a!2862) j!93) a!2862 mask!2687) lt!645590))))

(declare-fun b!1478180 () Bool)

(declare-fun res!1004222 () Bool)

(assert (=> b!1478180 (=> (not res!1004222) (not e!829211))))

(assert (=> b!1478180 (= res!1004222 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48478 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48478 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48478 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478181 () Bool)

(declare-fun res!1004220 () Bool)

(assert (=> b!1478181 (=> (not res!1004220) (not e!829214))))

(assert (=> b!1478181 (= res!1004220 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126192 res!1004219) b!1478169))

(assert (= (and b!1478169 res!1004213) b!1478176))

(assert (= (and b!1478176 res!1004210) b!1478170))

(assert (= (and b!1478170 res!1004221) b!1478165))

(assert (= (and b!1478165 res!1004212) b!1478175))

(assert (= (and b!1478175 res!1004216) b!1478180))

(assert (= (and b!1478180 res!1004222) b!1478167))

(assert (= (and b!1478167 res!1004223) b!1478166))

(assert (= (and b!1478166 res!1004215) b!1478179))

(assert (= (and b!1478179 res!1004214) b!1478177))

(assert (= (and b!1478177 res!1004218) b!1478168))

(assert (= (and b!1478168 c!136497) b!1478164))

(assert (= (and b!1478168 (not c!136497)) b!1478174))

(assert (= (and b!1478168 res!1004217) b!1478181))

(assert (= (and b!1478181 res!1004220) b!1478171))

(assert (= (and b!1478171 res!1004211) b!1478178))

(assert (= (and b!1478178 (not res!1004209)) b!1478172))

(assert (= (and b!1478172 res!1004224) b!1478173))

(declare-fun m!1364087 () Bool)

(assert (=> start!126192 m!1364087))

(declare-fun m!1364089 () Bool)

(assert (=> start!126192 m!1364089))

(declare-fun m!1364091 () Bool)

(assert (=> b!1478171 m!1364091))

(declare-fun m!1364093 () Bool)

(assert (=> b!1478171 m!1364093))

(declare-fun m!1364095 () Bool)

(assert (=> b!1478171 m!1364095))

(declare-fun m!1364097 () Bool)

(assert (=> b!1478171 m!1364097))

(declare-fun m!1364099 () Bool)

(assert (=> b!1478171 m!1364099))

(assert (=> b!1478171 m!1364095))

(declare-fun m!1364101 () Bool)

(assert (=> b!1478178 m!1364101))

(declare-fun m!1364103 () Bool)

(assert (=> b!1478178 m!1364103))

(declare-fun m!1364105 () Bool)

(assert (=> b!1478178 m!1364105))

(assert (=> b!1478178 m!1364095))

(assert (=> b!1478172 m!1364095))

(assert (=> b!1478172 m!1364095))

(declare-fun m!1364107 () Bool)

(assert (=> b!1478172 m!1364107))

(declare-fun m!1364109 () Bool)

(assert (=> b!1478174 m!1364109))

(declare-fun m!1364111 () Bool)

(assert (=> b!1478174 m!1364111))

(declare-fun m!1364113 () Bool)

(assert (=> b!1478164 m!1364113))

(assert (=> b!1478170 m!1364095))

(assert (=> b!1478170 m!1364095))

(declare-fun m!1364115 () Bool)

(assert (=> b!1478170 m!1364115))

(assert (=> b!1478167 m!1364103))

(declare-fun m!1364117 () Bool)

(assert (=> b!1478167 m!1364117))

(assert (=> b!1478166 m!1364095))

(assert (=> b!1478166 m!1364095))

(declare-fun m!1364119 () Bool)

(assert (=> b!1478166 m!1364119))

(assert (=> b!1478166 m!1364119))

(assert (=> b!1478166 m!1364095))

(declare-fun m!1364121 () Bool)

(assert (=> b!1478166 m!1364121))

(declare-fun m!1364123 () Bool)

(assert (=> b!1478175 m!1364123))

(declare-fun m!1364125 () Bool)

(assert (=> b!1478177 m!1364125))

(assert (=> b!1478177 m!1364125))

(declare-fun m!1364127 () Bool)

(assert (=> b!1478177 m!1364127))

(assert (=> b!1478177 m!1364103))

(declare-fun m!1364129 () Bool)

(assert (=> b!1478177 m!1364129))

(declare-fun m!1364131 () Bool)

(assert (=> b!1478176 m!1364131))

(assert (=> b!1478176 m!1364131))

(declare-fun m!1364133 () Bool)

(assert (=> b!1478176 m!1364133))

(declare-fun m!1364135 () Bool)

(assert (=> b!1478165 m!1364135))

(assert (=> b!1478179 m!1364095))

(assert (=> b!1478179 m!1364095))

(declare-fun m!1364137 () Bool)

(assert (=> b!1478179 m!1364137))

(check-sat (not b!1478175) (not b!1478179) (not start!126192) (not b!1478171) (not b!1478176) (not b!1478164) (not b!1478172) (not b!1478174) (not b!1478166) (not b!1478165) (not b!1478177) (not b!1478170))
(check-sat)
