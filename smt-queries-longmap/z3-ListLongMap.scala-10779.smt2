; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126450 () Bool)

(assert start!126450)

(declare-fun b!1479332 () Bool)

(declare-fun res!1004347 () Bool)

(declare-fun e!830007 () Bool)

(assert (=> b!1479332 (=> (not res!1004347) (not e!830007))))

(declare-datatypes ((array!99394 0))(
  ( (array!99395 (arr!47971 (Array (_ BitVec 32) (_ BitVec 64))) (size!48522 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99394)

(declare-datatypes ((List!34459 0))(
  ( (Nil!34456) (Cons!34455 (h!35837 (_ BitVec 64)) (t!49145 List!34459)) )
))
(declare-fun arrayNoDuplicates!0 (array!99394 (_ BitVec 32) List!34459) Bool)

(assert (=> b!1479332 (= res!1004347 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34456))))

(declare-fun b!1479333 () Bool)

(declare-fun res!1004341 () Bool)

(assert (=> b!1479333 (=> (not res!1004341) (not e!830007))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99394 (_ BitVec 32)) Bool)

(assert (=> b!1479333 (= res!1004341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479334 () Bool)

(declare-fun e!830000 () Bool)

(declare-fun e!830005 () Bool)

(assert (=> b!1479334 (= e!830000 e!830005)))

(declare-fun res!1004350 () Bool)

(assert (=> b!1479334 (=> res!1004350 e!830005)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479334 (= res!1004350 (or (and (= (select (arr!47971 a!2862) index!646) (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47971 a!2862) index!646) (select (arr!47971 a!2862) j!93))) (not (= (select (arr!47971 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479335 () Bool)

(declare-fun res!1004346 () Bool)

(assert (=> b!1479335 (=> (not res!1004346) (not e!830007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479335 (= res!1004346 (validKeyInArray!0 (select (arr!47971 a!2862) i!1006)))))

(declare-fun b!1479336 () Bool)

(declare-fun e!830004 () Bool)

(declare-fun e!830001 () Bool)

(assert (=> b!1479336 (= e!830004 e!830001)))

(declare-fun res!1004351 () Bool)

(assert (=> b!1479336 (=> (not res!1004351) (not e!830001))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12108 0))(
  ( (MissingZero!12108 (index!50824 (_ BitVec 32))) (Found!12108 (index!50825 (_ BitVec 32))) (Intermediate!12108 (undefined!12920 Bool) (index!50826 (_ BitVec 32)) (x!132604 (_ BitVec 32))) (Undefined!12108) (MissingVacant!12108 (index!50827 (_ BitVec 32))) )
))
(declare-fun lt!646046 () SeekEntryResult!12108)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479336 (= res!1004351 (= lt!646046 (Intermediate!12108 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646047 () (_ BitVec 64))

(declare-fun lt!646049 () array!99394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479336 (= lt!646046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646047 mask!2687) lt!646047 lt!646049 mask!2687))))

(assert (=> b!1479336 (= lt!646047 (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479337 () Bool)

(declare-fun e!830006 () Bool)

(assert (=> b!1479337 (= e!830005 e!830006)))

(declare-fun res!1004345 () Bool)

(assert (=> b!1479337 (=> (not res!1004345) (not e!830006))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646048 () SeekEntryResult!12108)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12108)

(assert (=> b!1479337 (= res!1004345 (= lt!646048 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47971 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479338 () Bool)

(declare-fun res!1004342 () Bool)

(assert (=> b!1479338 (=> (not res!1004342) (not e!830007))))

(assert (=> b!1479338 (= res!1004342 (validKeyInArray!0 (select (arr!47971 a!2862) j!93)))))

(declare-fun res!1004339 () Bool)

(assert (=> start!126450 (=> (not res!1004339) (not e!830007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126450 (= res!1004339 (validMask!0 mask!2687))))

(assert (=> start!126450 e!830007))

(assert (=> start!126450 true))

(declare-fun array_inv!37252 (array!99394) Bool)

(assert (=> start!126450 (array_inv!37252 a!2862)))

(declare-fun b!1479339 () Bool)

(declare-fun res!1004353 () Bool)

(assert (=> b!1479339 (=> (not res!1004353) (not e!830001))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479339 (= res!1004353 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479340 () Bool)

(declare-fun res!1004340 () Bool)

(assert (=> b!1479340 (=> (not res!1004340) (not e!830004))))

(declare-fun lt!646051 () SeekEntryResult!12108)

(assert (=> b!1479340 (= res!1004340 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646051))))

(declare-fun b!1479341 () Bool)

(declare-fun e!830002 () Bool)

(assert (=> b!1479341 (= e!830002 e!830004)))

(declare-fun res!1004349 () Bool)

(assert (=> b!1479341 (=> (not res!1004349) (not e!830004))))

(assert (=> b!1479341 (= res!1004349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646051))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479341 (= lt!646051 (Intermediate!12108 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479342 () Bool)

(assert (=> b!1479342 (= e!830007 e!830002)))

(declare-fun res!1004348 () Bool)

(assert (=> b!1479342 (=> (not res!1004348) (not e!830002))))

(assert (=> b!1479342 (= res!1004348 (= (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479342 (= lt!646049 (array!99395 (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48522 a!2862)))))

(declare-fun b!1479343 () Bool)

(assert (=> b!1479343 (= e!830001 (not true))))

(assert (=> b!1479343 e!830000))

(declare-fun res!1004343 () Bool)

(assert (=> b!1479343 (=> (not res!1004343) (not e!830000))))

(assert (=> b!1479343 (= res!1004343 (and (= lt!646048 (Found!12108 j!93)) (or (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) (select (arr!47971 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12108)

(assert (=> b!1479343 (= lt!646048 (seekEntryOrOpen!0 (select (arr!47971 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479343 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49589 0))(
  ( (Unit!49590) )
))
(declare-fun lt!646050 () Unit!49589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49589)

(assert (=> b!1479343 (= lt!646050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479344 () Bool)

(declare-fun res!1004352 () Bool)

(assert (=> b!1479344 (=> (not res!1004352) (not e!830007))))

(assert (=> b!1479344 (= res!1004352 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48522 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48522 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48522 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479345 () Bool)

(declare-fun e!830003 () Bool)

(assert (=> b!1479345 (= e!830003 (= lt!646046 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646047 lt!646049 mask!2687)))))

(declare-fun b!1479346 () Bool)

(assert (=> b!1479346 (= e!830006 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479347 () Bool)

(declare-fun res!1004344 () Bool)

(assert (=> b!1479347 (=> (not res!1004344) (not e!830007))))

(assert (=> b!1479347 (= res!1004344 (and (= (size!48522 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48522 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48522 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479348 () Bool)

(assert (=> b!1479348 (= e!830003 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646047 lt!646049 mask!2687) (seekEntryOrOpen!0 lt!646047 lt!646049 mask!2687)))))

(declare-fun b!1479349 () Bool)

(declare-fun res!1004354 () Bool)

(assert (=> b!1479349 (=> (not res!1004354) (not e!830001))))

(assert (=> b!1479349 (= res!1004354 e!830003)))

(declare-fun c!137026 () Bool)

(assert (=> b!1479349 (= c!137026 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126450 res!1004339) b!1479347))

(assert (= (and b!1479347 res!1004344) b!1479335))

(assert (= (and b!1479335 res!1004346) b!1479338))

(assert (= (and b!1479338 res!1004342) b!1479333))

(assert (= (and b!1479333 res!1004341) b!1479332))

(assert (= (and b!1479332 res!1004347) b!1479344))

(assert (= (and b!1479344 res!1004352) b!1479342))

(assert (= (and b!1479342 res!1004348) b!1479341))

(assert (= (and b!1479341 res!1004349) b!1479340))

(assert (= (and b!1479340 res!1004340) b!1479336))

(assert (= (and b!1479336 res!1004351) b!1479349))

(assert (= (and b!1479349 c!137026) b!1479345))

(assert (= (and b!1479349 (not c!137026)) b!1479348))

(assert (= (and b!1479349 res!1004354) b!1479339))

(assert (= (and b!1479339 res!1004353) b!1479343))

(assert (= (and b!1479343 res!1004343) b!1479334))

(assert (= (and b!1479334 (not res!1004350)) b!1479337))

(assert (= (and b!1479337 res!1004345) b!1479346))

(declare-fun m!1365253 () Bool)

(assert (=> b!1479337 m!1365253))

(assert (=> b!1479337 m!1365253))

(declare-fun m!1365255 () Bool)

(assert (=> b!1479337 m!1365255))

(declare-fun m!1365257 () Bool)

(assert (=> b!1479342 m!1365257))

(declare-fun m!1365259 () Bool)

(assert (=> b!1479342 m!1365259))

(declare-fun m!1365261 () Bool)

(assert (=> b!1479348 m!1365261))

(declare-fun m!1365263 () Bool)

(assert (=> b!1479348 m!1365263))

(declare-fun m!1365265 () Bool)

(assert (=> b!1479343 m!1365265))

(declare-fun m!1365267 () Bool)

(assert (=> b!1479343 m!1365267))

(assert (=> b!1479343 m!1365253))

(declare-fun m!1365269 () Bool)

(assert (=> b!1479343 m!1365269))

(declare-fun m!1365271 () Bool)

(assert (=> b!1479343 m!1365271))

(assert (=> b!1479343 m!1365253))

(declare-fun m!1365273 () Bool)

(assert (=> b!1479333 m!1365273))

(assert (=> b!1479338 m!1365253))

(assert (=> b!1479338 m!1365253))

(declare-fun m!1365275 () Bool)

(assert (=> b!1479338 m!1365275))

(declare-fun m!1365277 () Bool)

(assert (=> b!1479335 m!1365277))

(assert (=> b!1479335 m!1365277))

(declare-fun m!1365279 () Bool)

(assert (=> b!1479335 m!1365279))

(declare-fun m!1365281 () Bool)

(assert (=> b!1479334 m!1365281))

(assert (=> b!1479334 m!1365257))

(declare-fun m!1365283 () Bool)

(assert (=> b!1479334 m!1365283))

(assert (=> b!1479334 m!1365253))

(declare-fun m!1365285 () Bool)

(assert (=> b!1479336 m!1365285))

(assert (=> b!1479336 m!1365285))

(declare-fun m!1365287 () Bool)

(assert (=> b!1479336 m!1365287))

(assert (=> b!1479336 m!1365257))

(declare-fun m!1365289 () Bool)

(assert (=> b!1479336 m!1365289))

(assert (=> b!1479340 m!1365253))

(assert (=> b!1479340 m!1365253))

(declare-fun m!1365291 () Bool)

(assert (=> b!1479340 m!1365291))

(declare-fun m!1365293 () Bool)

(assert (=> b!1479345 m!1365293))

(declare-fun m!1365295 () Bool)

(assert (=> b!1479332 m!1365295))

(assert (=> b!1479341 m!1365253))

(assert (=> b!1479341 m!1365253))

(declare-fun m!1365297 () Bool)

(assert (=> b!1479341 m!1365297))

(assert (=> b!1479341 m!1365297))

(assert (=> b!1479341 m!1365253))

(declare-fun m!1365299 () Bool)

(assert (=> b!1479341 m!1365299))

(declare-fun m!1365301 () Bool)

(assert (=> start!126450 m!1365301))

(declare-fun m!1365303 () Bool)

(assert (=> start!126450 m!1365303))

(check-sat (not b!1479341) (not b!1479343) (not start!126450) (not b!1479337) (not b!1479332) (not b!1479338) (not b!1479336) (not b!1479345) (not b!1479335) (not b!1479348) (not b!1479340) (not b!1479333))
(check-sat)
