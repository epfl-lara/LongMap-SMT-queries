; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124816 () Bool)

(assert start!124816)

(declare-fun b!1448484 () Bool)

(declare-fun e!815737 () Bool)

(declare-fun e!815743 () Bool)

(assert (=> b!1448484 (= e!815737 (not e!815743))))

(declare-fun res!980036 () Bool)

(assert (=> b!1448484 (=> res!980036 e!815743)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98264 0))(
  ( (array!98265 (arr!47420 (Array (_ BitVec 32) (_ BitVec 64))) (size!47970 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98264)

(assert (=> b!1448484 (= res!980036 (or (and (= (select (arr!47420 a!2862) index!646) (select (store (arr!47420 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47420 a!2862) index!646) (select (arr!47420 a!2862) j!93))) (not (= (select (arr!47420 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47420 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815735 () Bool)

(assert (=> b!1448484 e!815735))

(declare-fun res!980033 () Bool)

(assert (=> b!1448484 (=> (not res!980033) (not e!815735))))

(declare-datatypes ((SeekEntryResult!11672 0))(
  ( (MissingZero!11672 (index!49080 (_ BitVec 32))) (Found!11672 (index!49081 (_ BitVec 32))) (Intermediate!11672 (undefined!12484 Bool) (index!49082 (_ BitVec 32)) (x!130753 (_ BitVec 32))) (Undefined!11672) (MissingVacant!11672 (index!49083 (_ BitVec 32))) )
))
(declare-fun lt!635549 () SeekEntryResult!11672)

(assert (=> b!1448484 (= res!980033 (and (= lt!635549 (Found!11672 j!93)) (or (= (select (arr!47420 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47420 a!2862) intermediateBeforeIndex!19) (select (arr!47420 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98264 (_ BitVec 32)) SeekEntryResult!11672)

(assert (=> b!1448484 (= lt!635549 (seekEntryOrOpen!0 (select (arr!47420 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98264 (_ BitVec 32)) Bool)

(assert (=> b!1448484 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48840 0))(
  ( (Unit!48841) )
))
(declare-fun lt!635552 () Unit!48840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48840)

(assert (=> b!1448484 (= lt!635552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635547 () array!98264)

(declare-fun e!815738 () Bool)

(declare-fun lt!635551 () SeekEntryResult!11672)

(declare-fun b!1448485 () Bool)

(declare-fun lt!635548 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98264 (_ BitVec 32)) SeekEntryResult!11672)

(assert (=> b!1448485 (= e!815738 (= lt!635551 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635548 lt!635547 mask!2687)))))

(declare-fun b!1448486 () Bool)

(declare-fun res!980029 () Bool)

(declare-fun e!815744 () Bool)

(assert (=> b!1448486 (=> (not res!980029) (not e!815744))))

(assert (=> b!1448486 (= res!980029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448487 () Bool)

(declare-fun res!980028 () Bool)

(assert (=> b!1448487 (=> (not res!980028) (not e!815737))))

(assert (=> b!1448487 (= res!980028 e!815738)))

(declare-fun c!133740 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448487 (= c!133740 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448488 () Bool)

(declare-fun res!980027 () Bool)

(assert (=> b!1448488 (=> (not res!980027) (not e!815737))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448488 (= res!980027 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448489 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98264 (_ BitVec 32)) SeekEntryResult!11672)

(assert (=> b!1448489 (= e!815738 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635548 lt!635547 mask!2687) (seekEntryOrOpen!0 lt!635548 lt!635547 mask!2687)))))

(declare-fun res!980039 () Bool)

(assert (=> start!124816 (=> (not res!980039) (not e!815744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124816 (= res!980039 (validMask!0 mask!2687))))

(assert (=> start!124816 e!815744))

(assert (=> start!124816 true))

(declare-fun array_inv!36448 (array!98264) Bool)

(assert (=> start!124816 (array_inv!36448 a!2862)))

(declare-fun b!1448490 () Bool)

(declare-fun res!980041 () Bool)

(assert (=> b!1448490 (=> (not res!980041) (not e!815744))))

(assert (=> b!1448490 (= res!980041 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47970 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47970 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47970 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448491 () Bool)

(declare-fun res!980026 () Bool)

(declare-fun e!815742 () Bool)

(assert (=> b!1448491 (=> (not res!980026) (not e!815742))))

(declare-fun lt!635553 () SeekEntryResult!11672)

(assert (=> b!1448491 (= res!980026 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47420 a!2862) j!93) a!2862 mask!2687) lt!635553))))

(declare-fun b!1448492 () Bool)

(assert (=> b!1448492 (= e!815743 true)))

(declare-fun lt!635550 () SeekEntryResult!11672)

(assert (=> b!1448492 (= lt!635550 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47420 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448493 () Bool)

(declare-fun res!980032 () Bool)

(assert (=> b!1448493 (=> (not res!980032) (not e!815744))))

(assert (=> b!1448493 (= res!980032 (and (= (size!47970 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47970 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47970 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448494 () Bool)

(declare-fun e!815736 () Bool)

(assert (=> b!1448494 (= e!815744 e!815736)))

(declare-fun res!980025 () Bool)

(assert (=> b!1448494 (=> (not res!980025) (not e!815736))))

(assert (=> b!1448494 (= res!980025 (= (select (store (arr!47420 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448494 (= lt!635547 (array!98265 (store (arr!47420 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47970 a!2862)))))

(declare-fun b!1448495 () Bool)

(declare-fun res!980030 () Bool)

(assert (=> b!1448495 (=> (not res!980030) (not e!815744))))

(declare-datatypes ((List!33921 0))(
  ( (Nil!33918) (Cons!33917 (h!35267 (_ BitVec 64)) (t!48615 List!33921)) )
))
(declare-fun arrayNoDuplicates!0 (array!98264 (_ BitVec 32) List!33921) Bool)

(assert (=> b!1448495 (= res!980030 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33918))))

(declare-fun b!1448496 () Bool)

(assert (=> b!1448496 (= e!815736 e!815742)))

(declare-fun res!980034 () Bool)

(assert (=> b!1448496 (=> (not res!980034) (not e!815742))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448496 (= res!980034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47420 a!2862) j!93) mask!2687) (select (arr!47420 a!2862) j!93) a!2862 mask!2687) lt!635553))))

(assert (=> b!1448496 (= lt!635553 (Intermediate!11672 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448497 () Bool)

(assert (=> b!1448497 (= e!815742 e!815737)))

(declare-fun res!980040 () Bool)

(assert (=> b!1448497 (=> (not res!980040) (not e!815737))))

(assert (=> b!1448497 (= res!980040 (= lt!635551 (Intermediate!11672 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448497 (= lt!635551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635548 mask!2687) lt!635548 lt!635547 mask!2687))))

(assert (=> b!1448497 (= lt!635548 (select (store (arr!47420 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448498 () Bool)

(declare-fun res!980037 () Bool)

(assert (=> b!1448498 (=> (not res!980037) (not e!815744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448498 (= res!980037 (validKeyInArray!0 (select (arr!47420 a!2862) j!93)))))

(declare-fun b!1448499 () Bool)

(declare-fun res!980035 () Bool)

(assert (=> b!1448499 (=> (not res!980035) (not e!815744))))

(assert (=> b!1448499 (= res!980035 (validKeyInArray!0 (select (arr!47420 a!2862) i!1006)))))

(declare-fun b!1448500 () Bool)

(declare-fun e!815739 () Bool)

(declare-fun e!815740 () Bool)

(assert (=> b!1448500 (= e!815739 e!815740)))

(declare-fun res!980031 () Bool)

(assert (=> b!1448500 (=> (not res!980031) (not e!815740))))

(assert (=> b!1448500 (= res!980031 (= lt!635549 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47420 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448501 () Bool)

(assert (=> b!1448501 (= e!815735 e!815739)))

(declare-fun res!980038 () Bool)

(assert (=> b!1448501 (=> res!980038 e!815739)))

(assert (=> b!1448501 (= res!980038 (or (and (= (select (arr!47420 a!2862) index!646) (select (store (arr!47420 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47420 a!2862) index!646) (select (arr!47420 a!2862) j!93))) (not (= (select (arr!47420 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448502 () Bool)

(assert (=> b!1448502 (= e!815740 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124816 res!980039) b!1448493))

(assert (= (and b!1448493 res!980032) b!1448499))

(assert (= (and b!1448499 res!980035) b!1448498))

(assert (= (and b!1448498 res!980037) b!1448486))

(assert (= (and b!1448486 res!980029) b!1448495))

(assert (= (and b!1448495 res!980030) b!1448490))

(assert (= (and b!1448490 res!980041) b!1448494))

(assert (= (and b!1448494 res!980025) b!1448496))

(assert (= (and b!1448496 res!980034) b!1448491))

(assert (= (and b!1448491 res!980026) b!1448497))

(assert (= (and b!1448497 res!980040) b!1448487))

(assert (= (and b!1448487 c!133740) b!1448485))

(assert (= (and b!1448487 (not c!133740)) b!1448489))

(assert (= (and b!1448487 res!980028) b!1448488))

(assert (= (and b!1448488 res!980027) b!1448484))

(assert (= (and b!1448484 res!980033) b!1448501))

(assert (= (and b!1448501 (not res!980038)) b!1448500))

(assert (= (and b!1448500 res!980031) b!1448502))

(assert (= (and b!1448484 (not res!980036)) b!1448492))

(declare-fun m!1337245 () Bool)

(assert (=> b!1448489 m!1337245))

(declare-fun m!1337247 () Bool)

(assert (=> b!1448489 m!1337247))

(declare-fun m!1337249 () Bool)

(assert (=> b!1448494 m!1337249))

(declare-fun m!1337251 () Bool)

(assert (=> b!1448494 m!1337251))

(declare-fun m!1337253 () Bool)

(assert (=> b!1448486 m!1337253))

(declare-fun m!1337255 () Bool)

(assert (=> b!1448492 m!1337255))

(assert (=> b!1448492 m!1337255))

(declare-fun m!1337257 () Bool)

(assert (=> b!1448492 m!1337257))

(assert (=> b!1448496 m!1337255))

(assert (=> b!1448496 m!1337255))

(declare-fun m!1337259 () Bool)

(assert (=> b!1448496 m!1337259))

(assert (=> b!1448496 m!1337259))

(assert (=> b!1448496 m!1337255))

(declare-fun m!1337261 () Bool)

(assert (=> b!1448496 m!1337261))

(declare-fun m!1337263 () Bool)

(assert (=> start!124816 m!1337263))

(declare-fun m!1337265 () Bool)

(assert (=> start!124816 m!1337265))

(declare-fun m!1337267 () Bool)

(assert (=> b!1448497 m!1337267))

(assert (=> b!1448497 m!1337267))

(declare-fun m!1337269 () Bool)

(assert (=> b!1448497 m!1337269))

(assert (=> b!1448497 m!1337249))

(declare-fun m!1337271 () Bool)

(assert (=> b!1448497 m!1337271))

(declare-fun m!1337273 () Bool)

(assert (=> b!1448484 m!1337273))

(assert (=> b!1448484 m!1337249))

(declare-fun m!1337275 () Bool)

(assert (=> b!1448484 m!1337275))

(declare-fun m!1337277 () Bool)

(assert (=> b!1448484 m!1337277))

(declare-fun m!1337279 () Bool)

(assert (=> b!1448484 m!1337279))

(assert (=> b!1448484 m!1337255))

(declare-fun m!1337281 () Bool)

(assert (=> b!1448484 m!1337281))

(declare-fun m!1337283 () Bool)

(assert (=> b!1448484 m!1337283))

(assert (=> b!1448484 m!1337255))

(assert (=> b!1448501 m!1337279))

(assert (=> b!1448501 m!1337249))

(assert (=> b!1448501 m!1337277))

(assert (=> b!1448501 m!1337255))

(declare-fun m!1337285 () Bool)

(assert (=> b!1448495 m!1337285))

(declare-fun m!1337287 () Bool)

(assert (=> b!1448485 m!1337287))

(assert (=> b!1448491 m!1337255))

(assert (=> b!1448491 m!1337255))

(declare-fun m!1337289 () Bool)

(assert (=> b!1448491 m!1337289))

(assert (=> b!1448500 m!1337255))

(assert (=> b!1448500 m!1337255))

(declare-fun m!1337291 () Bool)

(assert (=> b!1448500 m!1337291))

(declare-fun m!1337293 () Bool)

(assert (=> b!1448499 m!1337293))

(assert (=> b!1448499 m!1337293))

(declare-fun m!1337295 () Bool)

(assert (=> b!1448499 m!1337295))

(assert (=> b!1448498 m!1337255))

(assert (=> b!1448498 m!1337255))

(declare-fun m!1337297 () Bool)

(assert (=> b!1448498 m!1337297))

(push 1)

