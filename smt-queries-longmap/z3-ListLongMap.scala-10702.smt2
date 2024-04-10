; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125352 () Bool)

(assert start!125352)

(declare-fun b!1465089 () Bool)

(declare-fun res!994042 () Bool)

(declare-fun e!823277 () Bool)

(assert (=> b!1465089 (=> (not res!994042) (not e!823277))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98800 0))(
  ( (array!98801 (arr!47688 (Array (_ BitVec 32) (_ BitVec 64))) (size!48238 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98800)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465089 (= res!994042 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48238 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48238 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48238 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465090 () Bool)

(declare-fun e!823279 () Bool)

(assert (=> b!1465090 (= e!823277 e!823279)))

(declare-fun res!994057 () Bool)

(assert (=> b!1465090 (=> (not res!994057) (not e!823279))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465090 (= res!994057 (= (select (store (arr!47688 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641295 () array!98800)

(assert (=> b!1465090 (= lt!641295 (array!98801 (store (arr!47688 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48238 a!2862)))))

(declare-fun e!823280 () Bool)

(declare-fun b!1465091 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465091 (= e!823280 (or (= (select (arr!47688 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47688 a!2862) intermediateBeforeIndex!19) (select (arr!47688 a!2862) j!93))))))

(declare-fun b!1465092 () Bool)

(declare-fun e!823276 () Bool)

(assert (=> b!1465092 (= e!823276 true)))

(declare-fun lt!641296 () Bool)

(declare-fun e!823274 () Bool)

(assert (=> b!1465092 (= lt!641296 e!823274)))

(declare-fun c!135035 () Bool)

(assert (=> b!1465092 (= c!135035 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465093 () Bool)

(declare-fun res!994049 () Bool)

(assert (=> b!1465093 (=> (not res!994049) (not e!823277))))

(declare-datatypes ((List!34189 0))(
  ( (Nil!34186) (Cons!34185 (h!35535 (_ BitVec 64)) (t!48883 List!34189)) )
))
(declare-fun arrayNoDuplicates!0 (array!98800 (_ BitVec 32) List!34189) Bool)

(assert (=> b!1465093 (= res!994049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34186))))

(declare-fun lt!641297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11940 0))(
  ( (MissingZero!11940 (index!50152 (_ BitVec 32))) (Found!11940 (index!50153 (_ BitVec 32))) (Intermediate!11940 (undefined!12752 Bool) (index!50154 (_ BitVec 32)) (x!131733 (_ BitVec 32))) (Undefined!11940) (MissingVacant!11940 (index!50155 (_ BitVec 32))) )
))
(declare-fun lt!641293 () SeekEntryResult!11940)

(declare-fun b!1465094 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641298 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11940)

(assert (=> b!1465094 (= e!823274 (not (= lt!641293 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641297 lt!641298 lt!641295 mask!2687))))))

(declare-fun b!1465095 () Bool)

(declare-fun res!994053 () Bool)

(assert (=> b!1465095 (=> (not res!994053) (not e!823277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465095 (= res!994053 (validKeyInArray!0 (select (arr!47688 a!2862) j!93)))))

(declare-fun b!1465096 () Bool)

(declare-fun e!823273 () Bool)

(declare-fun e!823275 () Bool)

(assert (=> b!1465096 (= e!823273 e!823275)))

(declare-fun res!994048 () Bool)

(assert (=> b!1465096 (=> (not res!994048) (not e!823275))))

(assert (=> b!1465096 (= res!994048 (= lt!641293 (Intermediate!11940 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465096 (= lt!641293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641298 mask!2687) lt!641298 lt!641295 mask!2687))))

(assert (=> b!1465096 (= lt!641298 (select (store (arr!47688 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465097 () Bool)

(assert (=> b!1465097 (= e!823279 e!823273)))

(declare-fun res!994050 () Bool)

(assert (=> b!1465097 (=> (not res!994050) (not e!823273))))

(declare-fun lt!641294 () SeekEntryResult!11940)

(assert (=> b!1465097 (= res!994050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47688 a!2862) j!93) mask!2687) (select (arr!47688 a!2862) j!93) a!2862 mask!2687) lt!641294))))

(assert (=> b!1465097 (= lt!641294 (Intermediate!11940 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465098 () Bool)

(declare-fun res!994055 () Bool)

(assert (=> b!1465098 (=> (not res!994055) (not e!823277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98800 (_ BitVec 32)) Bool)

(assert (=> b!1465098 (= res!994055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!994056 () Bool)

(assert (=> start!125352 (=> (not res!994056) (not e!823277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125352 (= res!994056 (validMask!0 mask!2687))))

(assert (=> start!125352 e!823277))

(assert (=> start!125352 true))

(declare-fun array_inv!36716 (array!98800) Bool)

(assert (=> start!125352 (array_inv!36716 a!2862)))

(declare-fun b!1465099 () Bool)

(declare-fun e!823278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11940)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11940)

(assert (=> b!1465099 (= e!823278 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641298 lt!641295 mask!2687) (seekEntryOrOpen!0 lt!641298 lt!641295 mask!2687)))))

(declare-fun b!1465100 () Bool)

(assert (=> b!1465100 (= e!823274 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641297 intermediateAfterIndex!19 lt!641298 lt!641295 mask!2687) (seekEntryOrOpen!0 lt!641298 lt!641295 mask!2687))))))

(declare-fun b!1465101 () Bool)

(declare-fun e!823271 () Bool)

(assert (=> b!1465101 (= e!823271 e!823276)))

(declare-fun res!994040 () Bool)

(assert (=> b!1465101 (=> res!994040 e!823276)))

(assert (=> b!1465101 (= res!994040 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641297 #b00000000000000000000000000000000) (bvsge lt!641297 (size!48238 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465101 (= lt!641297 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465102 () Bool)

(declare-fun res!994043 () Bool)

(assert (=> b!1465102 (=> (not res!994043) (not e!823273))))

(assert (=> b!1465102 (= res!994043 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47688 a!2862) j!93) a!2862 mask!2687) lt!641294))))

(declare-fun b!1465103 () Bool)

(assert (=> b!1465103 (= e!823275 (not e!823271))))

(declare-fun res!994046 () Bool)

(assert (=> b!1465103 (=> res!994046 e!823271)))

(assert (=> b!1465103 (= res!994046 (or (and (= (select (arr!47688 a!2862) index!646) (select (store (arr!47688 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47688 a!2862) index!646) (select (arr!47688 a!2862) j!93))) (= (select (arr!47688 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465103 e!823280))

(declare-fun res!994054 () Bool)

(assert (=> b!1465103 (=> (not res!994054) (not e!823280))))

(assert (=> b!1465103 (= res!994054 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49376 0))(
  ( (Unit!49377) )
))
(declare-fun lt!641292 () Unit!49376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49376)

(assert (=> b!1465103 (= lt!641292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465104 () Bool)

(declare-fun res!994047 () Bool)

(assert (=> b!1465104 (=> (not res!994047) (not e!823275))))

(assert (=> b!1465104 (= res!994047 e!823278)))

(declare-fun c!135036 () Bool)

(assert (=> b!1465104 (= c!135036 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465105 () Bool)

(declare-fun res!994052 () Bool)

(assert (=> b!1465105 (=> (not res!994052) (not e!823277))))

(assert (=> b!1465105 (= res!994052 (and (= (size!48238 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48238 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48238 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465106 () Bool)

(declare-fun res!994044 () Bool)

(assert (=> b!1465106 (=> res!994044 e!823276)))

(assert (=> b!1465106 (= res!994044 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641297 (select (arr!47688 a!2862) j!93) a!2862 mask!2687) lt!641294)))))

(declare-fun b!1465107 () Bool)

(declare-fun res!994045 () Bool)

(assert (=> b!1465107 (=> (not res!994045) (not e!823275))))

(assert (=> b!1465107 (= res!994045 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465108 () Bool)

(declare-fun res!994051 () Bool)

(assert (=> b!1465108 (=> (not res!994051) (not e!823277))))

(assert (=> b!1465108 (= res!994051 (validKeyInArray!0 (select (arr!47688 a!2862) i!1006)))))

(declare-fun b!1465109 () Bool)

(assert (=> b!1465109 (= e!823278 (= lt!641293 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641298 lt!641295 mask!2687)))))

(declare-fun b!1465110 () Bool)

(declare-fun res!994041 () Bool)

(assert (=> b!1465110 (=> (not res!994041) (not e!823280))))

(assert (=> b!1465110 (= res!994041 (= (seekEntryOrOpen!0 (select (arr!47688 a!2862) j!93) a!2862 mask!2687) (Found!11940 j!93)))))

(assert (= (and start!125352 res!994056) b!1465105))

(assert (= (and b!1465105 res!994052) b!1465108))

(assert (= (and b!1465108 res!994051) b!1465095))

(assert (= (and b!1465095 res!994053) b!1465098))

(assert (= (and b!1465098 res!994055) b!1465093))

(assert (= (and b!1465093 res!994049) b!1465089))

(assert (= (and b!1465089 res!994042) b!1465090))

(assert (= (and b!1465090 res!994057) b!1465097))

(assert (= (and b!1465097 res!994050) b!1465102))

(assert (= (and b!1465102 res!994043) b!1465096))

(assert (= (and b!1465096 res!994048) b!1465104))

(assert (= (and b!1465104 c!135036) b!1465109))

(assert (= (and b!1465104 (not c!135036)) b!1465099))

(assert (= (and b!1465104 res!994047) b!1465107))

(assert (= (and b!1465107 res!994045) b!1465103))

(assert (= (and b!1465103 res!994054) b!1465110))

(assert (= (and b!1465110 res!994041) b!1465091))

(assert (= (and b!1465103 (not res!994046)) b!1465101))

(assert (= (and b!1465101 (not res!994040)) b!1465106))

(assert (= (and b!1465106 (not res!994044)) b!1465092))

(assert (= (and b!1465092 c!135035) b!1465094))

(assert (= (and b!1465092 (not c!135035)) b!1465100))

(declare-fun m!1352225 () Bool)

(assert (=> b!1465090 m!1352225))

(declare-fun m!1352227 () Bool)

(assert (=> b!1465090 m!1352227))

(declare-fun m!1352229 () Bool)

(assert (=> b!1465101 m!1352229))

(declare-fun m!1352231 () Bool)

(assert (=> b!1465091 m!1352231))

(declare-fun m!1352233 () Bool)

(assert (=> b!1465091 m!1352233))

(declare-fun m!1352235 () Bool)

(assert (=> b!1465108 m!1352235))

(assert (=> b!1465108 m!1352235))

(declare-fun m!1352237 () Bool)

(assert (=> b!1465108 m!1352237))

(declare-fun m!1352239 () Bool)

(assert (=> b!1465098 m!1352239))

(assert (=> b!1465097 m!1352233))

(assert (=> b!1465097 m!1352233))

(declare-fun m!1352241 () Bool)

(assert (=> b!1465097 m!1352241))

(assert (=> b!1465097 m!1352241))

(assert (=> b!1465097 m!1352233))

(declare-fun m!1352243 () Bool)

(assert (=> b!1465097 m!1352243))

(declare-fun m!1352245 () Bool)

(assert (=> b!1465094 m!1352245))

(declare-fun m!1352247 () Bool)

(assert (=> b!1465103 m!1352247))

(assert (=> b!1465103 m!1352225))

(declare-fun m!1352249 () Bool)

(assert (=> b!1465103 m!1352249))

(declare-fun m!1352251 () Bool)

(assert (=> b!1465103 m!1352251))

(declare-fun m!1352253 () Bool)

(assert (=> b!1465103 m!1352253))

(assert (=> b!1465103 m!1352233))

(assert (=> b!1465110 m!1352233))

(assert (=> b!1465110 m!1352233))

(declare-fun m!1352255 () Bool)

(assert (=> b!1465110 m!1352255))

(declare-fun m!1352257 () Bool)

(assert (=> start!125352 m!1352257))

(declare-fun m!1352259 () Bool)

(assert (=> start!125352 m!1352259))

(assert (=> b!1465102 m!1352233))

(assert (=> b!1465102 m!1352233))

(declare-fun m!1352261 () Bool)

(assert (=> b!1465102 m!1352261))

(assert (=> b!1465106 m!1352233))

(assert (=> b!1465106 m!1352233))

(declare-fun m!1352263 () Bool)

(assert (=> b!1465106 m!1352263))

(declare-fun m!1352265 () Bool)

(assert (=> b!1465096 m!1352265))

(assert (=> b!1465096 m!1352265))

(declare-fun m!1352267 () Bool)

(assert (=> b!1465096 m!1352267))

(assert (=> b!1465096 m!1352225))

(declare-fun m!1352269 () Bool)

(assert (=> b!1465096 m!1352269))

(declare-fun m!1352271 () Bool)

(assert (=> b!1465093 m!1352271))

(declare-fun m!1352273 () Bool)

(assert (=> b!1465099 m!1352273))

(declare-fun m!1352275 () Bool)

(assert (=> b!1465099 m!1352275))

(declare-fun m!1352277 () Bool)

(assert (=> b!1465109 m!1352277))

(assert (=> b!1465095 m!1352233))

(assert (=> b!1465095 m!1352233))

(declare-fun m!1352279 () Bool)

(assert (=> b!1465095 m!1352279))

(declare-fun m!1352281 () Bool)

(assert (=> b!1465100 m!1352281))

(assert (=> b!1465100 m!1352275))

(check-sat (not b!1465100) (not b!1465101) (not b!1465093) (not b!1465095) (not start!125352) (not b!1465098) (not b!1465106) (not b!1465094) (not b!1465096) (not b!1465110) (not b!1465103) (not b!1465097) (not b!1465109) (not b!1465102) (not b!1465099) (not b!1465108))
(check-sat)
