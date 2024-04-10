; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129058 () Bool)

(assert start!129058)

(declare-fun b!1513867 () Bool)

(declare-fun e!844887 () Bool)

(declare-fun e!844885 () Bool)

(assert (=> b!1513867 (= e!844887 e!844885)))

(declare-fun res!1033771 () Bool)

(assert (=> b!1513867 (=> (not res!1033771) (not e!844885))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100914 0))(
  ( (array!100915 (arr!48694 (Array (_ BitVec 32) (_ BitVec 64))) (size!49244 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100914)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12865 0))(
  ( (MissingZero!12865 (index!53855 (_ BitVec 32))) (Found!12865 (index!53856 (_ BitVec 32))) (Intermediate!12865 (undefined!13677 Bool) (index!53857 (_ BitVec 32)) (x!135567 (_ BitVec 32))) (Undefined!12865) (MissingVacant!12865 (index!53858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100914 (_ BitVec 32)) SeekEntryResult!12865)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100914 (_ BitVec 32)) SeekEntryResult!12865)

(assert (=> b!1513867 (= res!1033771 (= (seekEntryOrOpen!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513868 () Bool)

(declare-fun res!1033770 () Bool)

(declare-fun e!844884 () Bool)

(assert (=> b!1513868 (=> (not res!1033770) (not e!844884))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513868 (= res!1033770 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49244 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49244 a!2804))))))

(declare-fun b!1513869 () Bool)

(declare-fun e!844882 () Bool)

(assert (=> b!1513869 (= e!844882 (not true))))

(declare-fun e!844883 () Bool)

(assert (=> b!1513869 e!844883))

(declare-fun res!1033772 () Bool)

(assert (=> b!1513869 (=> (not res!1033772) (not e!844883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100914 (_ BitVec 32)) Bool)

(assert (=> b!1513869 (= res!1033772 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50598 0))(
  ( (Unit!50599) )
))
(declare-fun lt!656131 () Unit!50598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50598)

(assert (=> b!1513869 (= lt!656131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513870 () Bool)

(declare-fun e!844886 () Bool)

(assert (=> b!1513870 (= e!844886 e!844882)))

(declare-fun res!1033779 () Bool)

(assert (=> b!1513870 (=> (not res!1033779) (not e!844882))))

(declare-fun lt!656133 () (_ BitVec 64))

(declare-fun lt!656132 () SeekEntryResult!12865)

(declare-fun lt!656134 () array!100914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100914 (_ BitVec 32)) SeekEntryResult!12865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513870 (= res!1033779 (= lt!656132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656133 mask!2512) lt!656133 lt!656134 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513870 (= lt!656133 (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513870 (= lt!656134 (array!100915 (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49244 a!2804)))))

(declare-fun b!1513871 () Bool)

(declare-fun res!1033774 () Bool)

(assert (=> b!1513871 (=> (not res!1033774) (not e!844886))))

(declare-fun lt!656130 () SeekEntryResult!12865)

(assert (=> b!1513871 (= res!1033774 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) lt!656130))))

(declare-fun b!1513872 () Bool)

(declare-fun res!1033781 () Bool)

(assert (=> b!1513872 (=> (not res!1033781) (not e!844884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513872 (= res!1033781 (validKeyInArray!0 (select (arr!48694 a!2804) j!70)))))

(declare-fun b!1513873 () Bool)

(declare-fun res!1033773 () Bool)

(assert (=> b!1513873 (=> (not res!1033773) (not e!844884))))

(assert (=> b!1513873 (= res!1033773 (validKeyInArray!0 (select (arr!48694 a!2804) i!961)))))

(declare-fun res!1033777 () Bool)

(assert (=> start!129058 (=> (not res!1033777) (not e!844884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129058 (= res!1033777 (validMask!0 mask!2512))))

(assert (=> start!129058 e!844884))

(assert (=> start!129058 true))

(declare-fun array_inv!37722 (array!100914) Bool)

(assert (=> start!129058 (array_inv!37722 a!2804)))

(declare-fun b!1513874 () Bool)

(declare-fun res!1033776 () Bool)

(assert (=> b!1513874 (=> (not res!1033776) (not e!844884))))

(assert (=> b!1513874 (= res!1033776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513875 () Bool)

(declare-fun res!1033783 () Bool)

(assert (=> b!1513875 (=> (not res!1033783) (not e!844883))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100914 (_ BitVec 32)) SeekEntryResult!12865)

(assert (=> b!1513875 (= res!1033783 (= (seekEntry!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (Found!12865 j!70)))))

(declare-fun b!1513876 () Bool)

(assert (=> b!1513876 (= e!844884 e!844886)))

(declare-fun res!1033778 () Bool)

(assert (=> b!1513876 (=> (not res!1033778) (not e!844886))))

(assert (=> b!1513876 (= res!1033778 (= lt!656132 lt!656130))))

(assert (=> b!1513876 (= lt!656130 (Intermediate!12865 false resIndex!21 resX!21))))

(assert (=> b!1513876 (= lt!656132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48694 a!2804) j!70) mask!2512) (select (arr!48694 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513877 () Bool)

(assert (=> b!1513877 (= e!844883 e!844887)))

(declare-fun res!1033780 () Bool)

(assert (=> b!1513877 (=> res!1033780 e!844887)))

(assert (=> b!1513877 (= res!1033780 (or (not (= (select (arr!48694 a!2804) j!70) lt!656133)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48694 a!2804) index!487) (select (arr!48694 a!2804) j!70)) (not (= (select (arr!48694 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513878 () Bool)

(assert (=> b!1513878 (= e!844885 (= (seekEntryOrOpen!0 lt!656133 lt!656134 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656133 lt!656134 mask!2512)))))

(declare-fun b!1513879 () Bool)

(declare-fun res!1033775 () Bool)

(assert (=> b!1513879 (=> (not res!1033775) (not e!844884))))

(declare-datatypes ((List!35177 0))(
  ( (Nil!35174) (Cons!35173 (h!36585 (_ BitVec 64)) (t!49871 List!35177)) )
))
(declare-fun arrayNoDuplicates!0 (array!100914 (_ BitVec 32) List!35177) Bool)

(assert (=> b!1513879 (= res!1033775 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35174))))

(declare-fun b!1513880 () Bool)

(declare-fun res!1033782 () Bool)

(assert (=> b!1513880 (=> (not res!1033782) (not e!844884))))

(assert (=> b!1513880 (= res!1033782 (and (= (size!49244 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49244 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49244 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129058 res!1033777) b!1513880))

(assert (= (and b!1513880 res!1033782) b!1513873))

(assert (= (and b!1513873 res!1033773) b!1513872))

(assert (= (and b!1513872 res!1033781) b!1513874))

(assert (= (and b!1513874 res!1033776) b!1513879))

(assert (= (and b!1513879 res!1033775) b!1513868))

(assert (= (and b!1513868 res!1033770) b!1513876))

(assert (= (and b!1513876 res!1033778) b!1513871))

(assert (= (and b!1513871 res!1033774) b!1513870))

(assert (= (and b!1513870 res!1033779) b!1513869))

(assert (= (and b!1513869 res!1033772) b!1513875))

(assert (= (and b!1513875 res!1033783) b!1513877))

(assert (= (and b!1513877 (not res!1033780)) b!1513867))

(assert (= (and b!1513867 res!1033771) b!1513878))

(declare-fun m!1396767 () Bool)

(assert (=> b!1513874 m!1396767))

(declare-fun m!1396769 () Bool)

(assert (=> b!1513871 m!1396769))

(assert (=> b!1513871 m!1396769))

(declare-fun m!1396771 () Bool)

(assert (=> b!1513871 m!1396771))

(assert (=> b!1513872 m!1396769))

(assert (=> b!1513872 m!1396769))

(declare-fun m!1396773 () Bool)

(assert (=> b!1513872 m!1396773))

(declare-fun m!1396775 () Bool)

(assert (=> b!1513879 m!1396775))

(assert (=> b!1513876 m!1396769))

(assert (=> b!1513876 m!1396769))

(declare-fun m!1396777 () Bool)

(assert (=> b!1513876 m!1396777))

(assert (=> b!1513876 m!1396777))

(assert (=> b!1513876 m!1396769))

(declare-fun m!1396779 () Bool)

(assert (=> b!1513876 m!1396779))

(declare-fun m!1396781 () Bool)

(assert (=> b!1513869 m!1396781))

(declare-fun m!1396783 () Bool)

(assert (=> b!1513869 m!1396783))

(assert (=> b!1513877 m!1396769))

(declare-fun m!1396785 () Bool)

(assert (=> b!1513877 m!1396785))

(declare-fun m!1396787 () Bool)

(assert (=> b!1513870 m!1396787))

(assert (=> b!1513870 m!1396787))

(declare-fun m!1396789 () Bool)

(assert (=> b!1513870 m!1396789))

(declare-fun m!1396791 () Bool)

(assert (=> b!1513870 m!1396791))

(declare-fun m!1396793 () Bool)

(assert (=> b!1513870 m!1396793))

(assert (=> b!1513875 m!1396769))

(assert (=> b!1513875 m!1396769))

(declare-fun m!1396795 () Bool)

(assert (=> b!1513875 m!1396795))

(declare-fun m!1396797 () Bool)

(assert (=> start!129058 m!1396797))

(declare-fun m!1396799 () Bool)

(assert (=> start!129058 m!1396799))

(assert (=> b!1513867 m!1396769))

(assert (=> b!1513867 m!1396769))

(declare-fun m!1396801 () Bool)

(assert (=> b!1513867 m!1396801))

(assert (=> b!1513867 m!1396769))

(declare-fun m!1396803 () Bool)

(assert (=> b!1513867 m!1396803))

(declare-fun m!1396805 () Bool)

(assert (=> b!1513878 m!1396805))

(declare-fun m!1396807 () Bool)

(assert (=> b!1513878 m!1396807))

(declare-fun m!1396809 () Bool)

(assert (=> b!1513873 m!1396809))

(assert (=> b!1513873 m!1396809))

(declare-fun m!1396811 () Bool)

(assert (=> b!1513873 m!1396811))

(push 1)

