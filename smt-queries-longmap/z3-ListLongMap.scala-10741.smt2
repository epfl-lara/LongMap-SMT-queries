; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125554 () Bool)

(assert start!125554)

(declare-datatypes ((SeekEntryResult!12044 0))(
  ( (MissingZero!12044 (index!50568 (_ BitVec 32))) (Found!12044 (index!50569 (_ BitVec 32))) (Intermediate!12044 (undefined!12856 Bool) (index!50570 (_ BitVec 32)) (x!132144 (_ BitVec 32))) (Undefined!12044) (MissingVacant!12044 (index!50571 (_ BitVec 32))) )
))
(declare-fun lt!642357 () SeekEntryResult!12044)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824876 () Bool)

(declare-fun b!1469321 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98980 0))(
  ( (array!98981 (arr!47779 (Array (_ BitVec 32) (_ BitVec 64))) (size!48331 (_ BitVec 32))) )
))
(declare-fun lt!642356 () array!98980)

(declare-fun lt!642355 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!12044)

(assert (=> b!1469321 (= e!824876 (= lt!642357 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642355 lt!642356 mask!2687)))))

(declare-fun b!1469322 () Bool)

(declare-fun e!824877 () Bool)

(declare-fun e!824873 () Bool)

(assert (=> b!1469322 (= e!824877 e!824873)))

(declare-fun res!997923 () Bool)

(assert (=> b!1469322 (=> (not res!997923) (not e!824873))))

(declare-fun lt!642354 () SeekEntryResult!12044)

(declare-fun a!2862 () array!98980)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469322 (= res!997923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47779 a!2862) j!93) mask!2687) (select (arr!47779 a!2862) j!93) a!2862 mask!2687) lt!642354))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469322 (= lt!642354 (Intermediate!12044 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469323 () Bool)

(declare-fun res!997928 () Bool)

(declare-fun e!824872 () Bool)

(assert (=> b!1469323 (=> (not res!997928) (not e!824872))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469323 (= res!997928 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48331 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48331 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48331 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469324 () Bool)

(declare-fun e!824875 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469324 (= e!824875 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsgt #b00000000000000000000000000000000 (size!48331 a!2862))))))

(declare-fun b!1469325 () Bool)

(declare-fun res!997926 () Bool)

(assert (=> b!1469325 (=> (not res!997926) (not e!824872))))

(declare-datatypes ((List!34358 0))(
  ( (Nil!34355) (Cons!34354 (h!35704 (_ BitVec 64)) (t!49044 List!34358)) )
))
(declare-fun arrayNoDuplicates!0 (array!98980 (_ BitVec 32) List!34358) Bool)

(assert (=> b!1469325 (= res!997926 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34355))))

(declare-fun b!1469326 () Bool)

(declare-fun res!997922 () Bool)

(assert (=> b!1469326 (=> (not res!997922) (not e!824872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469326 (= res!997922 (validKeyInArray!0 (select (arr!47779 a!2862) i!1006)))))

(declare-fun b!1469327 () Bool)

(declare-fun res!997921 () Bool)

(assert (=> b!1469327 (=> (not res!997921) (not e!824873))))

(assert (=> b!1469327 (= res!997921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47779 a!2862) j!93) a!2862 mask!2687) lt!642354))))

(declare-fun b!1469328 () Bool)

(declare-fun res!997925 () Bool)

(assert (=> b!1469328 (=> (not res!997925) (not e!824875))))

(assert (=> b!1469328 (= res!997925 e!824876)))

(declare-fun c!135214 () Bool)

(assert (=> b!1469328 (= c!135214 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469329 () Bool)

(declare-fun res!997920 () Bool)

(assert (=> b!1469329 (=> (not res!997920) (not e!824872))))

(assert (=> b!1469329 (= res!997920 (validKeyInArray!0 (select (arr!47779 a!2862) j!93)))))

(declare-fun b!1469330 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!12044)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!12044)

(assert (=> b!1469330 (= e!824876 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642355 lt!642356 mask!2687) (seekEntryOrOpen!0 lt!642355 lt!642356 mask!2687)))))

(declare-fun b!1469331 () Bool)

(assert (=> b!1469331 (= e!824872 e!824877)))

(declare-fun res!997919 () Bool)

(assert (=> b!1469331 (=> (not res!997919) (not e!824877))))

(assert (=> b!1469331 (= res!997919 (= (select (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469331 (= lt!642356 (array!98981 (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48331 a!2862)))))

(declare-fun b!1469332 () Bool)

(declare-fun res!997927 () Bool)

(assert (=> b!1469332 (=> (not res!997927) (not e!824872))))

(assert (=> b!1469332 (= res!997927 (and (= (size!48331 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48331 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48331 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469333 () Bool)

(assert (=> b!1469333 (= e!824873 e!824875)))

(declare-fun res!997929 () Bool)

(assert (=> b!1469333 (=> (not res!997929) (not e!824875))))

(assert (=> b!1469333 (= res!997929 (= lt!642357 (Intermediate!12044 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469333 (= lt!642357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642355 mask!2687) lt!642355 lt!642356 mask!2687))))

(assert (=> b!1469333 (= lt!642355 (select (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!997930 () Bool)

(assert (=> start!125554 (=> (not res!997930) (not e!824872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125554 (= res!997930 (validMask!0 mask!2687))))

(assert (=> start!125554 e!824872))

(assert (=> start!125554 true))

(declare-fun array_inv!37012 (array!98980) Bool)

(assert (=> start!125554 (array_inv!37012 a!2862)))

(declare-fun b!1469334 () Bool)

(declare-fun res!997924 () Bool)

(assert (=> b!1469334 (=> (not res!997924) (not e!824872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98980 (_ BitVec 32)) Bool)

(assert (=> b!1469334 (= res!997924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125554 res!997930) b!1469332))

(assert (= (and b!1469332 res!997927) b!1469326))

(assert (= (and b!1469326 res!997922) b!1469329))

(assert (= (and b!1469329 res!997920) b!1469334))

(assert (= (and b!1469334 res!997924) b!1469325))

(assert (= (and b!1469325 res!997926) b!1469323))

(assert (= (and b!1469323 res!997928) b!1469331))

(assert (= (and b!1469331 res!997919) b!1469322))

(assert (= (and b!1469322 res!997923) b!1469327))

(assert (= (and b!1469327 res!997921) b!1469333))

(assert (= (and b!1469333 res!997929) b!1469328))

(assert (= (and b!1469328 c!135214) b!1469321))

(assert (= (and b!1469328 (not c!135214)) b!1469330))

(assert (= (and b!1469328 res!997925) b!1469324))

(declare-fun m!1356015 () Bool)

(assert (=> b!1469321 m!1356015))

(declare-fun m!1356017 () Bool)

(assert (=> b!1469329 m!1356017))

(assert (=> b!1469329 m!1356017))

(declare-fun m!1356019 () Bool)

(assert (=> b!1469329 m!1356019))

(declare-fun m!1356021 () Bool)

(assert (=> b!1469330 m!1356021))

(declare-fun m!1356023 () Bool)

(assert (=> b!1469330 m!1356023))

(declare-fun m!1356025 () Bool)

(assert (=> b!1469325 m!1356025))

(declare-fun m!1356027 () Bool)

(assert (=> b!1469333 m!1356027))

(assert (=> b!1469333 m!1356027))

(declare-fun m!1356029 () Bool)

(assert (=> b!1469333 m!1356029))

(declare-fun m!1356031 () Bool)

(assert (=> b!1469333 m!1356031))

(declare-fun m!1356033 () Bool)

(assert (=> b!1469333 m!1356033))

(declare-fun m!1356035 () Bool)

(assert (=> b!1469326 m!1356035))

(assert (=> b!1469326 m!1356035))

(declare-fun m!1356037 () Bool)

(assert (=> b!1469326 m!1356037))

(declare-fun m!1356039 () Bool)

(assert (=> start!125554 m!1356039))

(declare-fun m!1356041 () Bool)

(assert (=> start!125554 m!1356041))

(assert (=> b!1469322 m!1356017))

(assert (=> b!1469322 m!1356017))

(declare-fun m!1356043 () Bool)

(assert (=> b!1469322 m!1356043))

(assert (=> b!1469322 m!1356043))

(assert (=> b!1469322 m!1356017))

(declare-fun m!1356045 () Bool)

(assert (=> b!1469322 m!1356045))

(assert (=> b!1469331 m!1356031))

(declare-fun m!1356047 () Bool)

(assert (=> b!1469331 m!1356047))

(declare-fun m!1356049 () Bool)

(assert (=> b!1469334 m!1356049))

(assert (=> b!1469327 m!1356017))

(assert (=> b!1469327 m!1356017))

(declare-fun m!1356051 () Bool)

(assert (=> b!1469327 m!1356051))

(check-sat (not b!1469327) (not b!1469333) (not b!1469329) (not b!1469334) (not b!1469322) (not b!1469326) (not b!1469325) (not b!1469330) (not start!125554) (not b!1469321))
(check-sat)
