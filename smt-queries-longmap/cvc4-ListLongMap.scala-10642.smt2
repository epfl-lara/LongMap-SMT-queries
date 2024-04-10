; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124994 () Bool)

(assert start!124994)

(declare-fun b!1453466 () Bool)

(declare-fun res!984478 () Bool)

(declare-fun e!818085 () Bool)

(assert (=> b!1453466 (=> (not res!984478) (not e!818085))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11761 0))(
  ( (MissingZero!11761 (index!49436 (_ BitVec 32))) (Found!11761 (index!49437 (_ BitVec 32))) (Intermediate!11761 (undefined!12573 Bool) (index!49438 (_ BitVec 32)) (x!131074 (_ BitVec 32))) (Undefined!11761) (MissingVacant!11761 (index!49439 (_ BitVec 32))) )
))
(declare-fun lt!637251 () SeekEntryResult!11761)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98442 0))(
  ( (array!98443 (arr!47509 (Array (_ BitVec 32) (_ BitVec 64))) (size!48059 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98442)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98442 (_ BitVec 32)) SeekEntryResult!11761)

(assert (=> b!1453466 (= res!984478 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!637251))))

(declare-fun res!984474 () Bool)

(declare-fun e!818087 () Bool)

(assert (=> start!124994 (=> (not res!984474) (not e!818087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124994 (= res!984474 (validMask!0 mask!2687))))

(assert (=> start!124994 e!818087))

(assert (=> start!124994 true))

(declare-fun array_inv!36537 (array!98442) Bool)

(assert (=> start!124994 (array_inv!36537 a!2862)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1453467 () Bool)

(declare-fun e!818089 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453467 (= e!818089 (not (or (and (= (select (arr!47509 a!2862) index!646) (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!818090 () Bool)

(assert (=> b!1453467 e!818090))

(declare-fun res!984479 () Bool)

(assert (=> b!1453467 (=> (not res!984479) (not e!818090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98442 (_ BitVec 32)) Bool)

(assert (=> b!1453467 (= res!984479 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49018 0))(
  ( (Unit!49019) )
))
(declare-fun lt!637248 () Unit!49018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49018)

(assert (=> b!1453467 (= lt!637248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453468 () Bool)

(declare-fun res!984487 () Bool)

(assert (=> b!1453468 (=> (not res!984487) (not e!818087))))

(declare-datatypes ((List!34010 0))(
  ( (Nil!34007) (Cons!34006 (h!35356 (_ BitVec 64)) (t!48704 List!34010)) )
))
(declare-fun arrayNoDuplicates!0 (array!98442 (_ BitVec 32) List!34010) Bool)

(assert (=> b!1453468 (= res!984487 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34007))))

(declare-fun b!1453469 () Bool)

(declare-fun res!984489 () Bool)

(assert (=> b!1453469 (=> (not res!984489) (not e!818090))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98442 (_ BitVec 32)) SeekEntryResult!11761)

(assert (=> b!1453469 (= res!984489 (= (seekEntryOrOpen!0 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) (Found!11761 j!93)))))

(declare-fun lt!637249 () (_ BitVec 64))

(declare-fun e!818084 () Bool)

(declare-fun lt!637247 () SeekEntryResult!11761)

(declare-fun b!1453470 () Bool)

(declare-fun lt!637250 () array!98442)

(assert (=> b!1453470 (= e!818084 (= lt!637247 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637249 lt!637250 mask!2687)))))

(declare-fun b!1453471 () Bool)

(declare-fun res!984483 () Bool)

(assert (=> b!1453471 (=> (not res!984483) (not e!818090))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453471 (= res!984483 (or (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) (select (arr!47509 a!2862) j!93))))))

(declare-fun b!1453472 () Bool)

(declare-fun e!818086 () Bool)

(assert (=> b!1453472 (= e!818087 e!818086)))

(declare-fun res!984477 () Bool)

(assert (=> b!1453472 (=> (not res!984477) (not e!818086))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453472 (= res!984477 (= (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453472 (= lt!637250 (array!98443 (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48059 a!2862)))))

(declare-fun b!1453473 () Bool)

(assert (=> b!1453473 (= e!818086 e!818085)))

(declare-fun res!984480 () Bool)

(assert (=> b!1453473 (=> (not res!984480) (not e!818085))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453473 (= res!984480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47509 a!2862) j!93) mask!2687) (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!637251))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453473 (= lt!637251 (Intermediate!11761 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453474 () Bool)

(declare-fun res!984490 () Bool)

(assert (=> b!1453474 (=> (not res!984490) (not e!818087))))

(assert (=> b!1453474 (= res!984490 (and (= (size!48059 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48059 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48059 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453475 () Bool)

(declare-fun e!818088 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98442 (_ BitVec 32)) SeekEntryResult!11761)

(assert (=> b!1453475 (= e!818088 (= (seekEntryOrOpen!0 lt!637249 lt!637250 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637249 lt!637250 mask!2687)))))

(declare-fun b!1453476 () Bool)

(declare-fun res!984484 () Bool)

(assert (=> b!1453476 (=> (not res!984484) (not e!818087))))

(assert (=> b!1453476 (= res!984484 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48059 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48059 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48059 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453477 () Bool)

(declare-fun e!818083 () Bool)

(assert (=> b!1453477 (= e!818090 e!818083)))

(declare-fun res!984486 () Bool)

(assert (=> b!1453477 (=> res!984486 e!818083)))

(declare-fun lt!637246 () (_ BitVec 64))

(assert (=> b!1453477 (= res!984486 (or (and (= (select (arr!47509 a!2862) index!646) lt!637246) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453477 (= lt!637246 (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453478 () Bool)

(declare-fun res!984482 () Bool)

(assert (=> b!1453478 (=> (not res!984482) (not e!818089))))

(assert (=> b!1453478 (= res!984482 e!818084)))

(declare-fun c!134007 () Bool)

(assert (=> b!1453478 (= c!134007 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453479 () Bool)

(declare-fun res!984476 () Bool)

(assert (=> b!1453479 (=> (not res!984476) (not e!818087))))

(assert (=> b!1453479 (= res!984476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453480 () Bool)

(assert (=> b!1453480 (= e!818084 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637249 lt!637250 mask!2687) (seekEntryOrOpen!0 lt!637249 lt!637250 mask!2687)))))

(declare-fun b!1453481 () Bool)

(assert (=> b!1453481 (= e!818083 e!818088)))

(declare-fun res!984488 () Bool)

(assert (=> b!1453481 (=> (not res!984488) (not e!818088))))

(assert (=> b!1453481 (= res!984488 (and (= index!646 intermediateAfterIndex!19) (= lt!637246 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453482 () Bool)

(declare-fun res!984481 () Bool)

(assert (=> b!1453482 (=> (not res!984481) (not e!818087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453482 (= res!984481 (validKeyInArray!0 (select (arr!47509 a!2862) i!1006)))))

(declare-fun b!1453483 () Bool)

(declare-fun res!984475 () Bool)

(assert (=> b!1453483 (=> (not res!984475) (not e!818087))))

(assert (=> b!1453483 (= res!984475 (validKeyInArray!0 (select (arr!47509 a!2862) j!93)))))

(declare-fun b!1453484 () Bool)

(assert (=> b!1453484 (= e!818085 e!818089)))

(declare-fun res!984485 () Bool)

(assert (=> b!1453484 (=> (not res!984485) (not e!818089))))

(assert (=> b!1453484 (= res!984485 (= lt!637247 (Intermediate!11761 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453484 (= lt!637247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637249 mask!2687) lt!637249 lt!637250 mask!2687))))

(assert (=> b!1453484 (= lt!637249 (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453485 () Bool)

(declare-fun res!984473 () Bool)

(assert (=> b!1453485 (=> (not res!984473) (not e!818089))))

(assert (=> b!1453485 (= res!984473 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124994 res!984474) b!1453474))

(assert (= (and b!1453474 res!984490) b!1453482))

(assert (= (and b!1453482 res!984481) b!1453483))

(assert (= (and b!1453483 res!984475) b!1453479))

(assert (= (and b!1453479 res!984476) b!1453468))

(assert (= (and b!1453468 res!984487) b!1453476))

(assert (= (and b!1453476 res!984484) b!1453472))

(assert (= (and b!1453472 res!984477) b!1453473))

(assert (= (and b!1453473 res!984480) b!1453466))

(assert (= (and b!1453466 res!984478) b!1453484))

(assert (= (and b!1453484 res!984485) b!1453478))

(assert (= (and b!1453478 c!134007) b!1453470))

(assert (= (and b!1453478 (not c!134007)) b!1453480))

(assert (= (and b!1453478 res!984482) b!1453485))

(assert (= (and b!1453485 res!984473) b!1453467))

(assert (= (and b!1453467 res!984479) b!1453469))

(assert (= (and b!1453469 res!984489) b!1453471))

(assert (= (and b!1453471 res!984483) b!1453477))

(assert (= (and b!1453477 (not res!984486)) b!1453481))

(assert (= (and b!1453481 res!984488) b!1453475))

(declare-fun m!1341941 () Bool)

(assert (=> b!1453467 m!1341941))

(declare-fun m!1341943 () Bool)

(assert (=> b!1453467 m!1341943))

(declare-fun m!1341945 () Bool)

(assert (=> b!1453467 m!1341945))

(declare-fun m!1341947 () Bool)

(assert (=> b!1453467 m!1341947))

(declare-fun m!1341949 () Bool)

(assert (=> b!1453467 m!1341949))

(declare-fun m!1341951 () Bool)

(assert (=> b!1453467 m!1341951))

(declare-fun m!1341953 () Bool)

(assert (=> b!1453475 m!1341953))

(declare-fun m!1341955 () Bool)

(assert (=> b!1453475 m!1341955))

(declare-fun m!1341957 () Bool)

(assert (=> b!1453470 m!1341957))

(declare-fun m!1341959 () Bool)

(assert (=> b!1453479 m!1341959))

(assert (=> b!1453472 m!1341943))

(declare-fun m!1341961 () Bool)

(assert (=> b!1453472 m!1341961))

(assert (=> b!1453466 m!1341951))

(assert (=> b!1453466 m!1341951))

(declare-fun m!1341963 () Bool)

(assert (=> b!1453466 m!1341963))

(declare-fun m!1341965 () Bool)

(assert (=> b!1453484 m!1341965))

(assert (=> b!1453484 m!1341965))

(declare-fun m!1341967 () Bool)

(assert (=> b!1453484 m!1341967))

(assert (=> b!1453484 m!1341943))

(declare-fun m!1341969 () Bool)

(assert (=> b!1453484 m!1341969))

(assert (=> b!1453477 m!1341947))

(assert (=> b!1453477 m!1341951))

(assert (=> b!1453477 m!1341943))

(assert (=> b!1453477 m!1341945))

(declare-fun m!1341971 () Bool)

(assert (=> b!1453482 m!1341971))

(assert (=> b!1453482 m!1341971))

(declare-fun m!1341973 () Bool)

(assert (=> b!1453482 m!1341973))

(assert (=> b!1453473 m!1341951))

(assert (=> b!1453473 m!1341951))

(declare-fun m!1341975 () Bool)

(assert (=> b!1453473 m!1341975))

(assert (=> b!1453473 m!1341975))

(assert (=> b!1453473 m!1341951))

(declare-fun m!1341977 () Bool)

(assert (=> b!1453473 m!1341977))

(assert (=> b!1453480 m!1341955))

(assert (=> b!1453480 m!1341953))

(assert (=> b!1453469 m!1341951))

(assert (=> b!1453469 m!1341951))

(declare-fun m!1341979 () Bool)

(assert (=> b!1453469 m!1341979))

(declare-fun m!1341981 () Bool)

(assert (=> start!124994 m!1341981))

(declare-fun m!1341983 () Bool)

(assert (=> start!124994 m!1341983))

(declare-fun m!1341985 () Bool)

(assert (=> b!1453468 m!1341985))

(assert (=> b!1453483 m!1341951))

(assert (=> b!1453483 m!1341951))

(declare-fun m!1341987 () Bool)

(assert (=> b!1453483 m!1341987))

(declare-fun m!1341989 () Bool)

(assert (=> b!1453471 m!1341989))

(assert (=> b!1453471 m!1341951))

(push 1)

(assert (not b!1453470))

(assert (not b!1453468))

(assert (not b!1453469))

(assert (not start!124994))

(assert (not b!1453473))

(assert (not b!1453480))

(assert (not b!1453479))

(assert (not b!1453484))

(assert (not b!1453482))

(assert (not b!1453466))

(assert (not b!1453483))

(assert (not b!1453475))

(assert (not b!1453467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

