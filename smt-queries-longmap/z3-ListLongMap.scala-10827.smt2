; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127020 () Bool)

(assert start!127020)

(declare-fun res!1012399 () Bool)

(declare-fun e!835045 () Bool)

(assert (=> start!127020 (=> (not res!1012399) (not e!835045))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127020 (= res!1012399 (validMask!0 mask!2687))))

(assert (=> start!127020 e!835045))

(assert (=> start!127020 true))

(declare-datatypes ((array!99694 0))(
  ( (array!99695 (arr!48115 (Array (_ BitVec 32) (_ BitVec 64))) (size!48666 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99694)

(declare-fun array_inv!37396 (array!99694) Bool)

(assert (=> start!127020 (array_inv!37396 a!2862)))

(declare-fun b!1489513 () Bool)

(declare-fun res!1012395 () Bool)

(assert (=> b!1489513 (=> (not res!1012395) (not e!835045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99694 (_ BitVec 32)) Bool)

(assert (=> b!1489513 (= res!1012395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!835040 () Bool)

(declare-datatypes ((SeekEntryResult!12252 0))(
  ( (MissingZero!12252 (index!51400 (_ BitVec 32))) (Found!12252 (index!51401 (_ BitVec 32))) (Intermediate!12252 (undefined!13064 Bool) (index!51402 (_ BitVec 32)) (x!133177 (_ BitVec 32))) (Undefined!12252) (MissingVacant!12252 (index!51403 (_ BitVec 32))) )
))
(declare-fun lt!649600 () SeekEntryResult!12252)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649597 () array!99694)

(declare-fun b!1489514 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649603 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99694 (_ BitVec 32)) SeekEntryResult!12252)

(assert (=> b!1489514 (= e!835040 (= lt!649600 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649603 lt!649597 mask!2687)))))

(declare-fun b!1489515 () Bool)

(declare-fun e!835038 () Bool)

(assert (=> b!1489515 (= e!835038 true)))

(declare-fun lt!649601 () SeekEntryResult!12252)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!649599 () (_ BitVec 32))

(assert (=> b!1489515 (= lt!649601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649599 (select (arr!48115 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489516 () Bool)

(declare-fun e!835041 () Bool)

(declare-fun e!835046 () Bool)

(assert (=> b!1489516 (= e!835041 e!835046)))

(declare-fun res!1012393 () Bool)

(assert (=> b!1489516 (=> (not res!1012393) (not e!835046))))

(declare-fun lt!649602 () SeekEntryResult!12252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489516 (= res!1012393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48115 a!2862) j!93) mask!2687) (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!649602))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489516 (= lt!649602 (Intermediate!12252 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489517 () Bool)

(declare-fun e!835044 () Bool)

(assert (=> b!1489517 (= e!835044 e!835038)))

(declare-fun res!1012389 () Bool)

(assert (=> b!1489517 (=> res!1012389 e!835038)))

(assert (=> b!1489517 (= res!1012389 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649599 #b00000000000000000000000000000000) (bvsge lt!649599 (size!48666 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489517 (= lt!649599 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1489518 () Bool)

(declare-fun res!1012394 () Bool)

(assert (=> b!1489518 (=> (not res!1012394) (not e!835045))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489518 (= res!1012394 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48666 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48666 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48666 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489519 () Bool)

(declare-fun res!1012384 () Bool)

(assert (=> b!1489519 (=> (not res!1012384) (not e!835045))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489519 (= res!1012384 (validKeyInArray!0 (select (arr!48115 a!2862) i!1006)))))

(declare-fun b!1489520 () Bool)

(declare-fun res!1012401 () Bool)

(assert (=> b!1489520 (=> (not res!1012401) (not e!835045))))

(declare-datatypes ((List!34603 0))(
  ( (Nil!34600) (Cons!34599 (h!35993 (_ BitVec 64)) (t!49289 List!34603)) )
))
(declare-fun arrayNoDuplicates!0 (array!99694 (_ BitVec 32) List!34603) Bool)

(assert (=> b!1489520 (= res!1012401 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34600))))

(declare-fun b!1489521 () Bool)

(declare-fun e!835043 () Bool)

(assert (=> b!1489521 (= e!835046 e!835043)))

(declare-fun res!1012402 () Bool)

(assert (=> b!1489521 (=> (not res!1012402) (not e!835043))))

(assert (=> b!1489521 (= res!1012402 (= lt!649600 (Intermediate!12252 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489521 (= lt!649600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649603 mask!2687) lt!649603 lt!649597 mask!2687))))

(assert (=> b!1489521 (= lt!649603 (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489522 () Bool)

(declare-fun res!1012385 () Bool)

(declare-fun e!835037 () Bool)

(assert (=> b!1489522 (=> (not res!1012385) (not e!835037))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99694 (_ BitVec 32)) SeekEntryResult!12252)

(assert (=> b!1489522 (= res!1012385 (= (seekEntryOrOpen!0 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) (Found!12252 j!93)))))

(declare-fun b!1489523 () Bool)

(declare-fun res!1012398 () Bool)

(assert (=> b!1489523 (=> (not res!1012398) (not e!835045))))

(assert (=> b!1489523 (= res!1012398 (validKeyInArray!0 (select (arr!48115 a!2862) j!93)))))

(declare-fun b!1489524 () Bool)

(assert (=> b!1489524 (= e!835043 (not e!835044))))

(declare-fun res!1012392 () Bool)

(assert (=> b!1489524 (=> res!1012392 e!835044)))

(assert (=> b!1489524 (= res!1012392 (or (and (= (select (arr!48115 a!2862) index!646) (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48115 a!2862) index!646) (select (arr!48115 a!2862) j!93))) (= (select (arr!48115 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489524 e!835037))

(declare-fun res!1012388 () Bool)

(assert (=> b!1489524 (=> (not res!1012388) (not e!835037))))

(assert (=> b!1489524 (= res!1012388 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49877 0))(
  ( (Unit!49878) )
))
(declare-fun lt!649596 () Unit!49877)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49877)

(assert (=> b!1489524 (= lt!649596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489525 () Bool)

(declare-fun res!1012396 () Bool)

(assert (=> b!1489525 (=> (not res!1012396) (not e!835043))))

(assert (=> b!1489525 (= res!1012396 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489526 () Bool)

(declare-fun res!1012400 () Bool)

(assert (=> b!1489526 (=> (not res!1012400) (not e!835046))))

(assert (=> b!1489526 (= res!1012400 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!649602))))

(declare-fun b!1489527 () Bool)

(declare-fun res!1012397 () Bool)

(assert (=> b!1489527 (=> (not res!1012397) (not e!835045))))

(assert (=> b!1489527 (= res!1012397 (and (= (size!48666 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48666 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48666 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489528 () Bool)

(declare-fun e!835039 () Bool)

(declare-fun e!835047 () Bool)

(assert (=> b!1489528 (= e!835039 e!835047)))

(declare-fun res!1012390 () Bool)

(assert (=> b!1489528 (=> (not res!1012390) (not e!835047))))

(declare-fun lt!649598 () (_ BitVec 64))

(assert (=> b!1489528 (= res!1012390 (and (= index!646 intermediateAfterIndex!19) (= lt!649598 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489529 () Bool)

(declare-fun res!1012403 () Bool)

(assert (=> b!1489529 (=> (not res!1012403) (not e!835037))))

(assert (=> b!1489529 (= res!1012403 (or (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) (select (arr!48115 a!2862) j!93))))))

(declare-fun b!1489530 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99694 (_ BitVec 32)) SeekEntryResult!12252)

(assert (=> b!1489530 (= e!835047 (= (seekEntryOrOpen!0 lt!649603 lt!649597 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649603 lt!649597 mask!2687)))))

(declare-fun b!1489531 () Bool)

(assert (=> b!1489531 (= e!835037 e!835039)))

(declare-fun res!1012387 () Bool)

(assert (=> b!1489531 (=> res!1012387 e!835039)))

(assert (=> b!1489531 (= res!1012387 (or (and (= (select (arr!48115 a!2862) index!646) lt!649598) (= (select (arr!48115 a!2862) index!646) (select (arr!48115 a!2862) j!93))) (= (select (arr!48115 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489531 (= lt!649598 (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1489532 () Bool)

(declare-fun res!1012386 () Bool)

(assert (=> b!1489532 (=> (not res!1012386) (not e!835043))))

(assert (=> b!1489532 (= res!1012386 e!835040)))

(declare-fun c!138100 () Bool)

(assert (=> b!1489532 (= c!138100 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489533 () Bool)

(assert (=> b!1489533 (= e!835040 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649603 lt!649597 mask!2687) (seekEntryOrOpen!0 lt!649603 lt!649597 mask!2687)))))

(declare-fun b!1489534 () Bool)

(assert (=> b!1489534 (= e!835045 e!835041)))

(declare-fun res!1012391 () Bool)

(assert (=> b!1489534 (=> (not res!1012391) (not e!835041))))

(assert (=> b!1489534 (= res!1012391 (= (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489534 (= lt!649597 (array!99695 (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48666 a!2862)))))

(assert (= (and start!127020 res!1012399) b!1489527))

(assert (= (and b!1489527 res!1012397) b!1489519))

(assert (= (and b!1489519 res!1012384) b!1489523))

(assert (= (and b!1489523 res!1012398) b!1489513))

(assert (= (and b!1489513 res!1012395) b!1489520))

(assert (= (and b!1489520 res!1012401) b!1489518))

(assert (= (and b!1489518 res!1012394) b!1489534))

(assert (= (and b!1489534 res!1012391) b!1489516))

(assert (= (and b!1489516 res!1012393) b!1489526))

(assert (= (and b!1489526 res!1012400) b!1489521))

(assert (= (and b!1489521 res!1012402) b!1489532))

(assert (= (and b!1489532 c!138100) b!1489514))

(assert (= (and b!1489532 (not c!138100)) b!1489533))

(assert (= (and b!1489532 res!1012386) b!1489525))

(assert (= (and b!1489525 res!1012396) b!1489524))

(assert (= (and b!1489524 res!1012388) b!1489522))

(assert (= (and b!1489522 res!1012385) b!1489529))

(assert (= (and b!1489529 res!1012403) b!1489531))

(assert (= (and b!1489531 (not res!1012387)) b!1489528))

(assert (= (and b!1489528 res!1012390) b!1489530))

(assert (= (and b!1489524 (not res!1012392)) b!1489517))

(assert (= (and b!1489517 (not res!1012389)) b!1489515))

(declare-fun m!1374061 () Bool)

(assert (=> b!1489533 m!1374061))

(declare-fun m!1374063 () Bool)

(assert (=> b!1489533 m!1374063))

(declare-fun m!1374065 () Bool)

(assert (=> b!1489526 m!1374065))

(assert (=> b!1489526 m!1374065))

(declare-fun m!1374067 () Bool)

(assert (=> b!1489526 m!1374067))

(declare-fun m!1374069 () Bool)

(assert (=> b!1489521 m!1374069))

(assert (=> b!1489521 m!1374069))

(declare-fun m!1374071 () Bool)

(assert (=> b!1489521 m!1374071))

(declare-fun m!1374073 () Bool)

(assert (=> b!1489521 m!1374073))

(declare-fun m!1374075 () Bool)

(assert (=> b!1489521 m!1374075))

(declare-fun m!1374077 () Bool)

(assert (=> b!1489529 m!1374077))

(assert (=> b!1489529 m!1374065))

(declare-fun m!1374079 () Bool)

(assert (=> b!1489514 m!1374079))

(assert (=> b!1489522 m!1374065))

(assert (=> b!1489522 m!1374065))

(declare-fun m!1374081 () Bool)

(assert (=> b!1489522 m!1374081))

(assert (=> b!1489534 m!1374073))

(declare-fun m!1374083 () Bool)

(assert (=> b!1489534 m!1374083))

(assert (=> b!1489523 m!1374065))

(assert (=> b!1489523 m!1374065))

(declare-fun m!1374085 () Bool)

(assert (=> b!1489523 m!1374085))

(declare-fun m!1374087 () Bool)

(assert (=> b!1489519 m!1374087))

(assert (=> b!1489519 m!1374087))

(declare-fun m!1374089 () Bool)

(assert (=> b!1489519 m!1374089))

(declare-fun m!1374091 () Bool)

(assert (=> b!1489517 m!1374091))

(declare-fun m!1374093 () Bool)

(assert (=> b!1489531 m!1374093))

(assert (=> b!1489531 m!1374065))

(assert (=> b!1489531 m!1374073))

(declare-fun m!1374095 () Bool)

(assert (=> b!1489531 m!1374095))

(declare-fun m!1374097 () Bool)

(assert (=> b!1489524 m!1374097))

(assert (=> b!1489524 m!1374073))

(assert (=> b!1489524 m!1374095))

(assert (=> b!1489524 m!1374093))

(declare-fun m!1374099 () Bool)

(assert (=> b!1489524 m!1374099))

(assert (=> b!1489524 m!1374065))

(declare-fun m!1374101 () Bool)

(assert (=> b!1489513 m!1374101))

(assert (=> b!1489530 m!1374063))

(assert (=> b!1489530 m!1374061))

(assert (=> b!1489516 m!1374065))

(assert (=> b!1489516 m!1374065))

(declare-fun m!1374103 () Bool)

(assert (=> b!1489516 m!1374103))

(assert (=> b!1489516 m!1374103))

(assert (=> b!1489516 m!1374065))

(declare-fun m!1374105 () Bool)

(assert (=> b!1489516 m!1374105))

(declare-fun m!1374107 () Bool)

(assert (=> start!127020 m!1374107))

(declare-fun m!1374109 () Bool)

(assert (=> start!127020 m!1374109))

(assert (=> b!1489515 m!1374065))

(assert (=> b!1489515 m!1374065))

(declare-fun m!1374111 () Bool)

(assert (=> b!1489515 m!1374111))

(declare-fun m!1374113 () Bool)

(assert (=> b!1489520 m!1374113))

(check-sat (not b!1489517) (not b!1489514) (not b!1489522) (not b!1489513) (not b!1489530) (not b!1489533) (not start!127020) (not b!1489526) (not b!1489521) (not b!1489523) (not b!1489524) (not b!1489519) (not b!1489516) (not b!1489520) (not b!1489515))
(check-sat)
