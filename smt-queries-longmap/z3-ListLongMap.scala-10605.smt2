; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124986 () Bool)

(assert start!124986)

(declare-fun b!1448443 () Bool)

(declare-fun res!979308 () Bool)

(declare-fun e!815858 () Bool)

(assert (=> b!1448443 (=> (not res!979308) (not e!815858))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448443 (= res!979308 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448444 () Bool)

(declare-fun res!979314 () Bool)

(declare-fun e!815854 () Bool)

(assert (=> b!1448444 (=> (not res!979314) (not e!815854))))

(declare-datatypes ((SeekEntryResult!11598 0))(
  ( (MissingZero!11598 (index!48784 (_ BitVec 32))) (Found!11598 (index!48785 (_ BitVec 32))) (Intermediate!11598 (undefined!12410 Bool) (index!48786 (_ BitVec 32)) (x!130639 (_ BitVec 32))) (Undefined!11598) (MissingVacant!11598 (index!48787 (_ BitVec 32))) )
))
(declare-fun lt!635522 () SeekEntryResult!11598)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98329 0))(
  ( (array!98330 (arr!47449 (Array (_ BitVec 32) (_ BitVec 64))) (size!48000 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98329)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98329 (_ BitVec 32)) SeekEntryResult!11598)

(assert (=> b!1448444 (= res!979314 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!635522))))

(declare-fun lt!635524 () (_ BitVec 64))

(declare-fun e!815862 () Bool)

(declare-fun lt!635527 () array!98329)

(declare-fun b!1448445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98329 (_ BitVec 32)) SeekEntryResult!11598)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98329 (_ BitVec 32)) SeekEntryResult!11598)

(assert (=> b!1448445 (= e!815862 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635524 lt!635527 mask!2687) (seekEntryOrOpen!0 lt!635524 lt!635527 mask!2687)))))

(declare-fun b!1448446 () Bool)

(declare-fun res!979310 () Bool)

(assert (=> b!1448446 (=> (not res!979310) (not e!815858))))

(assert (=> b!1448446 (= res!979310 e!815862)))

(declare-fun c!134089 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448446 (= c!134089 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448447 () Bool)

(declare-fun res!979315 () Bool)

(declare-fun e!815856 () Bool)

(assert (=> b!1448447 (=> (not res!979315) (not e!815856))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448447 (= res!979315 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48000 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48000 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48000 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!979312 () Bool)

(assert (=> start!124986 (=> (not res!979312) (not e!815856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124986 (= res!979312 (validMask!0 mask!2687))))

(assert (=> start!124986 e!815856))

(assert (=> start!124986 true))

(declare-fun array_inv!36730 (array!98329) Bool)

(assert (=> start!124986 (array_inv!36730 a!2862)))

(declare-fun b!1448448 () Bool)

(declare-fun e!815861 () Bool)

(assert (=> b!1448448 (= e!815861 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448449 () Bool)

(assert (=> b!1448449 (= e!815854 e!815858)))

(declare-fun res!979316 () Bool)

(assert (=> b!1448449 (=> (not res!979316) (not e!815858))))

(declare-fun lt!635525 () SeekEntryResult!11598)

(assert (=> b!1448449 (= res!979316 (= lt!635525 (Intermediate!11598 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448449 (= lt!635525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635524 mask!2687) lt!635524 lt!635527 mask!2687))))

(assert (=> b!1448449 (= lt!635524 (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448450 () Bool)

(declare-fun res!979305 () Bool)

(assert (=> b!1448450 (=> (not res!979305) (not e!815856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448450 (= res!979305 (validKeyInArray!0 (select (arr!47449 a!2862) i!1006)))))

(declare-fun b!1448451 () Bool)

(declare-fun e!815857 () Bool)

(assert (=> b!1448451 (= e!815857 e!815861)))

(declare-fun res!979319 () Bool)

(assert (=> b!1448451 (=> (not res!979319) (not e!815861))))

(declare-fun lt!635523 () SeekEntryResult!11598)

(assert (=> b!1448451 (= res!979319 (= lt!635523 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47449 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448452 () Bool)

(declare-fun res!979318 () Bool)

(assert (=> b!1448452 (=> (not res!979318) (not e!815856))))

(declare-datatypes ((List!33937 0))(
  ( (Nil!33934) (Cons!33933 (h!35294 (_ BitVec 64)) (t!48623 List!33937)) )
))
(declare-fun arrayNoDuplicates!0 (array!98329 (_ BitVec 32) List!33937) Bool)

(assert (=> b!1448452 (= res!979318 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33934))))

(declare-fun b!1448453 () Bool)

(declare-fun res!979317 () Bool)

(assert (=> b!1448453 (=> (not res!979317) (not e!815856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98329 (_ BitVec 32)) Bool)

(assert (=> b!1448453 (= res!979317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448454 () Bool)

(declare-fun e!815855 () Bool)

(assert (=> b!1448454 (= e!815855 true)))

(declare-fun lt!635521 () SeekEntryResult!11598)

(assert (=> b!1448454 (= lt!635521 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47449 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448455 () Bool)

(declare-fun res!979304 () Bool)

(assert (=> b!1448455 (=> (not res!979304) (not e!815856))))

(assert (=> b!1448455 (= res!979304 (and (= (size!48000 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48000 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48000 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448456 () Bool)

(declare-fun e!815859 () Bool)

(assert (=> b!1448456 (= e!815859 e!815854)))

(declare-fun res!979307 () Bool)

(assert (=> b!1448456 (=> (not res!979307) (not e!815854))))

(assert (=> b!1448456 (= res!979307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47449 a!2862) j!93) mask!2687) (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!635522))))

(assert (=> b!1448456 (= lt!635522 (Intermediate!11598 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448457 () Bool)

(assert (=> b!1448457 (= e!815858 (not e!815855))))

(declare-fun res!979313 () Bool)

(assert (=> b!1448457 (=> res!979313 e!815855)))

(assert (=> b!1448457 (= res!979313 (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (not (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815853 () Bool)

(assert (=> b!1448457 e!815853))

(declare-fun res!979309 () Bool)

(assert (=> b!1448457 (=> (not res!979309) (not e!815853))))

(assert (=> b!1448457 (= res!979309 (and (= lt!635523 (Found!11598 j!93)) (or (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) (select (arr!47449 a!2862) j!93)))))))

(assert (=> b!1448457 (= lt!635523 (seekEntryOrOpen!0 (select (arr!47449 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448457 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48725 0))(
  ( (Unit!48726) )
))
(declare-fun lt!635526 () Unit!48725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48725)

(assert (=> b!1448457 (= lt!635526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448458 () Bool)

(declare-fun res!979306 () Bool)

(assert (=> b!1448458 (=> (not res!979306) (not e!815856))))

(assert (=> b!1448458 (= res!979306 (validKeyInArray!0 (select (arr!47449 a!2862) j!93)))))

(declare-fun b!1448459 () Bool)

(assert (=> b!1448459 (= e!815856 e!815859)))

(declare-fun res!979311 () Bool)

(assert (=> b!1448459 (=> (not res!979311) (not e!815859))))

(assert (=> b!1448459 (= res!979311 (= (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448459 (= lt!635527 (array!98330 (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48000 a!2862)))))

(declare-fun b!1448460 () Bool)

(assert (=> b!1448460 (= e!815862 (= lt!635525 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635524 lt!635527 mask!2687)))))

(declare-fun b!1448461 () Bool)

(assert (=> b!1448461 (= e!815853 e!815857)))

(declare-fun res!979303 () Bool)

(assert (=> b!1448461 (=> res!979303 e!815857)))

(assert (=> b!1448461 (= res!979303 (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (not (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!124986 res!979312) b!1448455))

(assert (= (and b!1448455 res!979304) b!1448450))

(assert (= (and b!1448450 res!979305) b!1448458))

(assert (= (and b!1448458 res!979306) b!1448453))

(assert (= (and b!1448453 res!979317) b!1448452))

(assert (= (and b!1448452 res!979318) b!1448447))

(assert (= (and b!1448447 res!979315) b!1448459))

(assert (= (and b!1448459 res!979311) b!1448456))

(assert (= (and b!1448456 res!979307) b!1448444))

(assert (= (and b!1448444 res!979314) b!1448449))

(assert (= (and b!1448449 res!979316) b!1448446))

(assert (= (and b!1448446 c!134089) b!1448460))

(assert (= (and b!1448446 (not c!134089)) b!1448445))

(assert (= (and b!1448446 res!979310) b!1448443))

(assert (= (and b!1448443 res!979308) b!1448457))

(assert (= (and b!1448457 res!979309) b!1448461))

(assert (= (and b!1448461 (not res!979303)) b!1448451))

(assert (= (and b!1448451 res!979319) b!1448448))

(assert (= (and b!1448457 (not res!979313)) b!1448454))

(declare-fun m!1337389 () Bool)

(assert (=> b!1448449 m!1337389))

(assert (=> b!1448449 m!1337389))

(declare-fun m!1337391 () Bool)

(assert (=> b!1448449 m!1337391))

(declare-fun m!1337393 () Bool)

(assert (=> b!1448449 m!1337393))

(declare-fun m!1337395 () Bool)

(assert (=> b!1448449 m!1337395))

(declare-fun m!1337397 () Bool)

(assert (=> b!1448445 m!1337397))

(declare-fun m!1337399 () Bool)

(assert (=> b!1448445 m!1337399))

(declare-fun m!1337401 () Bool)

(assert (=> b!1448456 m!1337401))

(assert (=> b!1448456 m!1337401))

(declare-fun m!1337403 () Bool)

(assert (=> b!1448456 m!1337403))

(assert (=> b!1448456 m!1337403))

(assert (=> b!1448456 m!1337401))

(declare-fun m!1337405 () Bool)

(assert (=> b!1448456 m!1337405))

(declare-fun m!1337407 () Bool)

(assert (=> b!1448460 m!1337407))

(declare-fun m!1337409 () Bool)

(assert (=> b!1448457 m!1337409))

(assert (=> b!1448457 m!1337393))

(declare-fun m!1337411 () Bool)

(assert (=> b!1448457 m!1337411))

(declare-fun m!1337413 () Bool)

(assert (=> b!1448457 m!1337413))

(declare-fun m!1337415 () Bool)

(assert (=> b!1448457 m!1337415))

(assert (=> b!1448457 m!1337401))

(declare-fun m!1337417 () Bool)

(assert (=> b!1448457 m!1337417))

(declare-fun m!1337419 () Bool)

(assert (=> b!1448457 m!1337419))

(assert (=> b!1448457 m!1337401))

(assert (=> b!1448454 m!1337401))

(assert (=> b!1448454 m!1337401))

(declare-fun m!1337421 () Bool)

(assert (=> b!1448454 m!1337421))

(assert (=> b!1448458 m!1337401))

(assert (=> b!1448458 m!1337401))

(declare-fun m!1337423 () Bool)

(assert (=> b!1448458 m!1337423))

(declare-fun m!1337425 () Bool)

(assert (=> b!1448452 m!1337425))

(declare-fun m!1337427 () Bool)

(assert (=> b!1448453 m!1337427))

(assert (=> b!1448461 m!1337415))

(assert (=> b!1448461 m!1337393))

(assert (=> b!1448461 m!1337413))

(assert (=> b!1448461 m!1337401))

(assert (=> b!1448444 m!1337401))

(assert (=> b!1448444 m!1337401))

(declare-fun m!1337429 () Bool)

(assert (=> b!1448444 m!1337429))

(assert (=> b!1448459 m!1337393))

(declare-fun m!1337431 () Bool)

(assert (=> b!1448459 m!1337431))

(assert (=> b!1448451 m!1337401))

(assert (=> b!1448451 m!1337401))

(declare-fun m!1337433 () Bool)

(assert (=> b!1448451 m!1337433))

(declare-fun m!1337435 () Bool)

(assert (=> b!1448450 m!1337435))

(assert (=> b!1448450 m!1337435))

(declare-fun m!1337437 () Bool)

(assert (=> b!1448450 m!1337437))

(declare-fun m!1337439 () Bool)

(assert (=> start!124986 m!1337439))

(declare-fun m!1337441 () Bool)

(assert (=> start!124986 m!1337441))

(check-sat (not b!1448458) (not b!1448452) (not b!1448450) (not b!1448457) (not b!1448460) (not b!1448454) (not b!1448449) (not b!1448451) (not start!124986) (not b!1448445) (not b!1448444) (not b!1448453) (not b!1448456))
(check-sat)
