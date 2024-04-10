; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126194 () Bool)

(assert start!126194)

(declare-fun res!1004272 () Bool)

(declare-fun e!829236 () Bool)

(assert (=> start!126194 (=> (not res!1004272) (not e!829236))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126194 (= res!1004272 (validMask!0 mask!2687))))

(assert (=> start!126194 e!829236))

(assert (=> start!126194 true))

(declare-datatypes ((array!99300 0))(
  ( (array!99301 (arr!47929 (Array (_ BitVec 32) (_ BitVec 64))) (size!48479 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99300)

(declare-fun array_inv!36957 (array!99300) Bool)

(assert (=> start!126194 (array_inv!36957 a!2862)))

(declare-fun b!1478218 () Bool)

(declare-fun e!829234 () Bool)

(assert (=> b!1478218 (= e!829234 (not true))))

(declare-fun e!829240 () Bool)

(assert (=> b!1478218 e!829240))

(declare-fun res!1004258 () Bool)

(assert (=> b!1478218 (=> (not res!1004258) (not e!829240))))

(declare-datatypes ((SeekEntryResult!12169 0))(
  ( (MissingZero!12169 (index!51068 (_ BitVec 32))) (Found!12169 (index!51069 (_ BitVec 32))) (Intermediate!12169 (undefined!12981 Bool) (index!51070 (_ BitVec 32)) (x!132656 (_ BitVec 32))) (Undefined!12169) (MissingVacant!12169 (index!51071 (_ BitVec 32))) )
))
(declare-fun lt!645607 () SeekEntryResult!12169)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1478218 (= res!1004258 (and (= lt!645607 (Found!12169 j!93)) (or (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) (select (arr!47929 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99300 (_ BitVec 32)) SeekEntryResult!12169)

(assert (=> b!1478218 (= lt!645607 (seekEntryOrOpen!0 (select (arr!47929 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99300 (_ BitVec 32)) Bool)

(assert (=> b!1478218 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49678 0))(
  ( (Unit!49679) )
))
(declare-fun lt!645610 () Unit!49678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49678)

(assert (=> b!1478218 (= lt!645610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478219 () Bool)

(declare-fun lt!645612 () (_ BitVec 64))

(declare-fun lt!645609 () SeekEntryResult!12169)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645608 () array!99300)

(declare-fun e!829235 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99300 (_ BitVec 32)) SeekEntryResult!12169)

(assert (=> b!1478219 (= e!829235 (= lt!645609 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645612 lt!645608 mask!2687)))))

(declare-fun b!1478220 () Bool)

(declare-fun e!829239 () Bool)

(declare-fun e!829241 () Bool)

(assert (=> b!1478220 (= e!829239 e!829241)))

(declare-fun res!1004268 () Bool)

(assert (=> b!1478220 (=> (not res!1004268) (not e!829241))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99300 (_ BitVec 32)) SeekEntryResult!12169)

(assert (=> b!1478220 (= res!1004268 (= lt!645607 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47929 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478221 () Bool)

(declare-fun res!1004270 () Bool)

(assert (=> b!1478221 (=> (not res!1004270) (not e!829236))))

(assert (=> b!1478221 (= res!1004270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478222 () Bool)

(declare-fun e!829238 () Bool)

(declare-fun e!829233 () Bool)

(assert (=> b!1478222 (= e!829238 e!829233)))

(declare-fun res!1004261 () Bool)

(assert (=> b!1478222 (=> (not res!1004261) (not e!829233))))

(declare-fun lt!645611 () SeekEntryResult!12169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478222 (= res!1004261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47929 a!2862) j!93) mask!2687) (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!645611))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478222 (= lt!645611 (Intermediate!12169 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478223 () Bool)

(declare-fun res!1004269 () Bool)

(assert (=> b!1478223 (=> (not res!1004269) (not e!829236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478223 (= res!1004269 (validKeyInArray!0 (select (arr!47929 a!2862) j!93)))))

(declare-fun b!1478224 () Bool)

(declare-fun res!1004271 () Bool)

(assert (=> b!1478224 (=> (not res!1004271) (not e!829233))))

(assert (=> b!1478224 (= res!1004271 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!645611))))

(declare-fun b!1478225 () Bool)

(declare-fun res!1004262 () Bool)

(assert (=> b!1478225 (=> (not res!1004262) (not e!829236))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478225 (= res!1004262 (validKeyInArray!0 (select (arr!47929 a!2862) i!1006)))))

(declare-fun b!1478226 () Bool)

(assert (=> b!1478226 (= e!829233 e!829234)))

(declare-fun res!1004267 () Bool)

(assert (=> b!1478226 (=> (not res!1004267) (not e!829234))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478226 (= res!1004267 (= lt!645609 (Intermediate!12169 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478226 (= lt!645609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645612 mask!2687) lt!645612 lt!645608 mask!2687))))

(assert (=> b!1478226 (= lt!645612 (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478227 () Bool)

(declare-fun res!1004257 () Bool)

(assert (=> b!1478227 (=> (not res!1004257) (not e!829236))))

(assert (=> b!1478227 (= res!1004257 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48479 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48479 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48479 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478228 () Bool)

(assert (=> b!1478228 (= e!829240 e!829239)))

(declare-fun res!1004263 () Bool)

(assert (=> b!1478228 (=> res!1004263 e!829239)))

(assert (=> b!1478228 (= res!1004263 (or (and (= (select (arr!47929 a!2862) index!646) (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47929 a!2862) index!646) (select (arr!47929 a!2862) j!93))) (not (= (select (arr!47929 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478229 () Bool)

(declare-fun res!1004266 () Bool)

(assert (=> b!1478229 (=> (not res!1004266) (not e!829234))))

(assert (=> b!1478229 (= res!1004266 e!829235)))

(declare-fun c!136500 () Bool)

(assert (=> b!1478229 (= c!136500 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478230 () Bool)

(assert (=> b!1478230 (= e!829241 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478231 () Bool)

(assert (=> b!1478231 (= e!829236 e!829238)))

(declare-fun res!1004264 () Bool)

(assert (=> b!1478231 (=> (not res!1004264) (not e!829238))))

(assert (=> b!1478231 (= res!1004264 (= (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478231 (= lt!645608 (array!99301 (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48479 a!2862)))))

(declare-fun b!1478232 () Bool)

(declare-fun res!1004265 () Bool)

(assert (=> b!1478232 (=> (not res!1004265) (not e!829236))))

(assert (=> b!1478232 (= res!1004265 (and (= (size!48479 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48479 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48479 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478233 () Bool)

(declare-fun res!1004260 () Bool)

(assert (=> b!1478233 (=> (not res!1004260) (not e!829234))))

(assert (=> b!1478233 (= res!1004260 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478234 () Bool)

(declare-fun res!1004259 () Bool)

(assert (=> b!1478234 (=> (not res!1004259) (not e!829236))))

(declare-datatypes ((List!34430 0))(
  ( (Nil!34427) (Cons!34426 (h!35794 (_ BitVec 64)) (t!49124 List!34430)) )
))
(declare-fun arrayNoDuplicates!0 (array!99300 (_ BitVec 32) List!34430) Bool)

(assert (=> b!1478234 (= res!1004259 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34427))))

(declare-fun b!1478235 () Bool)

(assert (=> b!1478235 (= e!829235 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645612 lt!645608 mask!2687) (seekEntryOrOpen!0 lt!645612 lt!645608 mask!2687)))))

(assert (= (and start!126194 res!1004272) b!1478232))

(assert (= (and b!1478232 res!1004265) b!1478225))

(assert (= (and b!1478225 res!1004262) b!1478223))

(assert (= (and b!1478223 res!1004269) b!1478221))

(assert (= (and b!1478221 res!1004270) b!1478234))

(assert (= (and b!1478234 res!1004259) b!1478227))

(assert (= (and b!1478227 res!1004257) b!1478231))

(assert (= (and b!1478231 res!1004264) b!1478222))

(assert (= (and b!1478222 res!1004261) b!1478224))

(assert (= (and b!1478224 res!1004271) b!1478226))

(assert (= (and b!1478226 res!1004267) b!1478229))

(assert (= (and b!1478229 c!136500) b!1478219))

(assert (= (and b!1478229 (not c!136500)) b!1478235))

(assert (= (and b!1478229 res!1004266) b!1478233))

(assert (= (and b!1478233 res!1004260) b!1478218))

(assert (= (and b!1478218 res!1004258) b!1478228))

(assert (= (and b!1478228 (not res!1004263)) b!1478220))

(assert (= (and b!1478220 res!1004268) b!1478230))

(declare-fun m!1364139 () Bool)

(assert (=> b!1478219 m!1364139))

(declare-fun m!1364141 () Bool)

(assert (=> b!1478234 m!1364141))

(declare-fun m!1364143 () Bool)

(assert (=> b!1478224 m!1364143))

(assert (=> b!1478224 m!1364143))

(declare-fun m!1364145 () Bool)

(assert (=> b!1478224 m!1364145))

(declare-fun m!1364147 () Bool)

(assert (=> b!1478226 m!1364147))

(assert (=> b!1478226 m!1364147))

(declare-fun m!1364149 () Bool)

(assert (=> b!1478226 m!1364149))

(declare-fun m!1364151 () Bool)

(assert (=> b!1478226 m!1364151))

(declare-fun m!1364153 () Bool)

(assert (=> b!1478226 m!1364153))

(declare-fun m!1364155 () Bool)

(assert (=> b!1478221 m!1364155))

(declare-fun m!1364157 () Bool)

(assert (=> b!1478228 m!1364157))

(assert (=> b!1478228 m!1364151))

(declare-fun m!1364159 () Bool)

(assert (=> b!1478228 m!1364159))

(assert (=> b!1478228 m!1364143))

(assert (=> b!1478220 m!1364143))

(assert (=> b!1478220 m!1364143))

(declare-fun m!1364161 () Bool)

(assert (=> b!1478220 m!1364161))

(assert (=> b!1478223 m!1364143))

(assert (=> b!1478223 m!1364143))

(declare-fun m!1364163 () Bool)

(assert (=> b!1478223 m!1364163))

(declare-fun m!1364165 () Bool)

(assert (=> b!1478235 m!1364165))

(declare-fun m!1364167 () Bool)

(assert (=> b!1478235 m!1364167))

(declare-fun m!1364169 () Bool)

(assert (=> b!1478218 m!1364169))

(declare-fun m!1364171 () Bool)

(assert (=> b!1478218 m!1364171))

(assert (=> b!1478218 m!1364143))

(declare-fun m!1364173 () Bool)

(assert (=> b!1478218 m!1364173))

(declare-fun m!1364175 () Bool)

(assert (=> b!1478218 m!1364175))

(assert (=> b!1478218 m!1364143))

(declare-fun m!1364177 () Bool)

(assert (=> start!126194 m!1364177))

(declare-fun m!1364179 () Bool)

(assert (=> start!126194 m!1364179))

(assert (=> b!1478222 m!1364143))

(assert (=> b!1478222 m!1364143))

(declare-fun m!1364181 () Bool)

(assert (=> b!1478222 m!1364181))

(assert (=> b!1478222 m!1364181))

(assert (=> b!1478222 m!1364143))

(declare-fun m!1364183 () Bool)

(assert (=> b!1478222 m!1364183))

(declare-fun m!1364185 () Bool)

(assert (=> b!1478225 m!1364185))

(assert (=> b!1478225 m!1364185))

(declare-fun m!1364187 () Bool)

(assert (=> b!1478225 m!1364187))

(assert (=> b!1478231 m!1364151))

(declare-fun m!1364189 () Bool)

(assert (=> b!1478231 m!1364189))

(push 1)

