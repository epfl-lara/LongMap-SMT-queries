; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129262 () Bool)

(assert start!129262)

(declare-fun b!1517864 () Bool)

(declare-fun e!846809 () Bool)

(declare-fun e!846813 () Bool)

(assert (=> b!1517864 (= e!846809 e!846813)))

(declare-fun res!1037779 () Bool)

(assert (=> b!1517864 (=> res!1037779 e!846813)))

(declare-datatypes ((array!101118 0))(
  ( (array!101119 (arr!48796 (Array (_ BitVec 32) (_ BitVec 64))) (size!49346 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101118)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657948 () (_ BitVec 32))

(assert (=> b!1517864 (= res!1037779 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657948 #b00000000000000000000000000000000) (bvsge lt!657948 (size!49346 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517864 (= lt!657948 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517865 () Bool)

(declare-fun res!1037769 () Bool)

(declare-fun e!846814 () Bool)

(assert (=> b!1517865 (=> (not res!1037769) (not e!846814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101118 (_ BitVec 32)) Bool)

(assert (=> b!1517865 (= res!1037769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517866 () Bool)

(declare-fun res!1037771 () Bool)

(declare-fun e!846812 () Bool)

(assert (=> b!1517866 (=> (not res!1037771) (not e!846812))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12967 0))(
  ( (MissingZero!12967 (index!54263 (_ BitVec 32))) (Found!12967 (index!54264 (_ BitVec 32))) (Intermediate!12967 (undefined!13779 Bool) (index!54265 (_ BitVec 32)) (x!135941 (_ BitVec 32))) (Undefined!12967) (MissingVacant!12967 (index!54266 (_ BitVec 32))) )
))
(declare-fun lt!657951 () SeekEntryResult!12967)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101118 (_ BitVec 32)) SeekEntryResult!12967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517866 (= res!1037771 (= lt!657951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101119 (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49346 a!2804)) mask!2512)))))

(declare-fun b!1517867 () Bool)

(assert (=> b!1517867 (= e!846812 (not e!846809))))

(declare-fun res!1037774 () Bool)

(assert (=> b!1517867 (=> res!1037774 e!846809)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517867 (= res!1037774 (or (not (= (select (arr!48796 a!2804) j!70) (select (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846811 () Bool)

(assert (=> b!1517867 e!846811))

(declare-fun res!1037767 () Bool)

(assert (=> b!1517867 (=> (not res!1037767) (not e!846811))))

(assert (=> b!1517867 (= res!1037767 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50802 0))(
  ( (Unit!50803) )
))
(declare-fun lt!657949 () Unit!50802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50802)

(assert (=> b!1517867 (= lt!657949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517868 () Bool)

(declare-fun res!1037772 () Bool)

(assert (=> b!1517868 (=> (not res!1037772) (not e!846814))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517868 (= res!1037772 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49346 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49346 a!2804))))))

(declare-fun b!1517869 () Bool)

(declare-fun res!1037777 () Bool)

(assert (=> b!1517869 (=> (not res!1037777) (not e!846814))))

(declare-datatypes ((List!35279 0))(
  ( (Nil!35276) (Cons!35275 (h!36687 (_ BitVec 64)) (t!49973 List!35279)) )
))
(declare-fun arrayNoDuplicates!0 (array!101118 (_ BitVec 32) List!35279) Bool)

(assert (=> b!1517869 (= res!1037777 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35276))))

(declare-fun res!1037775 () Bool)

(assert (=> start!129262 (=> (not res!1037775) (not e!846814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129262 (= res!1037775 (validMask!0 mask!2512))))

(assert (=> start!129262 e!846814))

(assert (=> start!129262 true))

(declare-fun array_inv!37824 (array!101118) Bool)

(assert (=> start!129262 (array_inv!37824 a!2804)))

(declare-fun b!1517870 () Bool)

(assert (=> b!1517870 (= e!846814 e!846812)))

(declare-fun res!1037778 () Bool)

(assert (=> b!1517870 (=> (not res!1037778) (not e!846812))))

(declare-fun lt!657952 () SeekEntryResult!12967)

(assert (=> b!1517870 (= res!1037778 (= lt!657951 lt!657952))))

(assert (=> b!1517870 (= lt!657952 (Intermediate!12967 false resIndex!21 resX!21))))

(assert (=> b!1517870 (= lt!657951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48796 a!2804) j!70) mask!2512) (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517871 () Bool)

(declare-fun res!1037768 () Bool)

(assert (=> b!1517871 (=> (not res!1037768) (not e!846812))))

(assert (=> b!1517871 (= res!1037768 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) lt!657952))))

(declare-fun b!1517872 () Bool)

(declare-fun res!1037773 () Bool)

(assert (=> b!1517872 (=> (not res!1037773) (not e!846814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517872 (= res!1037773 (validKeyInArray!0 (select (arr!48796 a!2804) i!961)))))

(declare-fun b!1517873 () Bool)

(declare-fun res!1037776 () Bool)

(assert (=> b!1517873 (=> (not res!1037776) (not e!846814))))

(assert (=> b!1517873 (= res!1037776 (validKeyInArray!0 (select (arr!48796 a!2804) j!70)))))

(declare-fun b!1517874 () Bool)

(declare-fun res!1037770 () Bool)

(assert (=> b!1517874 (=> (not res!1037770) (not e!846814))))

(assert (=> b!1517874 (= res!1037770 (and (= (size!49346 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49346 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49346 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517875 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101118 (_ BitVec 32)) SeekEntryResult!12967)

(assert (=> b!1517875 (= e!846811 (= (seekEntry!0 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) (Found!12967 j!70)))))

(declare-fun b!1517876 () Bool)

(assert (=> b!1517876 (= e!846813 true)))

(declare-fun lt!657950 () SeekEntryResult!12967)

(assert (=> b!1517876 (= lt!657950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657948 (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129262 res!1037775) b!1517874))

(assert (= (and b!1517874 res!1037770) b!1517872))

(assert (= (and b!1517872 res!1037773) b!1517873))

(assert (= (and b!1517873 res!1037776) b!1517865))

(assert (= (and b!1517865 res!1037769) b!1517869))

(assert (= (and b!1517869 res!1037777) b!1517868))

(assert (= (and b!1517868 res!1037772) b!1517870))

(assert (= (and b!1517870 res!1037778) b!1517871))

(assert (= (and b!1517871 res!1037768) b!1517866))

(assert (= (and b!1517866 res!1037771) b!1517867))

(assert (= (and b!1517867 res!1037767) b!1517875))

(assert (= (and b!1517867 (not res!1037774)) b!1517864))

(assert (= (and b!1517864 (not res!1037779)) b!1517876))

(declare-fun m!1401165 () Bool)

(assert (=> start!129262 m!1401165))

(declare-fun m!1401167 () Bool)

(assert (=> start!129262 m!1401167))

(declare-fun m!1401169 () Bool)

(assert (=> b!1517872 m!1401169))

(assert (=> b!1517872 m!1401169))

(declare-fun m!1401171 () Bool)

(assert (=> b!1517872 m!1401171))

(declare-fun m!1401173 () Bool)

(assert (=> b!1517865 m!1401173))

(declare-fun m!1401175 () Bool)

(assert (=> b!1517876 m!1401175))

(assert (=> b!1517876 m!1401175))

(declare-fun m!1401177 () Bool)

(assert (=> b!1517876 m!1401177))

(assert (=> b!1517873 m!1401175))

(assert (=> b!1517873 m!1401175))

(declare-fun m!1401179 () Bool)

(assert (=> b!1517873 m!1401179))

(assert (=> b!1517871 m!1401175))

(assert (=> b!1517871 m!1401175))

(declare-fun m!1401181 () Bool)

(assert (=> b!1517871 m!1401181))

(assert (=> b!1517867 m!1401175))

(declare-fun m!1401183 () Bool)

(assert (=> b!1517867 m!1401183))

(declare-fun m!1401185 () Bool)

(assert (=> b!1517867 m!1401185))

(declare-fun m!1401187 () Bool)

(assert (=> b!1517867 m!1401187))

(declare-fun m!1401189 () Bool)

(assert (=> b!1517867 m!1401189))

(assert (=> b!1517866 m!1401185))

(assert (=> b!1517866 m!1401187))

(assert (=> b!1517866 m!1401187))

(declare-fun m!1401191 () Bool)

(assert (=> b!1517866 m!1401191))

(assert (=> b!1517866 m!1401191))

(assert (=> b!1517866 m!1401187))

(declare-fun m!1401193 () Bool)

(assert (=> b!1517866 m!1401193))

(assert (=> b!1517870 m!1401175))

(assert (=> b!1517870 m!1401175))

(declare-fun m!1401195 () Bool)

(assert (=> b!1517870 m!1401195))

(assert (=> b!1517870 m!1401195))

(assert (=> b!1517870 m!1401175))

(declare-fun m!1401197 () Bool)

(assert (=> b!1517870 m!1401197))

(assert (=> b!1517875 m!1401175))

(assert (=> b!1517875 m!1401175))

(declare-fun m!1401199 () Bool)

(assert (=> b!1517875 m!1401199))

(declare-fun m!1401201 () Bool)

(assert (=> b!1517869 m!1401201))

(declare-fun m!1401203 () Bool)

(assert (=> b!1517864 m!1401203))

(push 1)

(assert (not b!1517865))

(assert (not b!1517864))

(assert (not b!1517875))

