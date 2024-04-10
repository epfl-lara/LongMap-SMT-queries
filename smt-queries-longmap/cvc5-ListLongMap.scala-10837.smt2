; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126868 () Bool)

(assert start!126868)

(declare-fun b!1490248 () Bool)

(declare-fun res!1013550 () Bool)

(declare-fun e!835098 () Bool)

(assert (=> b!1490248 (=> (not res!1013550) (not e!835098))))

(declare-datatypes ((array!99641 0))(
  ( (array!99642 (arr!48092 (Array (_ BitVec 32) (_ BitVec 64))) (size!48642 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99641)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490248 (= res!1013550 (validKeyInArray!0 (select (arr!48092 a!2862) i!1006)))))

(declare-fun b!1490249 () Bool)

(declare-fun res!1013558 () Bool)

(declare-fun e!835102 () Bool)

(assert (=> b!1490249 (=> (not res!1013558) (not e!835102))))

(declare-fun e!835099 () Bool)

(assert (=> b!1490249 (= res!1013558 e!835099)))

(declare-fun c!137877 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490249 (= c!137877 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490251 () Bool)

(declare-fun e!835096 () Bool)

(assert (=> b!1490251 (= e!835102 (not e!835096))))

(declare-fun res!1013551 () Bool)

(assert (=> b!1490251 (=> res!1013551 e!835096)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490251 (= res!1013551 (or (and (= (select (arr!48092 a!2862) index!646) (select (store (arr!48092 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48092 a!2862) index!646) (select (arr!48092 a!2862) j!93))) (= (select (arr!48092 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835097 () Bool)

(assert (=> b!1490251 e!835097))

(declare-fun res!1013563 () Bool)

(assert (=> b!1490251 (=> (not res!1013563) (not e!835097))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99641 (_ BitVec 32)) Bool)

(assert (=> b!1490251 (= res!1013563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50004 0))(
  ( (Unit!50005) )
))
(declare-fun lt!649881 () Unit!50004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50004)

(assert (=> b!1490251 (= lt!649881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!649880 () (_ BitVec 64))

(declare-fun b!1490252 () Bool)

(declare-fun lt!649884 () array!99641)

(declare-datatypes ((SeekEntryResult!12332 0))(
  ( (MissingZero!12332 (index!51720 (_ BitVec 32))) (Found!12332 (index!51721 (_ BitVec 32))) (Intermediate!12332 (undefined!13144 Bool) (index!51722 (_ BitVec 32)) (x!133316 (_ BitVec 32))) (Undefined!12332) (MissingVacant!12332 (index!51723 (_ BitVec 32))) )
))
(declare-fun lt!649882 () SeekEntryResult!12332)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99641 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1490252 (= e!835099 (= lt!649882 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649880 lt!649884 mask!2687)))))

(declare-fun b!1490253 () Bool)

(declare-fun res!1013560 () Bool)

(assert (=> b!1490253 (=> (not res!1013560) (not e!835098))))

(assert (=> b!1490253 (= res!1013560 (validKeyInArray!0 (select (arr!48092 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1490254 () Bool)

(assert (=> b!1490254 (= e!835097 (or (= (select (arr!48092 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48092 a!2862) intermediateBeforeIndex!19) (select (arr!48092 a!2862) j!93))))))

(declare-fun b!1490255 () Bool)

(declare-fun res!1013562 () Bool)

(assert (=> b!1490255 (=> (not res!1013562) (not e!835098))))

(assert (=> b!1490255 (= res!1013562 (and (= (size!48642 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48642 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48642 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490256 () Bool)

(declare-fun res!1013555 () Bool)

(assert (=> b!1490256 (=> (not res!1013555) (not e!835098))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490256 (= res!1013555 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48642 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48642 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48642 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490257 () Bool)

(assert (=> b!1490257 (= e!835096 true)))

(declare-fun lt!649879 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490257 (= lt!649879 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490250 () Bool)

(declare-fun res!1013561 () Bool)

(assert (=> b!1490250 (=> (not res!1013561) (not e!835098))))

(declare-datatypes ((List!34593 0))(
  ( (Nil!34590) (Cons!34589 (h!35972 (_ BitVec 64)) (t!49287 List!34593)) )
))
(declare-fun arrayNoDuplicates!0 (array!99641 (_ BitVec 32) List!34593) Bool)

(assert (=> b!1490250 (= res!1013561 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34590))))

(declare-fun res!1013548 () Bool)

(assert (=> start!126868 (=> (not res!1013548) (not e!835098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126868 (= res!1013548 (validMask!0 mask!2687))))

(assert (=> start!126868 e!835098))

(assert (=> start!126868 true))

(declare-fun array_inv!37120 (array!99641) Bool)

(assert (=> start!126868 (array_inv!37120 a!2862)))

(declare-fun b!1490258 () Bool)

(declare-fun e!835100 () Bool)

(declare-fun e!835103 () Bool)

(assert (=> b!1490258 (= e!835100 e!835103)))

(declare-fun res!1013549 () Bool)

(assert (=> b!1490258 (=> (not res!1013549) (not e!835103))))

(declare-fun lt!649883 () SeekEntryResult!12332)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490258 (= res!1013549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48092 a!2862) j!93) mask!2687) (select (arr!48092 a!2862) j!93) a!2862 mask!2687) lt!649883))))

(assert (=> b!1490258 (= lt!649883 (Intermediate!12332 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490259 () Bool)

(assert (=> b!1490259 (= e!835098 e!835100)))

(declare-fun res!1013557 () Bool)

(assert (=> b!1490259 (=> (not res!1013557) (not e!835100))))

(assert (=> b!1490259 (= res!1013557 (= (select (store (arr!48092 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490259 (= lt!649884 (array!99642 (store (arr!48092 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48642 a!2862)))))

(declare-fun b!1490260 () Bool)

(declare-fun res!1013554 () Bool)

(assert (=> b!1490260 (=> (not res!1013554) (not e!835097))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99641 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1490260 (= res!1013554 (= (seekEntryOrOpen!0 (select (arr!48092 a!2862) j!93) a!2862 mask!2687) (Found!12332 j!93)))))

(declare-fun b!1490261 () Bool)

(declare-fun res!1013559 () Bool)

(assert (=> b!1490261 (=> (not res!1013559) (not e!835103))))

(assert (=> b!1490261 (= res!1013559 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48092 a!2862) j!93) a!2862 mask!2687) lt!649883))))

(declare-fun b!1490262 () Bool)

(declare-fun res!1013553 () Bool)

(assert (=> b!1490262 (=> (not res!1013553) (not e!835098))))

(assert (=> b!1490262 (= res!1013553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490263 () Bool)

(assert (=> b!1490263 (= e!835103 e!835102)))

(declare-fun res!1013556 () Bool)

(assert (=> b!1490263 (=> (not res!1013556) (not e!835102))))

(assert (=> b!1490263 (= res!1013556 (= lt!649882 (Intermediate!12332 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490263 (= lt!649882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649880 mask!2687) lt!649880 lt!649884 mask!2687))))

(assert (=> b!1490263 (= lt!649880 (select (store (arr!48092 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99641 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1490264 (= e!835099 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649880 lt!649884 mask!2687) (seekEntryOrOpen!0 lt!649880 lt!649884 mask!2687)))))

(declare-fun b!1490265 () Bool)

(declare-fun res!1013552 () Bool)

(assert (=> b!1490265 (=> (not res!1013552) (not e!835102))))

(assert (=> b!1490265 (= res!1013552 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126868 res!1013548) b!1490255))

(assert (= (and b!1490255 res!1013562) b!1490248))

(assert (= (and b!1490248 res!1013550) b!1490253))

(assert (= (and b!1490253 res!1013560) b!1490262))

(assert (= (and b!1490262 res!1013553) b!1490250))

(assert (= (and b!1490250 res!1013561) b!1490256))

(assert (= (and b!1490256 res!1013555) b!1490259))

(assert (= (and b!1490259 res!1013557) b!1490258))

(assert (= (and b!1490258 res!1013549) b!1490261))

(assert (= (and b!1490261 res!1013559) b!1490263))

(assert (= (and b!1490263 res!1013556) b!1490249))

(assert (= (and b!1490249 c!137877) b!1490252))

(assert (= (and b!1490249 (not c!137877)) b!1490264))

(assert (= (and b!1490249 res!1013558) b!1490265))

(assert (= (and b!1490265 res!1013552) b!1490251))

(assert (= (and b!1490251 res!1013563) b!1490260))

(assert (= (and b!1490260 res!1013554) b!1490254))

(assert (= (and b!1490251 (not res!1013551)) b!1490257))

(declare-fun m!1374415 () Bool)

(assert (=> b!1490257 m!1374415))

(declare-fun m!1374417 () Bool)

(assert (=> b!1490253 m!1374417))

(assert (=> b!1490253 m!1374417))

(declare-fun m!1374419 () Bool)

(assert (=> b!1490253 m!1374419))

(declare-fun m!1374421 () Bool)

(assert (=> b!1490250 m!1374421))

(declare-fun m!1374423 () Bool)

(assert (=> start!126868 m!1374423))

(declare-fun m!1374425 () Bool)

(assert (=> start!126868 m!1374425))

(declare-fun m!1374427 () Bool)

(assert (=> b!1490264 m!1374427))

(declare-fun m!1374429 () Bool)

(assert (=> b!1490264 m!1374429))

(declare-fun m!1374431 () Bool)

(assert (=> b!1490262 m!1374431))

(declare-fun m!1374433 () Bool)

(assert (=> b!1490251 m!1374433))

(declare-fun m!1374435 () Bool)

(assert (=> b!1490251 m!1374435))

(declare-fun m!1374437 () Bool)

(assert (=> b!1490251 m!1374437))

(declare-fun m!1374439 () Bool)

(assert (=> b!1490251 m!1374439))

(declare-fun m!1374441 () Bool)

(assert (=> b!1490251 m!1374441))

(assert (=> b!1490251 m!1374417))

(declare-fun m!1374443 () Bool)

(assert (=> b!1490254 m!1374443))

(assert (=> b!1490254 m!1374417))

(declare-fun m!1374445 () Bool)

(assert (=> b!1490252 m!1374445))

(declare-fun m!1374447 () Bool)

(assert (=> b!1490248 m!1374447))

(assert (=> b!1490248 m!1374447))

(declare-fun m!1374449 () Bool)

(assert (=> b!1490248 m!1374449))

(assert (=> b!1490260 m!1374417))

(assert (=> b!1490260 m!1374417))

(declare-fun m!1374451 () Bool)

(assert (=> b!1490260 m!1374451))

(assert (=> b!1490258 m!1374417))

(assert (=> b!1490258 m!1374417))

(declare-fun m!1374453 () Bool)

(assert (=> b!1490258 m!1374453))

(assert (=> b!1490258 m!1374453))

(assert (=> b!1490258 m!1374417))

(declare-fun m!1374455 () Bool)

(assert (=> b!1490258 m!1374455))

(assert (=> b!1490261 m!1374417))

(assert (=> b!1490261 m!1374417))

(declare-fun m!1374457 () Bool)

(assert (=> b!1490261 m!1374457))

(assert (=> b!1490259 m!1374435))

(declare-fun m!1374459 () Bool)

(assert (=> b!1490259 m!1374459))

(declare-fun m!1374461 () Bool)

(assert (=> b!1490263 m!1374461))

(assert (=> b!1490263 m!1374461))

(declare-fun m!1374463 () Bool)

(assert (=> b!1490263 m!1374463))

(assert (=> b!1490263 m!1374435))

(declare-fun m!1374465 () Bool)

(assert (=> b!1490263 m!1374465))

(push 1)

