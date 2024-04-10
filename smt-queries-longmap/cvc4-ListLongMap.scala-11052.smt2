; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129148 () Bool)

(assert start!129148)

(declare-fun b!1515705 () Bool)

(declare-fun e!845830 () Bool)

(declare-fun e!845831 () Bool)

(assert (=> b!1515705 (= e!845830 e!845831)))

(declare-fun res!1035613 () Bool)

(assert (=> b!1515705 (=> (not res!1035613) (not e!845831))))

(declare-datatypes ((SeekEntryResult!12910 0))(
  ( (MissingZero!12910 (index!54035 (_ BitVec 32))) (Found!12910 (index!54036 (_ BitVec 32))) (Intermediate!12910 (undefined!13722 Bool) (index!54037 (_ BitVec 32)) (x!135732 (_ BitVec 32))) (Undefined!12910) (MissingVacant!12910 (index!54038 (_ BitVec 32))) )
))
(declare-fun lt!657075 () SeekEntryResult!12910)

(declare-fun lt!657073 () SeekEntryResult!12910)

(assert (=> b!1515705 (= res!1035613 (= lt!657075 lt!657073))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515705 (= lt!657073 (Intermediate!12910 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101004 0))(
  ( (array!101005 (arr!48739 (Array (_ BitVec 32) (_ BitVec 64))) (size!49289 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101004)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101004 (_ BitVec 32)) SeekEntryResult!12910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515705 (= lt!657075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48739 a!2804) j!70) mask!2512) (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515706 () Bool)

(declare-fun e!845829 () Bool)

(assert (=> b!1515706 (= e!845829 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!657079 () SeekEntryResult!12910)

(declare-fun lt!657077 () SeekEntryResult!12910)

(assert (=> b!1515706 (= lt!657079 lt!657077)))

(declare-datatypes ((Unit!50688 0))(
  ( (Unit!50689) )
))
(declare-fun lt!657072 () Unit!50688)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50688)

(assert (=> b!1515706 (= lt!657072 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515707 () Bool)

(declare-fun e!845832 () Bool)

(declare-fun e!845833 () Bool)

(assert (=> b!1515707 (= e!845832 (not e!845833))))

(declare-fun res!1035616 () Bool)

(assert (=> b!1515707 (=> res!1035616 e!845833)))

(declare-fun lt!657076 () (_ BitVec 64))

(assert (=> b!1515707 (= res!1035616 (or (not (= (select (arr!48739 a!2804) j!70) lt!657076)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48739 a!2804) index!487) (select (arr!48739 a!2804) j!70)) (not (= (select (arr!48739 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845828 () Bool)

(assert (=> b!1515707 e!845828))

(declare-fun res!1035614 () Bool)

(assert (=> b!1515707 (=> (not res!1035614) (not e!845828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101004 (_ BitVec 32)) Bool)

(assert (=> b!1515707 (= res!1035614 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657071 () Unit!50688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50688)

(assert (=> b!1515707 (= lt!657071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515708 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101004 (_ BitVec 32)) SeekEntryResult!12910)

(assert (=> b!1515708 (= e!845828 (= (seekEntry!0 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) (Found!12910 j!70)))))

(declare-fun b!1515709 () Bool)

(declare-fun res!1035618 () Bool)

(assert (=> b!1515709 (=> (not res!1035618) (not e!845831))))

(assert (=> b!1515709 (= res!1035618 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) lt!657073))))

(declare-fun b!1515710 () Bool)

(declare-fun res!1035611 () Bool)

(assert (=> b!1515710 (=> (not res!1035611) (not e!845830))))

(declare-datatypes ((List!35222 0))(
  ( (Nil!35219) (Cons!35218 (h!36630 (_ BitVec 64)) (t!49916 List!35222)) )
))
(declare-fun arrayNoDuplicates!0 (array!101004 (_ BitVec 32) List!35222) Bool)

(assert (=> b!1515710 (= res!1035611 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35219))))

(declare-fun b!1515711 () Bool)

(declare-fun res!1035609 () Bool)

(assert (=> b!1515711 (=> (not res!1035609) (not e!845830))))

(assert (=> b!1515711 (= res!1035609 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49289 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49289 a!2804))))))

(declare-fun b!1515712 () Bool)

(declare-fun res!1035610 () Bool)

(assert (=> b!1515712 (=> (not res!1035610) (not e!845830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515712 (= res!1035610 (validKeyInArray!0 (select (arr!48739 a!2804) j!70)))))

(declare-fun b!1515713 () Bool)

(declare-fun res!1035607 () Bool)

(assert (=> b!1515713 (=> (not res!1035607) (not e!845830))))

(assert (=> b!1515713 (= res!1035607 (and (= (size!49289 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49289 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49289 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1035617 () Bool)

(assert (=> start!129148 (=> (not res!1035617) (not e!845830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129148 (= res!1035617 (validMask!0 mask!2512))))

(assert (=> start!129148 e!845830))

(assert (=> start!129148 true))

(declare-fun array_inv!37767 (array!101004) Bool)

(assert (=> start!129148 (array_inv!37767 a!2804)))

(declare-fun b!1515704 () Bool)

(assert (=> b!1515704 (= e!845833 e!845829)))

(declare-fun res!1035619 () Bool)

(assert (=> b!1515704 (=> res!1035619 e!845829)))

(assert (=> b!1515704 (= res!1035619 (not (= lt!657077 (Found!12910 j!70))))))

(declare-fun lt!657074 () SeekEntryResult!12910)

(assert (=> b!1515704 (= lt!657074 lt!657079)))

(declare-fun lt!657070 () array!101004)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101004 (_ BitVec 32)) SeekEntryResult!12910)

(assert (=> b!1515704 (= lt!657079 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657076 lt!657070 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101004 (_ BitVec 32)) SeekEntryResult!12910)

(assert (=> b!1515704 (= lt!657074 (seekEntryOrOpen!0 lt!657076 lt!657070 mask!2512))))

(declare-fun lt!657078 () SeekEntryResult!12910)

(assert (=> b!1515704 (= lt!657078 lt!657077)))

(assert (=> b!1515704 (= lt!657077 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515704 (= lt!657078 (seekEntryOrOpen!0 (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515714 () Bool)

(declare-fun res!1035615 () Bool)

(assert (=> b!1515714 (=> (not res!1035615) (not e!845830))))

(assert (=> b!1515714 (= res!1035615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515715 () Bool)

(assert (=> b!1515715 (= e!845831 e!845832)))

(declare-fun res!1035612 () Bool)

(assert (=> b!1515715 (=> (not res!1035612) (not e!845832))))

(assert (=> b!1515715 (= res!1035612 (= lt!657075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657076 mask!2512) lt!657076 lt!657070 mask!2512)))))

(assert (=> b!1515715 (= lt!657076 (select (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515715 (= lt!657070 (array!101005 (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49289 a!2804)))))

(declare-fun b!1515716 () Bool)

(declare-fun res!1035608 () Bool)

(assert (=> b!1515716 (=> (not res!1035608) (not e!845830))))

(assert (=> b!1515716 (= res!1035608 (validKeyInArray!0 (select (arr!48739 a!2804) i!961)))))

(assert (= (and start!129148 res!1035617) b!1515713))

(assert (= (and b!1515713 res!1035607) b!1515716))

(assert (= (and b!1515716 res!1035608) b!1515712))

(assert (= (and b!1515712 res!1035610) b!1515714))

(assert (= (and b!1515714 res!1035615) b!1515710))

(assert (= (and b!1515710 res!1035611) b!1515711))

(assert (= (and b!1515711 res!1035609) b!1515705))

(assert (= (and b!1515705 res!1035613) b!1515709))

(assert (= (and b!1515709 res!1035618) b!1515715))

(assert (= (and b!1515715 res!1035612) b!1515707))

(assert (= (and b!1515707 res!1035614) b!1515708))

(assert (= (and b!1515707 (not res!1035616)) b!1515704))

(assert (= (and b!1515704 (not res!1035619)) b!1515706))

(declare-fun m!1398871 () Bool)

(assert (=> b!1515709 m!1398871))

(assert (=> b!1515709 m!1398871))

(declare-fun m!1398873 () Bool)

(assert (=> b!1515709 m!1398873))

(assert (=> b!1515708 m!1398871))

(assert (=> b!1515708 m!1398871))

(declare-fun m!1398875 () Bool)

(assert (=> b!1515708 m!1398875))

(assert (=> b!1515704 m!1398871))

(declare-fun m!1398877 () Bool)

(assert (=> b!1515704 m!1398877))

(assert (=> b!1515704 m!1398871))

(declare-fun m!1398879 () Bool)

(assert (=> b!1515704 m!1398879))

(declare-fun m!1398881 () Bool)

(assert (=> b!1515704 m!1398881))

(assert (=> b!1515704 m!1398871))

(declare-fun m!1398883 () Bool)

(assert (=> b!1515704 m!1398883))

(declare-fun m!1398885 () Bool)

(assert (=> b!1515706 m!1398885))

(declare-fun m!1398887 () Bool)

(assert (=> b!1515716 m!1398887))

(assert (=> b!1515716 m!1398887))

(declare-fun m!1398889 () Bool)

(assert (=> b!1515716 m!1398889))

(declare-fun m!1398891 () Bool)

(assert (=> b!1515715 m!1398891))

(assert (=> b!1515715 m!1398891))

(declare-fun m!1398893 () Bool)

(assert (=> b!1515715 m!1398893))

(declare-fun m!1398895 () Bool)

(assert (=> b!1515715 m!1398895))

(declare-fun m!1398897 () Bool)

(assert (=> b!1515715 m!1398897))

(assert (=> b!1515707 m!1398871))

(declare-fun m!1398899 () Bool)

(assert (=> b!1515707 m!1398899))

(declare-fun m!1398901 () Bool)

(assert (=> b!1515707 m!1398901))

(declare-fun m!1398903 () Bool)

(assert (=> b!1515707 m!1398903))

(declare-fun m!1398905 () Bool)

(assert (=> b!1515714 m!1398905))

(assert (=> b!1515712 m!1398871))

(assert (=> b!1515712 m!1398871))

(declare-fun m!1398907 () Bool)

(assert (=> b!1515712 m!1398907))

(declare-fun m!1398909 () Bool)

(assert (=> b!1515710 m!1398909))

(declare-fun m!1398911 () Bool)

(assert (=> start!129148 m!1398911))

(declare-fun m!1398913 () Bool)

(assert (=> start!129148 m!1398913))

(assert (=> b!1515705 m!1398871))

(assert (=> b!1515705 m!1398871))

(declare-fun m!1398915 () Bool)

(assert (=> b!1515705 m!1398915))

(assert (=> b!1515705 m!1398915))

(assert (=> b!1515705 m!1398871))

(declare-fun m!1398917 () Bool)

(assert (=> b!1515705 m!1398917))

(push 1)

(assert (not start!129148))

