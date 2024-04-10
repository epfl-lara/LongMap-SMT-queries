; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126646 () Bool)

(assert start!126646)

(declare-fun b!1486441 () Bool)

(declare-fun e!833275 () Bool)

(assert (=> b!1486441 (= e!833275 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648469 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486441 (= lt!648469 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486442 () Bool)

(declare-fun e!833278 () Bool)

(declare-fun e!833281 () Bool)

(assert (=> b!1486442 (= e!833278 e!833281)))

(declare-fun res!1010792 () Bool)

(assert (=> b!1486442 (=> (not res!1010792) (not e!833281))))

(declare-datatypes ((SeekEntryResult!12287 0))(
  ( (MissingZero!12287 (index!51540 (_ BitVec 32))) (Found!12287 (index!51541 (_ BitVec 32))) (Intermediate!12287 (undefined!13099 Bool) (index!51542 (_ BitVec 32)) (x!133127 (_ BitVec 32))) (Undefined!12287) (MissingVacant!12287 (index!51543 (_ BitVec 32))) )
))
(declare-fun lt!648473 () SeekEntryResult!12287)

(declare-datatypes ((array!99545 0))(
  ( (array!99546 (arr!48047 (Array (_ BitVec 32) (_ BitVec 64))) (size!48597 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99545)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99545 (_ BitVec 32)) SeekEntryResult!12287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486442 (= res!1010792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48047 a!2862) j!93) mask!2687) (select (arr!48047 a!2862) j!93) a!2862 mask!2687) lt!648473))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486442 (= lt!648473 (Intermediate!12287 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!648470 () array!99545)

(declare-fun lt!648471 () SeekEntryResult!12287)

(declare-fun lt!648474 () (_ BitVec 64))

(declare-fun b!1486443 () Bool)

(declare-fun e!833279 () Bool)

(assert (=> b!1486443 (= e!833279 (= lt!648471 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648474 lt!648470 mask!2687)))))

(declare-fun b!1486444 () Bool)

(declare-fun res!1010809 () Bool)

(declare-fun e!833276 () Bool)

(assert (=> b!1486444 (=> (not res!1010809) (not e!833276))))

(declare-datatypes ((List!34548 0))(
  ( (Nil!34545) (Cons!34544 (h!35921 (_ BitVec 64)) (t!49242 List!34548)) )
))
(declare-fun arrayNoDuplicates!0 (array!99545 (_ BitVec 32) List!34548) Bool)

(assert (=> b!1486444 (= res!1010809 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34545))))

(declare-fun b!1486445 () Bool)

(declare-fun e!833274 () Bool)

(assert (=> b!1486445 (= e!833274 (not e!833275))))

(declare-fun res!1010803 () Bool)

(assert (=> b!1486445 (=> res!1010803 e!833275)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486445 (= res!1010803 (or (and (= (select (arr!48047 a!2862) index!646) (select (store (arr!48047 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48047 a!2862) index!646) (select (arr!48047 a!2862) j!93))) (= (select (arr!48047 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833273 () Bool)

(assert (=> b!1486445 e!833273))

(declare-fun res!1010791 () Bool)

(assert (=> b!1486445 (=> (not res!1010791) (not e!833273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99545 (_ BitVec 32)) Bool)

(assert (=> b!1486445 (= res!1010791 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49914 0))(
  ( (Unit!49915) )
))
(declare-fun lt!648472 () Unit!49914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49914)

(assert (=> b!1486445 (= lt!648472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486446 () Bool)

(assert (=> b!1486446 (= e!833281 e!833274)))

(declare-fun res!1010799 () Bool)

(assert (=> b!1486446 (=> (not res!1010799) (not e!833274))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486446 (= res!1010799 (= lt!648471 (Intermediate!12287 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486446 (= lt!648471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648474 mask!2687) lt!648474 lt!648470 mask!2687))))

(assert (=> b!1486446 (= lt!648474 (select (store (arr!48047 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486447 () Bool)

(declare-fun res!1010793 () Bool)

(assert (=> b!1486447 (=> (not res!1010793) (not e!833276))))

(assert (=> b!1486447 (= res!1010793 (and (= (size!48597 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48597 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48597 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!833282 () Bool)

(declare-fun b!1486448 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99545 (_ BitVec 32)) SeekEntryResult!12287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99545 (_ BitVec 32)) SeekEntryResult!12287)

(assert (=> b!1486448 (= e!833282 (= (seekEntryOrOpen!0 lt!648474 lt!648470 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648474 lt!648470 mask!2687)))))

(declare-fun b!1486449 () Bool)

(declare-fun res!1010806 () Bool)

(assert (=> b!1486449 (=> (not res!1010806) (not e!833276))))

(assert (=> b!1486449 (= res!1010806 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48597 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48597 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48597 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486450 () Bool)

(declare-fun res!1010794 () Bool)

(assert (=> b!1486450 (=> (not res!1010794) (not e!833274))))

(assert (=> b!1486450 (= res!1010794 e!833279)))

(declare-fun c!137349 () Bool)

(assert (=> b!1486450 (= c!137349 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486451 () Bool)

(assert (=> b!1486451 (= e!833276 e!833278)))

(declare-fun res!1010795 () Bool)

(assert (=> b!1486451 (=> (not res!1010795) (not e!833278))))

(assert (=> b!1486451 (= res!1010795 (= (select (store (arr!48047 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486451 (= lt!648470 (array!99546 (store (arr!48047 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48597 a!2862)))))

(declare-fun b!1486452 () Bool)

(assert (=> b!1486452 (= e!833279 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648474 lt!648470 mask!2687) (seekEntryOrOpen!0 lt!648474 lt!648470 mask!2687)))))

(declare-fun b!1486454 () Bool)

(declare-fun e!833277 () Bool)

(assert (=> b!1486454 (= e!833277 e!833282)))

(declare-fun res!1010797 () Bool)

(assert (=> b!1486454 (=> (not res!1010797) (not e!833282))))

(declare-fun lt!648468 () (_ BitVec 64))

(assert (=> b!1486454 (= res!1010797 (and (= index!646 intermediateAfterIndex!19) (= lt!648468 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486455 () Bool)

(declare-fun res!1010802 () Bool)

(assert (=> b!1486455 (=> (not res!1010802) (not e!833281))))

(assert (=> b!1486455 (= res!1010802 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48047 a!2862) j!93) a!2862 mask!2687) lt!648473))))

(declare-fun b!1486456 () Bool)

(declare-fun res!1010804 () Bool)

(assert (=> b!1486456 (=> (not res!1010804) (not e!833276))))

(assert (=> b!1486456 (= res!1010804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486457 () Bool)

(declare-fun res!1010801 () Bool)

(assert (=> b!1486457 (=> (not res!1010801) (not e!833273))))

(assert (=> b!1486457 (= res!1010801 (= (seekEntryOrOpen!0 (select (arr!48047 a!2862) j!93) a!2862 mask!2687) (Found!12287 j!93)))))

(declare-fun b!1486458 () Bool)

(declare-fun res!1010800 () Bool)

(assert (=> b!1486458 (=> (not res!1010800) (not e!833274))))

(assert (=> b!1486458 (= res!1010800 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486459 () Bool)

(declare-fun res!1010796 () Bool)

(assert (=> b!1486459 (=> (not res!1010796) (not e!833276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486459 (= res!1010796 (validKeyInArray!0 (select (arr!48047 a!2862) j!93)))))

(declare-fun res!1010808 () Bool)

(assert (=> start!126646 (=> (not res!1010808) (not e!833276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126646 (= res!1010808 (validMask!0 mask!2687))))

(assert (=> start!126646 e!833276))

(assert (=> start!126646 true))

(declare-fun array_inv!37075 (array!99545) Bool)

(assert (=> start!126646 (array_inv!37075 a!2862)))

(declare-fun b!1486453 () Bool)

(assert (=> b!1486453 (= e!833273 e!833277)))

(declare-fun res!1010807 () Bool)

(assert (=> b!1486453 (=> res!1010807 e!833277)))

(assert (=> b!1486453 (= res!1010807 (or (and (= (select (arr!48047 a!2862) index!646) lt!648468) (= (select (arr!48047 a!2862) index!646) (select (arr!48047 a!2862) j!93))) (= (select (arr!48047 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486453 (= lt!648468 (select (store (arr!48047 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486460 () Bool)

(declare-fun res!1010805 () Bool)

(assert (=> b!1486460 (=> (not res!1010805) (not e!833273))))

(assert (=> b!1486460 (= res!1010805 (or (= (select (arr!48047 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48047 a!2862) intermediateBeforeIndex!19) (select (arr!48047 a!2862) j!93))))))

(declare-fun b!1486461 () Bool)

(declare-fun res!1010798 () Bool)

(assert (=> b!1486461 (=> (not res!1010798) (not e!833276))))

(assert (=> b!1486461 (= res!1010798 (validKeyInArray!0 (select (arr!48047 a!2862) i!1006)))))

(assert (= (and start!126646 res!1010808) b!1486447))

(assert (= (and b!1486447 res!1010793) b!1486461))

(assert (= (and b!1486461 res!1010798) b!1486459))

(assert (= (and b!1486459 res!1010796) b!1486456))

(assert (= (and b!1486456 res!1010804) b!1486444))

(assert (= (and b!1486444 res!1010809) b!1486449))

(assert (= (and b!1486449 res!1010806) b!1486451))

(assert (= (and b!1486451 res!1010795) b!1486442))

(assert (= (and b!1486442 res!1010792) b!1486455))

(assert (= (and b!1486455 res!1010802) b!1486446))

(assert (= (and b!1486446 res!1010799) b!1486450))

(assert (= (and b!1486450 c!137349) b!1486443))

(assert (= (and b!1486450 (not c!137349)) b!1486452))

(assert (= (and b!1486450 res!1010794) b!1486458))

(assert (= (and b!1486458 res!1010800) b!1486445))

(assert (= (and b!1486445 res!1010791) b!1486457))

(assert (= (and b!1486457 res!1010801) b!1486460))

(assert (= (and b!1486460 res!1010805) b!1486453))

(assert (= (and b!1486453 (not res!1010807)) b!1486454))

(assert (= (and b!1486454 res!1010797) b!1486448))

(assert (= (and b!1486445 (not res!1010803)) b!1486441))

(declare-fun m!1371319 () Bool)

(assert (=> b!1486448 m!1371319))

(declare-fun m!1371321 () Bool)

(assert (=> b!1486448 m!1371321))

(declare-fun m!1371323 () Bool)

(assert (=> b!1486459 m!1371323))

(assert (=> b!1486459 m!1371323))

(declare-fun m!1371325 () Bool)

(assert (=> b!1486459 m!1371325))

(declare-fun m!1371327 () Bool)

(assert (=> b!1486444 m!1371327))

(declare-fun m!1371329 () Bool)

(assert (=> b!1486445 m!1371329))

(declare-fun m!1371331 () Bool)

(assert (=> b!1486445 m!1371331))

(declare-fun m!1371333 () Bool)

(assert (=> b!1486445 m!1371333))

(declare-fun m!1371335 () Bool)

(assert (=> b!1486445 m!1371335))

(declare-fun m!1371337 () Bool)

(assert (=> b!1486445 m!1371337))

(assert (=> b!1486445 m!1371323))

(declare-fun m!1371339 () Bool)

(assert (=> b!1486446 m!1371339))

(assert (=> b!1486446 m!1371339))

(declare-fun m!1371341 () Bool)

(assert (=> b!1486446 m!1371341))

(assert (=> b!1486446 m!1371331))

(declare-fun m!1371343 () Bool)

(assert (=> b!1486446 m!1371343))

(assert (=> b!1486451 m!1371331))

(declare-fun m!1371345 () Bool)

(assert (=> b!1486451 m!1371345))

(assert (=> b!1486453 m!1371335))

(assert (=> b!1486453 m!1371323))

(assert (=> b!1486453 m!1371331))

(assert (=> b!1486453 m!1371333))

(assert (=> b!1486457 m!1371323))

(assert (=> b!1486457 m!1371323))

(declare-fun m!1371347 () Bool)

(assert (=> b!1486457 m!1371347))

(declare-fun m!1371349 () Bool)

(assert (=> start!126646 m!1371349))

(declare-fun m!1371351 () Bool)

(assert (=> start!126646 m!1371351))

(assert (=> b!1486442 m!1371323))

(assert (=> b!1486442 m!1371323))

(declare-fun m!1371353 () Bool)

(assert (=> b!1486442 m!1371353))

(assert (=> b!1486442 m!1371353))

(assert (=> b!1486442 m!1371323))

(declare-fun m!1371355 () Bool)

(assert (=> b!1486442 m!1371355))

(declare-fun m!1371357 () Bool)

(assert (=> b!1486456 m!1371357))

(declare-fun m!1371359 () Bool)

(assert (=> b!1486443 m!1371359))

(assert (=> b!1486452 m!1371321))

(assert (=> b!1486452 m!1371319))

(assert (=> b!1486455 m!1371323))

(assert (=> b!1486455 m!1371323))

(declare-fun m!1371361 () Bool)

(assert (=> b!1486455 m!1371361))

(declare-fun m!1371363 () Bool)

(assert (=> b!1486460 m!1371363))

(assert (=> b!1486460 m!1371323))

(declare-fun m!1371365 () Bool)

(assert (=> b!1486461 m!1371365))

(assert (=> b!1486461 m!1371365))

(declare-fun m!1371367 () Bool)

(assert (=> b!1486461 m!1371367))

(declare-fun m!1371369 () Bool)

(assert (=> b!1486441 m!1371369))

(push 1)

