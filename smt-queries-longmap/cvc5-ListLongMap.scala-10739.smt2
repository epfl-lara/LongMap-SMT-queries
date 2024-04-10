; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125572 () Bool)

(assert start!125572)

(declare-fun b!1469280 () Bool)

(declare-fun res!997798 () Bool)

(declare-fun e!824884 () Bool)

(assert (=> b!1469280 (=> (not res!997798) (not e!824884))))

(declare-datatypes ((array!99020 0))(
  ( (array!99021 (arr!47798 (Array (_ BitVec 32) (_ BitVec 64))) (size!48348 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99020)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99020 (_ BitVec 32)) Bool)

(assert (=> b!1469280 (= res!997798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997797 () Bool)

(assert (=> start!125572 (=> (not res!997797) (not e!824884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125572 (= res!997797 (validMask!0 mask!2687))))

(assert (=> start!125572 e!824884))

(assert (=> start!125572 true))

(declare-fun array_inv!36826 (array!99020) Bool)

(assert (=> start!125572 (array_inv!36826 a!2862)))

(declare-fun b!1469281 () Bool)

(declare-fun res!997799 () Bool)

(assert (=> b!1469281 (=> (not res!997799) (not e!824884))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469281 (= res!997799 (validKeyInArray!0 (select (arr!47798 a!2862) i!1006)))))

(declare-fun b!1469282 () Bool)

(declare-fun e!824883 () Bool)

(assert (=> b!1469282 (= e!824884 e!824883)))

(declare-fun res!997802 () Bool)

(assert (=> b!1469282 (=> (not res!997802) (not e!824883))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469282 (= res!997802 (= (select (store (arr!47798 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642501 () array!99020)

(assert (=> b!1469282 (= lt!642501 (array!99021 (store (arr!47798 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48348 a!2862)))))

(declare-fun b!1469283 () Bool)

(declare-fun e!824885 () Bool)

(assert (=> b!1469283 (= e!824885 false)))

(declare-fun lt!642500 () Bool)

(declare-fun e!824880 () Bool)

(assert (=> b!1469283 (= lt!642500 e!824880)))

(declare-fun c!135252 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469283 (= c!135252 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469284 () Bool)

(declare-fun e!824881 () Bool)

(assert (=> b!1469284 (= e!824883 e!824881)))

(declare-fun res!997800 () Bool)

(assert (=> b!1469284 (=> (not res!997800) (not e!824881))))

(declare-datatypes ((SeekEntryResult!12038 0))(
  ( (MissingZero!12038 (index!50544 (_ BitVec 32))) (Found!12038 (index!50545 (_ BitVec 32))) (Intermediate!12038 (undefined!12850 Bool) (index!50546 (_ BitVec 32)) (x!132127 (_ BitVec 32))) (Undefined!12038) (MissingVacant!12038 (index!50547 (_ BitVec 32))) )
))
(declare-fun lt!642504 () SeekEntryResult!12038)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99020 (_ BitVec 32)) SeekEntryResult!12038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469284 (= res!997800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47798 a!2862) j!93) mask!2687) (select (arr!47798 a!2862) j!93) a!2862 mask!2687) lt!642504))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469284 (= lt!642504 (Intermediate!12038 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!642502 () (_ BitVec 64))

(declare-fun b!1469285 () Bool)

(declare-fun lt!642503 () SeekEntryResult!12038)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469285 (= e!824880 (not (= lt!642503 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642502 lt!642501 mask!2687))))))

(declare-fun b!1469286 () Bool)

(assert (=> b!1469286 (= e!824881 e!824885)))

(declare-fun res!997807 () Bool)

(assert (=> b!1469286 (=> (not res!997807) (not e!824885))))

(assert (=> b!1469286 (= res!997807 (= lt!642503 (Intermediate!12038 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469286 (= lt!642503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642502 mask!2687) lt!642502 lt!642501 mask!2687))))

(assert (=> b!1469286 (= lt!642502 (select (store (arr!47798 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469287 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99020 (_ BitVec 32)) SeekEntryResult!12038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99020 (_ BitVec 32)) SeekEntryResult!12038)

(assert (=> b!1469287 (= e!824880 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642502 lt!642501 mask!2687) (seekEntryOrOpen!0 lt!642502 lt!642501 mask!2687))))))

(declare-fun b!1469288 () Bool)

(declare-fun res!997805 () Bool)

(assert (=> b!1469288 (=> (not res!997805) (not e!824884))))

(assert (=> b!1469288 (= res!997805 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48348 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48348 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48348 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469289 () Bool)

(declare-fun res!997801 () Bool)

(assert (=> b!1469289 (=> (not res!997801) (not e!824884))))

(assert (=> b!1469289 (= res!997801 (validKeyInArray!0 (select (arr!47798 a!2862) j!93)))))

(declare-fun b!1469290 () Bool)

(declare-fun res!997806 () Bool)

(assert (=> b!1469290 (=> (not res!997806) (not e!824884))))

(declare-datatypes ((List!34299 0))(
  ( (Nil!34296) (Cons!34295 (h!35645 (_ BitVec 64)) (t!48993 List!34299)) )
))
(declare-fun arrayNoDuplicates!0 (array!99020 (_ BitVec 32) List!34299) Bool)

(assert (=> b!1469290 (= res!997806 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34296))))

(declare-fun b!1469291 () Bool)

(declare-fun res!997804 () Bool)

(assert (=> b!1469291 (=> (not res!997804) (not e!824881))))

(assert (=> b!1469291 (= res!997804 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47798 a!2862) j!93) a!2862 mask!2687) lt!642504))))

(declare-fun b!1469292 () Bool)

(declare-fun res!997803 () Bool)

(assert (=> b!1469292 (=> (not res!997803) (not e!824884))))

(assert (=> b!1469292 (= res!997803 (and (= (size!48348 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48348 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48348 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125572 res!997797) b!1469292))

(assert (= (and b!1469292 res!997803) b!1469281))

(assert (= (and b!1469281 res!997799) b!1469289))

(assert (= (and b!1469289 res!997801) b!1469280))

(assert (= (and b!1469280 res!997798) b!1469290))

(assert (= (and b!1469290 res!997806) b!1469288))

(assert (= (and b!1469288 res!997805) b!1469282))

(assert (= (and b!1469282 res!997802) b!1469284))

(assert (= (and b!1469284 res!997800) b!1469291))

(assert (= (and b!1469291 res!997804) b!1469286))

(assert (= (and b!1469286 res!997807) b!1469283))

(assert (= (and b!1469283 c!135252) b!1469285))

(assert (= (and b!1469283 (not c!135252)) b!1469287))

(declare-fun m!1356463 () Bool)

(assert (=> b!1469284 m!1356463))

(assert (=> b!1469284 m!1356463))

(declare-fun m!1356465 () Bool)

(assert (=> b!1469284 m!1356465))

(assert (=> b!1469284 m!1356465))

(assert (=> b!1469284 m!1356463))

(declare-fun m!1356467 () Bool)

(assert (=> b!1469284 m!1356467))

(assert (=> b!1469289 m!1356463))

(assert (=> b!1469289 m!1356463))

(declare-fun m!1356469 () Bool)

(assert (=> b!1469289 m!1356469))

(assert (=> b!1469291 m!1356463))

(assert (=> b!1469291 m!1356463))

(declare-fun m!1356471 () Bool)

(assert (=> b!1469291 m!1356471))

(declare-fun m!1356473 () Bool)

(assert (=> b!1469285 m!1356473))

(declare-fun m!1356475 () Bool)

(assert (=> b!1469281 m!1356475))

(assert (=> b!1469281 m!1356475))

(declare-fun m!1356477 () Bool)

(assert (=> b!1469281 m!1356477))

(declare-fun m!1356479 () Bool)

(assert (=> start!125572 m!1356479))

(declare-fun m!1356481 () Bool)

(assert (=> start!125572 m!1356481))

(declare-fun m!1356483 () Bool)

(assert (=> b!1469290 m!1356483))

(declare-fun m!1356485 () Bool)

(assert (=> b!1469286 m!1356485))

(assert (=> b!1469286 m!1356485))

(declare-fun m!1356487 () Bool)

(assert (=> b!1469286 m!1356487))

(declare-fun m!1356489 () Bool)

(assert (=> b!1469286 m!1356489))

(declare-fun m!1356491 () Bool)

(assert (=> b!1469286 m!1356491))

(declare-fun m!1356493 () Bool)

(assert (=> b!1469280 m!1356493))

(assert (=> b!1469282 m!1356489))

(declare-fun m!1356495 () Bool)

(assert (=> b!1469282 m!1356495))

(declare-fun m!1356497 () Bool)

(assert (=> b!1469287 m!1356497))

(declare-fun m!1356499 () Bool)

(assert (=> b!1469287 m!1356499))

(push 1)

