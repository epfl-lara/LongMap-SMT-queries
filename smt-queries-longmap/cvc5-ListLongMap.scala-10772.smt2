; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126130 () Bool)

(assert start!126130)

(declare-fun b!1476490 () Bool)

(declare-fun res!1002727 () Bool)

(declare-fun e!828372 () Bool)

(assert (=> b!1476490 (=> (not res!1002727) (not e!828372))))

(declare-datatypes ((array!99236 0))(
  ( (array!99237 (arr!47897 (Array (_ BitVec 32) (_ BitVec 64))) (size!48447 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99236)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99236 (_ BitVec 32)) Bool)

(assert (=> b!1476490 (= res!1002727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476491 () Bool)

(declare-fun res!1002731 () Bool)

(assert (=> b!1476491 (=> (not res!1002731) (not e!828372))))

(declare-datatypes ((List!34398 0))(
  ( (Nil!34395) (Cons!34394 (h!35762 (_ BitVec 64)) (t!49092 List!34398)) )
))
(declare-fun arrayNoDuplicates!0 (array!99236 (_ BitVec 32) List!34398) Bool)

(assert (=> b!1476491 (= res!1002731 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34395))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645036 () array!99236)

(declare-fun b!1476492 () Bool)

(declare-fun e!828375 () Bool)

(declare-datatypes ((SeekEntryResult!12137 0))(
  ( (MissingZero!12137 (index!50940 (_ BitVec 32))) (Found!12137 (index!50941 (_ BitVec 32))) (Intermediate!12137 (undefined!12949 Bool) (index!50942 (_ BitVec 32)) (x!132544 (_ BitVec 32))) (Undefined!12137) (MissingVacant!12137 (index!50943 (_ BitVec 32))) )
))
(declare-fun lt!645034 () SeekEntryResult!12137)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!645035 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99236 (_ BitVec 32)) SeekEntryResult!12137)

(assert (=> b!1476492 (= e!828375 (= lt!645034 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645035 lt!645036 mask!2687)))))

(declare-fun b!1476493 () Bool)

(declare-fun res!1002733 () Bool)

(assert (=> b!1476493 (=> (not res!1002733) (not e!828372))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476493 (= res!1002733 (validKeyInArray!0 (select (arr!47897 a!2862) i!1006)))))

(declare-fun b!1476494 () Bool)

(declare-fun res!1002721 () Bool)

(declare-fun e!828369 () Bool)

(assert (=> b!1476494 (=> (not res!1002721) (not e!828369))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476494 (= res!1002721 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476495 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99236 (_ BitVec 32)) SeekEntryResult!12137)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99236 (_ BitVec 32)) SeekEntryResult!12137)

(assert (=> b!1476495 (= e!828375 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645035 lt!645036 mask!2687) (seekEntryOrOpen!0 lt!645035 lt!645036 mask!2687)))))

(declare-fun b!1476496 () Bool)

(declare-fun res!1002734 () Bool)

(declare-fun e!828370 () Bool)

(assert (=> b!1476496 (=> (not res!1002734) (not e!828370))))

(declare-fun lt!645033 () SeekEntryResult!12137)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476496 (= res!1002734 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47897 a!2862) j!93) a!2862 mask!2687) lt!645033))))

(declare-fun b!1476498 () Bool)

(declare-fun e!828377 () Bool)

(assert (=> b!1476498 (= e!828372 e!828377)))

(declare-fun res!1002736 () Bool)

(assert (=> b!1476498 (=> (not res!1002736) (not e!828377))))

(assert (=> b!1476498 (= res!1002736 (= (select (store (arr!47897 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476498 (= lt!645036 (array!99237 (store (arr!47897 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48447 a!2862)))))

(declare-fun b!1476499 () Bool)

(declare-fun e!828374 () Bool)

(declare-fun e!828371 () Bool)

(assert (=> b!1476499 (= e!828374 e!828371)))

(declare-fun res!1002724 () Bool)

(assert (=> b!1476499 (=> (not res!1002724) (not e!828371))))

(declare-fun lt!645031 () SeekEntryResult!12137)

(assert (=> b!1476499 (= res!1002724 (= lt!645031 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47897 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476500 () Bool)

(assert (=> b!1476500 (= e!828370 e!828369)))

(declare-fun res!1002723 () Bool)

(assert (=> b!1476500 (=> (not res!1002723) (not e!828369))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476500 (= res!1002723 (= lt!645034 (Intermediate!12137 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476500 (= lt!645034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645035 mask!2687) lt!645035 lt!645036 mask!2687))))

(assert (=> b!1476500 (= lt!645035 (select (store (arr!47897 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1476501 () Bool)

(assert (=> b!1476501 (= e!828371 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476502 () Bool)

(declare-fun res!1002722 () Bool)

(assert (=> b!1476502 (=> (not res!1002722) (not e!828372))))

(assert (=> b!1476502 (= res!1002722 (validKeyInArray!0 (select (arr!47897 a!2862) j!93)))))

(declare-fun b!1476503 () Bool)

(assert (=> b!1476503 (= e!828377 e!828370)))

(declare-fun res!1002730 () Bool)

(assert (=> b!1476503 (=> (not res!1002730) (not e!828370))))

(assert (=> b!1476503 (= res!1002730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47897 a!2862) j!93) mask!2687) (select (arr!47897 a!2862) j!93) a!2862 mask!2687) lt!645033))))

(assert (=> b!1476503 (= lt!645033 (Intermediate!12137 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476504 () Bool)

(declare-fun e!828376 () Bool)

(assert (=> b!1476504 (= e!828376 e!828374)))

(declare-fun res!1002729 () Bool)

(assert (=> b!1476504 (=> res!1002729 e!828374)))

(assert (=> b!1476504 (= res!1002729 (or (and (= (select (arr!47897 a!2862) index!646) (select (store (arr!47897 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47897 a!2862) index!646) (select (arr!47897 a!2862) j!93))) (not (= (select (arr!47897 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476505 () Bool)

(declare-fun res!1002725 () Bool)

(assert (=> b!1476505 (=> (not res!1002725) (not e!828372))))

(assert (=> b!1476505 (= res!1002725 (and (= (size!48447 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48447 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48447 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1002735 () Bool)

(assert (=> start!126130 (=> (not res!1002735) (not e!828372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126130 (= res!1002735 (validMask!0 mask!2687))))

(assert (=> start!126130 e!828372))

(assert (=> start!126130 true))

(declare-fun array_inv!36925 (array!99236) Bool)

(assert (=> start!126130 (array_inv!36925 a!2862)))

(declare-fun b!1476497 () Bool)

(assert (=> b!1476497 (= e!828369 (not true))))

(assert (=> b!1476497 e!828376))

(declare-fun res!1002728 () Bool)

(assert (=> b!1476497 (=> (not res!1002728) (not e!828376))))

(assert (=> b!1476497 (= res!1002728 (and (= lt!645031 (Found!12137 j!93)) (or (= (select (arr!47897 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47897 a!2862) intermediateBeforeIndex!19) (select (arr!47897 a!2862) j!93)))))))

(assert (=> b!1476497 (= lt!645031 (seekEntryOrOpen!0 (select (arr!47897 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476497 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49614 0))(
  ( (Unit!49615) )
))
(declare-fun lt!645032 () Unit!49614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49614)

(assert (=> b!1476497 (= lt!645032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476506 () Bool)

(declare-fun res!1002732 () Bool)

(assert (=> b!1476506 (=> (not res!1002732) (not e!828369))))

(assert (=> b!1476506 (= res!1002732 e!828375)))

(declare-fun c!136404 () Bool)

(assert (=> b!1476506 (= c!136404 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476507 () Bool)

(declare-fun res!1002726 () Bool)

(assert (=> b!1476507 (=> (not res!1002726) (not e!828372))))

(assert (=> b!1476507 (= res!1002726 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48447 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48447 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48447 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126130 res!1002735) b!1476505))

(assert (= (and b!1476505 res!1002725) b!1476493))

(assert (= (and b!1476493 res!1002733) b!1476502))

(assert (= (and b!1476502 res!1002722) b!1476490))

(assert (= (and b!1476490 res!1002727) b!1476491))

(assert (= (and b!1476491 res!1002731) b!1476507))

(assert (= (and b!1476507 res!1002726) b!1476498))

(assert (= (and b!1476498 res!1002736) b!1476503))

(assert (= (and b!1476503 res!1002730) b!1476496))

(assert (= (and b!1476496 res!1002734) b!1476500))

(assert (= (and b!1476500 res!1002723) b!1476506))

(assert (= (and b!1476506 c!136404) b!1476492))

(assert (= (and b!1476506 (not c!136404)) b!1476495))

(assert (= (and b!1476506 res!1002732) b!1476494))

(assert (= (and b!1476494 res!1002721) b!1476497))

(assert (= (and b!1476497 res!1002728) b!1476504))

(assert (= (and b!1476504 (not res!1002729)) b!1476499))

(assert (= (and b!1476499 res!1002724) b!1476501))

(declare-fun m!1362475 () Bool)

(assert (=> b!1476495 m!1362475))

(declare-fun m!1362477 () Bool)

(assert (=> b!1476495 m!1362477))

(declare-fun m!1362479 () Bool)

(assert (=> b!1476502 m!1362479))

(assert (=> b!1476502 m!1362479))

(declare-fun m!1362481 () Bool)

(assert (=> b!1476502 m!1362481))

(declare-fun m!1362483 () Bool)

(assert (=> b!1476504 m!1362483))

(declare-fun m!1362485 () Bool)

(assert (=> b!1476504 m!1362485))

(declare-fun m!1362487 () Bool)

(assert (=> b!1476504 m!1362487))

(assert (=> b!1476504 m!1362479))

(declare-fun m!1362489 () Bool)

(assert (=> b!1476493 m!1362489))

(assert (=> b!1476493 m!1362489))

(declare-fun m!1362491 () Bool)

(assert (=> b!1476493 m!1362491))

(assert (=> b!1476503 m!1362479))

(assert (=> b!1476503 m!1362479))

(declare-fun m!1362493 () Bool)

(assert (=> b!1476503 m!1362493))

(assert (=> b!1476503 m!1362493))

(assert (=> b!1476503 m!1362479))

(declare-fun m!1362495 () Bool)

(assert (=> b!1476503 m!1362495))

(declare-fun m!1362497 () Bool)

(assert (=> b!1476500 m!1362497))

(assert (=> b!1476500 m!1362497))

(declare-fun m!1362499 () Bool)

(assert (=> b!1476500 m!1362499))

(assert (=> b!1476500 m!1362485))

(declare-fun m!1362501 () Bool)

(assert (=> b!1476500 m!1362501))

(declare-fun m!1362503 () Bool)

(assert (=> b!1476491 m!1362503))

(declare-fun m!1362505 () Bool)

(assert (=> b!1476492 m!1362505))

(assert (=> b!1476496 m!1362479))

(assert (=> b!1476496 m!1362479))

(declare-fun m!1362507 () Bool)

(assert (=> b!1476496 m!1362507))

(declare-fun m!1362509 () Bool)

(assert (=> b!1476490 m!1362509))

(assert (=> b!1476498 m!1362485))

(declare-fun m!1362511 () Bool)

(assert (=> b!1476498 m!1362511))

(declare-fun m!1362513 () Bool)

(assert (=> start!126130 m!1362513))

(declare-fun m!1362515 () Bool)

(assert (=> start!126130 m!1362515))

(declare-fun m!1362517 () Bool)

(assert (=> b!1476497 m!1362517))

(declare-fun m!1362519 () Bool)

(assert (=> b!1476497 m!1362519))

(assert (=> b!1476497 m!1362479))

(declare-fun m!1362521 () Bool)

(assert (=> b!1476497 m!1362521))

(declare-fun m!1362523 () Bool)

(assert (=> b!1476497 m!1362523))

(assert (=> b!1476497 m!1362479))

(assert (=> b!1476499 m!1362479))

(assert (=> b!1476499 m!1362479))

(declare-fun m!1362525 () Bool)

(assert (=> b!1476499 m!1362525))

(push 1)

