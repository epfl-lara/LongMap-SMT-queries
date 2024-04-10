; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128842 () Bool)

(assert start!128842)

(declare-fun b!1509874 () Bool)

(declare-fun res!1029778 () Bool)

(declare-fun e!843248 () Bool)

(assert (=> b!1509874 (=> (not res!1029778) (not e!843248))))

(declare-datatypes ((array!100698 0))(
  ( (array!100699 (arr!48586 (Array (_ BitVec 32) (_ BitVec 64))) (size!49136 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100698)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509874 (= res!1029778 (validKeyInArray!0 (select (arr!48586 a!2804) i!961)))))

(declare-fun b!1509875 () Bool)

(declare-fun res!1029783 () Bool)

(assert (=> b!1509875 (=> (not res!1029783) (not e!843248))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509875 (= res!1029783 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49136 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49136 a!2804))))))

(declare-fun b!1509876 () Bool)

(declare-fun res!1029787 () Bool)

(declare-fun e!843247 () Bool)

(assert (=> b!1509876 (=> (not res!1029787) (not e!843247))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12757 0))(
  ( (MissingZero!12757 (index!53423 (_ BitVec 32))) (Found!12757 (index!53424 (_ BitVec 32))) (Intermediate!12757 (undefined!13569 Bool) (index!53425 (_ BitVec 32)) (x!135171 (_ BitVec 32))) (Undefined!12757) (MissingVacant!12757 (index!53426 (_ BitVec 32))) )
))
(declare-fun lt!655018 () SeekEntryResult!12757)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100698 (_ BitVec 32)) SeekEntryResult!12757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509876 (= res!1029787 (= lt!655018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100699 (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49136 a!2804)) mask!2512)))))

(declare-fun b!1509877 () Bool)

(declare-fun res!1029784 () Bool)

(assert (=> b!1509877 (=> (not res!1029784) (not e!843248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100698 (_ BitVec 32)) Bool)

(assert (=> b!1509877 (= res!1029784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509878 () Bool)

(declare-fun res!1029785 () Bool)

(assert (=> b!1509878 (=> (not res!1029785) (not e!843248))))

(assert (=> b!1509878 (= res!1029785 (validKeyInArray!0 (select (arr!48586 a!2804) j!70)))))

(declare-fun res!1029781 () Bool)

(assert (=> start!128842 (=> (not res!1029781) (not e!843248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128842 (= res!1029781 (validMask!0 mask!2512))))

(assert (=> start!128842 e!843248))

(assert (=> start!128842 true))

(declare-fun array_inv!37614 (array!100698) Bool)

(assert (=> start!128842 (array_inv!37614 a!2804)))

(declare-fun b!1509879 () Bool)

(assert (=> b!1509879 (= e!843248 e!843247)))

(declare-fun res!1029786 () Bool)

(assert (=> b!1509879 (=> (not res!1029786) (not e!843247))))

(declare-fun lt!655016 () SeekEntryResult!12757)

(assert (=> b!1509879 (= res!1029786 (= lt!655018 lt!655016))))

(assert (=> b!1509879 (= lt!655016 (Intermediate!12757 false resIndex!21 resX!21))))

(assert (=> b!1509879 (= lt!655018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509880 () Bool)

(declare-fun res!1029779 () Bool)

(assert (=> b!1509880 (=> (not res!1029779) (not e!843247))))

(assert (=> b!1509880 (= res!1029779 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!655016))))

(declare-fun b!1509881 () Bool)

(assert (=> b!1509881 (= e!843247 (not true))))

(declare-fun e!843249 () Bool)

(assert (=> b!1509881 e!843249))

(declare-fun res!1029777 () Bool)

(assert (=> b!1509881 (=> (not res!1029777) (not e!843249))))

(assert (=> b!1509881 (= res!1029777 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50382 0))(
  ( (Unit!50383) )
))
(declare-fun lt!655017 () Unit!50382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50382)

(assert (=> b!1509881 (= lt!655017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509882 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100698 (_ BitVec 32)) SeekEntryResult!12757)

(assert (=> b!1509882 (= e!843249 (= (seekEntry!0 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) (Found!12757 j!70)))))

(declare-fun b!1509883 () Bool)

(declare-fun res!1029780 () Bool)

(assert (=> b!1509883 (=> (not res!1029780) (not e!843248))))

(declare-datatypes ((List!35069 0))(
  ( (Nil!35066) (Cons!35065 (h!36477 (_ BitVec 64)) (t!49763 List!35069)) )
))
(declare-fun arrayNoDuplicates!0 (array!100698 (_ BitVec 32) List!35069) Bool)

(assert (=> b!1509883 (= res!1029780 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35066))))

(declare-fun b!1509884 () Bool)

(declare-fun res!1029782 () Bool)

(assert (=> b!1509884 (=> (not res!1029782) (not e!843248))))

(assert (=> b!1509884 (= res!1029782 (and (= (size!49136 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49136 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49136 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128842 res!1029781) b!1509884))

(assert (= (and b!1509884 res!1029782) b!1509874))

(assert (= (and b!1509874 res!1029778) b!1509878))

(assert (= (and b!1509878 res!1029785) b!1509877))

(assert (= (and b!1509877 res!1029784) b!1509883))

(assert (= (and b!1509883 res!1029780) b!1509875))

(assert (= (and b!1509875 res!1029783) b!1509879))

(assert (= (and b!1509879 res!1029786) b!1509880))

(assert (= (and b!1509880 res!1029779) b!1509876))

(assert (= (and b!1509876 res!1029787) b!1509881))

(assert (= (and b!1509881 res!1029777) b!1509882))

(declare-fun m!1392403 () Bool)

(assert (=> b!1509878 m!1392403))

(assert (=> b!1509878 m!1392403))

(declare-fun m!1392405 () Bool)

(assert (=> b!1509878 m!1392405))

(assert (=> b!1509879 m!1392403))

(assert (=> b!1509879 m!1392403))

(declare-fun m!1392407 () Bool)

(assert (=> b!1509879 m!1392407))

(assert (=> b!1509879 m!1392407))

(assert (=> b!1509879 m!1392403))

(declare-fun m!1392409 () Bool)

(assert (=> b!1509879 m!1392409))

(assert (=> b!1509880 m!1392403))

(assert (=> b!1509880 m!1392403))

(declare-fun m!1392411 () Bool)

(assert (=> b!1509880 m!1392411))

(declare-fun m!1392413 () Bool)

(assert (=> b!1509881 m!1392413))

(declare-fun m!1392415 () Bool)

(assert (=> b!1509881 m!1392415))

(declare-fun m!1392417 () Bool)

(assert (=> b!1509874 m!1392417))

(assert (=> b!1509874 m!1392417))

(declare-fun m!1392419 () Bool)

(assert (=> b!1509874 m!1392419))

(declare-fun m!1392421 () Bool)

(assert (=> b!1509877 m!1392421))

(declare-fun m!1392423 () Bool)

(assert (=> b!1509883 m!1392423))

(declare-fun m!1392425 () Bool)

(assert (=> start!128842 m!1392425))

(declare-fun m!1392427 () Bool)

(assert (=> start!128842 m!1392427))

(assert (=> b!1509882 m!1392403))

(assert (=> b!1509882 m!1392403))

(declare-fun m!1392429 () Bool)

(assert (=> b!1509882 m!1392429))

(declare-fun m!1392431 () Bool)

(assert (=> b!1509876 m!1392431))

(declare-fun m!1392433 () Bool)

(assert (=> b!1509876 m!1392433))

(assert (=> b!1509876 m!1392433))

(declare-fun m!1392435 () Bool)

(assert (=> b!1509876 m!1392435))

(assert (=> b!1509876 m!1392435))

(assert (=> b!1509876 m!1392433))

(declare-fun m!1392437 () Bool)

(assert (=> b!1509876 m!1392437))

(push 1)

(assert (not b!1509877))

(assert (not b!1509883))

