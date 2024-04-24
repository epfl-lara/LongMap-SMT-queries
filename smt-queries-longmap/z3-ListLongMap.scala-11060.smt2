; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129548 () Bool)

(assert start!129548)

(declare-fun res!1037166 () Bool)

(declare-fun e!847493 () Bool)

(assert (=> start!129548 (=> (not res!1037166) (not e!847493))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129548 (= res!1037166 (validMask!0 mask!2512))))

(assert (=> start!129548 e!847493))

(assert (=> start!129548 true))

(declare-datatypes ((array!101167 0))(
  ( (array!101168 (arr!48814 (Array (_ BitVec 32) (_ BitVec 64))) (size!49365 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101167)

(declare-fun array_inv!38095 (array!101167) Bool)

(assert (=> start!129548 (array_inv!38095 a!2804)))

(declare-fun b!1518613 () Bool)

(declare-fun res!1037162 () Bool)

(assert (=> b!1518613 (=> (not res!1037162) (not e!847493))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518613 (= res!1037162 (validKeyInArray!0 (select (arr!48814 a!2804) j!70)))))

(declare-fun b!1518614 () Bool)

(declare-fun e!847490 () Bool)

(assert (=> b!1518614 (= e!847490 true)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658225 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12878 0))(
  ( (MissingZero!12878 (index!53907 (_ BitVec 32))) (Found!12878 (index!53908 (_ BitVec 32))) (Intermediate!12878 (undefined!13690 Bool) (index!53909 (_ BitVec 32)) (x!135807 (_ BitVec 32))) (Undefined!12878) (MissingVacant!12878 (index!53910 (_ BitVec 32))) )
))
(declare-fun lt!658223 () SeekEntryResult!12878)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101167 (_ BitVec 32)) SeekEntryResult!12878)

(assert (=> b!1518614 (= lt!658223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658225 (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!847492 () Bool)

(declare-fun b!1518615 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101167 (_ BitVec 32)) SeekEntryResult!12878)

(assert (=> b!1518615 (= e!847492 (= (seekEntry!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) (Found!12878 j!70)))))

(declare-fun b!1518616 () Bool)

(declare-fun e!847491 () Bool)

(assert (=> b!1518616 (= e!847493 e!847491)))

(declare-fun res!1037157 () Bool)

(assert (=> b!1518616 (=> (not res!1037157) (not e!847491))))

(declare-fun lt!658221 () SeekEntryResult!12878)

(declare-fun lt!658224 () SeekEntryResult!12878)

(assert (=> b!1518616 (= res!1037157 (= lt!658221 lt!658224))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518616 (= lt!658224 (Intermediate!12878 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518616 (= lt!658221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518617 () Bool)

(declare-fun res!1037167 () Bool)

(assert (=> b!1518617 (=> (not res!1037167) (not e!847493))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518617 (= res!1037167 (validKeyInArray!0 (select (arr!48814 a!2804) i!961)))))

(declare-fun b!1518618 () Bool)

(declare-fun res!1037164 () Bool)

(assert (=> b!1518618 (=> (not res!1037164) (not e!847493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101167 (_ BitVec 32)) Bool)

(assert (=> b!1518618 (= res!1037164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518619 () Bool)

(declare-fun res!1037161 () Bool)

(assert (=> b!1518619 (=> (not res!1037161) (not e!847493))))

(declare-datatypes ((List!35284 0))(
  ( (Nil!35281) (Cons!35280 (h!36710 (_ BitVec 64)) (t!49970 List!35284)) )
))
(declare-fun arrayNoDuplicates!0 (array!101167 (_ BitVec 32) List!35284) Bool)

(assert (=> b!1518619 (= res!1037161 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35281))))

(declare-fun b!1518620 () Bool)

(declare-fun res!1037168 () Bool)

(assert (=> b!1518620 (=> (not res!1037168) (not e!847493))))

(assert (=> b!1518620 (= res!1037168 (and (= (size!49365 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49365 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49365 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518621 () Bool)

(declare-fun e!847494 () Bool)

(assert (=> b!1518621 (= e!847494 e!847490)))

(declare-fun res!1037163 () Bool)

(assert (=> b!1518621 (=> res!1037163 e!847490)))

(assert (=> b!1518621 (= res!1037163 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658225 #b00000000000000000000000000000000) (bvsge lt!658225 (size!49365 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518621 (= lt!658225 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1518622 () Bool)

(declare-fun res!1037159 () Bool)

(assert (=> b!1518622 (=> (not res!1037159) (not e!847491))))

(assert (=> b!1518622 (= res!1037159 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658224))))

(declare-fun b!1518623 () Bool)

(assert (=> b!1518623 (= e!847491 (not e!847494))))

(declare-fun res!1037160 () Bool)

(assert (=> b!1518623 (=> res!1037160 e!847494)))

(assert (=> b!1518623 (= res!1037160 (or (not (= (select (arr!48814 a!2804) j!70) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518623 e!847492))

(declare-fun res!1037156 () Bool)

(assert (=> b!1518623 (=> (not res!1037156) (not e!847492))))

(assert (=> b!1518623 (= res!1037156 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50659 0))(
  ( (Unit!50660) )
))
(declare-fun lt!658222 () Unit!50659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50659)

(assert (=> b!1518623 (= lt!658222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518624 () Bool)

(declare-fun res!1037158 () Bool)

(assert (=> b!1518624 (=> (not res!1037158) (not e!847491))))

(assert (=> b!1518624 (= res!1037158 (= lt!658221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101168 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49365 a!2804)) mask!2512)))))

(declare-fun b!1518625 () Bool)

(declare-fun res!1037165 () Bool)

(assert (=> b!1518625 (=> (not res!1037165) (not e!847493))))

(assert (=> b!1518625 (= res!1037165 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49365 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49365 a!2804))))))

(assert (= (and start!129548 res!1037166) b!1518620))

(assert (= (and b!1518620 res!1037168) b!1518617))

(assert (= (and b!1518617 res!1037167) b!1518613))

(assert (= (and b!1518613 res!1037162) b!1518618))

(assert (= (and b!1518618 res!1037164) b!1518619))

(assert (= (and b!1518619 res!1037161) b!1518625))

(assert (= (and b!1518625 res!1037165) b!1518616))

(assert (= (and b!1518616 res!1037157) b!1518622))

(assert (= (and b!1518622 res!1037159) b!1518624))

(assert (= (and b!1518624 res!1037158) b!1518623))

(assert (= (and b!1518623 res!1037156) b!1518615))

(assert (= (and b!1518623 (not res!1037160)) b!1518621))

(assert (= (and b!1518621 (not res!1037163)) b!1518614))

(declare-fun m!1401729 () Bool)

(assert (=> b!1518618 m!1401729))

(declare-fun m!1401731 () Bool)

(assert (=> b!1518622 m!1401731))

(assert (=> b!1518622 m!1401731))

(declare-fun m!1401733 () Bool)

(assert (=> b!1518622 m!1401733))

(declare-fun m!1401735 () Bool)

(assert (=> b!1518624 m!1401735))

(declare-fun m!1401737 () Bool)

(assert (=> b!1518624 m!1401737))

(assert (=> b!1518624 m!1401737))

(declare-fun m!1401739 () Bool)

(assert (=> b!1518624 m!1401739))

(assert (=> b!1518624 m!1401739))

(assert (=> b!1518624 m!1401737))

(declare-fun m!1401741 () Bool)

(assert (=> b!1518624 m!1401741))

(declare-fun m!1401743 () Bool)

(assert (=> start!129548 m!1401743))

(declare-fun m!1401745 () Bool)

(assert (=> start!129548 m!1401745))

(assert (=> b!1518623 m!1401731))

(declare-fun m!1401747 () Bool)

(assert (=> b!1518623 m!1401747))

(assert (=> b!1518623 m!1401735))

(assert (=> b!1518623 m!1401737))

(declare-fun m!1401749 () Bool)

(assert (=> b!1518623 m!1401749))

(assert (=> b!1518614 m!1401731))

(assert (=> b!1518614 m!1401731))

(declare-fun m!1401751 () Bool)

(assert (=> b!1518614 m!1401751))

(declare-fun m!1401753 () Bool)

(assert (=> b!1518617 m!1401753))

(assert (=> b!1518617 m!1401753))

(declare-fun m!1401755 () Bool)

(assert (=> b!1518617 m!1401755))

(assert (=> b!1518616 m!1401731))

(assert (=> b!1518616 m!1401731))

(declare-fun m!1401757 () Bool)

(assert (=> b!1518616 m!1401757))

(assert (=> b!1518616 m!1401757))

(assert (=> b!1518616 m!1401731))

(declare-fun m!1401759 () Bool)

(assert (=> b!1518616 m!1401759))

(declare-fun m!1401761 () Bool)

(assert (=> b!1518619 m!1401761))

(declare-fun m!1401763 () Bool)

(assert (=> b!1518621 m!1401763))

(assert (=> b!1518615 m!1401731))

(assert (=> b!1518615 m!1401731))

(declare-fun m!1401765 () Bool)

(assert (=> b!1518615 m!1401765))

(assert (=> b!1518613 m!1401731))

(assert (=> b!1518613 m!1401731))

(declare-fun m!1401767 () Bool)

(assert (=> b!1518613 m!1401767))

(check-sat (not b!1518624) (not b!1518621) (not b!1518619) (not b!1518622) (not b!1518615) (not b!1518614) (not b!1518623) (not start!129548) (not b!1518613) (not b!1518616) (not b!1518618) (not b!1518617))
(check-sat)
