; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125128 () Bool)

(assert start!125128)

(declare-fun b!1458663 () Bool)

(declare-fun res!988838 () Bool)

(declare-fun e!820412 () Bool)

(assert (=> b!1458663 (=> (not res!988838) (not e!820412))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98554 0))(
  ( (array!98555 (arr!47566 (Array (_ BitVec 32) (_ BitVec 64))) (size!48118 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98554)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458663 (= res!988838 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48118 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48118 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48118 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458664 () Bool)

(declare-fun e!820405 () Bool)

(declare-fun e!820408 () Bool)

(assert (=> b!1458664 (= e!820405 e!820408)))

(declare-fun res!988828 () Bool)

(assert (=> b!1458664 (=> res!988828 e!820408)))

(declare-fun lt!638977 () (_ BitVec 32))

(assert (=> b!1458664 (= res!988828 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638977 #b00000000000000000000000000000000) (bvsge lt!638977 (size!48118 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458664 (= lt!638977 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638978 () array!98554)

(declare-datatypes ((SeekEntryResult!11843 0))(
  ( (MissingZero!11843 (index!49764 (_ BitVec 32))) (Found!11843 (index!49765 (_ BitVec 32))) (Intermediate!11843 (undefined!12655 Bool) (index!49766 (_ BitVec 32)) (x!131375 (_ BitVec 32))) (Undefined!11843) (MissingVacant!11843 (index!49767 (_ BitVec 32))) )
))
(declare-fun lt!638972 () SeekEntryResult!11843)

(declare-fun lt!638976 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458664 (= lt!638972 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638976 lt!638978 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458664 (= lt!638972 (seekEntryOrOpen!0 lt!638976 lt!638978 mask!2687))))

(declare-fun b!1458665 () Bool)

(declare-fun res!988824 () Bool)

(assert (=> b!1458665 (=> res!988824 e!820408)))

(declare-fun lt!638973 () SeekEntryResult!11843)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458665 (= res!988824 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638977 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638973)))))

(declare-fun b!1458666 () Bool)

(declare-fun res!988840 () Bool)

(assert (=> b!1458666 (=> (not res!988840) (not e!820412))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458666 (= res!988840 (and (= (size!48118 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48118 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48118 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458668 () Bool)

(declare-fun res!988839 () Bool)

(assert (=> b!1458668 (=> res!988839 e!820408)))

(assert (=> b!1458668 (= res!988839 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun res!988834 () Bool)

(assert (=> start!125128 (=> (not res!988834) (not e!820412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125128 (= res!988834 (validMask!0 mask!2687))))

(assert (=> start!125128 e!820412))

(assert (=> start!125128 true))

(declare-fun array_inv!36799 (array!98554) Bool)

(assert (=> start!125128 (array_inv!36799 a!2862)))

(declare-fun b!1458667 () Bool)

(declare-fun res!988832 () Bool)

(declare-fun e!820406 () Bool)

(assert (=> b!1458667 (=> (not res!988832) (not e!820406))))

(assert (=> b!1458667 (= res!988832 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458669 () Bool)

(declare-fun e!820407 () Bool)

(declare-fun e!820411 () Bool)

(assert (=> b!1458669 (= e!820407 e!820411)))

(declare-fun res!988836 () Bool)

(assert (=> b!1458669 (=> (not res!988836) (not e!820411))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458669 (= res!988836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47566 a!2862) j!93) mask!2687) (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638973))))

(assert (=> b!1458669 (= lt!638973 (Intermediate!11843 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!820409 () Bool)

(declare-fun lt!638979 () SeekEntryResult!11843)

(declare-fun b!1458670 () Bool)

(assert (=> b!1458670 (= e!820409 (= lt!638979 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638976 lt!638978 mask!2687)))))

(declare-fun b!1458671 () Bool)

(assert (=> b!1458671 (= e!820412 e!820407)))

(declare-fun res!988823 () Bool)

(assert (=> b!1458671 (=> (not res!988823) (not e!820407))))

(assert (=> b!1458671 (= res!988823 (= (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458671 (= lt!638978 (array!98555 (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48118 a!2862)))))

(declare-fun b!1458672 () Bool)

(declare-fun res!988830 () Bool)

(assert (=> b!1458672 (=> (not res!988830) (not e!820406))))

(assert (=> b!1458672 (= res!988830 e!820409)))

(declare-fun c!134433 () Bool)

(assert (=> b!1458672 (= c!134433 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458673 () Bool)

(assert (=> b!1458673 (= e!820411 e!820406)))

(declare-fun res!988837 () Bool)

(assert (=> b!1458673 (=> (not res!988837) (not e!820406))))

(assert (=> b!1458673 (= res!988837 (= lt!638979 (Intermediate!11843 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458673 (= lt!638979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638976 mask!2687) lt!638976 lt!638978 mask!2687))))

(assert (=> b!1458673 (= lt!638976 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458674 () Bool)

(declare-fun res!988833 () Bool)

(assert (=> b!1458674 (=> (not res!988833) (not e!820411))))

(assert (=> b!1458674 (= res!988833 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638973))))

(declare-fun e!820413 () Bool)

(declare-fun b!1458675 () Bool)

(assert (=> b!1458675 (= e!820413 (not (= lt!638979 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638977 lt!638976 lt!638978 mask!2687))))))

(declare-fun b!1458676 () Bool)

(declare-fun res!988835 () Bool)

(assert (=> b!1458676 (=> res!988835 e!820408)))

(assert (=> b!1458676 (= res!988835 e!820413)))

(declare-fun c!134434 () Bool)

(assert (=> b!1458676 (= c!134434 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458677 () Bool)

(declare-fun res!988825 () Bool)

(assert (=> b!1458677 (=> (not res!988825) (not e!820412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458677 (= res!988825 (validKeyInArray!0 (select (arr!47566 a!2862) j!93)))))

(declare-fun b!1458678 () Bool)

(assert (=> b!1458678 (= e!820413 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638977 intermediateAfterIndex!19 lt!638976 lt!638978 mask!2687) lt!638972)))))

(declare-fun b!1458679 () Bool)

(assert (=> b!1458679 (= e!820406 (not e!820405))))

(declare-fun res!988826 () Bool)

(assert (=> b!1458679 (=> res!988826 e!820405)))

(assert (=> b!1458679 (= res!988826 (or (and (= (select (arr!47566 a!2862) index!646) (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!638974 () SeekEntryResult!11843)

(assert (=> b!1458679 (and (= lt!638974 (Found!11843 j!93)) (or (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) (select (arr!47566 a!2862) j!93))) (let ((bdg!53465 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47566 a!2862) index!646) bdg!53465) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53465 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458679 (= lt!638974 (seekEntryOrOpen!0 (select (arr!47566 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98554 (_ BitVec 32)) Bool)

(assert (=> b!1458679 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49023 0))(
  ( (Unit!49024) )
))
(declare-fun lt!638975 () Unit!49023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49023)

(assert (=> b!1458679 (= lt!638975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458680 () Bool)

(declare-fun res!988829 () Bool)

(assert (=> b!1458680 (=> (not res!988829) (not e!820412))))

(assert (=> b!1458680 (= res!988829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458681 () Bool)

(assert (=> b!1458681 (= e!820408 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1458681 (= lt!638974 lt!638972)))

(declare-fun lt!638971 () Unit!49023)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49023)

(assert (=> b!1458681 (= lt!638971 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!638977 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458682 () Bool)

(declare-fun res!988831 () Bool)

(assert (=> b!1458682 (=> (not res!988831) (not e!820412))))

(declare-datatypes ((List!34145 0))(
  ( (Nil!34142) (Cons!34141 (h!35491 (_ BitVec 64)) (t!48831 List!34145)) )
))
(declare-fun arrayNoDuplicates!0 (array!98554 (_ BitVec 32) List!34145) Bool)

(assert (=> b!1458682 (= res!988831 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34142))))

(declare-fun b!1458683 () Bool)

(assert (=> b!1458683 (= e!820409 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638976 lt!638978 mask!2687) (seekEntryOrOpen!0 lt!638976 lt!638978 mask!2687)))))

(declare-fun b!1458684 () Bool)

(declare-fun res!988827 () Bool)

(assert (=> b!1458684 (=> (not res!988827) (not e!820412))))

(assert (=> b!1458684 (= res!988827 (validKeyInArray!0 (select (arr!47566 a!2862) i!1006)))))

(assert (= (and start!125128 res!988834) b!1458666))

(assert (= (and b!1458666 res!988840) b!1458684))

(assert (= (and b!1458684 res!988827) b!1458677))

(assert (= (and b!1458677 res!988825) b!1458680))

(assert (= (and b!1458680 res!988829) b!1458682))

(assert (= (and b!1458682 res!988831) b!1458663))

(assert (= (and b!1458663 res!988838) b!1458671))

(assert (= (and b!1458671 res!988823) b!1458669))

(assert (= (and b!1458669 res!988836) b!1458674))

(assert (= (and b!1458674 res!988833) b!1458673))

(assert (= (and b!1458673 res!988837) b!1458672))

(assert (= (and b!1458672 c!134433) b!1458670))

(assert (= (and b!1458672 (not c!134433)) b!1458683))

(assert (= (and b!1458672 res!988830) b!1458667))

(assert (= (and b!1458667 res!988832) b!1458679))

(assert (= (and b!1458679 (not res!988826)) b!1458664))

(assert (= (and b!1458664 (not res!988828)) b!1458665))

(assert (= (and b!1458665 (not res!988824)) b!1458676))

(assert (= (and b!1458676 c!134434) b!1458675))

(assert (= (and b!1458676 (not c!134434)) b!1458678))

(assert (= (and b!1458676 (not res!988835)) b!1458668))

(assert (= (and b!1458668 (not res!988839)) b!1458681))

(declare-fun m!1345995 () Bool)

(assert (=> b!1458681 m!1345995))

(declare-fun m!1345997 () Bool)

(assert (=> b!1458678 m!1345997))

(declare-fun m!1345999 () Bool)

(assert (=> b!1458664 m!1345999))

(declare-fun m!1346001 () Bool)

(assert (=> b!1458664 m!1346001))

(declare-fun m!1346003 () Bool)

(assert (=> b!1458664 m!1346003))

(assert (=> b!1458683 m!1346001))

(assert (=> b!1458683 m!1346003))

(declare-fun m!1346005 () Bool)

(assert (=> b!1458665 m!1346005))

(assert (=> b!1458665 m!1346005))

(declare-fun m!1346007 () Bool)

(assert (=> b!1458665 m!1346007))

(declare-fun m!1346009 () Bool)

(assert (=> b!1458679 m!1346009))

(declare-fun m!1346011 () Bool)

(assert (=> b!1458679 m!1346011))

(declare-fun m!1346013 () Bool)

(assert (=> b!1458679 m!1346013))

(declare-fun m!1346015 () Bool)

(assert (=> b!1458679 m!1346015))

(declare-fun m!1346017 () Bool)

(assert (=> b!1458679 m!1346017))

(assert (=> b!1458679 m!1346005))

(declare-fun m!1346019 () Bool)

(assert (=> b!1458679 m!1346019))

(declare-fun m!1346021 () Bool)

(assert (=> b!1458679 m!1346021))

(assert (=> b!1458679 m!1346005))

(declare-fun m!1346023 () Bool)

(assert (=> b!1458675 m!1346023))

(assert (=> b!1458671 m!1346011))

(declare-fun m!1346025 () Bool)

(assert (=> b!1458671 m!1346025))

(declare-fun m!1346027 () Bool)

(assert (=> b!1458680 m!1346027))

(declare-fun m!1346029 () Bool)

(assert (=> b!1458682 m!1346029))

(assert (=> b!1458677 m!1346005))

(assert (=> b!1458677 m!1346005))

(declare-fun m!1346031 () Bool)

(assert (=> b!1458677 m!1346031))

(declare-fun m!1346033 () Bool)

(assert (=> b!1458684 m!1346033))

(assert (=> b!1458684 m!1346033))

(declare-fun m!1346035 () Bool)

(assert (=> b!1458684 m!1346035))

(declare-fun m!1346037 () Bool)

(assert (=> b!1458673 m!1346037))

(assert (=> b!1458673 m!1346037))

(declare-fun m!1346039 () Bool)

(assert (=> b!1458673 m!1346039))

(assert (=> b!1458673 m!1346011))

(declare-fun m!1346041 () Bool)

(assert (=> b!1458673 m!1346041))

(declare-fun m!1346043 () Bool)

(assert (=> b!1458670 m!1346043))

(assert (=> b!1458669 m!1346005))

(assert (=> b!1458669 m!1346005))

(declare-fun m!1346045 () Bool)

(assert (=> b!1458669 m!1346045))

(assert (=> b!1458669 m!1346045))

(assert (=> b!1458669 m!1346005))

(declare-fun m!1346047 () Bool)

(assert (=> b!1458669 m!1346047))

(declare-fun m!1346049 () Bool)

(assert (=> start!125128 m!1346049))

(declare-fun m!1346051 () Bool)

(assert (=> start!125128 m!1346051))

(assert (=> b!1458674 m!1346005))

(assert (=> b!1458674 m!1346005))

(declare-fun m!1346053 () Bool)

(assert (=> b!1458674 m!1346053))

(check-sat (not b!1458679) (not b!1458683) (not start!125128) (not b!1458682) (not b!1458684) (not b!1458675) (not b!1458669) (not b!1458664) (not b!1458678) (not b!1458681) (not b!1458674) (not b!1458680) (not b!1458677) (not b!1458670) (not b!1458665) (not b!1458673))
(check-sat)
