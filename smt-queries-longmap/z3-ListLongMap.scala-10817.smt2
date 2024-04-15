; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126500 () Bool)

(assert start!126500)

(declare-fun b!1484746 () Bool)

(declare-fun e!832370 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1484746 (= e!832370 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!647687 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484746 (= lt!647687 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484747 () Bool)

(declare-fun res!1009700 () Bool)

(declare-fun e!832371 () Bool)

(assert (=> b!1484747 (=> (not res!1009700) (not e!832371))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99460 0))(
  ( (array!99461 (arr!48007 (Array (_ BitVec 32) (_ BitVec 64))) (size!48559 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99460)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484747 (= res!1009700 (and (= (size!48559 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48559 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48559 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484748 () Bool)

(declare-fun res!1009701 () Bool)

(declare-fun e!832378 () Bool)

(assert (=> b!1484748 (=> (not res!1009701) (not e!832378))))

(declare-fun e!832374 () Bool)

(assert (=> b!1484748 (= res!1009701 e!832374)))

(declare-fun c!137056 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484748 (= c!137056 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484749 () Bool)

(declare-fun lt!647684 () array!99460)

(declare-fun lt!647681 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12272 0))(
  ( (MissingZero!12272 (index!51480 (_ BitVec 32))) (Found!12272 (index!51481 (_ BitVec 32))) (Intermediate!12272 (undefined!13084 Bool) (index!51482 (_ BitVec 32)) (x!133053 (_ BitVec 32))) (Undefined!12272) (MissingVacant!12272 (index!51483 (_ BitVec 32))) )
))
(declare-fun lt!647682 () SeekEntryResult!12272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12272)

(assert (=> b!1484749 (= e!832374 (= lt!647682 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647681 lt!647684 mask!2687)))))

(declare-fun b!1484750 () Bool)

(declare-fun res!1009694 () Bool)

(assert (=> b!1484750 (=> (not res!1009694) (not e!832371))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484750 (= res!1009694 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48559 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48559 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48559 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484751 () Bool)

(declare-fun e!832377 () Bool)

(assert (=> b!1484751 (= e!832377 e!832378)))

(declare-fun res!1009691 () Bool)

(assert (=> b!1484751 (=> (not res!1009691) (not e!832378))))

(assert (=> b!1484751 (= res!1009691 (= lt!647682 (Intermediate!12272 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484751 (= lt!647682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647681 mask!2687) lt!647681 lt!647684 mask!2687))))

(assert (=> b!1484751 (= lt!647681 (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484752 () Bool)

(declare-fun res!1009686 () Bool)

(declare-fun e!832373 () Bool)

(assert (=> b!1484752 (=> (not res!1009686) (not e!832373))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12272)

(assert (=> b!1484752 (= res!1009686 (= (seekEntryOrOpen!0 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) (Found!12272 j!93)))))

(declare-fun b!1484753 () Bool)

(declare-fun res!1009699 () Bool)

(assert (=> b!1484753 (=> (not res!1009699) (not e!832378))))

(assert (=> b!1484753 (= res!1009699 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484754 () Bool)

(declare-fun e!832372 () Bool)

(assert (=> b!1484754 (= e!832373 e!832372)))

(declare-fun res!1009685 () Bool)

(assert (=> b!1484754 (=> res!1009685 e!832372)))

(declare-fun lt!647685 () (_ BitVec 64))

(assert (=> b!1484754 (= res!1009685 (or (and (= (select (arr!48007 a!2862) index!646) lt!647685) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484754 (= lt!647685 (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484755 () Bool)

(declare-fun e!832376 () Bool)

(assert (=> b!1484755 (= e!832371 e!832376)))

(declare-fun res!1009702 () Bool)

(assert (=> b!1484755 (=> (not res!1009702) (not e!832376))))

(assert (=> b!1484755 (= res!1009702 (= (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484755 (= lt!647684 (array!99461 (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48559 a!2862)))))

(declare-fun b!1484756 () Bool)

(assert (=> b!1484756 (= e!832378 (not e!832370))))

(declare-fun res!1009688 () Bool)

(assert (=> b!1484756 (=> res!1009688 e!832370)))

(assert (=> b!1484756 (= res!1009688 (or (and (= (select (arr!48007 a!2862) index!646) (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484756 e!832373))

(declare-fun res!1009695 () Bool)

(assert (=> b!1484756 (=> (not res!1009695) (not e!832373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99460 (_ BitVec 32)) Bool)

(assert (=> b!1484756 (= res!1009695 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49725 0))(
  ( (Unit!49726) )
))
(declare-fun lt!647683 () Unit!49725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49725)

(assert (=> b!1484756 (= lt!647683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484757 () Bool)

(assert (=> b!1484757 (= e!832376 e!832377)))

(declare-fun res!1009698 () Bool)

(assert (=> b!1484757 (=> (not res!1009698) (not e!832377))))

(declare-fun lt!647686 () SeekEntryResult!12272)

(assert (=> b!1484757 (= res!1009698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48007 a!2862) j!93) mask!2687) (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!647686))))

(assert (=> b!1484757 (= lt!647686 (Intermediate!12272 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484758 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12272)

(assert (=> b!1484758 (= e!832374 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647681 lt!647684 mask!2687) (seekEntryOrOpen!0 lt!647681 lt!647684 mask!2687)))))

(declare-fun res!1009689 () Bool)

(assert (=> start!126500 (=> (not res!1009689) (not e!832371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126500 (= res!1009689 (validMask!0 mask!2687))))

(assert (=> start!126500 e!832371))

(assert (=> start!126500 true))

(declare-fun array_inv!37240 (array!99460) Bool)

(assert (=> start!126500 (array_inv!37240 a!2862)))

(declare-fun b!1484759 () Bool)

(declare-fun e!832379 () Bool)

(assert (=> b!1484759 (= e!832372 e!832379)))

(declare-fun res!1009684 () Bool)

(assert (=> b!1484759 (=> (not res!1009684) (not e!832379))))

(assert (=> b!1484759 (= res!1009684 (and (= index!646 intermediateAfterIndex!19) (= lt!647685 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484760 () Bool)

(declare-fun res!1009690 () Bool)

(assert (=> b!1484760 (=> (not res!1009690) (not e!832377))))

(assert (=> b!1484760 (= res!1009690 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!647686))))

(declare-fun b!1484761 () Bool)

(declare-fun res!1009692 () Bool)

(assert (=> b!1484761 (=> (not res!1009692) (not e!832371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484761 (= res!1009692 (validKeyInArray!0 (select (arr!48007 a!2862) j!93)))))

(declare-fun b!1484762 () Bool)

(assert (=> b!1484762 (= e!832379 (= (seekEntryOrOpen!0 lt!647681 lt!647684 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647681 lt!647684 mask!2687)))))

(declare-fun b!1484763 () Bool)

(declare-fun res!1009697 () Bool)

(assert (=> b!1484763 (=> (not res!1009697) (not e!832371))))

(assert (=> b!1484763 (= res!1009697 (validKeyInArray!0 (select (arr!48007 a!2862) i!1006)))))

(declare-fun b!1484764 () Bool)

(declare-fun res!1009693 () Bool)

(assert (=> b!1484764 (=> (not res!1009693) (not e!832373))))

(assert (=> b!1484764 (= res!1009693 (or (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) (select (arr!48007 a!2862) j!93))))))

(declare-fun b!1484765 () Bool)

(declare-fun res!1009696 () Bool)

(assert (=> b!1484765 (=> (not res!1009696) (not e!832371))))

(declare-datatypes ((List!34586 0))(
  ( (Nil!34583) (Cons!34582 (h!35956 (_ BitVec 64)) (t!49272 List!34586)) )
))
(declare-fun arrayNoDuplicates!0 (array!99460 (_ BitVec 32) List!34586) Bool)

(assert (=> b!1484765 (= res!1009696 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34583))))

(declare-fun b!1484766 () Bool)

(declare-fun res!1009687 () Bool)

(assert (=> b!1484766 (=> (not res!1009687) (not e!832371))))

(assert (=> b!1484766 (= res!1009687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126500 res!1009689) b!1484747))

(assert (= (and b!1484747 res!1009700) b!1484763))

(assert (= (and b!1484763 res!1009697) b!1484761))

(assert (= (and b!1484761 res!1009692) b!1484766))

(assert (= (and b!1484766 res!1009687) b!1484765))

(assert (= (and b!1484765 res!1009696) b!1484750))

(assert (= (and b!1484750 res!1009694) b!1484755))

(assert (= (and b!1484755 res!1009702) b!1484757))

(assert (= (and b!1484757 res!1009698) b!1484760))

(assert (= (and b!1484760 res!1009690) b!1484751))

(assert (= (and b!1484751 res!1009691) b!1484748))

(assert (= (and b!1484748 c!137056) b!1484749))

(assert (= (and b!1484748 (not c!137056)) b!1484758))

(assert (= (and b!1484748 res!1009701) b!1484753))

(assert (= (and b!1484753 res!1009699) b!1484756))

(assert (= (and b!1484756 res!1009695) b!1484752))

(assert (= (and b!1484752 res!1009686) b!1484764))

(assert (= (and b!1484764 res!1009693) b!1484754))

(assert (= (and b!1484754 (not res!1009685)) b!1484759))

(assert (= (and b!1484759 res!1009684) b!1484762))

(assert (= (and b!1484756 (not res!1009688)) b!1484746))

(declare-fun m!1369401 () Bool)

(assert (=> b!1484764 m!1369401))

(declare-fun m!1369403 () Bool)

(assert (=> b!1484764 m!1369403))

(declare-fun m!1369405 () Bool)

(assert (=> start!126500 m!1369405))

(declare-fun m!1369407 () Bool)

(assert (=> start!126500 m!1369407))

(declare-fun m!1369409 () Bool)

(assert (=> b!1484763 m!1369409))

(assert (=> b!1484763 m!1369409))

(declare-fun m!1369411 () Bool)

(assert (=> b!1484763 m!1369411))

(declare-fun m!1369413 () Bool)

(assert (=> b!1484751 m!1369413))

(assert (=> b!1484751 m!1369413))

(declare-fun m!1369415 () Bool)

(assert (=> b!1484751 m!1369415))

(declare-fun m!1369417 () Bool)

(assert (=> b!1484751 m!1369417))

(declare-fun m!1369419 () Bool)

(assert (=> b!1484751 m!1369419))

(declare-fun m!1369421 () Bool)

(assert (=> b!1484754 m!1369421))

(assert (=> b!1484754 m!1369403))

(assert (=> b!1484754 m!1369417))

(declare-fun m!1369423 () Bool)

(assert (=> b!1484754 m!1369423))

(declare-fun m!1369425 () Bool)

(assert (=> b!1484756 m!1369425))

(assert (=> b!1484756 m!1369417))

(assert (=> b!1484756 m!1369423))

(assert (=> b!1484756 m!1369421))

(declare-fun m!1369427 () Bool)

(assert (=> b!1484756 m!1369427))

(assert (=> b!1484756 m!1369403))

(assert (=> b!1484755 m!1369417))

(declare-fun m!1369429 () Bool)

(assert (=> b!1484755 m!1369429))

(declare-fun m!1369431 () Bool)

(assert (=> b!1484758 m!1369431))

(declare-fun m!1369433 () Bool)

(assert (=> b!1484758 m!1369433))

(declare-fun m!1369435 () Bool)

(assert (=> b!1484746 m!1369435))

(declare-fun m!1369437 () Bool)

(assert (=> b!1484749 m!1369437))

(assert (=> b!1484757 m!1369403))

(assert (=> b!1484757 m!1369403))

(declare-fun m!1369439 () Bool)

(assert (=> b!1484757 m!1369439))

(assert (=> b!1484757 m!1369439))

(assert (=> b!1484757 m!1369403))

(declare-fun m!1369441 () Bool)

(assert (=> b!1484757 m!1369441))

(assert (=> b!1484761 m!1369403))

(assert (=> b!1484761 m!1369403))

(declare-fun m!1369443 () Bool)

(assert (=> b!1484761 m!1369443))

(assert (=> b!1484760 m!1369403))

(assert (=> b!1484760 m!1369403))

(declare-fun m!1369445 () Bool)

(assert (=> b!1484760 m!1369445))

(declare-fun m!1369447 () Bool)

(assert (=> b!1484766 m!1369447))

(assert (=> b!1484752 m!1369403))

(assert (=> b!1484752 m!1369403))

(declare-fun m!1369449 () Bool)

(assert (=> b!1484752 m!1369449))

(declare-fun m!1369451 () Bool)

(assert (=> b!1484765 m!1369451))

(assert (=> b!1484762 m!1369433))

(assert (=> b!1484762 m!1369431))

(check-sat (not b!1484756) (not b!1484760) (not b!1484758) (not b!1484765) (not b!1484757) (not b!1484762) (not b!1484746) (not b!1484751) (not b!1484761) (not b!1484749) (not b!1484763) (not b!1484766) (not start!126500) (not b!1484752))
(check-sat)
