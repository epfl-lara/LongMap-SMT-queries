; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125182 () Bool)

(assert start!125182)

(declare-fun b!1459650 () Bool)

(declare-fun res!989553 () Bool)

(declare-fun e!820847 () Bool)

(assert (=> b!1459650 (=> res!989553 e!820847)))

(declare-datatypes ((SeekEntryResult!11855 0))(
  ( (MissingZero!11855 (index!49812 (_ BitVec 32))) (Found!11855 (index!49813 (_ BitVec 32))) (Intermediate!11855 (undefined!12667 Bool) (index!49814 (_ BitVec 32)) (x!131424 (_ BitVec 32))) (Undefined!11855) (MissingVacant!11855 (index!49815 (_ BitVec 32))) )
))
(declare-fun lt!639537 () SeekEntryResult!11855)

(declare-datatypes ((array!98630 0))(
  ( (array!98631 (arr!47603 (Array (_ BitVec 32) (_ BitVec 64))) (size!48153 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98630)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!639536 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98630 (_ BitVec 32)) SeekEntryResult!11855)

(assert (=> b!1459650 (= res!989553 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639536 (select (arr!47603 a!2862) j!93) a!2862 mask!2687) lt!639537)))))

(declare-fun b!1459651 () Bool)

(declare-fun e!820852 () Bool)

(declare-fun e!820849 () Bool)

(assert (=> b!1459651 (= e!820852 e!820849)))

(declare-fun res!989551 () Bool)

(assert (=> b!1459651 (=> (not res!989551) (not e!820849))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459651 (= res!989551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47603 a!2862) j!93) mask!2687) (select (arr!47603 a!2862) j!93) a!2862 mask!2687) lt!639537))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459651 (= lt!639537 (Intermediate!11855 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459652 () Bool)

(declare-fun res!989561 () Bool)

(declare-fun e!820846 () Bool)

(assert (=> b!1459652 (=> (not res!989561) (not e!820846))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459652 (= res!989561 (validKeyInArray!0 (select (arr!47603 a!2862) i!1006)))))

(declare-fun b!1459653 () Bool)

(declare-fun e!820850 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639535 () (_ BitVec 64))

(declare-fun lt!639534 () array!98630)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98630 (_ BitVec 32)) SeekEntryResult!11855)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98630 (_ BitVec 32)) SeekEntryResult!11855)

(assert (=> b!1459653 (= e!820850 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639535 lt!639534 mask!2687) (seekEntryOrOpen!0 lt!639535 lt!639534 mask!2687)))))

(declare-fun b!1459654 () Bool)

(declare-fun e!820853 () Bool)

(declare-fun e!820845 () Bool)

(assert (=> b!1459654 (= e!820853 (not e!820845))))

(declare-fun res!989552 () Bool)

(assert (=> b!1459654 (=> res!989552 e!820845)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459654 (= res!989552 (or (and (= (select (arr!47603 a!2862) index!646) (select (store (arr!47603 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47603 a!2862) index!646) (select (arr!47603 a!2862) j!93))) (= (select (arr!47603 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639532 () SeekEntryResult!11855)

(assert (=> b!1459654 (and (= lt!639532 (Found!11855 j!93)) (or (= (select (arr!47603 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47603 a!2862) intermediateBeforeIndex!19) (select (arr!47603 a!2862) j!93))) (let ((bdg!53529 (select (store (arr!47603 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47603 a!2862) index!646) bdg!53529) (= (select (arr!47603 a!2862) index!646) (select (arr!47603 a!2862) j!93))) (= (select (arr!47603 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53529 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459654 (= lt!639532 (seekEntryOrOpen!0 (select (arr!47603 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98630 (_ BitVec 32)) Bool)

(assert (=> b!1459654 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49206 0))(
  ( (Unit!49207) )
))
(declare-fun lt!639530 () Unit!49206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49206)

(assert (=> b!1459654 (= lt!639530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459655 () Bool)

(declare-fun res!989565 () Bool)

(assert (=> b!1459655 (=> (not res!989565) (not e!820846))))

(assert (=> b!1459655 (= res!989565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459656 () Bool)

(declare-fun e!820848 () Bool)

(declare-fun lt!639529 () SeekEntryResult!11855)

(assert (=> b!1459656 (= e!820848 (not (= lt!639529 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639536 lt!639535 lt!639534 mask!2687))))))

(declare-fun b!1459657 () Bool)

(assert (=> b!1459657 (= e!820846 e!820852)))

(declare-fun res!989556 () Bool)

(assert (=> b!1459657 (=> (not res!989556) (not e!820852))))

(assert (=> b!1459657 (= res!989556 (= (select (store (arr!47603 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459657 (= lt!639534 (array!98631 (store (arr!47603 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48153 a!2862)))))

(declare-fun b!1459658 () Bool)

(assert (=> b!1459658 (= e!820847 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!639531 () SeekEntryResult!11855)

(assert (=> b!1459658 (= lt!639532 lt!639531)))

(declare-fun lt!639533 () Unit!49206)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49206)

(assert (=> b!1459658 (= lt!639533 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639536 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun res!989554 () Bool)

(assert (=> start!125182 (=> (not res!989554) (not e!820846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125182 (= res!989554 (validMask!0 mask!2687))))

(assert (=> start!125182 e!820846))

(assert (=> start!125182 true))

(declare-fun array_inv!36631 (array!98630) Bool)

(assert (=> start!125182 (array_inv!36631 a!2862)))

(declare-fun b!1459659 () Bool)

(declare-fun res!989559 () Bool)

(assert (=> b!1459659 (=> (not res!989559) (not e!820853))))

(assert (=> b!1459659 (= res!989559 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459660 () Bool)

(assert (=> b!1459660 (= e!820848 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639536 intermediateAfterIndex!19 lt!639535 lt!639534 mask!2687) lt!639531)))))

(declare-fun b!1459661 () Bool)

(declare-fun res!989558 () Bool)

(assert (=> b!1459661 (=> res!989558 e!820847)))

(assert (=> b!1459661 (= res!989558 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459662 () Bool)

(assert (=> b!1459662 (= e!820850 (= lt!639529 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639535 lt!639534 mask!2687)))))

(declare-fun b!1459663 () Bool)

(declare-fun res!989555 () Bool)

(assert (=> b!1459663 (=> (not res!989555) (not e!820846))))

(assert (=> b!1459663 (= res!989555 (validKeyInArray!0 (select (arr!47603 a!2862) j!93)))))

(declare-fun b!1459664 () Bool)

(assert (=> b!1459664 (= e!820845 e!820847)))

(declare-fun res!989557 () Bool)

(assert (=> b!1459664 (=> res!989557 e!820847)))

(assert (=> b!1459664 (= res!989557 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639536 #b00000000000000000000000000000000) (bvsge lt!639536 (size!48153 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459664 (= lt!639536 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459664 (= lt!639531 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639535 lt!639534 mask!2687))))

(assert (=> b!1459664 (= lt!639531 (seekEntryOrOpen!0 lt!639535 lt!639534 mask!2687))))

(declare-fun b!1459665 () Bool)

(declare-fun res!989550 () Bool)

(assert (=> b!1459665 (=> (not res!989550) (not e!820846))))

(assert (=> b!1459665 (= res!989550 (and (= (size!48153 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48153 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48153 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459666 () Bool)

(assert (=> b!1459666 (= e!820849 e!820853)))

(declare-fun res!989560 () Bool)

(assert (=> b!1459666 (=> (not res!989560) (not e!820853))))

(assert (=> b!1459666 (= res!989560 (= lt!639529 (Intermediate!11855 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459666 (= lt!639529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639535 mask!2687) lt!639535 lt!639534 mask!2687))))

(assert (=> b!1459666 (= lt!639535 (select (store (arr!47603 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459667 () Bool)

(declare-fun res!989562 () Bool)

(assert (=> b!1459667 (=> (not res!989562) (not e!820846))))

(assert (=> b!1459667 (= res!989562 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48153 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48153 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48153 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459668 () Bool)

(declare-fun res!989563 () Bool)

(assert (=> b!1459668 (=> (not res!989563) (not e!820853))))

(assert (=> b!1459668 (= res!989563 e!820850)))

(declare-fun c!134561 () Bool)

(assert (=> b!1459668 (= c!134561 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459669 () Bool)

(declare-fun res!989566 () Bool)

(assert (=> b!1459669 (=> (not res!989566) (not e!820846))))

(declare-datatypes ((List!34104 0))(
  ( (Nil!34101) (Cons!34100 (h!35450 (_ BitVec 64)) (t!48798 List!34104)) )
))
(declare-fun arrayNoDuplicates!0 (array!98630 (_ BitVec 32) List!34104) Bool)

(assert (=> b!1459669 (= res!989566 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34101))))

(declare-fun b!1459670 () Bool)

(declare-fun res!989564 () Bool)

(assert (=> b!1459670 (=> res!989564 e!820847)))

(assert (=> b!1459670 (= res!989564 e!820848)))

(declare-fun c!134562 () Bool)

(assert (=> b!1459670 (= c!134562 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459671 () Bool)

(declare-fun res!989549 () Bool)

(assert (=> b!1459671 (=> (not res!989549) (not e!820849))))

(assert (=> b!1459671 (= res!989549 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47603 a!2862) j!93) a!2862 mask!2687) lt!639537))))

(assert (= (and start!125182 res!989554) b!1459665))

(assert (= (and b!1459665 res!989550) b!1459652))

(assert (= (and b!1459652 res!989561) b!1459663))

(assert (= (and b!1459663 res!989555) b!1459655))

(assert (= (and b!1459655 res!989565) b!1459669))

(assert (= (and b!1459669 res!989566) b!1459667))

(assert (= (and b!1459667 res!989562) b!1459657))

(assert (= (and b!1459657 res!989556) b!1459651))

(assert (= (and b!1459651 res!989551) b!1459671))

(assert (= (and b!1459671 res!989549) b!1459666))

(assert (= (and b!1459666 res!989560) b!1459668))

(assert (= (and b!1459668 c!134561) b!1459662))

(assert (= (and b!1459668 (not c!134561)) b!1459653))

(assert (= (and b!1459668 res!989563) b!1459659))

(assert (= (and b!1459659 res!989559) b!1459654))

(assert (= (and b!1459654 (not res!989552)) b!1459664))

(assert (= (and b!1459664 (not res!989557)) b!1459650))

(assert (= (and b!1459650 (not res!989553)) b!1459670))

(assert (= (and b!1459670 c!134562) b!1459656))

(assert (= (and b!1459670 (not c!134562)) b!1459660))

(assert (= (and b!1459670 (not res!989564)) b!1459661))

(assert (= (and b!1459661 (not res!989558)) b!1459658))

(declare-fun m!1347391 () Bool)

(assert (=> start!125182 m!1347391))

(declare-fun m!1347393 () Bool)

(assert (=> start!125182 m!1347393))

(declare-fun m!1347395 () Bool)

(assert (=> b!1459657 m!1347395))

(declare-fun m!1347397 () Bool)

(assert (=> b!1459657 m!1347397))

(declare-fun m!1347399 () Bool)

(assert (=> b!1459653 m!1347399))

(declare-fun m!1347401 () Bool)

(assert (=> b!1459653 m!1347401))

(declare-fun m!1347403 () Bool)

(assert (=> b!1459654 m!1347403))

(assert (=> b!1459654 m!1347395))

(declare-fun m!1347405 () Bool)

(assert (=> b!1459654 m!1347405))

(declare-fun m!1347407 () Bool)

(assert (=> b!1459654 m!1347407))

(declare-fun m!1347409 () Bool)

(assert (=> b!1459654 m!1347409))

(declare-fun m!1347411 () Bool)

(assert (=> b!1459654 m!1347411))

(declare-fun m!1347413 () Bool)

(assert (=> b!1459654 m!1347413))

(declare-fun m!1347415 () Bool)

(assert (=> b!1459654 m!1347415))

(assert (=> b!1459654 m!1347411))

(assert (=> b!1459651 m!1347411))

(assert (=> b!1459651 m!1347411))

(declare-fun m!1347417 () Bool)

(assert (=> b!1459651 m!1347417))

(assert (=> b!1459651 m!1347417))

(assert (=> b!1459651 m!1347411))

(declare-fun m!1347419 () Bool)

(assert (=> b!1459651 m!1347419))

(assert (=> b!1459671 m!1347411))

(assert (=> b!1459671 m!1347411))

(declare-fun m!1347421 () Bool)

(assert (=> b!1459671 m!1347421))

(declare-fun m!1347423 () Bool)

(assert (=> b!1459669 m!1347423))

(declare-fun m!1347425 () Bool)

(assert (=> b!1459660 m!1347425))

(declare-fun m!1347427 () Bool)

(assert (=> b!1459666 m!1347427))

(assert (=> b!1459666 m!1347427))

(declare-fun m!1347429 () Bool)

(assert (=> b!1459666 m!1347429))

(assert (=> b!1459666 m!1347395))

(declare-fun m!1347431 () Bool)

(assert (=> b!1459666 m!1347431))

(declare-fun m!1347433 () Bool)

(assert (=> b!1459664 m!1347433))

(assert (=> b!1459664 m!1347399))

(assert (=> b!1459664 m!1347401))

(declare-fun m!1347435 () Bool)

(assert (=> b!1459656 m!1347435))

(declare-fun m!1347437 () Bool)

(assert (=> b!1459652 m!1347437))

(assert (=> b!1459652 m!1347437))

(declare-fun m!1347439 () Bool)

(assert (=> b!1459652 m!1347439))

(declare-fun m!1347441 () Bool)

(assert (=> b!1459655 m!1347441))

(assert (=> b!1459650 m!1347411))

(assert (=> b!1459650 m!1347411))

(declare-fun m!1347443 () Bool)

(assert (=> b!1459650 m!1347443))

(declare-fun m!1347445 () Bool)

(assert (=> b!1459662 m!1347445))

(declare-fun m!1347447 () Bool)

(assert (=> b!1459658 m!1347447))

(assert (=> b!1459663 m!1347411))

(assert (=> b!1459663 m!1347411))

(declare-fun m!1347449 () Bool)

(assert (=> b!1459663 m!1347449))

(push 1)

