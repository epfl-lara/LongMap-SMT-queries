; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126210 () Bool)

(assert start!126210)

(declare-fun res!1004656 () Bool)

(declare-fun e!829449 () Bool)

(assert (=> start!126210 (=> (not res!1004656) (not e!829449))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126210 (= res!1004656 (validMask!0 mask!2687))))

(assert (=> start!126210 e!829449))

(assert (=> start!126210 true))

(declare-datatypes ((array!99316 0))(
  ( (array!99317 (arr!47937 (Array (_ BitVec 32) (_ BitVec 64))) (size!48487 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99316)

(declare-fun array_inv!36965 (array!99316) Bool)

(assert (=> start!126210 (array_inv!36965 a!2862)))

(declare-fun b!1478650 () Bool)

(declare-fun res!1004646 () Bool)

(assert (=> b!1478650 (=> (not res!1004646) (not e!829449))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478650 (= res!1004646 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48487 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48487 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48487 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478651 () Bool)

(declare-fun lt!645755 () array!99316)

(declare-fun e!829455 () Bool)

(declare-fun lt!645753 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12177 0))(
  ( (MissingZero!12177 (index!51100 (_ BitVec 32))) (Found!12177 (index!51101 (_ BitVec 32))) (Intermediate!12177 (undefined!12989 Bool) (index!51102 (_ BitVec 32)) (x!132688 (_ BitVec 32))) (Undefined!12177) (MissingVacant!12177 (index!51103 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99316 (_ BitVec 32)) SeekEntryResult!12177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99316 (_ BitVec 32)) SeekEntryResult!12177)

(assert (=> b!1478651 (= e!829455 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645753 lt!645755 mask!2687) (seekEntryOrOpen!0 lt!645753 lt!645755 mask!2687)))))

(declare-fun b!1478652 () Bool)

(declare-fun e!829454 () Bool)

(declare-fun e!829450 () Bool)

(assert (=> b!1478652 (= e!829454 e!829450)))

(declare-fun res!1004645 () Bool)

(assert (=> b!1478652 (=> (not res!1004645) (not e!829450))))

(declare-fun lt!645756 () SeekEntryResult!12177)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99316 (_ BitVec 32)) SeekEntryResult!12177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478652 (= res!1004645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47937 a!2862) j!93) mask!2687) (select (arr!47937 a!2862) j!93) a!2862 mask!2687) lt!645756))))

(assert (=> b!1478652 (= lt!645756 (Intermediate!12177 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478653 () Bool)

(declare-fun e!829452 () Bool)

(declare-fun e!829456 () Bool)

(assert (=> b!1478653 (= e!829452 e!829456)))

(declare-fun res!1004653 () Bool)

(assert (=> b!1478653 (=> (not res!1004653) (not e!829456))))

(declare-fun lt!645754 () SeekEntryResult!12177)

(assert (=> b!1478653 (= res!1004653 (= lt!645754 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47937 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478654 () Bool)

(declare-fun res!1004655 () Bool)

(assert (=> b!1478654 (=> (not res!1004655) (not e!829450))))

(assert (=> b!1478654 (= res!1004655 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47937 a!2862) j!93) a!2862 mask!2687) lt!645756))))

(declare-fun b!1478655 () Bool)

(declare-fun lt!645751 () SeekEntryResult!12177)

(assert (=> b!1478655 (= e!829455 (= lt!645751 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645753 lt!645755 mask!2687)))))

(declare-fun b!1478656 () Bool)

(declare-fun e!829457 () Bool)

(assert (=> b!1478656 (= e!829450 e!829457)))

(declare-fun res!1004643 () Bool)

(assert (=> b!1478656 (=> (not res!1004643) (not e!829457))))

(assert (=> b!1478656 (= res!1004643 (= lt!645751 (Intermediate!12177 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478656 (= lt!645751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645753 mask!2687) lt!645753 lt!645755 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478656 (= lt!645753 (select (store (arr!47937 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478657 () Bool)

(assert (=> b!1478657 (= e!829449 e!829454)))

(declare-fun res!1004642 () Bool)

(assert (=> b!1478657 (=> (not res!1004642) (not e!829454))))

(assert (=> b!1478657 (= res!1004642 (= (select (store (arr!47937 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478657 (= lt!645755 (array!99317 (store (arr!47937 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48487 a!2862)))))

(declare-fun b!1478658 () Bool)

(declare-fun res!1004649 () Bool)

(assert (=> b!1478658 (=> (not res!1004649) (not e!829449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478658 (= res!1004649 (validKeyInArray!0 (select (arr!47937 a!2862) j!93)))))

(declare-fun b!1478659 () Bool)

(declare-fun res!1004644 () Bool)

(assert (=> b!1478659 (=> (not res!1004644) (not e!829457))))

(assert (=> b!1478659 (= res!1004644 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478660 () Bool)

(assert (=> b!1478660 (= e!829456 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478661 () Bool)

(declare-fun res!1004650 () Bool)

(assert (=> b!1478661 (=> (not res!1004650) (not e!829449))))

(assert (=> b!1478661 (= res!1004650 (validKeyInArray!0 (select (arr!47937 a!2862) i!1006)))))

(declare-fun b!1478662 () Bool)

(declare-fun res!1004652 () Bool)

(assert (=> b!1478662 (=> (not res!1004652) (not e!829449))))

(declare-datatypes ((List!34438 0))(
  ( (Nil!34435) (Cons!34434 (h!35802 (_ BitVec 64)) (t!49132 List!34438)) )
))
(declare-fun arrayNoDuplicates!0 (array!99316 (_ BitVec 32) List!34438) Bool)

(assert (=> b!1478662 (= res!1004652 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34435))))

(declare-fun b!1478663 () Bool)

(declare-fun res!1004654 () Bool)

(assert (=> b!1478663 (=> (not res!1004654) (not e!829449))))

(assert (=> b!1478663 (= res!1004654 (and (= (size!48487 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48487 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48487 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478664 () Bool)

(declare-fun e!829453 () Bool)

(assert (=> b!1478664 (= e!829453 e!829452)))

(declare-fun res!1004641 () Bool)

(assert (=> b!1478664 (=> res!1004641 e!829452)))

(assert (=> b!1478664 (= res!1004641 (or (and (= (select (arr!47937 a!2862) index!646) (select (store (arr!47937 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47937 a!2862) index!646) (select (arr!47937 a!2862) j!93))) (not (= (select (arr!47937 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478665 () Bool)

(declare-fun res!1004651 () Bool)

(assert (=> b!1478665 (=> (not res!1004651) (not e!829457))))

(assert (=> b!1478665 (= res!1004651 e!829455)))

(declare-fun c!136524 () Bool)

(assert (=> b!1478665 (= c!136524 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478666 () Bool)

(declare-fun res!1004648 () Bool)

(assert (=> b!1478666 (=> (not res!1004648) (not e!829449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99316 (_ BitVec 32)) Bool)

(assert (=> b!1478666 (= res!1004648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478667 () Bool)

(assert (=> b!1478667 (= e!829457 (not (or (and (= (select (arr!47937 a!2862) index!646) (select (store (arr!47937 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47937 a!2862) index!646) (select (arr!47937 a!2862) j!93))) (not (= (select (arr!47937 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!47937 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1478667 e!829453))

(declare-fun res!1004647 () Bool)

(assert (=> b!1478667 (=> (not res!1004647) (not e!829453))))

(assert (=> b!1478667 (= res!1004647 (and (= lt!645754 (Found!12177 j!93)) (or (= (select (arr!47937 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47937 a!2862) intermediateBeforeIndex!19) (select (arr!47937 a!2862) j!93)))))))

(assert (=> b!1478667 (= lt!645754 (seekEntryOrOpen!0 (select (arr!47937 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478667 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49694 0))(
  ( (Unit!49695) )
))
(declare-fun lt!645752 () Unit!49694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49694)

(assert (=> b!1478667 (= lt!645752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126210 res!1004656) b!1478663))

(assert (= (and b!1478663 res!1004654) b!1478661))

(assert (= (and b!1478661 res!1004650) b!1478658))

(assert (= (and b!1478658 res!1004649) b!1478666))

(assert (= (and b!1478666 res!1004648) b!1478662))

(assert (= (and b!1478662 res!1004652) b!1478650))

(assert (= (and b!1478650 res!1004646) b!1478657))

(assert (= (and b!1478657 res!1004642) b!1478652))

(assert (= (and b!1478652 res!1004645) b!1478654))

(assert (= (and b!1478654 res!1004655) b!1478656))

(assert (= (and b!1478656 res!1004643) b!1478665))

(assert (= (and b!1478665 c!136524) b!1478655))

(assert (= (and b!1478665 (not c!136524)) b!1478651))

(assert (= (and b!1478665 res!1004651) b!1478659))

(assert (= (and b!1478659 res!1004644) b!1478667))

(assert (= (and b!1478667 res!1004647) b!1478664))

(assert (= (and b!1478664 (not res!1004641)) b!1478653))

(assert (= (and b!1478653 res!1004653) b!1478660))

(declare-fun m!1364555 () Bool)

(assert (=> b!1478666 m!1364555))

(declare-fun m!1364557 () Bool)

(assert (=> b!1478655 m!1364557))

(declare-fun m!1364559 () Bool)

(assert (=> b!1478667 m!1364559))

(declare-fun m!1364561 () Bool)

(assert (=> b!1478667 m!1364561))

(declare-fun m!1364563 () Bool)

(assert (=> b!1478667 m!1364563))

(declare-fun m!1364565 () Bool)

(assert (=> b!1478667 m!1364565))

(declare-fun m!1364567 () Bool)

(assert (=> b!1478667 m!1364567))

(declare-fun m!1364569 () Bool)

(assert (=> b!1478667 m!1364569))

(declare-fun m!1364571 () Bool)

(assert (=> b!1478667 m!1364571))

(declare-fun m!1364573 () Bool)

(assert (=> b!1478667 m!1364573))

(assert (=> b!1478667 m!1364569))

(assert (=> b!1478658 m!1364569))

(assert (=> b!1478658 m!1364569))

(declare-fun m!1364575 () Bool)

(assert (=> b!1478658 m!1364575))

(declare-fun m!1364577 () Bool)

(assert (=> b!1478661 m!1364577))

(assert (=> b!1478661 m!1364577))

(declare-fun m!1364579 () Bool)

(assert (=> b!1478661 m!1364579))

(assert (=> b!1478653 m!1364569))

(assert (=> b!1478653 m!1364569))

(declare-fun m!1364581 () Bool)

(assert (=> b!1478653 m!1364581))

(declare-fun m!1364583 () Bool)

(assert (=> start!126210 m!1364583))

(declare-fun m!1364585 () Bool)

(assert (=> start!126210 m!1364585))

(assert (=> b!1478652 m!1364569))

(assert (=> b!1478652 m!1364569))

(declare-fun m!1364587 () Bool)

(assert (=> b!1478652 m!1364587))

(assert (=> b!1478652 m!1364587))

(assert (=> b!1478652 m!1364569))

(declare-fun m!1364589 () Bool)

(assert (=> b!1478652 m!1364589))

(assert (=> b!1478664 m!1364567))

(assert (=> b!1478664 m!1364561))

(assert (=> b!1478664 m!1364565))

(assert (=> b!1478664 m!1364569))

(declare-fun m!1364591 () Bool)

(assert (=> b!1478656 m!1364591))

(assert (=> b!1478656 m!1364591))

(declare-fun m!1364593 () Bool)

(assert (=> b!1478656 m!1364593))

(assert (=> b!1478656 m!1364561))

(declare-fun m!1364595 () Bool)

(assert (=> b!1478656 m!1364595))

(declare-fun m!1364597 () Bool)

(assert (=> b!1478662 m!1364597))

(assert (=> b!1478657 m!1364561))

(declare-fun m!1364599 () Bool)

(assert (=> b!1478657 m!1364599))

(declare-fun m!1364601 () Bool)

(assert (=> b!1478651 m!1364601))

(declare-fun m!1364603 () Bool)

(assert (=> b!1478651 m!1364603))

(assert (=> b!1478654 m!1364569))

(assert (=> b!1478654 m!1364569))

(declare-fun m!1364605 () Bool)

(assert (=> b!1478654 m!1364605))

(check-sat (not b!1478661) (not start!126210) (not b!1478666) (not b!1478667) (not b!1478651) (not b!1478654) (not b!1478656) (not b!1478658) (not b!1478652) (not b!1478655) (not b!1478662) (not b!1478653))
(check-sat)
