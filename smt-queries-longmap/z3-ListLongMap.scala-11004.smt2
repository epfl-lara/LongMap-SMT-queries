; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128804 () Bool)

(assert start!128804)

(declare-fun res!1029879 () Bool)

(declare-fun e!843117 () Bool)

(assert (=> start!128804 (=> (not res!1029879) (not e!843117))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128804 (= res!1029879 (validMask!0 mask!2512))))

(assert (=> start!128804 e!843117))

(assert (=> start!128804 true))

(declare-datatypes ((array!100660 0))(
  ( (array!100661 (arr!48568 (Array (_ BitVec 32) (_ BitVec 64))) (size!49120 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100660)

(declare-fun array_inv!37801 (array!100660) Bool)

(assert (=> start!128804 (array_inv!37801 a!2804)))

(declare-fun b!1509765 () Bool)

(declare-fun res!1029884 () Bool)

(assert (=> b!1509765 (=> (not res!1029884) (not e!843117))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509765 (= res!1029884 (and (= (size!49120 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49120 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49120 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509766 () Bool)

(declare-fun res!1029874 () Bool)

(assert (=> b!1509766 (=> (not res!1029874) (not e!843117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509766 (= res!1029874 (validKeyInArray!0 (select (arr!48568 a!2804) j!70)))))

(declare-fun b!1509767 () Bool)

(declare-fun res!1029878 () Bool)

(assert (=> b!1509767 (=> (not res!1029878) (not e!843117))))

(declare-datatypes ((List!35129 0))(
  ( (Nil!35126) (Cons!35125 (h!36538 (_ BitVec 64)) (t!49815 List!35129)) )
))
(declare-fun arrayNoDuplicates!0 (array!100660 (_ BitVec 32) List!35129) Bool)

(assert (=> b!1509767 (= res!1029878 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35126))))

(declare-fun b!1509768 () Bool)

(declare-fun res!1029883 () Bool)

(declare-fun e!843118 () Bool)

(assert (=> b!1509768 (=> (not res!1029883) (not e!843118))))

(declare-datatypes ((SeekEntryResult!12762 0))(
  ( (MissingZero!12762 (index!53443 (_ BitVec 32))) (Found!12762 (index!53444 (_ BitVec 32))) (Intermediate!12762 (undefined!13574 Bool) (index!53445 (_ BitVec 32)) (x!135194 (_ BitVec 32))) (Undefined!12762) (MissingVacant!12762 (index!53446 (_ BitVec 32))) )
))
(declare-fun lt!654786 () SeekEntryResult!12762)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100660 (_ BitVec 32)) SeekEntryResult!12762)

(assert (=> b!1509768 (= res!1029883 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48568 a!2804) j!70) a!2804 mask!2512) lt!654786))))

(declare-fun b!1509769 () Bool)

(assert (=> b!1509769 (= e!843117 e!843118)))

(declare-fun res!1029881 () Bool)

(assert (=> b!1509769 (=> (not res!1029881) (not e!843118))))

(declare-fun lt!654784 () SeekEntryResult!12762)

(assert (=> b!1509769 (= res!1029881 (= lt!654784 lt!654786))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509769 (= lt!654786 (Intermediate!12762 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509769 (= lt!654784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48568 a!2804) j!70) mask!2512) (select (arr!48568 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509770 () Bool)

(declare-fun res!1029877 () Bool)

(assert (=> b!1509770 (=> (not res!1029877) (not e!843118))))

(assert (=> b!1509770 (= res!1029877 (= lt!654784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100661 (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49120 a!2804)) mask!2512)))))

(declare-fun e!843120 () Bool)

(declare-fun b!1509771 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100660 (_ BitVec 32)) SeekEntryResult!12762)

(assert (=> b!1509771 (= e!843120 (= (seekEntry!0 (select (arr!48568 a!2804) j!70) a!2804 mask!2512) (Found!12762 j!70)))))

(declare-fun b!1509772 () Bool)

(declare-fun res!1029880 () Bool)

(assert (=> b!1509772 (=> (not res!1029880) (not e!843117))))

(assert (=> b!1509772 (= res!1029880 (validKeyInArray!0 (select (arr!48568 a!2804) i!961)))))

(declare-fun b!1509773 () Bool)

(declare-fun res!1029875 () Bool)

(assert (=> b!1509773 (=> (not res!1029875) (not e!843117))))

(assert (=> b!1509773 (= res!1029875 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49120 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49120 a!2804))))))

(declare-fun b!1509774 () Bool)

(declare-fun res!1029876 () Bool)

(assert (=> b!1509774 (=> (not res!1029876) (not e!843117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100660 (_ BitVec 32)) Bool)

(assert (=> b!1509774 (= res!1029876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509775 () Bool)

(assert (=> b!1509775 (= e!843118 (not (or (not (= (select (arr!48568 a!2804) j!70) (select (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48568 a!2804) index!487) (select (arr!48568 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1509775 e!843120))

(declare-fun res!1029882 () Bool)

(assert (=> b!1509775 (=> (not res!1029882) (not e!843120))))

(assert (=> b!1509775 (= res!1029882 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50231 0))(
  ( (Unit!50232) )
))
(declare-fun lt!654785 () Unit!50231)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50231)

(assert (=> b!1509775 (= lt!654785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128804 res!1029879) b!1509765))

(assert (= (and b!1509765 res!1029884) b!1509772))

(assert (= (and b!1509772 res!1029880) b!1509766))

(assert (= (and b!1509766 res!1029874) b!1509774))

(assert (= (and b!1509774 res!1029876) b!1509767))

(assert (= (and b!1509767 res!1029878) b!1509773))

(assert (= (and b!1509773 res!1029875) b!1509769))

(assert (= (and b!1509769 res!1029881) b!1509768))

(assert (= (and b!1509768 res!1029883) b!1509770))

(assert (= (and b!1509770 res!1029877) b!1509775))

(assert (= (and b!1509775 res!1029882) b!1509771))

(declare-fun m!1391747 () Bool)

(assert (=> start!128804 m!1391747))

(declare-fun m!1391749 () Bool)

(assert (=> start!128804 m!1391749))

(declare-fun m!1391751 () Bool)

(assert (=> b!1509772 m!1391751))

(assert (=> b!1509772 m!1391751))

(declare-fun m!1391753 () Bool)

(assert (=> b!1509772 m!1391753))

(declare-fun m!1391755 () Bool)

(assert (=> b!1509770 m!1391755))

(declare-fun m!1391757 () Bool)

(assert (=> b!1509770 m!1391757))

(assert (=> b!1509770 m!1391757))

(declare-fun m!1391759 () Bool)

(assert (=> b!1509770 m!1391759))

(assert (=> b!1509770 m!1391759))

(assert (=> b!1509770 m!1391757))

(declare-fun m!1391761 () Bool)

(assert (=> b!1509770 m!1391761))

(declare-fun m!1391763 () Bool)

(assert (=> b!1509775 m!1391763))

(declare-fun m!1391765 () Bool)

(assert (=> b!1509775 m!1391765))

(assert (=> b!1509775 m!1391755))

(declare-fun m!1391767 () Bool)

(assert (=> b!1509775 m!1391767))

(assert (=> b!1509775 m!1391757))

(declare-fun m!1391769 () Bool)

(assert (=> b!1509775 m!1391769))

(assert (=> b!1509771 m!1391763))

(assert (=> b!1509771 m!1391763))

(declare-fun m!1391771 () Bool)

(assert (=> b!1509771 m!1391771))

(declare-fun m!1391773 () Bool)

(assert (=> b!1509774 m!1391773))

(assert (=> b!1509766 m!1391763))

(assert (=> b!1509766 m!1391763))

(declare-fun m!1391775 () Bool)

(assert (=> b!1509766 m!1391775))

(assert (=> b!1509769 m!1391763))

(assert (=> b!1509769 m!1391763))

(declare-fun m!1391777 () Bool)

(assert (=> b!1509769 m!1391777))

(assert (=> b!1509769 m!1391777))

(assert (=> b!1509769 m!1391763))

(declare-fun m!1391779 () Bool)

(assert (=> b!1509769 m!1391779))

(assert (=> b!1509768 m!1391763))

(assert (=> b!1509768 m!1391763))

(declare-fun m!1391781 () Bool)

(assert (=> b!1509768 m!1391781))

(declare-fun m!1391783 () Bool)

(assert (=> b!1509767 m!1391783))

(check-sat (not b!1509767) (not b!1509772) (not b!1509770) (not b!1509771) (not b!1509769) (not b!1509774) (not start!128804) (not b!1509775) (not b!1509766) (not b!1509768))
(check-sat)
