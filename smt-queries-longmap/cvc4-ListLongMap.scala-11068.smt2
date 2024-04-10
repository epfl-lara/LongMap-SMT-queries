; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129244 () Bool)

(assert start!129244)

(declare-fun b!1517513 () Bool)

(declare-fun e!846647 () Bool)

(declare-fun e!846649 () Bool)

(assert (=> b!1517513 (= e!846647 e!846649)))

(declare-fun res!1037416 () Bool)

(assert (=> b!1517513 (=> (not res!1037416) (not e!846649))))

(declare-datatypes ((SeekEntryResult!12958 0))(
  ( (MissingZero!12958 (index!54227 (_ BitVec 32))) (Found!12958 (index!54228 (_ BitVec 32))) (Intermediate!12958 (undefined!13770 Bool) (index!54229 (_ BitVec 32)) (x!135908 (_ BitVec 32))) (Undefined!12958) (MissingVacant!12958 (index!54230 (_ BitVec 32))) )
))
(declare-fun lt!657813 () SeekEntryResult!12958)

(declare-fun lt!657814 () SeekEntryResult!12958)

(assert (=> b!1517513 (= res!1037416 (= lt!657813 lt!657814))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517513 (= lt!657814 (Intermediate!12958 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101100 0))(
  ( (array!101101 (arr!48787 (Array (_ BitVec 32) (_ BitVec 64))) (size!49337 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101100)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101100 (_ BitVec 32)) SeekEntryResult!12958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517513 (= lt!657813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48787 a!2804) j!70) mask!2512) (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517515 () Bool)

(declare-fun res!1037421 () Bool)

(assert (=> b!1517515 (=> (not res!1037421) (not e!846647))))

(declare-datatypes ((List!35270 0))(
  ( (Nil!35267) (Cons!35266 (h!36678 (_ BitVec 64)) (t!49964 List!35270)) )
))
(declare-fun arrayNoDuplicates!0 (array!101100 (_ BitVec 32) List!35270) Bool)

(assert (=> b!1517515 (= res!1037421 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35267))))

(declare-fun b!1517516 () Bool)

(declare-fun e!846650 () Bool)

(assert (=> b!1517516 (= e!846650 true)))

(declare-fun lt!657817 () SeekEntryResult!12958)

(declare-fun lt!657815 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517516 (= lt!657817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657815 (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517517 () Bool)

(declare-fun res!1037424 () Bool)

(assert (=> b!1517517 (=> (not res!1037424) (not e!846649))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517517 (= res!1037424 (= lt!657813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101101 (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49337 a!2804)) mask!2512)))))

(declare-fun b!1517518 () Bool)

(declare-fun e!846651 () Bool)

(assert (=> b!1517518 (= e!846651 e!846650)))

(declare-fun res!1037426 () Bool)

(assert (=> b!1517518 (=> res!1037426 e!846650)))

(assert (=> b!1517518 (= res!1037426 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657815 #b00000000000000000000000000000000) (bvsge lt!657815 (size!49337 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517518 (= lt!657815 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517519 () Bool)

(declare-fun res!1037418 () Bool)

(assert (=> b!1517519 (=> (not res!1037418) (not e!846647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517519 (= res!1037418 (validKeyInArray!0 (select (arr!48787 a!2804) i!961)))))

(declare-fun b!1517520 () Bool)

(declare-fun res!1037417 () Bool)

(assert (=> b!1517520 (=> (not res!1037417) (not e!846649))))

(assert (=> b!1517520 (= res!1037417 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) lt!657814))))

(declare-fun b!1517521 () Bool)

(declare-fun e!846652 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101100 (_ BitVec 32)) SeekEntryResult!12958)

(assert (=> b!1517521 (= e!846652 (= (seekEntry!0 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) (Found!12958 j!70)))))

(declare-fun b!1517522 () Bool)

(assert (=> b!1517522 (= e!846649 (not e!846651))))

(declare-fun res!1037420 () Bool)

(assert (=> b!1517522 (=> res!1037420 e!846651)))

(assert (=> b!1517522 (= res!1037420 (or (not (= (select (arr!48787 a!2804) j!70) (select (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517522 e!846652))

(declare-fun res!1037425 () Bool)

(assert (=> b!1517522 (=> (not res!1037425) (not e!846652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101100 (_ BitVec 32)) Bool)

(assert (=> b!1517522 (= res!1037425 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50784 0))(
  ( (Unit!50785) )
))
(declare-fun lt!657816 () Unit!50784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50784)

(assert (=> b!1517522 (= lt!657816 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517523 () Bool)

(declare-fun res!1037428 () Bool)

(assert (=> b!1517523 (=> (not res!1037428) (not e!846647))))

(assert (=> b!1517523 (= res!1037428 (validKeyInArray!0 (select (arr!48787 a!2804) j!70)))))

(declare-fun b!1517524 () Bool)

(declare-fun res!1037422 () Bool)

(assert (=> b!1517524 (=> (not res!1037422) (not e!846647))))

(assert (=> b!1517524 (= res!1037422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517525 () Bool)

(declare-fun res!1037427 () Bool)

(assert (=> b!1517525 (=> (not res!1037427) (not e!846647))))

(assert (=> b!1517525 (= res!1037427 (and (= (size!49337 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49337 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49337 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1037423 () Bool)

(assert (=> start!129244 (=> (not res!1037423) (not e!846647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129244 (= res!1037423 (validMask!0 mask!2512))))

(assert (=> start!129244 e!846647))

(assert (=> start!129244 true))

(declare-fun array_inv!37815 (array!101100) Bool)

(assert (=> start!129244 (array_inv!37815 a!2804)))

(declare-fun b!1517514 () Bool)

(declare-fun res!1037419 () Bool)

(assert (=> b!1517514 (=> (not res!1037419) (not e!846647))))

(assert (=> b!1517514 (= res!1037419 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49337 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49337 a!2804))))))

(assert (= (and start!129244 res!1037423) b!1517525))

(assert (= (and b!1517525 res!1037427) b!1517519))

(assert (= (and b!1517519 res!1037418) b!1517523))

(assert (= (and b!1517523 res!1037428) b!1517524))

(assert (= (and b!1517524 res!1037422) b!1517515))

(assert (= (and b!1517515 res!1037421) b!1517514))

(assert (= (and b!1517514 res!1037419) b!1517513))

(assert (= (and b!1517513 res!1037416) b!1517520))

(assert (= (and b!1517520 res!1037417) b!1517517))

(assert (= (and b!1517517 res!1037424) b!1517522))

(assert (= (and b!1517522 res!1037425) b!1517521))

(assert (= (and b!1517522 (not res!1037420)) b!1517518))

(assert (= (and b!1517518 (not res!1037426)) b!1517516))

(declare-fun m!1400805 () Bool)

(assert (=> b!1517522 m!1400805))

(declare-fun m!1400807 () Bool)

(assert (=> b!1517522 m!1400807))

(declare-fun m!1400809 () Bool)

(assert (=> b!1517522 m!1400809))

(declare-fun m!1400811 () Bool)

(assert (=> b!1517522 m!1400811))

(declare-fun m!1400813 () Bool)

(assert (=> b!1517522 m!1400813))

(declare-fun m!1400815 () Bool)

(assert (=> start!129244 m!1400815))

(declare-fun m!1400817 () Bool)

(assert (=> start!129244 m!1400817))

(assert (=> b!1517521 m!1400805))

(assert (=> b!1517521 m!1400805))

(declare-fun m!1400819 () Bool)

(assert (=> b!1517521 m!1400819))

(assert (=> b!1517520 m!1400805))

(assert (=> b!1517520 m!1400805))

(declare-fun m!1400821 () Bool)

(assert (=> b!1517520 m!1400821))

(declare-fun m!1400823 () Bool)

(assert (=> b!1517519 m!1400823))

(assert (=> b!1517519 m!1400823))

(declare-fun m!1400825 () Bool)

(assert (=> b!1517519 m!1400825))

(declare-fun m!1400827 () Bool)

(assert (=> b!1517524 m!1400827))

(declare-fun m!1400829 () Bool)

(assert (=> b!1517515 m!1400829))

(assert (=> b!1517513 m!1400805))

(assert (=> b!1517513 m!1400805))

(declare-fun m!1400831 () Bool)

(assert (=> b!1517513 m!1400831))

(assert (=> b!1517513 m!1400831))

(assert (=> b!1517513 m!1400805))

(declare-fun m!1400833 () Bool)

(assert (=> b!1517513 m!1400833))

(assert (=> b!1517516 m!1400805))

(assert (=> b!1517516 m!1400805))

(declare-fun m!1400835 () Bool)

(assert (=> b!1517516 m!1400835))

(assert (=> b!1517523 m!1400805))

(assert (=> b!1517523 m!1400805))

(declare-fun m!1400837 () Bool)

(assert (=> b!1517523 m!1400837))

(declare-fun m!1400839 () Bool)

(assert (=> b!1517518 m!1400839))

(assert (=> b!1517517 m!1400809))

(assert (=> b!1517517 m!1400811))

(assert (=> b!1517517 m!1400811))

(declare-fun m!1400841 () Bool)

(assert (=> b!1517517 m!1400841))

(assert (=> b!1517517 m!1400841))

(assert (=> b!1517517 m!1400811))

(declare-fun m!1400843 () Bool)

(assert (=> b!1517517 m!1400843))

(push 1)

(assert (not b!1517517))

