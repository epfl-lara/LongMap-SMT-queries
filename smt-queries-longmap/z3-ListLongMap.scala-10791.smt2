; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126246 () Bool)

(assert start!126246)

(declare-fun b!1479659 () Bool)

(declare-fun res!1005546 () Bool)

(declare-fun e!829966 () Bool)

(assert (=> b!1479659 (=> (not res!1005546) (not e!829966))))

(declare-datatypes ((array!99352 0))(
  ( (array!99353 (arr!47955 (Array (_ BitVec 32) (_ BitVec 64))) (size!48505 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99352)

(declare-datatypes ((List!34456 0))(
  ( (Nil!34453) (Cons!34452 (h!35820 (_ BitVec 64)) (t!49150 List!34456)) )
))
(declare-fun arrayNoDuplicates!0 (array!99352 (_ BitVec 32) List!34456) Bool)

(assert (=> b!1479659 (= res!1005546 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34453))))

(declare-fun b!1479660 () Bool)

(declare-fun e!829967 () Bool)

(declare-fun e!829964 () Bool)

(assert (=> b!1479660 (= e!829967 (not e!829964))))

(declare-fun res!1005551 () Bool)

(assert (=> b!1479660 (=> res!1005551 e!829964)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479660 (= res!1005551 (or (and (= (select (arr!47955 a!2862) index!646) (select (store (arr!47955 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47955 a!2862) index!646) (select (arr!47955 a!2862) j!93))) (not (= (select (arr!47955 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47955 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829960 () Bool)

(assert (=> b!1479660 e!829960))

(declare-fun res!1005550 () Bool)

(assert (=> b!1479660 (=> (not res!1005550) (not e!829960))))

(declare-datatypes ((SeekEntryResult!12195 0))(
  ( (MissingZero!12195 (index!51172 (_ BitVec 32))) (Found!12195 (index!51173 (_ BitVec 32))) (Intermediate!12195 (undefined!13007 Bool) (index!51174 (_ BitVec 32)) (x!132754 (_ BitVec 32))) (Undefined!12195) (MissingVacant!12195 (index!51175 (_ BitVec 32))) )
))
(declare-fun lt!646115 () SeekEntryResult!12195)

(declare-fun lt!646117 () SeekEntryResult!12195)

(assert (=> b!1479660 (= res!1005550 (and (= lt!646115 lt!646117) (or (= (select (arr!47955 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47955 a!2862) intermediateBeforeIndex!19) (select (arr!47955 a!2862) j!93)))))))

(assert (=> b!1479660 (= lt!646117 (Found!12195 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12195)

(assert (=> b!1479660 (= lt!646115 (seekEntryOrOpen!0 (select (arr!47955 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99352 (_ BitVec 32)) Bool)

(assert (=> b!1479660 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49730 0))(
  ( (Unit!49731) )
))
(declare-fun lt!646112 () Unit!49730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49730)

(assert (=> b!1479660 (= lt!646112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479662 () Bool)

(assert (=> b!1479662 (= e!829964 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646118 () (_ BitVec 64))

(declare-fun lt!646119 () array!99352)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12195)

(assert (=> b!1479662 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646118 lt!646119 mask!2687) lt!646117)))

(declare-fun lt!646113 () Unit!49730)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49730)

(assert (=> b!1479662 (= lt!646113 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479663 () Bool)

(declare-fun e!829959 () Bool)

(assert (=> b!1479663 (= e!829959 e!829967)))

(declare-fun res!1005547 () Bool)

(assert (=> b!1479663 (=> (not res!1005547) (not e!829967))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!646116 () SeekEntryResult!12195)

(assert (=> b!1479663 (= res!1005547 (= lt!646116 (Intermediate!12195 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479663 (= lt!646116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646118 mask!2687) lt!646118 lt!646119 mask!2687))))

(assert (=> b!1479663 (= lt!646118 (select (store (arr!47955 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479664 () Bool)

(declare-fun res!1005556 () Bool)

(assert (=> b!1479664 (=> (not res!1005556) (not e!829967))))

(declare-fun e!829963 () Bool)

(assert (=> b!1479664 (= res!1005556 e!829963)))

(declare-fun c!136578 () Bool)

(assert (=> b!1479664 (= c!136578 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479665 () Bool)

(assert (=> b!1479665 (= e!829963 (= lt!646116 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646118 lt!646119 mask!2687)))))

(declare-fun b!1479666 () Bool)

(declare-fun res!1005544 () Bool)

(assert (=> b!1479666 (=> (not res!1005544) (not e!829966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479666 (= res!1005544 (validKeyInArray!0 (select (arr!47955 a!2862) i!1006)))))

(declare-fun b!1479667 () Bool)

(declare-fun res!1005543 () Bool)

(assert (=> b!1479667 (=> (not res!1005543) (not e!829966))))

(assert (=> b!1479667 (= res!1005543 (validKeyInArray!0 (select (arr!47955 a!2862) j!93)))))

(declare-fun b!1479668 () Bool)

(declare-fun e!829958 () Bool)

(assert (=> b!1479668 (= e!829960 e!829958)))

(declare-fun res!1005559 () Bool)

(assert (=> b!1479668 (=> res!1005559 e!829958)))

(assert (=> b!1479668 (= res!1005559 (or (and (= (select (arr!47955 a!2862) index!646) (select (store (arr!47955 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47955 a!2862) index!646) (select (arr!47955 a!2862) j!93))) (not (= (select (arr!47955 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479669 () Bool)

(assert (=> b!1479669 (= e!829963 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646118 lt!646119 mask!2687) (seekEntryOrOpen!0 lt!646118 lt!646119 mask!2687)))))

(declare-fun b!1479670 () Bool)

(declare-fun e!829961 () Bool)

(assert (=> b!1479670 (= e!829966 e!829961)))

(declare-fun res!1005558 () Bool)

(assert (=> b!1479670 (=> (not res!1005558) (not e!829961))))

(assert (=> b!1479670 (= res!1005558 (= (select (store (arr!47955 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479670 (= lt!646119 (array!99353 (store (arr!47955 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48505 a!2862)))))

(declare-fun b!1479671 () Bool)

(declare-fun res!1005545 () Bool)

(assert (=> b!1479671 (=> (not res!1005545) (not e!829966))))

(assert (=> b!1479671 (= res!1005545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!829965 () Bool)

(declare-fun b!1479672 () Bool)

(assert (=> b!1479672 (= e!829965 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479673 () Bool)

(declare-fun res!1005549 () Bool)

(assert (=> b!1479673 (=> (not res!1005549) (not e!829967))))

(assert (=> b!1479673 (= res!1005549 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479674 () Bool)

(declare-fun res!1005557 () Bool)

(assert (=> b!1479674 (=> (not res!1005557) (not e!829966))))

(assert (=> b!1479674 (= res!1005557 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48505 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48505 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48505 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1005554 () Bool)

(assert (=> start!126246 (=> (not res!1005554) (not e!829966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126246 (= res!1005554 (validMask!0 mask!2687))))

(assert (=> start!126246 e!829966))

(assert (=> start!126246 true))

(declare-fun array_inv!36983 (array!99352) Bool)

(assert (=> start!126246 (array_inv!36983 a!2862)))

(declare-fun b!1479661 () Bool)

(declare-fun res!1005555 () Bool)

(assert (=> b!1479661 (=> res!1005555 e!829964)))

(assert (=> b!1479661 (= res!1005555 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47955 a!2862) j!93) a!2862 mask!2687) lt!646117)))))

(declare-fun b!1479675 () Bool)

(assert (=> b!1479675 (= e!829961 e!829959)))

(declare-fun res!1005552 () Bool)

(assert (=> b!1479675 (=> (not res!1005552) (not e!829959))))

(declare-fun lt!646114 () SeekEntryResult!12195)

(assert (=> b!1479675 (= res!1005552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47955 a!2862) j!93) mask!2687) (select (arr!47955 a!2862) j!93) a!2862 mask!2687) lt!646114))))

(assert (=> b!1479675 (= lt!646114 (Intermediate!12195 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479676 () Bool)

(declare-fun res!1005548 () Bool)

(assert (=> b!1479676 (=> (not res!1005548) (not e!829959))))

(assert (=> b!1479676 (= res!1005548 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47955 a!2862) j!93) a!2862 mask!2687) lt!646114))))

(declare-fun b!1479677 () Bool)

(assert (=> b!1479677 (= e!829958 e!829965)))

(declare-fun res!1005542 () Bool)

(assert (=> b!1479677 (=> (not res!1005542) (not e!829965))))

(assert (=> b!1479677 (= res!1005542 (= lt!646115 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47955 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479678 () Bool)

(declare-fun res!1005553 () Bool)

(assert (=> b!1479678 (=> (not res!1005553) (not e!829966))))

(assert (=> b!1479678 (= res!1005553 (and (= (size!48505 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48505 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48505 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126246 res!1005554) b!1479678))

(assert (= (and b!1479678 res!1005553) b!1479666))

(assert (= (and b!1479666 res!1005544) b!1479667))

(assert (= (and b!1479667 res!1005543) b!1479671))

(assert (= (and b!1479671 res!1005545) b!1479659))

(assert (= (and b!1479659 res!1005546) b!1479674))

(assert (= (and b!1479674 res!1005557) b!1479670))

(assert (= (and b!1479670 res!1005558) b!1479675))

(assert (= (and b!1479675 res!1005552) b!1479676))

(assert (= (and b!1479676 res!1005548) b!1479663))

(assert (= (and b!1479663 res!1005547) b!1479664))

(assert (= (and b!1479664 c!136578) b!1479665))

(assert (= (and b!1479664 (not c!136578)) b!1479669))

(assert (= (and b!1479664 res!1005556) b!1479673))

(assert (= (and b!1479673 res!1005549) b!1479660))

(assert (= (and b!1479660 res!1005550) b!1479668))

(assert (= (and b!1479668 (not res!1005559)) b!1479677))

(assert (= (and b!1479677 res!1005542) b!1479672))

(assert (= (and b!1479660 (not res!1005551)) b!1479661))

(assert (= (and b!1479661 (not res!1005555)) b!1479662))

(declare-fun m!1365513 () Bool)

(assert (=> b!1479668 m!1365513))

(declare-fun m!1365515 () Bool)

(assert (=> b!1479668 m!1365515))

(declare-fun m!1365517 () Bool)

(assert (=> b!1479668 m!1365517))

(declare-fun m!1365519 () Bool)

(assert (=> b!1479668 m!1365519))

(declare-fun m!1365521 () Bool)

(assert (=> b!1479663 m!1365521))

(assert (=> b!1479663 m!1365521))

(declare-fun m!1365523 () Bool)

(assert (=> b!1479663 m!1365523))

(assert (=> b!1479663 m!1365515))

(declare-fun m!1365525 () Bool)

(assert (=> b!1479663 m!1365525))

(assert (=> b!1479667 m!1365519))

(assert (=> b!1479667 m!1365519))

(declare-fun m!1365527 () Bool)

(assert (=> b!1479667 m!1365527))

(declare-fun m!1365529 () Bool)

(assert (=> start!126246 m!1365529))

(declare-fun m!1365531 () Bool)

(assert (=> start!126246 m!1365531))

(declare-fun m!1365533 () Bool)

(assert (=> b!1479665 m!1365533))

(declare-fun m!1365535 () Bool)

(assert (=> b!1479666 m!1365535))

(assert (=> b!1479666 m!1365535))

(declare-fun m!1365537 () Bool)

(assert (=> b!1479666 m!1365537))

(declare-fun m!1365539 () Bool)

(assert (=> b!1479662 m!1365539))

(declare-fun m!1365541 () Bool)

(assert (=> b!1479662 m!1365541))

(declare-fun m!1365543 () Bool)

(assert (=> b!1479660 m!1365543))

(assert (=> b!1479660 m!1365515))

(declare-fun m!1365545 () Bool)

(assert (=> b!1479660 m!1365545))

(assert (=> b!1479660 m!1365517))

(assert (=> b!1479660 m!1365513))

(assert (=> b!1479660 m!1365519))

(declare-fun m!1365547 () Bool)

(assert (=> b!1479660 m!1365547))

(declare-fun m!1365549 () Bool)

(assert (=> b!1479660 m!1365549))

(assert (=> b!1479660 m!1365519))

(assert (=> b!1479661 m!1365519))

(assert (=> b!1479661 m!1365519))

(declare-fun m!1365551 () Bool)

(assert (=> b!1479661 m!1365551))

(declare-fun m!1365553 () Bool)

(assert (=> b!1479659 m!1365553))

(assert (=> b!1479677 m!1365519))

(assert (=> b!1479677 m!1365519))

(declare-fun m!1365555 () Bool)

(assert (=> b!1479677 m!1365555))

(assert (=> b!1479669 m!1365539))

(declare-fun m!1365557 () Bool)

(assert (=> b!1479669 m!1365557))

(assert (=> b!1479675 m!1365519))

(assert (=> b!1479675 m!1365519))

(declare-fun m!1365559 () Bool)

(assert (=> b!1479675 m!1365559))

(assert (=> b!1479675 m!1365559))

(assert (=> b!1479675 m!1365519))

(declare-fun m!1365561 () Bool)

(assert (=> b!1479675 m!1365561))

(assert (=> b!1479670 m!1365515))

(declare-fun m!1365563 () Bool)

(assert (=> b!1479670 m!1365563))

(declare-fun m!1365565 () Bool)

(assert (=> b!1479671 m!1365565))

(assert (=> b!1479676 m!1365519))

(assert (=> b!1479676 m!1365519))

(declare-fun m!1365567 () Bool)

(assert (=> b!1479676 m!1365567))

(check-sat (not b!1479667) (not b!1479666) (not b!1479677) (not b!1479665) (not b!1479660) (not b!1479671) (not b!1479675) (not b!1479659) (not b!1479662) (not b!1479663) (not b!1479661) (not b!1479669) (not b!1479676) (not start!126246))
(check-sat)
