; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130206 () Bool)

(assert start!130206)

(declare-fun b!1528859 () Bool)

(declare-fun e!852025 () Bool)

(declare-fun e!852022 () Bool)

(assert (=> b!1528859 (= e!852025 (not e!852022))))

(declare-fun res!1046756 () Bool)

(assert (=> b!1528859 (=> res!1046756 e!852022)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101554 0))(
  ( (array!101555 (arr!49003 (Array (_ BitVec 32) (_ BitVec 64))) (size!49555 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101554)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528859 (= res!1046756 (or (not (= (select (arr!49003 a!2804) j!70) (select (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852021 () Bool)

(assert (=> b!1528859 e!852021))

(declare-fun res!1046753 () Bool)

(assert (=> b!1528859 (=> (not res!1046753) (not e!852021))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101554 (_ BitVec 32)) Bool)

(assert (=> b!1528859 (= res!1046753 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51005 0))(
  ( (Unit!51006) )
))
(declare-fun lt!662059 () Unit!51005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51005)

(assert (=> b!1528859 (= lt!662059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528860 () Bool)

(declare-fun res!1046751 () Bool)

(declare-fun e!852024 () Bool)

(assert (=> b!1528860 (=> (not res!1046751) (not e!852024))))

(declare-datatypes ((List!35564 0))(
  ( (Nil!35561) (Cons!35560 (h!36997 (_ BitVec 64)) (t!50250 List!35564)) )
))
(declare-fun arrayNoDuplicates!0 (array!101554 (_ BitVec 32) List!35564) Bool)

(assert (=> b!1528860 (= res!1046751 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35561))))

(declare-fun b!1528861 () Bool)

(declare-fun res!1046757 () Bool)

(assert (=> b!1528861 (=> (not res!1046757) (not e!852025))))

(declare-datatypes ((SeekEntryResult!13191 0))(
  ( (MissingZero!13191 (index!55159 (_ BitVec 32))) (Found!13191 (index!55160 (_ BitVec 32))) (Intermediate!13191 (undefined!14003 Bool) (index!55161 (_ BitVec 32)) (x!136849 (_ BitVec 32))) (Undefined!13191) (MissingVacant!13191 (index!55162 (_ BitVec 32))) )
))
(declare-fun lt!662061 () SeekEntryResult!13191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528861 (= res!1046757 (= lt!662061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101555 (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49555 a!2804)) mask!2512)))))

(declare-fun b!1528862 () Bool)

(declare-fun res!1046759 () Bool)

(assert (=> b!1528862 (=> (not res!1046759) (not e!852024))))

(assert (=> b!1528862 (= res!1046759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528863 () Bool)

(assert (=> b!1528863 (= e!852022 true)))

(declare-fun lt!662060 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528863 (= lt!662060 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1046750 () Bool)

(assert (=> start!130206 (=> (not res!1046750) (not e!852024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130206 (= res!1046750 (validMask!0 mask!2512))))

(assert (=> start!130206 e!852024))

(assert (=> start!130206 true))

(declare-fun array_inv!38236 (array!101554) Bool)

(assert (=> start!130206 (array_inv!38236 a!2804)))

(declare-fun b!1528864 () Bool)

(declare-fun res!1046760 () Bool)

(assert (=> b!1528864 (=> (not res!1046760) (not e!852024))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528864 (= res!1046760 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49555 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49555 a!2804))))))

(declare-fun b!1528865 () Bool)

(declare-fun res!1046754 () Bool)

(assert (=> b!1528865 (=> (not res!1046754) (not e!852024))))

(assert (=> b!1528865 (= res!1046754 (and (= (size!49555 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49555 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49555 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528866 () Bool)

(declare-fun res!1046761 () Bool)

(assert (=> b!1528866 (=> (not res!1046761) (not e!852025))))

(declare-fun lt!662058 () SeekEntryResult!13191)

(assert (=> b!1528866 (= res!1046761 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!662058))))

(declare-fun b!1528867 () Bool)

(declare-fun res!1046755 () Bool)

(assert (=> b!1528867 (=> (not res!1046755) (not e!852024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528867 (= res!1046755 (validKeyInArray!0 (select (arr!49003 a!2804) i!961)))))

(declare-fun b!1528868 () Bool)

(declare-fun res!1046758 () Bool)

(assert (=> b!1528868 (=> (not res!1046758) (not e!852024))))

(assert (=> b!1528868 (= res!1046758 (validKeyInArray!0 (select (arr!49003 a!2804) j!70)))))

(declare-fun b!1528869 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13191)

(assert (=> b!1528869 (= e!852021 (= (seekEntry!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) (Found!13191 j!70)))))

(declare-fun b!1528870 () Bool)

(assert (=> b!1528870 (= e!852024 e!852025)))

(declare-fun res!1046752 () Bool)

(assert (=> b!1528870 (=> (not res!1046752) (not e!852025))))

(assert (=> b!1528870 (= res!1046752 (= lt!662061 lt!662058))))

(assert (=> b!1528870 (= lt!662058 (Intermediate!13191 false resIndex!21 resX!21))))

(assert (=> b!1528870 (= lt!662061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130206 res!1046750) b!1528865))

(assert (= (and b!1528865 res!1046754) b!1528867))

(assert (= (and b!1528867 res!1046755) b!1528868))

(assert (= (and b!1528868 res!1046758) b!1528862))

(assert (= (and b!1528862 res!1046759) b!1528860))

(assert (= (and b!1528860 res!1046751) b!1528864))

(assert (= (and b!1528864 res!1046760) b!1528870))

(assert (= (and b!1528870 res!1046752) b!1528866))

(assert (= (and b!1528866 res!1046761) b!1528861))

(assert (= (and b!1528861 res!1046757) b!1528859))

(assert (= (and b!1528859 res!1046753) b!1528869))

(assert (= (and b!1528859 (not res!1046756)) b!1528863))

(declare-fun m!1411211 () Bool)

(assert (=> b!1528862 m!1411211))

(declare-fun m!1411213 () Bool)

(assert (=> b!1528860 m!1411213))

(declare-fun m!1411215 () Bool)

(assert (=> b!1528861 m!1411215))

(declare-fun m!1411217 () Bool)

(assert (=> b!1528861 m!1411217))

(assert (=> b!1528861 m!1411217))

(declare-fun m!1411219 () Bool)

(assert (=> b!1528861 m!1411219))

(assert (=> b!1528861 m!1411219))

(assert (=> b!1528861 m!1411217))

(declare-fun m!1411221 () Bool)

(assert (=> b!1528861 m!1411221))

(declare-fun m!1411223 () Bool)

(assert (=> b!1528870 m!1411223))

(assert (=> b!1528870 m!1411223))

(declare-fun m!1411225 () Bool)

(assert (=> b!1528870 m!1411225))

(assert (=> b!1528870 m!1411225))

(assert (=> b!1528870 m!1411223))

(declare-fun m!1411227 () Bool)

(assert (=> b!1528870 m!1411227))

(declare-fun m!1411229 () Bool)

(assert (=> b!1528867 m!1411229))

(assert (=> b!1528867 m!1411229))

(declare-fun m!1411231 () Bool)

(assert (=> b!1528867 m!1411231))

(assert (=> b!1528866 m!1411223))

(assert (=> b!1528866 m!1411223))

(declare-fun m!1411233 () Bool)

(assert (=> b!1528866 m!1411233))

(assert (=> b!1528869 m!1411223))

(assert (=> b!1528869 m!1411223))

(declare-fun m!1411235 () Bool)

(assert (=> b!1528869 m!1411235))

(declare-fun m!1411237 () Bool)

(assert (=> b!1528863 m!1411237))

(assert (=> b!1528859 m!1411223))

(declare-fun m!1411239 () Bool)

(assert (=> b!1528859 m!1411239))

(assert (=> b!1528859 m!1411215))

(assert (=> b!1528859 m!1411217))

(declare-fun m!1411241 () Bool)

(assert (=> b!1528859 m!1411241))

(assert (=> b!1528868 m!1411223))

(assert (=> b!1528868 m!1411223))

(declare-fun m!1411243 () Bool)

(assert (=> b!1528868 m!1411243))

(declare-fun m!1411245 () Bool)

(assert (=> start!130206 m!1411245))

(declare-fun m!1411247 () Bool)

(assert (=> start!130206 m!1411247))

(check-sat (not b!1528860) (not b!1528863) (not b!1528868) (not b!1528859) (not b!1528870) (not b!1528866) (not b!1528862) (not b!1528867) (not b!1528861) (not b!1528869) (not start!130206))
(check-sat)
