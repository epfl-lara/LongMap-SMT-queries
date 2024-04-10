; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129010 () Bool)

(assert start!129010)

(declare-fun b!1512860 () Bool)

(declare-fun res!1032770 () Bool)

(declare-fun e!844382 () Bool)

(assert (=> b!1512860 (=> (not res!1032770) (not e!844382))))

(declare-datatypes ((array!100866 0))(
  ( (array!100867 (arr!48670 (Array (_ BitVec 32) (_ BitVec 64))) (size!49220 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100866)

(declare-datatypes ((List!35153 0))(
  ( (Nil!35150) (Cons!35149 (h!36561 (_ BitVec 64)) (t!49847 List!35153)) )
))
(declare-fun arrayNoDuplicates!0 (array!100866 (_ BitVec 32) List!35153) Bool)

(assert (=> b!1512860 (= res!1032770 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35150))))

(declare-fun b!1512861 () Bool)

(declare-fun e!844383 () Bool)

(assert (=> b!1512861 (= e!844382 e!844383)))

(declare-fun res!1032775 () Bool)

(assert (=> b!1512861 (=> (not res!1032775) (not e!844383))))

(declare-datatypes ((SeekEntryResult!12841 0))(
  ( (MissingZero!12841 (index!53759 (_ BitVec 32))) (Found!12841 (index!53760 (_ BitVec 32))) (Intermediate!12841 (undefined!13653 Bool) (index!53761 (_ BitVec 32)) (x!135479 (_ BitVec 32))) (Undefined!12841) (MissingVacant!12841 (index!53762 (_ BitVec 32))) )
))
(declare-fun lt!655783 () SeekEntryResult!12841)

(declare-fun lt!655781 () SeekEntryResult!12841)

(assert (=> b!1512861 (= res!1032775 (= lt!655783 lt!655781))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512861 (= lt!655781 (Intermediate!12841 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100866 (_ BitVec 32)) SeekEntryResult!12841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512861 (= lt!655783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48670 a!2804) j!70) mask!2512) (select (arr!48670 a!2804) j!70) a!2804 mask!2512))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655782 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!844384 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1512862 () Bool)

(assert (=> b!1512862 (= e!844384 (not (or (not (= (select (arr!48670 a!2804) j!70) lt!655782)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48670 a!2804) index!487) (select (arr!48670 a!2804) j!70)) (not (= (select (arr!48670 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (= (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!844380 () Bool)

(assert (=> b!1512862 e!844380))

(declare-fun res!1032774 () Bool)

(assert (=> b!1512862 (=> (not res!1032774) (not e!844380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100866 (_ BitVec 32)) Bool)

(assert (=> b!1512862 (= res!1032774 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50550 0))(
  ( (Unit!50551) )
))
(declare-fun lt!655780 () Unit!50550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50550)

(assert (=> b!1512862 (= lt!655780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1032771 () Bool)

(assert (=> start!129010 (=> (not res!1032771) (not e!844382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129010 (= res!1032771 (validMask!0 mask!2512))))

(assert (=> start!129010 e!844382))

(assert (=> start!129010 true))

(declare-fun array_inv!37698 (array!100866) Bool)

(assert (=> start!129010 (array_inv!37698 a!2804)))

(declare-fun b!1512863 () Bool)

(declare-fun e!844381 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100866 (_ BitVec 32)) SeekEntryResult!12841)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100866 (_ BitVec 32)) SeekEntryResult!12841)

(assert (=> b!1512863 (= e!844381 (= (seekEntryOrOpen!0 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48670 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512864 () Bool)

(declare-fun res!1032767 () Bool)

(assert (=> b!1512864 (=> (not res!1032767) (not e!844382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512864 (= res!1032767 (validKeyInArray!0 (select (arr!48670 a!2804) j!70)))))

(declare-fun b!1512865 () Bool)

(declare-fun res!1032764 () Bool)

(assert (=> b!1512865 (=> (not res!1032764) (not e!844383))))

(assert (=> b!1512865 (= res!1032764 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) lt!655781))))

(declare-fun b!1512866 () Bool)

(declare-fun res!1032769 () Bool)

(assert (=> b!1512866 (=> (not res!1032769) (not e!844382))))

(assert (=> b!1512866 (= res!1032769 (validKeyInArray!0 (select (arr!48670 a!2804) i!961)))))

(declare-fun b!1512867 () Bool)

(declare-fun res!1032766 () Bool)

(assert (=> b!1512867 (=> (not res!1032766) (not e!844382))))

(assert (=> b!1512867 (= res!1032766 (and (= (size!49220 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49220 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49220 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512868 () Bool)

(assert (=> b!1512868 (= e!844380 e!844381)))

(declare-fun res!1032768 () Bool)

(assert (=> b!1512868 (=> res!1032768 e!844381)))

(assert (=> b!1512868 (= res!1032768 (or (not (= (select (arr!48670 a!2804) j!70) lt!655782)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48670 a!2804) index!487) (select (arr!48670 a!2804) j!70)) (not (= (select (arr!48670 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512869 () Bool)

(assert (=> b!1512869 (= e!844383 e!844384)))

(declare-fun res!1032765 () Bool)

(assert (=> b!1512869 (=> (not res!1032765) (not e!844384))))

(assert (=> b!1512869 (= res!1032765 (= lt!655783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655782 mask!2512) lt!655782 (array!100867 (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49220 a!2804)) mask!2512)))))

(assert (=> b!1512869 (= lt!655782 (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512870 () Bool)

(declare-fun res!1032772 () Bool)

(assert (=> b!1512870 (=> (not res!1032772) (not e!844382))))

(assert (=> b!1512870 (= res!1032772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512871 () Bool)

(declare-fun res!1032773 () Bool)

(assert (=> b!1512871 (=> (not res!1032773) (not e!844380))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100866 (_ BitVec 32)) SeekEntryResult!12841)

(assert (=> b!1512871 (= res!1032773 (= (seekEntry!0 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) (Found!12841 j!70)))))

(declare-fun b!1512872 () Bool)

(declare-fun res!1032763 () Bool)

(assert (=> b!1512872 (=> (not res!1032763) (not e!844382))))

(assert (=> b!1512872 (= res!1032763 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49220 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49220 a!2804))))))

(assert (= (and start!129010 res!1032771) b!1512867))

(assert (= (and b!1512867 res!1032766) b!1512866))

(assert (= (and b!1512866 res!1032769) b!1512864))

(assert (= (and b!1512864 res!1032767) b!1512870))

(assert (= (and b!1512870 res!1032772) b!1512860))

(assert (= (and b!1512860 res!1032770) b!1512872))

(assert (= (and b!1512872 res!1032763) b!1512861))

(assert (= (and b!1512861 res!1032775) b!1512865))

(assert (= (and b!1512865 res!1032764) b!1512869))

(assert (= (and b!1512869 res!1032765) b!1512862))

(assert (= (and b!1512862 res!1032774) b!1512871))

(assert (= (and b!1512871 res!1032773) b!1512868))

(assert (= (and b!1512868 (not res!1032768)) b!1512863))

(declare-fun m!1395665 () Bool)

(assert (=> b!1512869 m!1395665))

(declare-fun m!1395667 () Bool)

(assert (=> b!1512869 m!1395667))

(assert (=> b!1512869 m!1395665))

(declare-fun m!1395669 () Bool)

(assert (=> b!1512869 m!1395669))

(declare-fun m!1395671 () Bool)

(assert (=> b!1512869 m!1395671))

(declare-fun m!1395673 () Bool)

(assert (=> b!1512864 m!1395673))

(assert (=> b!1512864 m!1395673))

(declare-fun m!1395675 () Bool)

(assert (=> b!1512864 m!1395675))

(assert (=> b!1512861 m!1395673))

(assert (=> b!1512861 m!1395673))

(declare-fun m!1395677 () Bool)

(assert (=> b!1512861 m!1395677))

(assert (=> b!1512861 m!1395677))

(assert (=> b!1512861 m!1395673))

(declare-fun m!1395679 () Bool)

(assert (=> b!1512861 m!1395679))

(assert (=> b!1512868 m!1395673))

(declare-fun m!1395681 () Bool)

(assert (=> b!1512868 m!1395681))

(declare-fun m!1395683 () Bool)

(assert (=> b!1512866 m!1395683))

(assert (=> b!1512866 m!1395683))

(declare-fun m!1395685 () Bool)

(assert (=> b!1512866 m!1395685))

(assert (=> b!1512865 m!1395673))

(assert (=> b!1512865 m!1395673))

(declare-fun m!1395687 () Bool)

(assert (=> b!1512865 m!1395687))

(assert (=> b!1512871 m!1395673))

(assert (=> b!1512871 m!1395673))

(declare-fun m!1395689 () Bool)

(assert (=> b!1512871 m!1395689))

(declare-fun m!1395691 () Bool)

(assert (=> b!1512860 m!1395691))

(assert (=> b!1512863 m!1395673))

(assert (=> b!1512863 m!1395673))

(declare-fun m!1395693 () Bool)

(assert (=> b!1512863 m!1395693))

(assert (=> b!1512863 m!1395673))

(declare-fun m!1395695 () Bool)

(assert (=> b!1512863 m!1395695))

(declare-fun m!1395697 () Bool)

(assert (=> start!129010 m!1395697))

(declare-fun m!1395699 () Bool)

(assert (=> start!129010 m!1395699))

(declare-fun m!1395701 () Bool)

(assert (=> b!1512870 m!1395701))

(assert (=> b!1512862 m!1395673))

(declare-fun m!1395703 () Bool)

(assert (=> b!1512862 m!1395703))

(assert (=> b!1512862 m!1395667))

(assert (=> b!1512862 m!1395681))

(declare-fun m!1395705 () Bool)

(assert (=> b!1512862 m!1395705))

(declare-fun m!1395707 () Bool)

(assert (=> b!1512862 m!1395707))

(push 1)

(assert (not start!129010))

(assert (not b!1512862))

