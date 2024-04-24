; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125352 () Bool)

(assert start!125352)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98695 0))(
  ( (array!98696 (arr!47632 (Array (_ BitVec 32) (_ BitVec 64))) (size!48183 (_ BitVec 32))) )
))
(declare-fun lt!639384 () array!98695)

(declare-fun b!1459393 () Bool)

(declare-fun e!821013 () Bool)

(declare-datatypes ((SeekEntryResult!11781 0))(
  ( (MissingZero!11781 (index!49516 (_ BitVec 32))) (Found!11781 (index!49517 (_ BitVec 32))) (Intermediate!11781 (undefined!12593 Bool) (index!49518 (_ BitVec 32)) (x!131310 (_ BitVec 32))) (Undefined!11781) (MissingVacant!11781 (index!49519 (_ BitVec 32))) )
))
(declare-fun lt!639391 () SeekEntryResult!11781)

(declare-fun lt!639390 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639385 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98695 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1459393 (= e!821013 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639390 intermediateAfterIndex!19 lt!639385 lt!639384 mask!2687) lt!639391)))))

(declare-fun b!1459394 () Bool)

(declare-fun res!988762 () Bool)

(declare-fun e!821012 () Bool)

(assert (=> b!1459394 (=> (not res!988762) (not e!821012))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun a!2862 () array!98695)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!639386 () SeekEntryResult!11781)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98695 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1459394 (= res!988762 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!639386))))

(declare-fun b!1459395 () Bool)

(declare-fun e!821011 () Bool)

(declare-fun e!821014 () Bool)

(assert (=> b!1459395 (= e!821011 e!821014)))

(declare-fun res!988768 () Bool)

(assert (=> b!1459395 (=> (not res!988768) (not e!821014))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459395 (= res!988768 (= (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459395 (= lt!639384 (array!98696 (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48183 a!2862)))))

(declare-fun e!821018 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1459396 () Bool)

(assert (=> b!1459396 (= e!821018 (and (or (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) (select (arr!47632 a!2862) j!93))) (let ((bdg!53396 (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47632 a!2862) index!646) bdg!53396) (= (select (arr!47632 a!2862) index!646) (select (arr!47632 a!2862) j!93))) (= (select (arr!47632 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53396 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1459397 () Bool)

(declare-fun e!821016 () Bool)

(assert (=> b!1459397 (= e!821012 e!821016)))

(declare-fun res!988764 () Bool)

(assert (=> b!1459397 (=> (not res!988764) (not e!821016))))

(declare-fun lt!639388 () SeekEntryResult!11781)

(assert (=> b!1459397 (= res!988764 (= lt!639388 (Intermediate!11781 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459397 (= lt!639388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639385 mask!2687) lt!639385 lt!639384 mask!2687))))

(assert (=> b!1459397 (= lt!639385 (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459398 () Bool)

(declare-fun e!821019 () Bool)

(assert (=> b!1459398 (= e!821019 (= lt!639388 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639385 lt!639384 mask!2687)))))

(declare-fun b!1459399 () Bool)

(declare-fun e!821017 () Bool)

(assert (=> b!1459399 (= e!821016 (not e!821017))))

(declare-fun res!988755 () Bool)

(assert (=> b!1459399 (=> res!988755 e!821017)))

(assert (=> b!1459399 (= res!988755 (or (and (= (select (arr!47632 a!2862) index!646) (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47632 a!2862) index!646) (select (arr!47632 a!2862) j!93))) (= (select (arr!47632 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459399 e!821018))

(declare-fun res!988770 () Bool)

(assert (=> b!1459399 (=> (not res!988770) (not e!821018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98695 (_ BitVec 32)) Bool)

(assert (=> b!1459399 (= res!988770 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49091 0))(
  ( (Unit!49092) )
))
(declare-fun lt!639389 () Unit!49091)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49091)

(assert (=> b!1459399 (= lt!639389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459400 () Bool)

(declare-fun res!988766 () Bool)

(assert (=> b!1459400 (=> (not res!988766) (not e!821011))))

(assert (=> b!1459400 (= res!988766 (and (= (size!48183 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48183 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48183 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459401 () Bool)

(declare-fun res!988763 () Bool)

(assert (=> b!1459401 (=> (not res!988763) (not e!821011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459401 (= res!988763 (validKeyInArray!0 (select (arr!47632 a!2862) i!1006)))))

(declare-fun b!1459402 () Bool)

(declare-fun res!988761 () Bool)

(assert (=> b!1459402 (=> (not res!988761) (not e!821016))))

(assert (=> b!1459402 (= res!988761 e!821019)))

(declare-fun c!134839 () Bool)

(assert (=> b!1459402 (= c!134839 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!988765 () Bool)

(assert (=> start!125352 (=> (not res!988765) (not e!821011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125352 (= res!988765 (validMask!0 mask!2687))))

(assert (=> start!125352 e!821011))

(assert (=> start!125352 true))

(declare-fun array_inv!36913 (array!98695) Bool)

(assert (=> start!125352 (array_inv!36913 a!2862)))

(declare-fun b!1459403 () Bool)

(assert (=> b!1459403 (= e!821014 e!821012)))

(declare-fun res!988760 () Bool)

(assert (=> b!1459403 (=> (not res!988760) (not e!821012))))

(assert (=> b!1459403 (= res!988760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47632 a!2862) j!93) mask!2687) (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!639386))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459403 (= lt!639386 (Intermediate!11781 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459404 () Bool)

(declare-fun res!988767 () Bool)

(assert (=> b!1459404 (=> (not res!988767) (not e!821018))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98695 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1459404 (= res!988767 (= (seekEntryOrOpen!0 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) (Found!11781 j!93)))))

(declare-fun b!1459405 () Bool)

(declare-fun res!988758 () Bool)

(assert (=> b!1459405 (=> (not res!988758) (not e!821011))))

(assert (=> b!1459405 (= res!988758 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48183 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48183 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48183 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459406 () Bool)

(declare-fun res!988756 () Bool)

(assert (=> b!1459406 (=> (not res!988756) (not e!821011))))

(assert (=> b!1459406 (= res!988756 (validKeyInArray!0 (select (arr!47632 a!2862) j!93)))))

(declare-fun b!1459407 () Bool)

(assert (=> b!1459407 (= e!821019 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639385 lt!639384 mask!2687) (seekEntryOrOpen!0 lt!639385 lt!639384 mask!2687)))))

(declare-fun b!1459408 () Bool)

(declare-fun res!988759 () Bool)

(assert (=> b!1459408 (=> (not res!988759) (not e!821016))))

(assert (=> b!1459408 (= res!988759 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459409 () Bool)

(declare-fun res!988757 () Bool)

(assert (=> b!1459409 (=> (not res!988757) (not e!821011))))

(declare-datatypes ((List!34120 0))(
  ( (Nil!34117) (Cons!34116 (h!35477 (_ BitVec 64)) (t!48806 List!34120)) )
))
(declare-fun arrayNoDuplicates!0 (array!98695 (_ BitVec 32) List!34120) Bool)

(assert (=> b!1459409 (= res!988757 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34117))))

(declare-fun b!1459410 () Bool)

(declare-fun res!988772 () Bool)

(declare-fun e!821015 () Bool)

(assert (=> b!1459410 (=> res!988772 e!821015)))

(assert (=> b!1459410 (= res!988772 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639390 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!639386)))))

(declare-fun b!1459411 () Bool)

(assert (=> b!1459411 (= e!821013 (not (= lt!639388 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639390 lt!639385 lt!639384 mask!2687))))))

(declare-fun b!1459412 () Bool)

(declare-fun res!988769 () Bool)

(assert (=> b!1459412 (=> (not res!988769) (not e!821011))))

(assert (=> b!1459412 (= res!988769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459413 () Bool)

(assert (=> b!1459413 (= e!821015 true)))

(declare-fun lt!639387 () Bool)

(assert (=> b!1459413 (= lt!639387 e!821013)))

(declare-fun c!134838 () Bool)

(assert (=> b!1459413 (= c!134838 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459414 () Bool)

(assert (=> b!1459414 (= e!821017 e!821015)))

(declare-fun res!988771 () Bool)

(assert (=> b!1459414 (=> res!988771 e!821015)))

(assert (=> b!1459414 (= res!988771 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639390 #b00000000000000000000000000000000) (bvsge lt!639390 (size!48183 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459414 (= lt!639390 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1459414 (= lt!639391 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639385 lt!639384 mask!2687))))

(assert (=> b!1459414 (= lt!639391 (seekEntryOrOpen!0 lt!639385 lt!639384 mask!2687))))

(assert (= (and start!125352 res!988765) b!1459400))

(assert (= (and b!1459400 res!988766) b!1459401))

(assert (= (and b!1459401 res!988763) b!1459406))

(assert (= (and b!1459406 res!988756) b!1459412))

(assert (= (and b!1459412 res!988769) b!1459409))

(assert (= (and b!1459409 res!988757) b!1459405))

(assert (= (and b!1459405 res!988758) b!1459395))

(assert (= (and b!1459395 res!988768) b!1459403))

(assert (= (and b!1459403 res!988760) b!1459394))

(assert (= (and b!1459394 res!988762) b!1459397))

(assert (= (and b!1459397 res!988764) b!1459402))

(assert (= (and b!1459402 c!134839) b!1459398))

(assert (= (and b!1459402 (not c!134839)) b!1459407))

(assert (= (and b!1459402 res!988761) b!1459408))

(assert (= (and b!1459408 res!988759) b!1459399))

(assert (= (and b!1459399 res!988770) b!1459404))

(assert (= (and b!1459404 res!988767) b!1459396))

(assert (= (and b!1459399 (not res!988755)) b!1459414))

(assert (= (and b!1459414 (not res!988771)) b!1459410))

(assert (= (and b!1459410 (not res!988772)) b!1459413))

(assert (= (and b!1459413 c!134838) b!1459411))

(assert (= (and b!1459413 (not c!134838)) b!1459393))

(declare-fun m!1347409 () Bool)

(assert (=> b!1459407 m!1347409))

(declare-fun m!1347411 () Bool)

(assert (=> b!1459407 m!1347411))

(declare-fun m!1347413 () Bool)

(assert (=> b!1459410 m!1347413))

(assert (=> b!1459410 m!1347413))

(declare-fun m!1347415 () Bool)

(assert (=> b!1459410 m!1347415))

(declare-fun m!1347417 () Bool)

(assert (=> b!1459399 m!1347417))

(declare-fun m!1347419 () Bool)

(assert (=> b!1459399 m!1347419))

(declare-fun m!1347421 () Bool)

(assert (=> b!1459399 m!1347421))

(declare-fun m!1347423 () Bool)

(assert (=> b!1459399 m!1347423))

(declare-fun m!1347425 () Bool)

(assert (=> b!1459399 m!1347425))

(assert (=> b!1459399 m!1347413))

(declare-fun m!1347427 () Bool)

(assert (=> start!125352 m!1347427))

(declare-fun m!1347429 () Bool)

(assert (=> start!125352 m!1347429))

(assert (=> b!1459395 m!1347419))

(declare-fun m!1347431 () Bool)

(assert (=> b!1459395 m!1347431))

(declare-fun m!1347433 () Bool)

(assert (=> b!1459414 m!1347433))

(assert (=> b!1459414 m!1347409))

(assert (=> b!1459414 m!1347411))

(assert (=> b!1459403 m!1347413))

(assert (=> b!1459403 m!1347413))

(declare-fun m!1347435 () Bool)

(assert (=> b!1459403 m!1347435))

(assert (=> b!1459403 m!1347435))

(assert (=> b!1459403 m!1347413))

(declare-fun m!1347437 () Bool)

(assert (=> b!1459403 m!1347437))

(assert (=> b!1459396 m!1347419))

(declare-fun m!1347439 () Bool)

(assert (=> b!1459396 m!1347439))

(assert (=> b!1459396 m!1347421))

(assert (=> b!1459396 m!1347423))

(assert (=> b!1459396 m!1347413))

(declare-fun m!1347441 () Bool)

(assert (=> b!1459398 m!1347441))

(declare-fun m!1347443 () Bool)

(assert (=> b!1459412 m!1347443))

(assert (=> b!1459404 m!1347413))

(assert (=> b!1459404 m!1347413))

(declare-fun m!1347445 () Bool)

(assert (=> b!1459404 m!1347445))

(declare-fun m!1347447 () Bool)

(assert (=> b!1459409 m!1347447))

(declare-fun m!1347449 () Bool)

(assert (=> b!1459393 m!1347449))

(assert (=> b!1459394 m!1347413))

(assert (=> b!1459394 m!1347413))

(declare-fun m!1347451 () Bool)

(assert (=> b!1459394 m!1347451))

(declare-fun m!1347453 () Bool)

(assert (=> b!1459411 m!1347453))

(assert (=> b!1459406 m!1347413))

(assert (=> b!1459406 m!1347413))

(declare-fun m!1347455 () Bool)

(assert (=> b!1459406 m!1347455))

(declare-fun m!1347457 () Bool)

(assert (=> b!1459397 m!1347457))

(assert (=> b!1459397 m!1347457))

(declare-fun m!1347459 () Bool)

(assert (=> b!1459397 m!1347459))

(assert (=> b!1459397 m!1347419))

(declare-fun m!1347461 () Bool)

(assert (=> b!1459397 m!1347461))

(declare-fun m!1347463 () Bool)

(assert (=> b!1459401 m!1347463))

(assert (=> b!1459401 m!1347463))

(declare-fun m!1347465 () Bool)

(assert (=> b!1459401 m!1347465))

(check-sat (not start!125352) (not b!1459397) (not b!1459401) (not b!1459414) (not b!1459393) (not b!1459399) (not b!1459404) (not b!1459410) (not b!1459411) (not b!1459398) (not b!1459403) (not b!1459407) (not b!1459412) (not b!1459406) (not b!1459394) (not b!1459409))
(check-sat)
