; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129224 () Bool)

(assert start!129224)

(declare-fun b!1517797 () Bool)

(declare-fun e!846721 () Bool)

(declare-fun e!846725 () Bool)

(assert (=> b!1517797 (= e!846721 e!846725)))

(declare-fun res!1037913 () Bool)

(assert (=> b!1517797 (=> res!1037913 e!846725)))

(declare-fun lt!657758 () (_ BitVec 32))

(declare-datatypes ((array!101080 0))(
  ( (array!101081 (arr!48778 (Array (_ BitVec 32) (_ BitVec 64))) (size!49330 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101080)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517797 (= res!1037913 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657758 #b00000000000000000000000000000000) (bvsge lt!657758 (size!49330 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517797 (= lt!657758 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517798 () Bool)

(declare-fun e!846724 () Bool)

(declare-fun e!846722 () Bool)

(assert (=> b!1517798 (= e!846724 e!846722)))

(declare-fun res!1037907 () Bool)

(assert (=> b!1517798 (=> (not res!1037907) (not e!846722))))

(declare-datatypes ((SeekEntryResult!12972 0))(
  ( (MissingZero!12972 (index!54283 (_ BitVec 32))) (Found!12972 (index!54284 (_ BitVec 32))) (Intermediate!12972 (undefined!13784 Bool) (index!54285 (_ BitVec 32)) (x!135964 (_ BitVec 32))) (Undefined!12972) (MissingVacant!12972 (index!54286 (_ BitVec 32))) )
))
(declare-fun lt!657761 () SeekEntryResult!12972)

(declare-fun lt!657760 () SeekEntryResult!12972)

(assert (=> b!1517798 (= res!1037907 (= lt!657761 lt!657760))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517798 (= lt!657760 (Intermediate!12972 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517798 (= lt!657761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48778 a!2804) j!70) mask!2512) (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517799 () Bool)

(declare-fun res!1037912 () Bool)

(assert (=> b!1517799 (=> (not res!1037912) (not e!846724))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517799 (= res!1037912 (validKeyInArray!0 (select (arr!48778 a!2804) i!961)))))

(declare-fun b!1517800 () Bool)

(declare-fun res!1037908 () Bool)

(assert (=> b!1517800 (=> (not res!1037908) (not e!846724))))

(assert (=> b!1517800 (= res!1037908 (and (= (size!49330 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49330 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49330 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517801 () Bool)

(declare-fun res!1037914 () Bool)

(assert (=> b!1517801 (=> (not res!1037914) (not e!846724))))

(declare-datatypes ((List!35339 0))(
  ( (Nil!35336) (Cons!35335 (h!36748 (_ BitVec 64)) (t!50025 List!35339)) )
))
(declare-fun arrayNoDuplicates!0 (array!101080 (_ BitVec 32) List!35339) Bool)

(assert (=> b!1517801 (= res!1037914 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35336))))

(declare-fun b!1517802 () Bool)

(declare-fun res!1037917 () Bool)

(assert (=> b!1517802 (=> (not res!1037917) (not e!846724))))

(assert (=> b!1517802 (= res!1037917 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49330 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49330 a!2804))))))

(declare-fun b!1517803 () Bool)

(declare-fun res!1037909 () Bool)

(assert (=> b!1517803 (=> (not res!1037909) (not e!846722))))

(assert (=> b!1517803 (= res!1037909 (= lt!657761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101081 (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49330 a!2804)) mask!2512)))))

(declare-fun b!1517804 () Bool)

(assert (=> b!1517804 (= e!846722 (not e!846721))))

(declare-fun res!1037918 () Bool)

(assert (=> b!1517804 (=> res!1037918 e!846721)))

(assert (=> b!1517804 (= res!1037918 (or (not (= (select (arr!48778 a!2804) j!70) (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846723 () Bool)

(assert (=> b!1517804 e!846723))

(declare-fun res!1037911 () Bool)

(assert (=> b!1517804 (=> (not res!1037911) (not e!846723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101080 (_ BitVec 32)) Bool)

(assert (=> b!1517804 (= res!1037911 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50651 0))(
  ( (Unit!50652) )
))
(declare-fun lt!657762 () Unit!50651)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50651)

(assert (=> b!1517804 (= lt!657762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517805 () Bool)

(assert (=> b!1517805 (= e!846725 true)))

(declare-fun lt!657759 () SeekEntryResult!12972)

(assert (=> b!1517805 (= lt!657759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657758 (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037916 () Bool)

(assert (=> start!129224 (=> (not res!1037916) (not e!846724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129224 (= res!1037916 (validMask!0 mask!2512))))

(assert (=> start!129224 e!846724))

(assert (=> start!129224 true))

(declare-fun array_inv!38011 (array!101080) Bool)

(assert (=> start!129224 (array_inv!38011 a!2804)))

(declare-fun b!1517806 () Bool)

(declare-fun res!1037915 () Bool)

(assert (=> b!1517806 (=> (not res!1037915) (not e!846722))))

(assert (=> b!1517806 (= res!1037915 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) lt!657760))))

(declare-fun b!1517807 () Bool)

(declare-fun res!1037906 () Bool)

(assert (=> b!1517807 (=> (not res!1037906) (not e!846724))))

(assert (=> b!1517807 (= res!1037906 (validKeyInArray!0 (select (arr!48778 a!2804) j!70)))))

(declare-fun b!1517808 () Bool)

(declare-fun res!1037910 () Bool)

(assert (=> b!1517808 (=> (not res!1037910) (not e!846724))))

(assert (=> b!1517808 (= res!1037910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517809 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12972)

(assert (=> b!1517809 (= e!846723 (= (seekEntry!0 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) (Found!12972 j!70)))))

(assert (= (and start!129224 res!1037916) b!1517800))

(assert (= (and b!1517800 res!1037908) b!1517799))

(assert (= (and b!1517799 res!1037912) b!1517807))

(assert (= (and b!1517807 res!1037906) b!1517808))

(assert (= (and b!1517808 res!1037910) b!1517801))

(assert (= (and b!1517801 res!1037914) b!1517802))

(assert (= (and b!1517802 res!1037917) b!1517798))

(assert (= (and b!1517798 res!1037907) b!1517806))

(assert (= (and b!1517806 res!1037915) b!1517803))

(assert (= (and b!1517803 res!1037909) b!1517804))

(assert (= (and b!1517804 res!1037911) b!1517809))

(assert (= (and b!1517804 (not res!1037918)) b!1517797))

(assert (= (and b!1517797 (not res!1037913)) b!1517805))

(declare-fun m!1400537 () Bool)

(assert (=> b!1517804 m!1400537))

(declare-fun m!1400539 () Bool)

(assert (=> b!1517804 m!1400539))

(declare-fun m!1400541 () Bool)

(assert (=> b!1517804 m!1400541))

(declare-fun m!1400543 () Bool)

(assert (=> b!1517804 m!1400543))

(declare-fun m!1400545 () Bool)

(assert (=> b!1517804 m!1400545))

(assert (=> b!1517803 m!1400541))

(assert (=> b!1517803 m!1400543))

(assert (=> b!1517803 m!1400543))

(declare-fun m!1400547 () Bool)

(assert (=> b!1517803 m!1400547))

(assert (=> b!1517803 m!1400547))

(assert (=> b!1517803 m!1400543))

(declare-fun m!1400549 () Bool)

(assert (=> b!1517803 m!1400549))

(declare-fun m!1400551 () Bool)

(assert (=> b!1517808 m!1400551))

(declare-fun m!1400553 () Bool)

(assert (=> start!129224 m!1400553))

(declare-fun m!1400555 () Bool)

(assert (=> start!129224 m!1400555))

(assert (=> b!1517805 m!1400537))

(assert (=> b!1517805 m!1400537))

(declare-fun m!1400557 () Bool)

(assert (=> b!1517805 m!1400557))

(declare-fun m!1400559 () Bool)

(assert (=> b!1517797 m!1400559))

(assert (=> b!1517806 m!1400537))

(assert (=> b!1517806 m!1400537))

(declare-fun m!1400561 () Bool)

(assert (=> b!1517806 m!1400561))

(assert (=> b!1517807 m!1400537))

(assert (=> b!1517807 m!1400537))

(declare-fun m!1400563 () Bool)

(assert (=> b!1517807 m!1400563))

(declare-fun m!1400565 () Bool)

(assert (=> b!1517799 m!1400565))

(assert (=> b!1517799 m!1400565))

(declare-fun m!1400567 () Bool)

(assert (=> b!1517799 m!1400567))

(declare-fun m!1400569 () Bool)

(assert (=> b!1517801 m!1400569))

(assert (=> b!1517798 m!1400537))

(assert (=> b!1517798 m!1400537))

(declare-fun m!1400571 () Bool)

(assert (=> b!1517798 m!1400571))

(assert (=> b!1517798 m!1400571))

(assert (=> b!1517798 m!1400537))

(declare-fun m!1400573 () Bool)

(assert (=> b!1517798 m!1400573))

(assert (=> b!1517809 m!1400537))

(assert (=> b!1517809 m!1400537))

(declare-fun m!1400575 () Bool)

(assert (=> b!1517809 m!1400575))

(check-sat (not b!1517798) (not b!1517804) (not b!1517809) (not b!1517799) (not b!1517808) (not b!1517797) (not b!1517801) (not b!1517807) (not start!129224) (not b!1517806) (not b!1517803) (not b!1517805))
(check-sat)
