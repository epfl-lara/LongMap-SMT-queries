; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126204 () Bool)

(assert start!126204)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1478488 () Bool)

(declare-fun e!829370 () Bool)

(assert (=> b!1478488 (= e!829370 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478489 () Bool)

(declare-fun e!829371 () Bool)

(declare-fun e!829376 () Bool)

(assert (=> b!1478489 (= e!829371 e!829376)))

(declare-fun res!1004505 () Bool)

(assert (=> b!1478489 (=> (not res!1004505) (not e!829376))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12174 0))(
  ( (MissingZero!12174 (index!51088 (_ BitVec 32))) (Found!12174 (index!51089 (_ BitVec 32))) (Intermediate!12174 (undefined!12986 Bool) (index!51090 (_ BitVec 32)) (x!132677 (_ BitVec 32))) (Undefined!12174) (MissingVacant!12174 (index!51091 (_ BitVec 32))) )
))
(declare-fun lt!645699 () SeekEntryResult!12174)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478489 (= res!1004505 (= lt!645699 (Intermediate!12174 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645701 () (_ BitVec 64))

(declare-datatypes ((array!99310 0))(
  ( (array!99311 (arr!47934 (Array (_ BitVec 32) (_ BitVec 64))) (size!48484 (_ BitVec 32))) )
))
(declare-fun lt!645702 () array!99310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478489 (= lt!645699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645701 mask!2687) lt!645701 lt!645702 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99310)

(assert (=> b!1478489 (= lt!645701 (select (store (arr!47934 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478490 () Bool)

(declare-fun res!1004512 () Bool)

(declare-fun e!829373 () Bool)

(assert (=> b!1478490 (=> (not res!1004512) (not e!829373))))

(assert (=> b!1478490 (= res!1004512 (and (= (size!48484 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48484 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48484 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478491 () Bool)

(declare-fun e!829375 () Bool)

(assert (=> b!1478491 (= e!829373 e!829375)))

(declare-fun res!1004511 () Bool)

(assert (=> b!1478491 (=> (not res!1004511) (not e!829375))))

(assert (=> b!1478491 (= res!1004511 (= (select (store (arr!47934 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478491 (= lt!645702 (array!99311 (store (arr!47934 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48484 a!2862)))))

(declare-fun b!1478492 () Bool)

(assert (=> b!1478492 (= e!829376 (not true))))

(declare-fun e!829372 () Bool)

(assert (=> b!1478492 e!829372))

(declare-fun res!1004504 () Bool)

(assert (=> b!1478492 (=> (not res!1004504) (not e!829372))))

(declare-fun lt!645698 () SeekEntryResult!12174)

(assert (=> b!1478492 (= res!1004504 (and (= lt!645698 (Found!12174 j!93)) (or (= (select (arr!47934 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47934 a!2862) intermediateBeforeIndex!19) (select (arr!47934 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12174)

(assert (=> b!1478492 (= lt!645698 (seekEntryOrOpen!0 (select (arr!47934 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99310 (_ BitVec 32)) Bool)

(assert (=> b!1478492 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49688 0))(
  ( (Unit!49689) )
))
(declare-fun lt!645700 () Unit!49688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49688)

(assert (=> b!1478492 (= lt!645700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478493 () Bool)

(declare-fun res!1004502 () Bool)

(assert (=> b!1478493 (=> (not res!1004502) (not e!829373))))

(assert (=> b!1478493 (= res!1004502 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48484 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48484 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48484 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478494 () Bool)

(declare-fun e!829368 () Bool)

(assert (=> b!1478494 (= e!829368 (= lt!645699 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645701 lt!645702 mask!2687)))))

(declare-fun b!1478495 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12174)

(assert (=> b!1478495 (= e!829368 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645701 lt!645702 mask!2687) (seekEntryOrOpen!0 lt!645701 lt!645702 mask!2687)))))

(declare-fun res!1004510 () Bool)

(assert (=> start!126204 (=> (not res!1004510) (not e!829373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126204 (= res!1004510 (validMask!0 mask!2687))))

(assert (=> start!126204 e!829373))

(assert (=> start!126204 true))

(declare-fun array_inv!36962 (array!99310) Bool)

(assert (=> start!126204 (array_inv!36962 a!2862)))

(declare-fun b!1478496 () Bool)

(assert (=> b!1478496 (= e!829375 e!829371)))

(declare-fun res!1004500 () Bool)

(assert (=> b!1478496 (=> (not res!1004500) (not e!829371))))

(declare-fun lt!645697 () SeekEntryResult!12174)

(assert (=> b!1478496 (= res!1004500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47934 a!2862) j!93) mask!2687) (select (arr!47934 a!2862) j!93) a!2862 mask!2687) lt!645697))))

(assert (=> b!1478496 (= lt!645697 (Intermediate!12174 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478497 () Bool)

(declare-fun res!1004501 () Bool)

(assert (=> b!1478497 (=> (not res!1004501) (not e!829373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478497 (= res!1004501 (validKeyInArray!0 (select (arr!47934 a!2862) i!1006)))))

(declare-fun b!1478498 () Bool)

(declare-fun res!1004509 () Bool)

(assert (=> b!1478498 (=> (not res!1004509) (not e!829371))))

(assert (=> b!1478498 (= res!1004509 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47934 a!2862) j!93) a!2862 mask!2687) lt!645697))))

(declare-fun b!1478499 () Bool)

(declare-fun e!829374 () Bool)

(assert (=> b!1478499 (= e!829372 e!829374)))

(declare-fun res!1004503 () Bool)

(assert (=> b!1478499 (=> res!1004503 e!829374)))

(assert (=> b!1478499 (= res!1004503 (or (and (= (select (arr!47934 a!2862) index!646) (select (store (arr!47934 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47934 a!2862) index!646) (select (arr!47934 a!2862) j!93))) (not (= (select (arr!47934 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478500 () Bool)

(declare-fun res!1004506 () Bool)

(assert (=> b!1478500 (=> (not res!1004506) (not e!829373))))

(declare-datatypes ((List!34435 0))(
  ( (Nil!34432) (Cons!34431 (h!35799 (_ BitVec 64)) (t!49129 List!34435)) )
))
(declare-fun arrayNoDuplicates!0 (array!99310 (_ BitVec 32) List!34435) Bool)

(assert (=> b!1478500 (= res!1004506 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34432))))

(declare-fun b!1478501 () Bool)

(declare-fun res!1004507 () Bool)

(assert (=> b!1478501 (=> (not res!1004507) (not e!829376))))

(assert (=> b!1478501 (= res!1004507 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478502 () Bool)

(declare-fun res!1004497 () Bool)

(assert (=> b!1478502 (=> (not res!1004497) (not e!829373))))

(assert (=> b!1478502 (= res!1004497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478503 () Bool)

(declare-fun res!1004499 () Bool)

(assert (=> b!1478503 (=> (not res!1004499) (not e!829376))))

(assert (=> b!1478503 (= res!1004499 e!829368)))

(declare-fun c!136515 () Bool)

(assert (=> b!1478503 (= c!136515 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478504 () Bool)

(assert (=> b!1478504 (= e!829374 e!829370)))

(declare-fun res!1004498 () Bool)

(assert (=> b!1478504 (=> (not res!1004498) (not e!829370))))

(assert (=> b!1478504 (= res!1004498 (= lt!645698 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47934 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478505 () Bool)

(declare-fun res!1004508 () Bool)

(assert (=> b!1478505 (=> (not res!1004508) (not e!829373))))

(assert (=> b!1478505 (= res!1004508 (validKeyInArray!0 (select (arr!47934 a!2862) j!93)))))

(assert (= (and start!126204 res!1004510) b!1478490))

(assert (= (and b!1478490 res!1004512) b!1478497))

(assert (= (and b!1478497 res!1004501) b!1478505))

(assert (= (and b!1478505 res!1004508) b!1478502))

(assert (= (and b!1478502 res!1004497) b!1478500))

(assert (= (and b!1478500 res!1004506) b!1478493))

(assert (= (and b!1478493 res!1004502) b!1478491))

(assert (= (and b!1478491 res!1004511) b!1478496))

(assert (= (and b!1478496 res!1004500) b!1478498))

(assert (= (and b!1478498 res!1004509) b!1478489))

(assert (= (and b!1478489 res!1004505) b!1478503))

(assert (= (and b!1478503 c!136515) b!1478494))

(assert (= (and b!1478503 (not c!136515)) b!1478495))

(assert (= (and b!1478503 res!1004499) b!1478501))

(assert (= (and b!1478501 res!1004507) b!1478492))

(assert (= (and b!1478492 res!1004504) b!1478499))

(assert (= (and b!1478499 (not res!1004503)) b!1478504))

(assert (= (and b!1478504 res!1004498) b!1478488))

(declare-fun m!1364399 () Bool)

(assert (=> start!126204 m!1364399))

(declare-fun m!1364401 () Bool)

(assert (=> start!126204 m!1364401))

(declare-fun m!1364403 () Bool)

(assert (=> b!1478498 m!1364403))

(assert (=> b!1478498 m!1364403))

(declare-fun m!1364405 () Bool)

(assert (=> b!1478498 m!1364405))

(assert (=> b!1478504 m!1364403))

(assert (=> b!1478504 m!1364403))

(declare-fun m!1364407 () Bool)

(assert (=> b!1478504 m!1364407))

(declare-fun m!1364409 () Bool)

(assert (=> b!1478499 m!1364409))

(declare-fun m!1364411 () Bool)

(assert (=> b!1478499 m!1364411))

(declare-fun m!1364413 () Bool)

(assert (=> b!1478499 m!1364413))

(assert (=> b!1478499 m!1364403))

(declare-fun m!1364415 () Bool)

(assert (=> b!1478492 m!1364415))

(declare-fun m!1364417 () Bool)

(assert (=> b!1478492 m!1364417))

(assert (=> b!1478492 m!1364403))

(declare-fun m!1364419 () Bool)

(assert (=> b!1478492 m!1364419))

(declare-fun m!1364421 () Bool)

(assert (=> b!1478492 m!1364421))

(assert (=> b!1478492 m!1364403))

(declare-fun m!1364423 () Bool)

(assert (=> b!1478497 m!1364423))

(assert (=> b!1478497 m!1364423))

(declare-fun m!1364425 () Bool)

(assert (=> b!1478497 m!1364425))

(assert (=> b!1478491 m!1364411))

(declare-fun m!1364427 () Bool)

(assert (=> b!1478491 m!1364427))

(declare-fun m!1364429 () Bool)

(assert (=> b!1478495 m!1364429))

(declare-fun m!1364431 () Bool)

(assert (=> b!1478495 m!1364431))

(declare-fun m!1364433 () Bool)

(assert (=> b!1478500 m!1364433))

(declare-fun m!1364435 () Bool)

(assert (=> b!1478502 m!1364435))

(assert (=> b!1478496 m!1364403))

(assert (=> b!1478496 m!1364403))

(declare-fun m!1364437 () Bool)

(assert (=> b!1478496 m!1364437))

(assert (=> b!1478496 m!1364437))

(assert (=> b!1478496 m!1364403))

(declare-fun m!1364439 () Bool)

(assert (=> b!1478496 m!1364439))

(declare-fun m!1364441 () Bool)

(assert (=> b!1478489 m!1364441))

(assert (=> b!1478489 m!1364441))

(declare-fun m!1364443 () Bool)

(assert (=> b!1478489 m!1364443))

(assert (=> b!1478489 m!1364411))

(declare-fun m!1364445 () Bool)

(assert (=> b!1478489 m!1364445))

(declare-fun m!1364447 () Bool)

(assert (=> b!1478494 m!1364447))

(assert (=> b!1478505 m!1364403))

(assert (=> b!1478505 m!1364403))

(declare-fun m!1364449 () Bool)

(assert (=> b!1478505 m!1364449))

(check-sat (not b!1478492) (not start!126204) (not b!1478495) (not b!1478505) (not b!1478497) (not b!1478504) (not b!1478489) (not b!1478500) (not b!1478502) (not b!1478494) (not b!1478496) (not b!1478498))
