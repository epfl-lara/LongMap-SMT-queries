; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129368 () Bool)

(assert start!129368)

(declare-fun b!1515867 () Bool)

(declare-fun e!846104 () Bool)

(declare-fun e!846105 () Bool)

(assert (=> b!1515867 (= e!846104 e!846105)))

(declare-fun res!1034599 () Bool)

(assert (=> b!1515867 (=> res!1034599 e!846105)))

(declare-fun lt!656857 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101038 0))(
  ( (array!101039 (arr!48751 (Array (_ BitVec 32) (_ BitVec 64))) (size!49302 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101038)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515867 (= res!1034599 (or (not (= (select (arr!48751 a!2804) j!70) lt!656857)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48751 a!2804) index!487) (select (arr!48751 a!2804) j!70)) (not (= (select (arr!48751 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515868 () Bool)

(declare-fun res!1034596 () Bool)

(declare-fun e!846107 () Bool)

(assert (=> b!1515868 (=> (not res!1034596) (not e!846107))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101038 (_ BitVec 32)) Bool)

(assert (=> b!1515868 (= res!1034596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515870 () Bool)

(declare-fun res!1034605 () Bool)

(assert (=> b!1515870 (=> (not res!1034605) (not e!846107))))

(assert (=> b!1515870 (= res!1034605 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49302 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49302 a!2804))))))

(declare-fun b!1515871 () Bool)

(declare-fun e!846102 () Bool)

(assert (=> b!1515871 (= e!846107 e!846102)))

(declare-fun res!1034601 () Bool)

(assert (=> b!1515871 (=> (not res!1034601) (not e!846102))))

(declare-datatypes ((SeekEntryResult!12815 0))(
  ( (MissingZero!12815 (index!53655 (_ BitVec 32))) (Found!12815 (index!53656 (_ BitVec 32))) (Intermediate!12815 (undefined!13627 Bool) (index!53657 (_ BitVec 32)) (x!135570 (_ BitVec 32))) (Undefined!12815) (MissingVacant!12815 (index!53658 (_ BitVec 32))) )
))
(declare-fun lt!656854 () SeekEntryResult!12815)

(declare-fun lt!656853 () SeekEntryResult!12815)

(assert (=> b!1515871 (= res!1034601 (= lt!656854 lt!656853))))

(assert (=> b!1515871 (= lt!656853 (Intermediate!12815 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515871 (= lt!656854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48751 a!2804) j!70) mask!2512) (select (arr!48751 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515872 () Bool)

(declare-fun res!1034597 () Bool)

(assert (=> b!1515872 (=> (not res!1034597) (not e!846107))))

(declare-datatypes ((List!35221 0))(
  ( (Nil!35218) (Cons!35217 (h!36644 (_ BitVec 64)) (t!49907 List!35221)) )
))
(declare-fun arrayNoDuplicates!0 (array!101038 (_ BitVec 32) List!35221) Bool)

(assert (=> b!1515872 (= res!1034597 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35218))))

(declare-fun b!1515873 () Bool)

(declare-fun res!1034602 () Bool)

(assert (=> b!1515873 (=> (not res!1034602) (not e!846107))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515873 (= res!1034602 (validKeyInArray!0 (select (arr!48751 a!2804) i!961)))))

(declare-fun b!1515874 () Bool)

(declare-fun res!1034594 () Bool)

(assert (=> b!1515874 (=> (not res!1034594) (not e!846107))))

(assert (=> b!1515874 (= res!1034594 (validKeyInArray!0 (select (arr!48751 a!2804) j!70)))))

(declare-fun b!1515875 () Bool)

(declare-fun e!846108 () Bool)

(assert (=> b!1515875 (= e!846102 e!846108)))

(declare-fun res!1034606 () Bool)

(assert (=> b!1515875 (=> (not res!1034606) (not e!846108))))

(declare-fun lt!656855 () array!101038)

(assert (=> b!1515875 (= res!1034606 (= lt!656854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656857 mask!2512) lt!656857 lt!656855 mask!2512)))))

(assert (=> b!1515875 (= lt!656857 (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515875 (= lt!656855 (array!101039 (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49302 a!2804)))))

(declare-fun b!1515876 () Bool)

(declare-fun res!1034603 () Bool)

(assert (=> b!1515876 (=> (not res!1034603) (not e!846102))))

(assert (=> b!1515876 (= res!1034603 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) lt!656853))))

(declare-fun b!1515877 () Bool)

(declare-fun res!1034595 () Bool)

(assert (=> b!1515877 (=> (not res!1034595) (not e!846107))))

(assert (=> b!1515877 (= res!1034595 (and (= (size!49302 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49302 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49302 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515878 () Bool)

(declare-fun e!846106 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12815)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12815)

(assert (=> b!1515878 (= e!846106 (= (seekEntryOrOpen!0 lt!656857 lt!656855 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656857 lt!656855 mask!2512)))))

(declare-fun res!1034598 () Bool)

(assert (=> start!129368 (=> (not res!1034598) (not e!846107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129368 (= res!1034598 (validMask!0 mask!2512))))

(assert (=> start!129368 e!846107))

(assert (=> start!129368 true))

(declare-fun array_inv!38032 (array!101038) Bool)

(assert (=> start!129368 (array_inv!38032 a!2804)))

(declare-fun b!1515869 () Bool)

(assert (=> b!1515869 (= e!846105 e!846106)))

(declare-fun res!1034600 () Bool)

(assert (=> b!1515869 (=> (not res!1034600) (not e!846106))))

(assert (=> b!1515869 (= res!1034600 (= (seekEntryOrOpen!0 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48751 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1515879 () Bool)

(assert (=> b!1515879 (= e!846108 (not true))))

(assert (=> b!1515879 e!846104))

(declare-fun res!1034604 () Bool)

(assert (=> b!1515879 (=> (not res!1034604) (not e!846104))))

(assert (=> b!1515879 (= res!1034604 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50533 0))(
  ( (Unit!50534) )
))
(declare-fun lt!656856 () Unit!50533)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50533)

(assert (=> b!1515879 (= lt!656856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515880 () Bool)

(declare-fun res!1034593 () Bool)

(assert (=> b!1515880 (=> (not res!1034593) (not e!846104))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12815)

(assert (=> b!1515880 (= res!1034593 (= (seekEntry!0 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) (Found!12815 j!70)))))

(assert (= (and start!129368 res!1034598) b!1515877))

(assert (= (and b!1515877 res!1034595) b!1515873))

(assert (= (and b!1515873 res!1034602) b!1515874))

(assert (= (and b!1515874 res!1034594) b!1515868))

(assert (= (and b!1515868 res!1034596) b!1515872))

(assert (= (and b!1515872 res!1034597) b!1515870))

(assert (= (and b!1515870 res!1034605) b!1515871))

(assert (= (and b!1515871 res!1034601) b!1515876))

(assert (= (and b!1515876 res!1034603) b!1515875))

(assert (= (and b!1515875 res!1034606) b!1515879))

(assert (= (and b!1515879 res!1034604) b!1515880))

(assert (= (and b!1515880 res!1034593) b!1515867))

(assert (= (and b!1515867 (not res!1034599)) b!1515869))

(assert (= (and b!1515869 res!1034600) b!1515878))

(declare-fun m!1398747 () Bool)

(assert (=> b!1515869 m!1398747))

(assert (=> b!1515869 m!1398747))

(declare-fun m!1398749 () Bool)

(assert (=> b!1515869 m!1398749))

(assert (=> b!1515869 m!1398747))

(declare-fun m!1398751 () Bool)

(assert (=> b!1515869 m!1398751))

(declare-fun m!1398753 () Bool)

(assert (=> b!1515878 m!1398753))

(declare-fun m!1398755 () Bool)

(assert (=> b!1515878 m!1398755))

(assert (=> b!1515876 m!1398747))

(assert (=> b!1515876 m!1398747))

(declare-fun m!1398757 () Bool)

(assert (=> b!1515876 m!1398757))

(assert (=> b!1515880 m!1398747))

(assert (=> b!1515880 m!1398747))

(declare-fun m!1398759 () Bool)

(assert (=> b!1515880 m!1398759))

(declare-fun m!1398761 () Bool)

(assert (=> b!1515875 m!1398761))

(assert (=> b!1515875 m!1398761))

(declare-fun m!1398763 () Bool)

(assert (=> b!1515875 m!1398763))

(declare-fun m!1398765 () Bool)

(assert (=> b!1515875 m!1398765))

(declare-fun m!1398767 () Bool)

(assert (=> b!1515875 m!1398767))

(declare-fun m!1398769 () Bool)

(assert (=> start!129368 m!1398769))

(declare-fun m!1398771 () Bool)

(assert (=> start!129368 m!1398771))

(declare-fun m!1398773 () Bool)

(assert (=> b!1515873 m!1398773))

(assert (=> b!1515873 m!1398773))

(declare-fun m!1398775 () Bool)

(assert (=> b!1515873 m!1398775))

(assert (=> b!1515874 m!1398747))

(assert (=> b!1515874 m!1398747))

(declare-fun m!1398777 () Bool)

(assert (=> b!1515874 m!1398777))

(assert (=> b!1515871 m!1398747))

(assert (=> b!1515871 m!1398747))

(declare-fun m!1398779 () Bool)

(assert (=> b!1515871 m!1398779))

(assert (=> b!1515871 m!1398779))

(assert (=> b!1515871 m!1398747))

(declare-fun m!1398781 () Bool)

(assert (=> b!1515871 m!1398781))

(declare-fun m!1398783 () Bool)

(assert (=> b!1515879 m!1398783))

(declare-fun m!1398785 () Bool)

(assert (=> b!1515879 m!1398785))

(assert (=> b!1515867 m!1398747))

(declare-fun m!1398787 () Bool)

(assert (=> b!1515867 m!1398787))

(declare-fun m!1398789 () Bool)

(assert (=> b!1515868 m!1398789))

(declare-fun m!1398791 () Bool)

(assert (=> b!1515872 m!1398791))

(check-sat (not b!1515874) (not b!1515878) (not b!1515876) (not b!1515875) (not b!1515880) (not b!1515869) (not b!1515871) (not b!1515873) (not b!1515872) (not b!1515868) (not start!129368) (not b!1515879))
(check-sat)
