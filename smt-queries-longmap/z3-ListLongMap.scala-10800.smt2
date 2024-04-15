; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126338 () Bool)

(assert start!126338)

(declare-fun res!1006871 () Bool)

(declare-fun e!830765 () Bool)

(assert (=> start!126338 (=> (not res!1006871) (not e!830765))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126338 (= res!1006871 (validMask!0 mask!2687))))

(assert (=> start!126338 e!830765))

(assert (=> start!126338 true))

(declare-datatypes ((array!99355 0))(
  ( (array!99356 (arr!47956 (Array (_ BitVec 32) (_ BitVec 64))) (size!48508 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99355)

(declare-fun array_inv!37189 (array!99355) Bool)

(assert (=> start!126338 (array_inv!37189 a!2862)))

(declare-fun b!1481351 () Bool)

(declare-fun res!1006872 () Bool)

(assert (=> b!1481351 (=> (not res!1006872) (not e!830765))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481351 (= res!1006872 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48508 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48508 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48508 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-datatypes ((SeekEntryResult!12221 0))(
  ( (MissingZero!12221 (index!51276 (_ BitVec 32))) (Found!12221 (index!51277 (_ BitVec 32))) (Intermediate!12221 (undefined!13033 Bool) (index!51278 (_ BitVec 32)) (x!132857 (_ BitVec 32))) (Undefined!12221) (MissingVacant!12221 (index!51279 (_ BitVec 32))) )
))
(declare-fun lt!646557 () SeekEntryResult!12221)

(declare-fun lt!646559 () array!99355)

(declare-fun lt!646558 () (_ BitVec 64))

(declare-fun b!1481352 () Bool)

(declare-fun e!830767 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99355 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481352 (= e!830767 (= lt!646557 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646558 lt!646559 mask!2687)))))

(declare-fun b!1481353 () Bool)

(declare-fun res!1006870 () Bool)

(assert (=> b!1481353 (=> (not res!1006870) (not e!830765))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481353 (= res!1006870 (and (= (size!48508 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48508 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48508 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481354 () Bool)

(declare-fun res!1006878 () Bool)

(assert (=> b!1481354 (=> (not res!1006878) (not e!830765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481354 (= res!1006878 (validKeyInArray!0 (select (arr!47956 a!2862) i!1006)))))

(declare-fun b!1481355 () Bool)

(declare-fun res!1006881 () Bool)

(declare-fun e!830768 () Bool)

(assert (=> b!1481355 (=> (not res!1006881) (not e!830768))))

(assert (=> b!1481355 (= res!1006881 e!830767)))

(declare-fun c!136765 () Bool)

(assert (=> b!1481355 (= c!136765 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481356 () Bool)

(declare-fun res!1006879 () Bool)

(assert (=> b!1481356 (=> (not res!1006879) (not e!830765))))

(declare-datatypes ((List!34535 0))(
  ( (Nil!34532) (Cons!34531 (h!35902 (_ BitVec 64)) (t!49221 List!34535)) )
))
(declare-fun arrayNoDuplicates!0 (array!99355 (_ BitVec 32) List!34535) Bool)

(assert (=> b!1481356 (= res!1006879 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34532))))

(declare-fun e!830766 () Bool)

(declare-fun b!1481357 () Bool)

(assert (=> b!1481357 (= e!830766 (and (or (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) (select (arr!47956 a!2862) j!93))) (or (and (= (select (arr!47956 a!2862) index!646) (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47956 a!2862) index!646) (select (arr!47956 a!2862) j!93))) (= (select (arr!47956 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481358 () Bool)

(declare-fun res!1006873 () Bool)

(declare-fun e!830763 () Bool)

(assert (=> b!1481358 (=> (not res!1006873) (not e!830763))))

(declare-fun lt!646555 () SeekEntryResult!12221)

(assert (=> b!1481358 (= res!1006873 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!646555))))

(declare-fun b!1481359 () Bool)

(declare-fun e!830764 () Bool)

(assert (=> b!1481359 (= e!830764 e!830763)))

(declare-fun res!1006877 () Bool)

(assert (=> b!1481359 (=> (not res!1006877) (not e!830763))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481359 (= res!1006877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47956 a!2862) j!93) mask!2687) (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!646555))))

(assert (=> b!1481359 (= lt!646555 (Intermediate!12221 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481360 () Bool)

(declare-fun res!1006874 () Bool)

(assert (=> b!1481360 (=> (not res!1006874) (not e!830766))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99355 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481360 (= res!1006874 (= (seekEntryOrOpen!0 (select (arr!47956 a!2862) j!93) a!2862 mask!2687) (Found!12221 j!93)))))

(declare-fun b!1481361 () Bool)

(assert (=> b!1481361 (= e!830763 e!830768)))

(declare-fun res!1006882 () Bool)

(assert (=> b!1481361 (=> (not res!1006882) (not e!830768))))

(assert (=> b!1481361 (= res!1006882 (= lt!646557 (Intermediate!12221 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481361 (= lt!646557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646558 mask!2687) lt!646558 lt!646559 mask!2687))))

(assert (=> b!1481361 (= lt!646558 (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481362 () Bool)

(declare-fun res!1006875 () Bool)

(assert (=> b!1481362 (=> (not res!1006875) (not e!830765))))

(assert (=> b!1481362 (= res!1006875 (validKeyInArray!0 (select (arr!47956 a!2862) j!93)))))

(declare-fun b!1481363 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99355 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481363 (= e!830767 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646558 lt!646559 mask!2687) (seekEntryOrOpen!0 lt!646558 lt!646559 mask!2687)))))

(declare-fun b!1481364 () Bool)

(assert (=> b!1481364 (= e!830765 e!830764)))

(declare-fun res!1006868 () Bool)

(assert (=> b!1481364 (=> (not res!1006868) (not e!830764))))

(assert (=> b!1481364 (= res!1006868 (= (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481364 (= lt!646559 (array!99356 (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48508 a!2862)))))

(declare-fun b!1481365 () Bool)

(declare-fun res!1006869 () Bool)

(assert (=> b!1481365 (=> (not res!1006869) (not e!830765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99355 (_ BitVec 32)) Bool)

(assert (=> b!1481365 (= res!1006869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481366 () Bool)

(declare-fun res!1006876 () Bool)

(assert (=> b!1481366 (=> (not res!1006876) (not e!830768))))

(assert (=> b!1481366 (= res!1006876 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481367 () Bool)

(assert (=> b!1481367 (= e!830768 (not true))))

(assert (=> b!1481367 e!830766))

(declare-fun res!1006880 () Bool)

(assert (=> b!1481367 (=> (not res!1006880) (not e!830766))))

(assert (=> b!1481367 (= res!1006880 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49623 0))(
  ( (Unit!49624) )
))
(declare-fun lt!646556 () Unit!49623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49623)

(assert (=> b!1481367 (= lt!646556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126338 res!1006871) b!1481353))

(assert (= (and b!1481353 res!1006870) b!1481354))

(assert (= (and b!1481354 res!1006878) b!1481362))

(assert (= (and b!1481362 res!1006875) b!1481365))

(assert (= (and b!1481365 res!1006869) b!1481356))

(assert (= (and b!1481356 res!1006879) b!1481351))

(assert (= (and b!1481351 res!1006872) b!1481364))

(assert (= (and b!1481364 res!1006868) b!1481359))

(assert (= (and b!1481359 res!1006877) b!1481358))

(assert (= (and b!1481358 res!1006873) b!1481361))

(assert (= (and b!1481361 res!1006882) b!1481355))

(assert (= (and b!1481355 c!136765) b!1481352))

(assert (= (and b!1481355 (not c!136765)) b!1481363))

(assert (= (and b!1481355 res!1006881) b!1481366))

(assert (= (and b!1481366 res!1006876) b!1481367))

(assert (= (and b!1481367 res!1006880) b!1481360))

(assert (= (and b!1481360 res!1006874) b!1481357))

(declare-fun m!1366551 () Bool)

(assert (=> b!1481362 m!1366551))

(assert (=> b!1481362 m!1366551))

(declare-fun m!1366553 () Bool)

(assert (=> b!1481362 m!1366553))

(assert (=> b!1481358 m!1366551))

(assert (=> b!1481358 m!1366551))

(declare-fun m!1366555 () Bool)

(assert (=> b!1481358 m!1366555))

(declare-fun m!1366557 () Bool)

(assert (=> b!1481363 m!1366557))

(declare-fun m!1366559 () Bool)

(assert (=> b!1481363 m!1366559))

(declare-fun m!1366561 () Bool)

(assert (=> b!1481354 m!1366561))

(assert (=> b!1481354 m!1366561))

(declare-fun m!1366563 () Bool)

(assert (=> b!1481354 m!1366563))

(assert (=> b!1481360 m!1366551))

(assert (=> b!1481360 m!1366551))

(declare-fun m!1366565 () Bool)

(assert (=> b!1481360 m!1366565))

(declare-fun m!1366567 () Bool)

(assert (=> start!126338 m!1366567))

(declare-fun m!1366569 () Bool)

(assert (=> start!126338 m!1366569))

(assert (=> b!1481359 m!1366551))

(assert (=> b!1481359 m!1366551))

(declare-fun m!1366571 () Bool)

(assert (=> b!1481359 m!1366571))

(assert (=> b!1481359 m!1366571))

(assert (=> b!1481359 m!1366551))

(declare-fun m!1366573 () Bool)

(assert (=> b!1481359 m!1366573))

(declare-fun m!1366575 () Bool)

(assert (=> b!1481365 m!1366575))

(declare-fun m!1366577 () Bool)

(assert (=> b!1481352 m!1366577))

(declare-fun m!1366579 () Bool)

(assert (=> b!1481356 m!1366579))

(declare-fun m!1366581 () Bool)

(assert (=> b!1481364 m!1366581))

(declare-fun m!1366583 () Bool)

(assert (=> b!1481364 m!1366583))

(declare-fun m!1366585 () Bool)

(assert (=> b!1481361 m!1366585))

(assert (=> b!1481361 m!1366585))

(declare-fun m!1366587 () Bool)

(assert (=> b!1481361 m!1366587))

(assert (=> b!1481361 m!1366581))

(declare-fun m!1366589 () Bool)

(assert (=> b!1481361 m!1366589))

(declare-fun m!1366591 () Bool)

(assert (=> b!1481367 m!1366591))

(declare-fun m!1366593 () Bool)

(assert (=> b!1481367 m!1366593))

(assert (=> b!1481357 m!1366581))

(declare-fun m!1366595 () Bool)

(assert (=> b!1481357 m!1366595))

(declare-fun m!1366597 () Bool)

(assert (=> b!1481357 m!1366597))

(declare-fun m!1366599 () Bool)

(assert (=> b!1481357 m!1366599))

(assert (=> b!1481357 m!1366551))

(check-sat (not b!1481360) (not b!1481362) (not b!1481354) (not b!1481367) (not b!1481363) (not b!1481358) (not b!1481359) (not b!1481361) (not b!1481365) (not b!1481356) (not b!1481352) (not start!126338))
(check-sat)
