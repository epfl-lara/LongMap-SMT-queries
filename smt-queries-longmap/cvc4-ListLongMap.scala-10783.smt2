; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126200 () Bool)

(assert start!126200)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!829320 () Bool)

(declare-datatypes ((array!99306 0))(
  ( (array!99307 (arr!47932 (Array (_ BitVec 32) (_ BitVec 64))) (size!48482 (_ BitVec 32))) )
))
(declare-fun lt!645661 () array!99306)

(declare-fun b!1478380 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645666 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12172 0))(
  ( (MissingZero!12172 (index!51080 (_ BitVec 32))) (Found!12172 (index!51081 (_ BitVec 32))) (Intermediate!12172 (undefined!12984 Bool) (index!51082 (_ BitVec 32)) (x!132667 (_ BitVec 32))) (Undefined!12172) (MissingVacant!12172 (index!51083 (_ BitVec 32))) )
))
(declare-fun lt!645662 () SeekEntryResult!12172)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99306 (_ BitVec 32)) SeekEntryResult!12172)

(assert (=> b!1478380 (= e!829320 (= lt!645662 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645666 lt!645661 mask!2687)))))

(declare-fun b!1478381 () Bool)

(declare-fun res!1004413 () Bool)

(declare-fun e!829317 () Bool)

(assert (=> b!1478381 (=> (not res!1004413) (not e!829317))))

(assert (=> b!1478381 (= res!1004413 e!829320)))

(declare-fun c!136509 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478381 (= c!136509 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478382 () Bool)

(declare-fun e!829316 () Bool)

(declare-fun e!829319 () Bool)

(assert (=> b!1478382 (= e!829316 e!829319)))

(declare-fun res!1004416 () Bool)

(assert (=> b!1478382 (=> (not res!1004416) (not e!829319))))

(declare-fun a!2862 () array!99306)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!645664 () SeekEntryResult!12172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478382 (= res!1004416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47932 a!2862) j!93) mask!2687) (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!645664))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478382 (= lt!645664 (Intermediate!12172 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478383 () Bool)

(declare-fun res!1004407 () Bool)

(assert (=> b!1478383 (=> (not res!1004407) (not e!829317))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478383 (= res!1004407 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478384 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99306 (_ BitVec 32)) SeekEntryResult!12172)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99306 (_ BitVec 32)) SeekEntryResult!12172)

(assert (=> b!1478384 (= e!829320 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645666 lt!645661 mask!2687) (seekEntryOrOpen!0 lt!645666 lt!645661 mask!2687)))))

(declare-fun b!1478385 () Bool)

(declare-fun res!1004408 () Bool)

(declare-fun e!829314 () Bool)

(assert (=> b!1478385 (=> (not res!1004408) (not e!829314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99306 (_ BitVec 32)) Bool)

(assert (=> b!1478385 (= res!1004408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478387 () Bool)

(declare-fun res!1004410 () Bool)

(assert (=> b!1478387 (=> (not res!1004410) (not e!829314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478387 (= res!1004410 (validKeyInArray!0 (select (arr!47932 a!2862) i!1006)))))

(declare-fun b!1478388 () Bool)

(declare-fun res!1004412 () Bool)

(assert (=> b!1478388 (=> (not res!1004412) (not e!829314))))

(assert (=> b!1478388 (= res!1004412 (validKeyInArray!0 (select (arr!47932 a!2862) j!93)))))

(declare-fun b!1478389 () Bool)

(assert (=> b!1478389 (= e!829319 e!829317)))

(declare-fun res!1004409 () Bool)

(assert (=> b!1478389 (=> (not res!1004409) (not e!829317))))

(assert (=> b!1478389 (= res!1004409 (= lt!645662 (Intermediate!12172 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478389 (= lt!645662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645666 mask!2687) lt!645666 lt!645661 mask!2687))))

(assert (=> b!1478389 (= lt!645666 (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478386 () Bool)

(declare-fun res!1004403 () Bool)

(assert (=> b!1478386 (=> (not res!1004403) (not e!829319))))

(assert (=> b!1478386 (= res!1004403 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!645664))))

(declare-fun res!1004414 () Bool)

(assert (=> start!126200 (=> (not res!1004414) (not e!829314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126200 (= res!1004414 (validMask!0 mask!2687))))

(assert (=> start!126200 e!829314))

(assert (=> start!126200 true))

(declare-fun array_inv!36960 (array!99306) Bool)

(assert (=> start!126200 (array_inv!36960 a!2862)))

(declare-fun b!1478390 () Bool)

(declare-fun res!1004406 () Bool)

(assert (=> b!1478390 (=> (not res!1004406) (not e!829314))))

(assert (=> b!1478390 (= res!1004406 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48482 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48482 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48482 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478391 () Bool)

(declare-fun e!829321 () Bool)

(declare-fun e!829315 () Bool)

(assert (=> b!1478391 (= e!829321 e!829315)))

(declare-fun res!1004405 () Bool)

(assert (=> b!1478391 (=> (not res!1004405) (not e!829315))))

(declare-fun lt!645665 () SeekEntryResult!12172)

(assert (=> b!1478391 (= res!1004405 (= lt!645665 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47932 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478392 () Bool)

(assert (=> b!1478392 (= e!829314 e!829316)))

(declare-fun res!1004411 () Bool)

(assert (=> b!1478392 (=> (not res!1004411) (not e!829316))))

(assert (=> b!1478392 (= res!1004411 (= (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478392 (= lt!645661 (array!99307 (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48482 a!2862)))))

(declare-fun b!1478393 () Bool)

(declare-fun e!829318 () Bool)

(assert (=> b!1478393 (= e!829318 e!829321)))

(declare-fun res!1004401 () Bool)

(assert (=> b!1478393 (=> res!1004401 e!829321)))

(assert (=> b!1478393 (= res!1004401 (or (and (= (select (arr!47932 a!2862) index!646) (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47932 a!2862) index!646) (select (arr!47932 a!2862) j!93))) (not (= (select (arr!47932 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478394 () Bool)

(assert (=> b!1478394 (= e!829317 (not true))))

(assert (=> b!1478394 e!829318))

(declare-fun res!1004404 () Bool)

(assert (=> b!1478394 (=> (not res!1004404) (not e!829318))))

(assert (=> b!1478394 (= res!1004404 (and (= lt!645665 (Found!12172 j!93)) (or (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) (select (arr!47932 a!2862) j!93)))))))

(assert (=> b!1478394 (= lt!645665 (seekEntryOrOpen!0 (select (arr!47932 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49684 0))(
  ( (Unit!49685) )
))
(declare-fun lt!645663 () Unit!49684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49684)

(assert (=> b!1478394 (= lt!645663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478395 () Bool)

(assert (=> b!1478395 (= e!829315 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478396 () Bool)

(declare-fun res!1004415 () Bool)

(assert (=> b!1478396 (=> (not res!1004415) (not e!829314))))

(assert (=> b!1478396 (= res!1004415 (and (= (size!48482 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48482 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48482 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478397 () Bool)

(declare-fun res!1004402 () Bool)

(assert (=> b!1478397 (=> (not res!1004402) (not e!829314))))

(declare-datatypes ((List!34433 0))(
  ( (Nil!34430) (Cons!34429 (h!35797 (_ BitVec 64)) (t!49127 List!34433)) )
))
(declare-fun arrayNoDuplicates!0 (array!99306 (_ BitVec 32) List!34433) Bool)

(assert (=> b!1478397 (= res!1004402 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34430))))

(assert (= (and start!126200 res!1004414) b!1478396))

(assert (= (and b!1478396 res!1004415) b!1478387))

(assert (= (and b!1478387 res!1004410) b!1478388))

(assert (= (and b!1478388 res!1004412) b!1478385))

(assert (= (and b!1478385 res!1004408) b!1478397))

(assert (= (and b!1478397 res!1004402) b!1478390))

(assert (= (and b!1478390 res!1004406) b!1478392))

(assert (= (and b!1478392 res!1004411) b!1478382))

(assert (= (and b!1478382 res!1004416) b!1478386))

(assert (= (and b!1478386 res!1004403) b!1478389))

(assert (= (and b!1478389 res!1004409) b!1478381))

(assert (= (and b!1478381 c!136509) b!1478380))

(assert (= (and b!1478381 (not c!136509)) b!1478384))

(assert (= (and b!1478381 res!1004413) b!1478383))

(assert (= (and b!1478383 res!1004407) b!1478394))

(assert (= (and b!1478394 res!1004404) b!1478393))

(assert (= (and b!1478393 (not res!1004401)) b!1478391))

(assert (= (and b!1478391 res!1004405) b!1478395))

(declare-fun m!1364295 () Bool)

(assert (=> start!126200 m!1364295))

(declare-fun m!1364297 () Bool)

(assert (=> start!126200 m!1364297))

(declare-fun m!1364299 () Bool)

(assert (=> b!1478382 m!1364299))

(assert (=> b!1478382 m!1364299))

(declare-fun m!1364301 () Bool)

(assert (=> b!1478382 m!1364301))

(assert (=> b!1478382 m!1364301))

(assert (=> b!1478382 m!1364299))

(declare-fun m!1364303 () Bool)

(assert (=> b!1478382 m!1364303))

(declare-fun m!1364305 () Bool)

(assert (=> b!1478380 m!1364305))

(declare-fun m!1364307 () Bool)

(assert (=> b!1478384 m!1364307))

(declare-fun m!1364309 () Bool)

(assert (=> b!1478384 m!1364309))

(assert (=> b!1478391 m!1364299))

(assert (=> b!1478391 m!1364299))

(declare-fun m!1364311 () Bool)

(assert (=> b!1478391 m!1364311))

(declare-fun m!1364313 () Bool)

(assert (=> b!1478392 m!1364313))

(declare-fun m!1364315 () Bool)

(assert (=> b!1478392 m!1364315))

(declare-fun m!1364317 () Bool)

(assert (=> b!1478389 m!1364317))

(assert (=> b!1478389 m!1364317))

(declare-fun m!1364319 () Bool)

(assert (=> b!1478389 m!1364319))

(assert (=> b!1478389 m!1364313))

(declare-fun m!1364321 () Bool)

(assert (=> b!1478389 m!1364321))

(declare-fun m!1364323 () Bool)

(assert (=> b!1478385 m!1364323))

(declare-fun m!1364325 () Bool)

(assert (=> b!1478393 m!1364325))

(assert (=> b!1478393 m!1364313))

(declare-fun m!1364327 () Bool)

(assert (=> b!1478393 m!1364327))

(assert (=> b!1478393 m!1364299))

(assert (=> b!1478386 m!1364299))

(assert (=> b!1478386 m!1364299))

(declare-fun m!1364329 () Bool)

(assert (=> b!1478386 m!1364329))

(assert (=> b!1478388 m!1364299))

(assert (=> b!1478388 m!1364299))

(declare-fun m!1364331 () Bool)

(assert (=> b!1478388 m!1364331))

(declare-fun m!1364333 () Bool)

(assert (=> b!1478394 m!1364333))

(declare-fun m!1364335 () Bool)

(assert (=> b!1478394 m!1364335))

(assert (=> b!1478394 m!1364299))

(declare-fun m!1364337 () Bool)

(assert (=> b!1478394 m!1364337))

(declare-fun m!1364339 () Bool)

(assert (=> b!1478394 m!1364339))

(assert (=> b!1478394 m!1364299))

(declare-fun m!1364341 () Bool)

(assert (=> b!1478387 m!1364341))

(assert (=> b!1478387 m!1364341))

(declare-fun m!1364343 () Bool)

(assert (=> b!1478387 m!1364343))

(declare-fun m!1364345 () Bool)

(assert (=> b!1478397 m!1364345))

(push 1)

