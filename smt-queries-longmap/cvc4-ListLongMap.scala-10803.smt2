; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126410 () Bool)

(assert start!126410)

(declare-fun b!1482281 () Bool)

(declare-fun e!831225 () Bool)

(declare-fun e!831223 () Bool)

(assert (=> b!1482281 (= e!831225 e!831223)))

(declare-fun res!1007511 () Bool)

(assert (=> b!1482281 (=> (not res!1007511) (not e!831223))))

(declare-datatypes ((SeekEntryResult!12232 0))(
  ( (MissingZero!12232 (index!51320 (_ BitVec 32))) (Found!12232 (index!51321 (_ BitVec 32))) (Intermediate!12232 (undefined!13044 Bool) (index!51322 (_ BitVec 32)) (x!132899 (_ BitVec 32))) (Undefined!12232) (MissingVacant!12232 (index!51323 (_ BitVec 32))) )
))
(declare-fun lt!647026 () SeekEntryResult!12232)

(declare-datatypes ((array!99429 0))(
  ( (array!99430 (arr!47992 (Array (_ BitVec 32) (_ BitVec 64))) (size!48542 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99429)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99429 (_ BitVec 32)) SeekEntryResult!12232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482281 (= res!1007511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47992 a!2862) j!93) mask!2687) (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!647026))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482281 (= lt!647026 (Intermediate!12232 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482282 () Bool)

(declare-fun res!1007508 () Bool)

(declare-fun e!831221 () Bool)

(assert (=> b!1482282 (=> (not res!1007508) (not e!831221))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99429 (_ BitVec 32)) SeekEntryResult!12232)

(assert (=> b!1482282 (= res!1007508 (= (seekEntryOrOpen!0 (select (arr!47992 a!2862) j!93) a!2862 mask!2687) (Found!12232 j!93)))))

(declare-fun b!1482283 () Bool)

(declare-fun res!1007510 () Bool)

(declare-fun e!831224 () Bool)

(assert (=> b!1482283 (=> (not res!1007510) (not e!831224))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482283 (= res!1007510 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482284 () Bool)

(declare-fun res!1007512 () Bool)

(assert (=> b!1482284 (=> (not res!1007512) (not e!831223))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1482284 (= res!1007512 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!647026))))

(declare-fun b!1482285 () Bool)

(declare-fun res!1007518 () Bool)

(declare-fun e!831222 () Bool)

(assert (=> b!1482285 (=> (not res!1007518) (not e!831222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482285 (= res!1007518 (validKeyInArray!0 (select (arr!47992 a!2862) i!1006)))))

(declare-fun b!1482286 () Bool)

(assert (=> b!1482286 (= e!831222 e!831225)))

(declare-fun res!1007516 () Bool)

(assert (=> b!1482286 (=> (not res!1007516) (not e!831225))))

(assert (=> b!1482286 (= res!1007516 (= (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647025 () array!99429)

(assert (=> b!1482286 (= lt!647025 (array!99430 (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48542 a!2862)))))

(declare-fun b!1482287 () Bool)

(declare-fun res!1007521 () Bool)

(assert (=> b!1482287 (=> (not res!1007521) (not e!831222))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1482287 (= res!1007521 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48542 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48542 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48542 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482288 () Bool)

(declare-fun res!1007514 () Bool)

(assert (=> b!1482288 (=> (not res!1007514) (not e!831222))))

(declare-datatypes ((List!34493 0))(
  ( (Nil!34490) (Cons!34489 (h!35860 (_ BitVec 64)) (t!49187 List!34493)) )
))
(declare-fun arrayNoDuplicates!0 (array!99429 (_ BitVec 32) List!34493) Bool)

(assert (=> b!1482288 (= res!1007514 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34490))))

(declare-fun b!1482289 () Bool)

(assert (=> b!1482289 (= e!831224 (not true))))

(assert (=> b!1482289 e!831221))

(declare-fun res!1007507 () Bool)

(assert (=> b!1482289 (=> (not res!1007507) (not e!831221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99429 (_ BitVec 32)) Bool)

(assert (=> b!1482289 (= res!1007507 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49804 0))(
  ( (Unit!49805) )
))
(declare-fun lt!647027 () Unit!49804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49804)

(assert (=> b!1482289 (= lt!647027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1007517 () Bool)

(assert (=> start!126410 (=> (not res!1007517) (not e!831222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126410 (= res!1007517 (validMask!0 mask!2687))))

(assert (=> start!126410 e!831222))

(assert (=> start!126410 true))

(declare-fun array_inv!37020 (array!99429) Bool)

(assert (=> start!126410 (array_inv!37020 a!2862)))

(declare-fun b!1482290 () Bool)

(declare-fun res!1007509 () Bool)

(assert (=> b!1482290 (=> (not res!1007509) (not e!831224))))

(declare-fun e!831226 () Bool)

(assert (=> b!1482290 (= res!1007509 e!831226)))

(declare-fun c!136908 () Bool)

(assert (=> b!1482290 (= c!136908 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482291 () Bool)

(declare-fun res!1007513 () Bool)

(assert (=> b!1482291 (=> (not res!1007513) (not e!831222))))

(assert (=> b!1482291 (= res!1007513 (and (= (size!48542 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48542 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48542 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482292 () Bool)

(assert (=> b!1482292 (= e!831221 (and (or (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) (select (arr!47992 a!2862) j!93))) (or (and (= (select (arr!47992 a!2862) index!646) (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47992 a!2862) index!646) (select (arr!47992 a!2862) j!93))) (= (select (arr!47992 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!647028 () (_ BitVec 64))

(declare-fun lt!647024 () SeekEntryResult!12232)

(declare-fun b!1482293 () Bool)

(assert (=> b!1482293 (= e!831226 (= lt!647024 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647028 lt!647025 mask!2687)))))

(declare-fun b!1482294 () Bool)

(assert (=> b!1482294 (= e!831223 e!831224)))

(declare-fun res!1007519 () Bool)

(assert (=> b!1482294 (=> (not res!1007519) (not e!831224))))

(assert (=> b!1482294 (= res!1007519 (= lt!647024 (Intermediate!12232 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482294 (= lt!647024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647028 mask!2687) lt!647028 lt!647025 mask!2687))))

(assert (=> b!1482294 (= lt!647028 (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99429 (_ BitVec 32)) SeekEntryResult!12232)

(assert (=> b!1482295 (= e!831226 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647028 lt!647025 mask!2687) (seekEntryOrOpen!0 lt!647028 lt!647025 mask!2687)))))

(declare-fun b!1482296 () Bool)

(declare-fun res!1007515 () Bool)

(assert (=> b!1482296 (=> (not res!1007515) (not e!831222))))

(assert (=> b!1482296 (= res!1007515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482297 () Bool)

(declare-fun res!1007520 () Bool)

(assert (=> b!1482297 (=> (not res!1007520) (not e!831222))))

(assert (=> b!1482297 (= res!1007520 (validKeyInArray!0 (select (arr!47992 a!2862) j!93)))))

(assert (= (and start!126410 res!1007517) b!1482291))

(assert (= (and b!1482291 res!1007513) b!1482285))

(assert (= (and b!1482285 res!1007518) b!1482297))

(assert (= (and b!1482297 res!1007520) b!1482296))

(assert (= (and b!1482296 res!1007515) b!1482288))

(assert (= (and b!1482288 res!1007514) b!1482287))

(assert (= (and b!1482287 res!1007521) b!1482286))

(assert (= (and b!1482286 res!1007516) b!1482281))

(assert (= (and b!1482281 res!1007511) b!1482284))

(assert (= (and b!1482284 res!1007512) b!1482294))

(assert (= (and b!1482294 res!1007519) b!1482290))

(assert (= (and b!1482290 c!136908) b!1482293))

(assert (= (and b!1482290 (not c!136908)) b!1482295))

(assert (= (and b!1482290 res!1007509) b!1482283))

(assert (= (and b!1482283 res!1007510) b!1482289))

(assert (= (and b!1482289 res!1007507) b!1482282))

(assert (= (and b!1482282 res!1007508) b!1482292))

(declare-fun m!1368005 () Bool)

(assert (=> b!1482288 m!1368005))

(declare-fun m!1368007 () Bool)

(assert (=> b!1482293 m!1368007))

(declare-fun m!1368009 () Bool)

(assert (=> start!126410 m!1368009))

(declare-fun m!1368011 () Bool)

(assert (=> start!126410 m!1368011))

(declare-fun m!1368013 () Bool)

(assert (=> b!1482284 m!1368013))

(assert (=> b!1482284 m!1368013))

(declare-fun m!1368015 () Bool)

(assert (=> b!1482284 m!1368015))

(declare-fun m!1368017 () Bool)

(assert (=> b!1482294 m!1368017))

(assert (=> b!1482294 m!1368017))

(declare-fun m!1368019 () Bool)

(assert (=> b!1482294 m!1368019))

(declare-fun m!1368021 () Bool)

(assert (=> b!1482294 m!1368021))

(declare-fun m!1368023 () Bool)

(assert (=> b!1482294 m!1368023))

(assert (=> b!1482282 m!1368013))

(assert (=> b!1482282 m!1368013))

(declare-fun m!1368025 () Bool)

(assert (=> b!1482282 m!1368025))

(declare-fun m!1368027 () Bool)

(assert (=> b!1482285 m!1368027))

(assert (=> b!1482285 m!1368027))

(declare-fun m!1368029 () Bool)

(assert (=> b!1482285 m!1368029))

(declare-fun m!1368031 () Bool)

(assert (=> b!1482289 m!1368031))

(declare-fun m!1368033 () Bool)

(assert (=> b!1482289 m!1368033))

(assert (=> b!1482286 m!1368021))

(declare-fun m!1368035 () Bool)

(assert (=> b!1482286 m!1368035))

(assert (=> b!1482297 m!1368013))

(assert (=> b!1482297 m!1368013))

(declare-fun m!1368037 () Bool)

(assert (=> b!1482297 m!1368037))

(assert (=> b!1482281 m!1368013))

(assert (=> b!1482281 m!1368013))

(declare-fun m!1368039 () Bool)

(assert (=> b!1482281 m!1368039))

(assert (=> b!1482281 m!1368039))

(assert (=> b!1482281 m!1368013))

(declare-fun m!1368041 () Bool)

(assert (=> b!1482281 m!1368041))

(assert (=> b!1482292 m!1368021))

(declare-fun m!1368043 () Bool)

(assert (=> b!1482292 m!1368043))

(declare-fun m!1368045 () Bool)

(assert (=> b!1482292 m!1368045))

(declare-fun m!1368047 () Bool)

(assert (=> b!1482292 m!1368047))

(assert (=> b!1482292 m!1368013))

(declare-fun m!1368049 () Bool)

(assert (=> b!1482296 m!1368049))

(declare-fun m!1368051 () Bool)

(assert (=> b!1482295 m!1368051))

(declare-fun m!1368053 () Bool)

(assert (=> b!1482295 m!1368053))

(push 1)

