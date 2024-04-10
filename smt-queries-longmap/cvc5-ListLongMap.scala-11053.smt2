; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129150 () Bool)

(assert start!129150)

(declare-fun b!1515743 () Bool)

(declare-fun res!1035652 () Bool)

(declare-fun e!845852 () Bool)

(assert (=> b!1515743 (=> (not res!1035652) (not e!845852))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101006 0))(
  ( (array!101007 (arr!48740 (Array (_ BitVec 32) (_ BitVec 64))) (size!49290 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101006)

(assert (=> b!1515743 (= res!1035652 (and (= (size!49290 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49290 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49290 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515744 () Bool)

(declare-fun e!845851 () Bool)

(declare-fun e!845854 () Bool)

(assert (=> b!1515744 (= e!845851 (not e!845854))))

(declare-fun res!1035651 () Bool)

(assert (=> b!1515744 (=> res!1035651 e!845854)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657100 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515744 (= res!1035651 (or (not (= (select (arr!48740 a!2804) j!70) lt!657100)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48740 a!2804) index!487) (select (arr!48740 a!2804) j!70)) (not (= (select (arr!48740 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845849 () Bool)

(assert (=> b!1515744 e!845849))

(declare-fun res!1035649 () Bool)

(assert (=> b!1515744 (=> (not res!1035649) (not e!845849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101006 (_ BitVec 32)) Bool)

(assert (=> b!1515744 (= res!1035649 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50690 0))(
  ( (Unit!50691) )
))
(declare-fun lt!657104 () Unit!50690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50690)

(assert (=> b!1515744 (= lt!657104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515745 () Bool)

(declare-fun res!1035646 () Bool)

(declare-fun e!845853 () Bool)

(assert (=> b!1515745 (=> (not res!1035646) (not e!845853))))

(declare-datatypes ((SeekEntryResult!12911 0))(
  ( (MissingZero!12911 (index!54039 (_ BitVec 32))) (Found!12911 (index!54040 (_ BitVec 32))) (Intermediate!12911 (undefined!13723 Bool) (index!54041 (_ BitVec 32)) (x!135741 (_ BitVec 32))) (Undefined!12911) (MissingVacant!12911 (index!54042 (_ BitVec 32))) )
))
(declare-fun lt!657105 () SeekEntryResult!12911)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101006 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1515745 (= res!1035646 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48740 a!2804) j!70) a!2804 mask!2512) lt!657105))))

(declare-fun b!1515746 () Bool)

(declare-fun res!1035650 () Bool)

(assert (=> b!1515746 (=> (not res!1035650) (not e!845852))))

(declare-datatypes ((List!35223 0))(
  ( (Nil!35220) (Cons!35219 (h!36631 (_ BitVec 64)) (t!49917 List!35223)) )
))
(declare-fun arrayNoDuplicates!0 (array!101006 (_ BitVec 32) List!35223) Bool)

(assert (=> b!1515746 (= res!1035650 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35220))))

(declare-fun res!1035653 () Bool)

(assert (=> start!129150 (=> (not res!1035653) (not e!845852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129150 (= res!1035653 (validMask!0 mask!2512))))

(assert (=> start!129150 e!845852))

(assert (=> start!129150 true))

(declare-fun array_inv!37768 (array!101006) Bool)

(assert (=> start!129150 (array_inv!37768 a!2804)))

(declare-fun b!1515747 () Bool)

(declare-fun res!1035658 () Bool)

(assert (=> b!1515747 (=> (not res!1035658) (not e!845852))))

(assert (=> b!1515747 (= res!1035658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515748 () Bool)

(assert (=> b!1515748 (= e!845852 e!845853)))

(declare-fun res!1035647 () Bool)

(assert (=> b!1515748 (=> (not res!1035647) (not e!845853))))

(declare-fun lt!657106 () SeekEntryResult!12911)

(assert (=> b!1515748 (= res!1035647 (= lt!657106 lt!657105))))

(assert (=> b!1515748 (= lt!657105 (Intermediate!12911 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515748 (= lt!657106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48740 a!2804) j!70) mask!2512) (select (arr!48740 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515749 () Bool)

(declare-fun res!1035655 () Bool)

(assert (=> b!1515749 (=> (not res!1035655) (not e!845852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515749 (= res!1035655 (validKeyInArray!0 (select (arr!48740 a!2804) i!961)))))

(declare-fun b!1515750 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101006 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1515750 (= e!845849 (= (seekEntry!0 (select (arr!48740 a!2804) j!70) a!2804 mask!2512) (Found!12911 j!70)))))

(declare-fun b!1515751 () Bool)

(assert (=> b!1515751 (= e!845853 e!845851)))

(declare-fun res!1035654 () Bool)

(assert (=> b!1515751 (=> (not res!1035654) (not e!845851))))

(declare-fun lt!657107 () array!101006)

(assert (=> b!1515751 (= res!1035654 (= lt!657106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657100 mask!2512) lt!657100 lt!657107 mask!2512)))))

(assert (=> b!1515751 (= lt!657100 (select (store (arr!48740 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515751 (= lt!657107 (array!101007 (store (arr!48740 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49290 a!2804)))))

(declare-fun b!1515752 () Bool)

(declare-fun res!1035648 () Bool)

(assert (=> b!1515752 (=> (not res!1035648) (not e!845852))))

(assert (=> b!1515752 (= res!1035648 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49290 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49290 a!2804))))))

(declare-fun b!1515753 () Bool)

(declare-fun e!845850 () Bool)

(assert (=> b!1515753 (= e!845854 e!845850)))

(declare-fun res!1035657 () Bool)

(assert (=> b!1515753 (=> res!1035657 e!845850)))

(declare-fun lt!657102 () SeekEntryResult!12911)

(assert (=> b!1515753 (= res!1035657 (not (= lt!657102 (Found!12911 j!70))))))

(declare-fun lt!657108 () SeekEntryResult!12911)

(declare-fun lt!657101 () SeekEntryResult!12911)

(assert (=> b!1515753 (= lt!657108 lt!657101)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101006 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1515753 (= lt!657101 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657100 lt!657107 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101006 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1515753 (= lt!657108 (seekEntryOrOpen!0 lt!657100 lt!657107 mask!2512))))

(declare-fun lt!657109 () SeekEntryResult!12911)

(assert (=> b!1515753 (= lt!657109 lt!657102)))

(assert (=> b!1515753 (= lt!657102 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48740 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515753 (= lt!657109 (seekEntryOrOpen!0 (select (arr!48740 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515754 () Bool)

(declare-fun res!1035656 () Bool)

(assert (=> b!1515754 (=> (not res!1035656) (not e!845852))))

(assert (=> b!1515754 (= res!1035656 (validKeyInArray!0 (select (arr!48740 a!2804) j!70)))))

(declare-fun b!1515755 () Bool)

(assert (=> b!1515755 (= e!845850 true)))

(assert (=> b!1515755 (= lt!657101 lt!657102)))

(declare-fun lt!657103 () Unit!50690)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50690)

(assert (=> b!1515755 (= lt!657103 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!129150 res!1035653) b!1515743))

(assert (= (and b!1515743 res!1035652) b!1515749))

(assert (= (and b!1515749 res!1035655) b!1515754))

(assert (= (and b!1515754 res!1035656) b!1515747))

(assert (= (and b!1515747 res!1035658) b!1515746))

(assert (= (and b!1515746 res!1035650) b!1515752))

(assert (= (and b!1515752 res!1035648) b!1515748))

(assert (= (and b!1515748 res!1035647) b!1515745))

(assert (= (and b!1515745 res!1035646) b!1515751))

(assert (= (and b!1515751 res!1035654) b!1515744))

(assert (= (and b!1515744 res!1035649) b!1515750))

(assert (= (and b!1515744 (not res!1035651)) b!1515753))

(assert (= (and b!1515753 (not res!1035657)) b!1515755))

(declare-fun m!1398919 () Bool)

(assert (=> b!1515750 m!1398919))

(assert (=> b!1515750 m!1398919))

(declare-fun m!1398921 () Bool)

(assert (=> b!1515750 m!1398921))

(declare-fun m!1398923 () Bool)

(assert (=> b!1515747 m!1398923))

(declare-fun m!1398925 () Bool)

(assert (=> b!1515751 m!1398925))

(assert (=> b!1515751 m!1398925))

(declare-fun m!1398927 () Bool)

(assert (=> b!1515751 m!1398927))

(declare-fun m!1398929 () Bool)

(assert (=> b!1515751 m!1398929))

(declare-fun m!1398931 () Bool)

(assert (=> b!1515751 m!1398931))

(declare-fun m!1398933 () Bool)

(assert (=> start!129150 m!1398933))

(declare-fun m!1398935 () Bool)

(assert (=> start!129150 m!1398935))

(declare-fun m!1398937 () Bool)

(assert (=> b!1515749 m!1398937))

(assert (=> b!1515749 m!1398937))

(declare-fun m!1398939 () Bool)

(assert (=> b!1515749 m!1398939))

(assert (=> b!1515753 m!1398919))

(declare-fun m!1398941 () Bool)

(assert (=> b!1515753 m!1398941))

(assert (=> b!1515753 m!1398919))

(assert (=> b!1515753 m!1398919))

(declare-fun m!1398943 () Bool)

(assert (=> b!1515753 m!1398943))

(declare-fun m!1398945 () Bool)

(assert (=> b!1515753 m!1398945))

(declare-fun m!1398947 () Bool)

(assert (=> b!1515753 m!1398947))

(assert (=> b!1515744 m!1398919))

(declare-fun m!1398949 () Bool)

(assert (=> b!1515744 m!1398949))

(declare-fun m!1398951 () Bool)

(assert (=> b!1515744 m!1398951))

(declare-fun m!1398953 () Bool)

(assert (=> b!1515744 m!1398953))

(assert (=> b!1515748 m!1398919))

(assert (=> b!1515748 m!1398919))

(declare-fun m!1398955 () Bool)

(assert (=> b!1515748 m!1398955))

(assert (=> b!1515748 m!1398955))

(assert (=> b!1515748 m!1398919))

(declare-fun m!1398957 () Bool)

(assert (=> b!1515748 m!1398957))

(assert (=> b!1515745 m!1398919))

(assert (=> b!1515745 m!1398919))

(declare-fun m!1398959 () Bool)

(assert (=> b!1515745 m!1398959))

(assert (=> b!1515754 m!1398919))

(assert (=> b!1515754 m!1398919))

(declare-fun m!1398961 () Bool)

(assert (=> b!1515754 m!1398961))

(declare-fun m!1398963 () Bool)

(assert (=> b!1515755 m!1398963))

(declare-fun m!1398965 () Bool)

(assert (=> b!1515746 m!1398965))

(push 1)

