; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124846 () Bool)

(assert start!124846)

(declare-fun b!1450029 () Bool)

(declare-fun res!981517 () Bool)

(declare-fun e!816524 () Bool)

(assert (=> b!1450029 (=> (not res!981517) (not e!816524))))

(declare-datatypes ((SeekEntryResult!11702 0))(
  ( (MissingZero!11702 (index!49200 (_ BitVec 32))) (Found!11702 (index!49201 (_ BitVec 32))) (Intermediate!11702 (undefined!12514 Bool) (index!49202 (_ BitVec 32)) (x!130858 (_ BitVec 32))) (Undefined!11702) (MissingVacant!11702 (index!49203 (_ BitVec 32))) )
))
(declare-fun lt!635972 () SeekEntryResult!11702)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98272 0))(
  ( (array!98273 (arr!47425 (Array (_ BitVec 32) (_ BitVec 64))) (size!47977 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98272)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11702)

(assert (=> b!1450029 (= res!981517 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635972))))

(declare-fun b!1450030 () Bool)

(declare-fun res!981513 () Bool)

(declare-fun e!816528 () Bool)

(assert (=> b!1450030 (=> (not res!981513) (not e!816528))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450030 (= res!981513 (validKeyInArray!0 (select (arr!47425 a!2862) i!1006)))))

(declare-fun b!1450031 () Bool)

(declare-fun res!981522 () Bool)

(declare-fun e!816522 () Bool)

(assert (=> b!1450031 (=> (not res!981522) (not e!816522))))

(declare-fun e!816519 () Bool)

(assert (=> b!1450031 (= res!981522 e!816519)))

(declare-fun c!133774 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450031 (= c!133774 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!635973 () array!98272)

(declare-fun b!1450032 () Bool)

(declare-fun lt!635975 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11702)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11702)

(assert (=> b!1450032 (= e!816519 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635975 lt!635973 mask!2687) (seekEntryOrOpen!0 lt!635975 lt!635973 mask!2687)))))

(declare-fun b!1450033 () Bool)

(declare-fun res!981509 () Bool)

(assert (=> b!1450033 (=> (not res!981509) (not e!816528))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450033 (= res!981509 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47977 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47977 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47977 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450034 () Bool)

(declare-fun res!981510 () Bool)

(declare-fun e!816527 () Bool)

(assert (=> b!1450034 (=> res!981510 e!816527)))

(declare-fun lt!635977 () SeekEntryResult!11702)

(assert (=> b!1450034 (= res!981510 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635977)))))

(declare-fun b!1450035 () Bool)

(declare-fun res!981523 () Bool)

(assert (=> b!1450035 (=> (not res!981523) (not e!816528))))

(declare-datatypes ((List!34004 0))(
  ( (Nil!34001) (Cons!34000 (h!35350 (_ BitVec 64)) (t!48690 List!34004)) )
))
(declare-fun arrayNoDuplicates!0 (array!98272 (_ BitVec 32) List!34004) Bool)

(assert (=> b!1450035 (= res!981523 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34001))))

(declare-fun b!1450036 () Bool)

(assert (=> b!1450036 (= e!816522 (not e!816527))))

(declare-fun res!981512 () Bool)

(assert (=> b!1450036 (=> res!981512 e!816527)))

(assert (=> b!1450036 (= res!981512 (or (and (= (select (arr!47425 a!2862) index!646) (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47425 a!2862) index!646) (select (arr!47425 a!2862) j!93))) (not (= (select (arr!47425 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816525 () Bool)

(assert (=> b!1450036 e!816525))

(declare-fun res!981518 () Bool)

(assert (=> b!1450036 (=> (not res!981518) (not e!816525))))

(declare-fun lt!635974 () SeekEntryResult!11702)

(assert (=> b!1450036 (= res!981518 (and (= lt!635974 lt!635977) (or (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) (select (arr!47425 a!2862) j!93)))))))

(assert (=> b!1450036 (= lt!635977 (Found!11702 j!93))))

(assert (=> b!1450036 (= lt!635974 (seekEntryOrOpen!0 (select (arr!47425 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98272 (_ BitVec 32)) Bool)

(assert (=> b!1450036 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48741 0))(
  ( (Unit!48742) )
))
(declare-fun lt!635979 () Unit!48741)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48741)

(assert (=> b!1450036 (= lt!635979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450037 () Bool)

(declare-fun e!816520 () Bool)

(declare-fun e!816521 () Bool)

(assert (=> b!1450037 (= e!816520 e!816521)))

(declare-fun res!981519 () Bool)

(assert (=> b!1450037 (=> (not res!981519) (not e!816521))))

(assert (=> b!1450037 (= res!981519 (= lt!635974 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47425 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450038 () Bool)

(declare-fun res!981506 () Bool)

(assert (=> b!1450038 (=> (not res!981506) (not e!816528))))

(assert (=> b!1450038 (= res!981506 (and (= (size!47977 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47977 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47977 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450039 () Bool)

(declare-fun e!816523 () Bool)

(assert (=> b!1450039 (= e!816528 e!816523)))

(declare-fun res!981521 () Bool)

(assert (=> b!1450039 (=> (not res!981521) (not e!816523))))

(assert (=> b!1450039 (= res!981521 (= (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450039 (= lt!635973 (array!98273 (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47977 a!2862)))))

(declare-fun b!1450028 () Bool)

(assert (=> b!1450028 (= e!816525 e!816520)))

(declare-fun res!981511 () Bool)

(assert (=> b!1450028 (=> res!981511 e!816520)))

(assert (=> b!1450028 (= res!981511 (or (and (= (select (arr!47425 a!2862) index!646) (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47425 a!2862) index!646) (select (arr!47425 a!2862) j!93))) (not (= (select (arr!47425 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!981508 () Bool)

(assert (=> start!124846 (=> (not res!981508) (not e!816528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124846 (= res!981508 (validMask!0 mask!2687))))

(assert (=> start!124846 e!816528))

(assert (=> start!124846 true))

(declare-fun array_inv!36658 (array!98272) Bool)

(assert (=> start!124846 (array_inv!36658 a!2862)))

(declare-fun b!1450040 () Bool)

(declare-fun res!981516 () Bool)

(assert (=> b!1450040 (=> (not res!981516) (not e!816522))))

(assert (=> b!1450040 (= res!981516 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450041 () Bool)

(declare-fun res!981515 () Bool)

(assert (=> b!1450041 (=> (not res!981515) (not e!816528))))

(assert (=> b!1450041 (= res!981515 (validKeyInArray!0 (select (arr!47425 a!2862) j!93)))))

(declare-fun b!1450042 () Bool)

(assert (=> b!1450042 (= e!816523 e!816524)))

(declare-fun res!981514 () Bool)

(assert (=> b!1450042 (=> (not res!981514) (not e!816524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450042 (= res!981514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47425 a!2862) j!93) mask!2687) (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635972))))

(assert (=> b!1450042 (= lt!635972 (Intermediate!11702 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450043 () Bool)

(declare-fun res!981507 () Bool)

(assert (=> b!1450043 (=> (not res!981507) (not e!816528))))

(assert (=> b!1450043 (= res!981507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!635978 () SeekEntryResult!11702)

(declare-fun b!1450044 () Bool)

(assert (=> b!1450044 (= e!816519 (= lt!635978 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635975 lt!635973 mask!2687)))))

(declare-fun b!1450045 () Bool)

(assert (=> b!1450045 (= e!816524 e!816522)))

(declare-fun res!981520 () Bool)

(assert (=> b!1450045 (=> (not res!981520) (not e!816522))))

(assert (=> b!1450045 (= res!981520 (= lt!635978 (Intermediate!11702 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450045 (= lt!635978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635975 mask!2687) lt!635975 lt!635973 mask!2687))))

(assert (=> b!1450045 (= lt!635975 (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450046 () Bool)

(assert (=> b!1450046 (= e!816521 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450047 () Bool)

(assert (=> b!1450047 (= e!816527 true)))

(assert (=> b!1450047 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635975 lt!635973 mask!2687) lt!635977)))

(declare-fun lt!635976 () Unit!48741)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48741)

(assert (=> b!1450047 (= lt!635976 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!124846 res!981508) b!1450038))

(assert (= (and b!1450038 res!981506) b!1450030))

(assert (= (and b!1450030 res!981513) b!1450041))

(assert (= (and b!1450041 res!981515) b!1450043))

(assert (= (and b!1450043 res!981507) b!1450035))

(assert (= (and b!1450035 res!981523) b!1450033))

(assert (= (and b!1450033 res!981509) b!1450039))

(assert (= (and b!1450039 res!981521) b!1450042))

(assert (= (and b!1450042 res!981514) b!1450029))

(assert (= (and b!1450029 res!981517) b!1450045))

(assert (= (and b!1450045 res!981520) b!1450031))

(assert (= (and b!1450031 c!133774) b!1450044))

(assert (= (and b!1450031 (not c!133774)) b!1450032))

(assert (= (and b!1450031 res!981522) b!1450040))

(assert (= (and b!1450040 res!981516) b!1450036))

(assert (= (and b!1450036 res!981518) b!1450028))

(assert (= (and b!1450028 (not res!981511)) b!1450037))

(assert (= (and b!1450037 res!981519) b!1450046))

(assert (= (and b!1450036 (not res!981512)) b!1450034))

(assert (= (and b!1450034 (not res!981510)) b!1450047))

(declare-fun m!1338207 () Bool)

(assert (=> b!1450041 m!1338207))

(assert (=> b!1450041 m!1338207))

(declare-fun m!1338209 () Bool)

(assert (=> b!1450041 m!1338209))

(declare-fun m!1338211 () Bool)

(assert (=> b!1450043 m!1338211))

(declare-fun m!1338213 () Bool)

(assert (=> b!1450045 m!1338213))

(assert (=> b!1450045 m!1338213))

(declare-fun m!1338215 () Bool)

(assert (=> b!1450045 m!1338215))

(declare-fun m!1338217 () Bool)

(assert (=> b!1450045 m!1338217))

(declare-fun m!1338219 () Bool)

(assert (=> b!1450045 m!1338219))

(declare-fun m!1338221 () Bool)

(assert (=> b!1450047 m!1338221))

(declare-fun m!1338223 () Bool)

(assert (=> b!1450047 m!1338223))

(assert (=> b!1450037 m!1338207))

(assert (=> b!1450037 m!1338207))

(declare-fun m!1338225 () Bool)

(assert (=> b!1450037 m!1338225))

(declare-fun m!1338227 () Bool)

(assert (=> b!1450044 m!1338227))

(declare-fun m!1338229 () Bool)

(assert (=> b!1450035 m!1338229))

(assert (=> b!1450039 m!1338217))

(declare-fun m!1338231 () Bool)

(assert (=> b!1450039 m!1338231))

(declare-fun m!1338233 () Bool)

(assert (=> b!1450030 m!1338233))

(assert (=> b!1450030 m!1338233))

(declare-fun m!1338235 () Bool)

(assert (=> b!1450030 m!1338235))

(assert (=> b!1450042 m!1338207))

(assert (=> b!1450042 m!1338207))

(declare-fun m!1338237 () Bool)

(assert (=> b!1450042 m!1338237))

(assert (=> b!1450042 m!1338237))

(assert (=> b!1450042 m!1338207))

(declare-fun m!1338239 () Bool)

(assert (=> b!1450042 m!1338239))

(declare-fun m!1338241 () Bool)

(assert (=> b!1450036 m!1338241))

(assert (=> b!1450036 m!1338217))

(declare-fun m!1338243 () Bool)

(assert (=> b!1450036 m!1338243))

(declare-fun m!1338245 () Bool)

(assert (=> b!1450036 m!1338245))

(declare-fun m!1338247 () Bool)

(assert (=> b!1450036 m!1338247))

(assert (=> b!1450036 m!1338207))

(declare-fun m!1338249 () Bool)

(assert (=> b!1450036 m!1338249))

(declare-fun m!1338251 () Bool)

(assert (=> b!1450036 m!1338251))

(assert (=> b!1450036 m!1338207))

(assert (=> b!1450029 m!1338207))

(assert (=> b!1450029 m!1338207))

(declare-fun m!1338253 () Bool)

(assert (=> b!1450029 m!1338253))

(assert (=> b!1450032 m!1338221))

(declare-fun m!1338255 () Bool)

(assert (=> b!1450032 m!1338255))

(assert (=> b!1450034 m!1338207))

(assert (=> b!1450034 m!1338207))

(declare-fun m!1338257 () Bool)

(assert (=> b!1450034 m!1338257))

(assert (=> b!1450028 m!1338247))

(assert (=> b!1450028 m!1338217))

(assert (=> b!1450028 m!1338245))

(assert (=> b!1450028 m!1338207))

(declare-fun m!1338259 () Bool)

(assert (=> start!124846 m!1338259))

(declare-fun m!1338261 () Bool)

(assert (=> start!124846 m!1338261))

(check-sat (not b!1450034) (not b!1450044) (not b!1450047) (not b!1450043) (not b!1450041) (not start!124846) (not b!1450030) (not b!1450045) (not b!1450037) (not b!1450042) (not b!1450029) (not b!1450035) (not b!1450036) (not b!1450032))
(check-sat)
