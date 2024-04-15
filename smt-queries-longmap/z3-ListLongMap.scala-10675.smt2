; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125158 () Bool)

(assert start!125158)

(declare-fun b!1459653 () Bool)

(declare-fun res!989640 () Bool)

(declare-fun e!820817 () Bool)

(assert (=> b!1459653 (=> (not res!989640) (not e!820817))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98584 0))(
  ( (array!98585 (arr!47581 (Array (_ BitVec 32) (_ BitVec 64))) (size!48133 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98584)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459653 (= res!989640 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48133 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48133 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48133 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459654 () Bool)

(declare-fun res!989638 () Bool)

(assert (=> b!1459654 (=> (not res!989638) (not e!820817))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459654 (= res!989638 (and (= (size!48133 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48133 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48133 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459655 () Bool)

(declare-fun res!989636 () Bool)

(assert (=> b!1459655 (=> (not res!989636) (not e!820817))))

(declare-datatypes ((List!34160 0))(
  ( (Nil!34157) (Cons!34156 (h!35506 (_ BitVec 64)) (t!48846 List!34160)) )
))
(declare-fun arrayNoDuplicates!0 (array!98584 (_ BitVec 32) List!34160) Bool)

(assert (=> b!1459655 (= res!989636 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34157))))

(declare-fun b!1459656 () Bool)

(declare-fun e!820814 () Bool)

(declare-fun e!820818 () Bool)

(assert (=> b!1459656 (= e!820814 e!820818)))

(declare-fun res!989633 () Bool)

(assert (=> b!1459656 (=> res!989633 e!820818)))

(declare-fun lt!639379 () (_ BitVec 32))

(assert (=> b!1459656 (= res!989633 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639379 #b00000000000000000000000000000000) (bvsge lt!639379 (size!48133 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459656 (= lt!639379 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639377 () (_ BitVec 64))

(declare-fun lt!639381 () array!98584)

(declare-datatypes ((SeekEntryResult!11858 0))(
  ( (MissingZero!11858 (index!49824 (_ BitVec 32))) (Found!11858 (index!49825 (_ BitVec 32))) (Intermediate!11858 (undefined!12670 Bool) (index!49826 (_ BitVec 32)) (x!131430 (_ BitVec 32))) (Undefined!11858) (MissingVacant!11858 (index!49827 (_ BitVec 32))) )
))
(declare-fun lt!639376 () SeekEntryResult!11858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459656 (= lt!639376 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639377 lt!639381 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459656 (= lt!639376 (seekEntryOrOpen!0 lt!639377 lt!639381 mask!2687))))

(declare-fun lt!639378 () SeekEntryResult!11858)

(declare-fun b!1459657 () Bool)

(declare-fun e!820811 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459657 (= e!820811 (= lt!639378 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639377 lt!639381 mask!2687)))))

(declare-fun res!989634 () Bool)

(assert (=> start!125158 (=> (not res!989634) (not e!820817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125158 (= res!989634 (validMask!0 mask!2687))))

(assert (=> start!125158 e!820817))

(assert (=> start!125158 true))

(declare-fun array_inv!36814 (array!98584) Bool)

(assert (=> start!125158 (array_inv!36814 a!2862)))

(declare-fun b!1459658 () Bool)

(declare-fun e!820812 () Bool)

(declare-fun e!820810 () Bool)

(assert (=> b!1459658 (= e!820812 e!820810)))

(declare-fun res!989635 () Bool)

(assert (=> b!1459658 (=> (not res!989635) (not e!820810))))

(declare-fun lt!639380 () SeekEntryResult!11858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459658 (= res!989635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47581 a!2862) j!93) mask!2687) (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!639380))))

(assert (=> b!1459658 (= lt!639380 (Intermediate!11858 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!820813 () Bool)

(declare-fun b!1459659 () Bool)

(assert (=> b!1459659 (= e!820813 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639379 intermediateAfterIndex!19 lt!639377 lt!639381 mask!2687) lt!639376)))))

(declare-fun b!1459660 () Bool)

(declare-fun e!820815 () Bool)

(assert (=> b!1459660 (= e!820815 (not e!820814))))

(declare-fun res!989650 () Bool)

(assert (=> b!1459660 (=> res!989650 e!820814)))

(assert (=> b!1459660 (= res!989650 (or (and (= (select (arr!47581 a!2862) index!646) (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639384 () SeekEntryResult!11858)

(assert (=> b!1459660 (and (= lt!639384 (Found!11858 j!93)) (or (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) (select (arr!47581 a!2862) j!93))) (let ((bdg!53545 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47581 a!2862) index!646) bdg!53545) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53545 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459660 (= lt!639384 (seekEntryOrOpen!0 (select (arr!47581 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98584 (_ BitVec 32)) Bool)

(assert (=> b!1459660 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49053 0))(
  ( (Unit!49054) )
))
(declare-fun lt!639382 () Unit!49053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49053)

(assert (=> b!1459660 (= lt!639382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459661 () Bool)

(declare-fun res!989644 () Bool)

(assert (=> b!1459661 (=> res!989644 e!820818)))

(assert (=> b!1459661 (= res!989644 e!820813)))

(declare-fun c!134523 () Bool)

(assert (=> b!1459661 (= c!134523 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459662 () Bool)

(assert (=> b!1459662 (= e!820813 (not (= lt!639378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639379 lt!639377 lt!639381 mask!2687))))))

(declare-fun b!1459663 () Bool)

(assert (=> b!1459663 (= e!820818 true)))

(assert (=> b!1459663 (= lt!639384 lt!639376)))

(declare-fun lt!639383 () Unit!49053)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49053)

(assert (=> b!1459663 (= lt!639383 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639379 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459664 () Bool)

(declare-fun res!989642 () Bool)

(assert (=> b!1459664 (=> res!989642 e!820818)))

(assert (=> b!1459664 (= res!989642 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639379 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!639380)))))

(declare-fun b!1459665 () Bool)

(declare-fun res!989645 () Bool)

(assert (=> b!1459665 (=> res!989645 e!820818)))

(assert (=> b!1459665 (= res!989645 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459666 () Bool)

(assert (=> b!1459666 (= e!820817 e!820812)))

(declare-fun res!989639 () Bool)

(assert (=> b!1459666 (=> (not res!989639) (not e!820812))))

(assert (=> b!1459666 (= res!989639 (= (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459666 (= lt!639381 (array!98585 (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48133 a!2862)))))

(declare-fun b!1459667 () Bool)

(assert (=> b!1459667 (= e!820810 e!820815)))

(declare-fun res!989649 () Bool)

(assert (=> b!1459667 (=> (not res!989649) (not e!820815))))

(assert (=> b!1459667 (= res!989649 (= lt!639378 (Intermediate!11858 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459667 (= lt!639378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639377 mask!2687) lt!639377 lt!639381 mask!2687))))

(assert (=> b!1459667 (= lt!639377 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459668 () Bool)

(declare-fun res!989637 () Bool)

(assert (=> b!1459668 (=> (not res!989637) (not e!820817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459668 (= res!989637 (validKeyInArray!0 (select (arr!47581 a!2862) i!1006)))))

(declare-fun b!1459669 () Bool)

(declare-fun res!989643 () Bool)

(assert (=> b!1459669 (=> (not res!989643) (not e!820810))))

(assert (=> b!1459669 (= res!989643 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!639380))))

(declare-fun b!1459670 () Bool)

(declare-fun res!989646 () Bool)

(assert (=> b!1459670 (=> (not res!989646) (not e!820817))))

(assert (=> b!1459670 (= res!989646 (validKeyInArray!0 (select (arr!47581 a!2862) j!93)))))

(declare-fun b!1459671 () Bool)

(assert (=> b!1459671 (= e!820811 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639377 lt!639381 mask!2687) (seekEntryOrOpen!0 lt!639377 lt!639381 mask!2687)))))

(declare-fun b!1459672 () Bool)

(declare-fun res!989648 () Bool)

(assert (=> b!1459672 (=> (not res!989648) (not e!820815))))

(assert (=> b!1459672 (= res!989648 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459673 () Bool)

(declare-fun res!989641 () Bool)

(assert (=> b!1459673 (=> (not res!989641) (not e!820815))))

(assert (=> b!1459673 (= res!989641 e!820811)))

(declare-fun c!134524 () Bool)

(assert (=> b!1459673 (= c!134524 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459674 () Bool)

(declare-fun res!989647 () Bool)

(assert (=> b!1459674 (=> (not res!989647) (not e!820817))))

(assert (=> b!1459674 (= res!989647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125158 res!989634) b!1459654))

(assert (= (and b!1459654 res!989638) b!1459668))

(assert (= (and b!1459668 res!989637) b!1459670))

(assert (= (and b!1459670 res!989646) b!1459674))

(assert (= (and b!1459674 res!989647) b!1459655))

(assert (= (and b!1459655 res!989636) b!1459653))

(assert (= (and b!1459653 res!989640) b!1459666))

(assert (= (and b!1459666 res!989639) b!1459658))

(assert (= (and b!1459658 res!989635) b!1459669))

(assert (= (and b!1459669 res!989643) b!1459667))

(assert (= (and b!1459667 res!989649) b!1459673))

(assert (= (and b!1459673 c!134524) b!1459657))

(assert (= (and b!1459673 (not c!134524)) b!1459671))

(assert (= (and b!1459673 res!989641) b!1459672))

(assert (= (and b!1459672 res!989648) b!1459660))

(assert (= (and b!1459660 (not res!989650)) b!1459656))

(assert (= (and b!1459656 (not res!989633)) b!1459664))

(assert (= (and b!1459664 (not res!989642)) b!1459661))

(assert (= (and b!1459661 c!134523) b!1459662))

(assert (= (and b!1459661 (not c!134523)) b!1459659))

(assert (= (and b!1459661 (not res!989644)) b!1459665))

(assert (= (and b!1459665 (not res!989645)) b!1459663))

(declare-fun m!1346895 () Bool)

(assert (=> b!1459658 m!1346895))

(assert (=> b!1459658 m!1346895))

(declare-fun m!1346897 () Bool)

(assert (=> b!1459658 m!1346897))

(assert (=> b!1459658 m!1346897))

(assert (=> b!1459658 m!1346895))

(declare-fun m!1346899 () Bool)

(assert (=> b!1459658 m!1346899))

(declare-fun m!1346901 () Bool)

(assert (=> b!1459660 m!1346901))

(declare-fun m!1346903 () Bool)

(assert (=> b!1459660 m!1346903))

(declare-fun m!1346905 () Bool)

(assert (=> b!1459660 m!1346905))

(declare-fun m!1346907 () Bool)

(assert (=> b!1459660 m!1346907))

(declare-fun m!1346909 () Bool)

(assert (=> b!1459660 m!1346909))

(assert (=> b!1459660 m!1346895))

(declare-fun m!1346911 () Bool)

(assert (=> b!1459660 m!1346911))

(declare-fun m!1346913 () Bool)

(assert (=> b!1459660 m!1346913))

(assert (=> b!1459660 m!1346895))

(declare-fun m!1346915 () Bool)

(assert (=> b!1459668 m!1346915))

(assert (=> b!1459668 m!1346915))

(declare-fun m!1346917 () Bool)

(assert (=> b!1459668 m!1346917))

(declare-fun m!1346919 () Bool)

(assert (=> b!1459674 m!1346919))

(declare-fun m!1346921 () Bool)

(assert (=> b!1459656 m!1346921))

(declare-fun m!1346923 () Bool)

(assert (=> b!1459656 m!1346923))

(declare-fun m!1346925 () Bool)

(assert (=> b!1459656 m!1346925))

(assert (=> b!1459669 m!1346895))

(assert (=> b!1459669 m!1346895))

(declare-fun m!1346927 () Bool)

(assert (=> b!1459669 m!1346927))

(declare-fun m!1346929 () Bool)

(assert (=> b!1459659 m!1346929))

(declare-fun m!1346931 () Bool)

(assert (=> b!1459655 m!1346931))

(declare-fun m!1346933 () Bool)

(assert (=> b!1459667 m!1346933))

(assert (=> b!1459667 m!1346933))

(declare-fun m!1346935 () Bool)

(assert (=> b!1459667 m!1346935))

(assert (=> b!1459667 m!1346903))

(declare-fun m!1346937 () Bool)

(assert (=> b!1459667 m!1346937))

(assert (=> b!1459666 m!1346903))

(declare-fun m!1346939 () Bool)

(assert (=> b!1459666 m!1346939))

(assert (=> b!1459664 m!1346895))

(assert (=> b!1459664 m!1346895))

(declare-fun m!1346941 () Bool)

(assert (=> b!1459664 m!1346941))

(declare-fun m!1346943 () Bool)

(assert (=> b!1459663 m!1346943))

(assert (=> b!1459671 m!1346923))

(assert (=> b!1459671 m!1346925))

(declare-fun m!1346945 () Bool)

(assert (=> start!125158 m!1346945))

(declare-fun m!1346947 () Bool)

(assert (=> start!125158 m!1346947))

(assert (=> b!1459670 m!1346895))

(assert (=> b!1459670 m!1346895))

(declare-fun m!1346949 () Bool)

(assert (=> b!1459670 m!1346949))

(declare-fun m!1346951 () Bool)

(assert (=> b!1459657 m!1346951))

(declare-fun m!1346953 () Bool)

(assert (=> b!1459662 m!1346953))

(check-sat (not b!1459671) (not b!1459669) (not b!1459657) (not b!1459674) (not start!125158) (not b!1459656) (not b!1459670) (not b!1459663) (not b!1459662) (not b!1459658) (not b!1459667) (not b!1459660) (not b!1459664) (not b!1459668) (not b!1459655) (not b!1459659))
(check-sat)
