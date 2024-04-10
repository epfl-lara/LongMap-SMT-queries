; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129256 () Bool)

(assert start!129256)

(declare-fun b!1517747 () Bool)

(declare-fun res!1037660 () Bool)

(declare-fun e!846758 () Bool)

(assert (=> b!1517747 (=> (not res!1037660) (not e!846758))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101112 0))(
  ( (array!101113 (arr!48793 (Array (_ BitVec 32) (_ BitVec 64))) (size!49343 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101112)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517747 (= res!1037660 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49343 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49343 a!2804))))))

(declare-fun b!1517748 () Bool)

(declare-fun res!1037662 () Bool)

(assert (=> b!1517748 (=> (not res!1037662) (not e!846758))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1517748 (= res!1037662 (and (= (size!49343 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49343 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49343 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517749 () Bool)

(declare-fun e!846755 () Bool)

(declare-fun e!846757 () Bool)

(assert (=> b!1517749 (= e!846755 e!846757)))

(declare-fun res!1037655 () Bool)

(assert (=> b!1517749 (=> res!1037655 e!846757)))

(declare-fun lt!657903 () (_ BitVec 32))

(assert (=> b!1517749 (= res!1037655 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657903 #b00000000000000000000000000000000) (bvsge lt!657903 (size!49343 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517749 (= lt!657903 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517750 () Bool)

(declare-fun res!1037659 () Bool)

(assert (=> b!1517750 (=> (not res!1037659) (not e!846758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101112 (_ BitVec 32)) Bool)

(assert (=> b!1517750 (= res!1037659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517751 () Bool)

(declare-fun res!1037661 () Bool)

(assert (=> b!1517751 (=> (not res!1037661) (not e!846758))))

(declare-datatypes ((List!35276 0))(
  ( (Nil!35273) (Cons!35272 (h!36684 (_ BitVec 64)) (t!49970 List!35276)) )
))
(declare-fun arrayNoDuplicates!0 (array!101112 (_ BitVec 32) List!35276) Bool)

(assert (=> b!1517751 (= res!1037661 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35273))))

(declare-fun b!1517753 () Bool)

(declare-fun res!1037656 () Bool)

(declare-fun e!846759 () Bool)

(assert (=> b!1517753 (=> (not res!1037656) (not e!846759))))

(declare-datatypes ((SeekEntryResult!12964 0))(
  ( (MissingZero!12964 (index!54251 (_ BitVec 32))) (Found!12964 (index!54252 (_ BitVec 32))) (Intermediate!12964 (undefined!13776 Bool) (index!54253 (_ BitVec 32)) (x!135930 (_ BitVec 32))) (Undefined!12964) (MissingVacant!12964 (index!54254 (_ BitVec 32))) )
))
(declare-fun lt!657905 () SeekEntryResult!12964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101112 (_ BitVec 32)) SeekEntryResult!12964)

(assert (=> b!1517753 (= res!1037656 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) lt!657905))))

(declare-fun b!1517754 () Bool)

(assert (=> b!1517754 (= e!846759 (not e!846755))))

(declare-fun res!1037652 () Bool)

(assert (=> b!1517754 (=> res!1037652 e!846755)))

(assert (=> b!1517754 (= res!1037652 (or (not (= (select (arr!48793 a!2804) j!70) (select (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846760 () Bool)

(assert (=> b!1517754 e!846760))

(declare-fun res!1037658 () Bool)

(assert (=> b!1517754 (=> (not res!1037658) (not e!846760))))

(assert (=> b!1517754 (= res!1037658 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50796 0))(
  ( (Unit!50797) )
))
(declare-fun lt!657906 () Unit!50796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50796)

(assert (=> b!1517754 (= lt!657906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517755 () Bool)

(declare-fun res!1037657 () Bool)

(assert (=> b!1517755 (=> (not res!1037657) (not e!846758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517755 (= res!1037657 (validKeyInArray!0 (select (arr!48793 a!2804) j!70)))))

(declare-fun b!1517756 () Bool)

(declare-fun res!1037650 () Bool)

(assert (=> b!1517756 (=> (not res!1037650) (not e!846759))))

(declare-fun lt!657907 () SeekEntryResult!12964)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517756 (= res!1037650 (= lt!657907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101113 (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49343 a!2804)) mask!2512)))))

(declare-fun b!1517757 () Bool)

(assert (=> b!1517757 (= e!846758 e!846759)))

(declare-fun res!1037653 () Bool)

(assert (=> b!1517757 (=> (not res!1037653) (not e!846759))))

(assert (=> b!1517757 (= res!1037653 (= lt!657907 lt!657905))))

(assert (=> b!1517757 (= lt!657905 (Intermediate!12964 false resIndex!21 resX!21))))

(assert (=> b!1517757 (= lt!657907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48793 a!2804) j!70) mask!2512) (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037654 () Bool)

(assert (=> start!129256 (=> (not res!1037654) (not e!846758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129256 (= res!1037654 (validMask!0 mask!2512))))

(assert (=> start!129256 e!846758))

(assert (=> start!129256 true))

(declare-fun array_inv!37821 (array!101112) Bool)

(assert (=> start!129256 (array_inv!37821 a!2804)))

(declare-fun b!1517752 () Bool)

(declare-fun res!1037651 () Bool)

(assert (=> b!1517752 (=> (not res!1037651) (not e!846758))))

(assert (=> b!1517752 (= res!1037651 (validKeyInArray!0 (select (arr!48793 a!2804) i!961)))))

(declare-fun b!1517758 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101112 (_ BitVec 32)) SeekEntryResult!12964)

(assert (=> b!1517758 (= e!846760 (= (seekEntry!0 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) (Found!12964 j!70)))))

(declare-fun b!1517759 () Bool)

(assert (=> b!1517759 (= e!846757 true)))

(declare-fun lt!657904 () SeekEntryResult!12964)

(assert (=> b!1517759 (= lt!657904 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657903 (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129256 res!1037654) b!1517748))

(assert (= (and b!1517748 res!1037662) b!1517752))

(assert (= (and b!1517752 res!1037651) b!1517755))

(assert (= (and b!1517755 res!1037657) b!1517750))

(assert (= (and b!1517750 res!1037659) b!1517751))

(assert (= (and b!1517751 res!1037661) b!1517747))

(assert (= (and b!1517747 res!1037660) b!1517757))

(assert (= (and b!1517757 res!1037653) b!1517753))

(assert (= (and b!1517753 res!1037656) b!1517756))

(assert (= (and b!1517756 res!1037650) b!1517754))

(assert (= (and b!1517754 res!1037658) b!1517758))

(assert (= (and b!1517754 (not res!1037652)) b!1517749))

(assert (= (and b!1517749 (not res!1037655)) b!1517759))

(declare-fun m!1401045 () Bool)

(assert (=> b!1517755 m!1401045))

(assert (=> b!1517755 m!1401045))

(declare-fun m!1401047 () Bool)

(assert (=> b!1517755 m!1401047))

(assert (=> b!1517757 m!1401045))

(assert (=> b!1517757 m!1401045))

(declare-fun m!1401049 () Bool)

(assert (=> b!1517757 m!1401049))

(assert (=> b!1517757 m!1401049))

(assert (=> b!1517757 m!1401045))

(declare-fun m!1401051 () Bool)

(assert (=> b!1517757 m!1401051))

(declare-fun m!1401053 () Bool)

(assert (=> b!1517750 m!1401053))

(assert (=> b!1517754 m!1401045))

(declare-fun m!1401055 () Bool)

(assert (=> b!1517754 m!1401055))

(declare-fun m!1401057 () Bool)

(assert (=> b!1517754 m!1401057))

(declare-fun m!1401059 () Bool)

(assert (=> b!1517754 m!1401059))

(declare-fun m!1401061 () Bool)

(assert (=> b!1517754 m!1401061))

(declare-fun m!1401063 () Bool)

(assert (=> start!129256 m!1401063))

(declare-fun m!1401065 () Bool)

(assert (=> start!129256 m!1401065))

(assert (=> b!1517753 m!1401045))

(assert (=> b!1517753 m!1401045))

(declare-fun m!1401067 () Bool)

(assert (=> b!1517753 m!1401067))

(declare-fun m!1401069 () Bool)

(assert (=> b!1517749 m!1401069))

(assert (=> b!1517756 m!1401057))

(assert (=> b!1517756 m!1401059))

(assert (=> b!1517756 m!1401059))

(declare-fun m!1401071 () Bool)

(assert (=> b!1517756 m!1401071))

(assert (=> b!1517756 m!1401071))

(assert (=> b!1517756 m!1401059))

(declare-fun m!1401073 () Bool)

(assert (=> b!1517756 m!1401073))

(declare-fun m!1401075 () Bool)

(assert (=> b!1517752 m!1401075))

(assert (=> b!1517752 m!1401075))

(declare-fun m!1401077 () Bool)

(assert (=> b!1517752 m!1401077))

(assert (=> b!1517758 m!1401045))

(assert (=> b!1517758 m!1401045))

(declare-fun m!1401079 () Bool)

(assert (=> b!1517758 m!1401079))

(assert (=> b!1517759 m!1401045))

(assert (=> b!1517759 m!1401045))

(declare-fun m!1401081 () Bool)

(assert (=> b!1517759 m!1401081))

(declare-fun m!1401083 () Bool)

(assert (=> b!1517751 m!1401083))

(push 1)

