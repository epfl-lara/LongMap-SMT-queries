; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130244 () Bool)

(assert start!130244)

(declare-fun b!1528956 () Bool)

(declare-fun res!1046663 () Bool)

(declare-fun e!852129 () Bool)

(assert (=> b!1528956 (=> (not res!1046663) (not e!852129))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101594 0))(
  ( (array!101595 (arr!49022 (Array (_ BitVec 32) (_ BitVec 64))) (size!49572 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101594)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528956 (= res!1046663 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49572 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49572 a!2804))))))

(declare-fun b!1528957 () Bool)

(declare-fun res!1046674 () Bool)

(declare-fun e!852132 () Bool)

(assert (=> b!1528957 (=> (not res!1046674) (not e!852132))))

(declare-datatypes ((SeekEntryResult!13187 0))(
  ( (MissingZero!13187 (index!55143 (_ BitVec 32))) (Found!13187 (index!55144 (_ BitVec 32))) (Intermediate!13187 (undefined!13999 Bool) (index!55145 (_ BitVec 32)) (x!136834 (_ BitVec 32))) (Undefined!13187) (MissingVacant!13187 (index!55146 (_ BitVec 32))) )
))
(declare-fun lt!662275 () SeekEntryResult!13187)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101594 (_ BitVec 32)) SeekEntryResult!13187)

(assert (=> b!1528957 (= res!1046674 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49022 a!2804) j!70) a!2804 mask!2512) lt!662275))))

(declare-fun b!1528958 () Bool)

(declare-fun res!1046665 () Bool)

(assert (=> b!1528958 (=> (not res!1046665) (not e!852129))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528958 (= res!1046665 (validKeyInArray!0 (select (arr!49022 a!2804) i!961)))))

(declare-fun b!1528959 () Bool)

(declare-fun res!1046671 () Bool)

(assert (=> b!1528959 (=> (not res!1046671) (not e!852129))))

(assert (=> b!1528959 (= res!1046671 (and (= (size!49572 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49572 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49572 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1046669 () Bool)

(assert (=> start!130244 (=> (not res!1046669) (not e!852129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130244 (= res!1046669 (validMask!0 mask!2512))))

(assert (=> start!130244 e!852129))

(assert (=> start!130244 true))

(declare-fun array_inv!38050 (array!101594) Bool)

(assert (=> start!130244 (array_inv!38050 a!2804)))

(declare-fun b!1528960 () Bool)

(declare-fun e!852133 () Bool)

(assert (=> b!1528960 (= e!852132 (not e!852133))))

(declare-fun res!1046664 () Bool)

(assert (=> b!1528960 (=> res!1046664 e!852133)))

(assert (=> b!1528960 (= res!1046664 (or (not (= (select (arr!49022 a!2804) j!70) (select (store (arr!49022 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852130 () Bool)

(assert (=> b!1528960 e!852130))

(declare-fun res!1046668 () Bool)

(assert (=> b!1528960 (=> (not res!1046668) (not e!852130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101594 (_ BitVec 32)) Bool)

(assert (=> b!1528960 (= res!1046668 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51158 0))(
  ( (Unit!51159) )
))
(declare-fun lt!662274 () Unit!51158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51158)

(assert (=> b!1528960 (= lt!662274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528961 () Bool)

(assert (=> b!1528961 (= e!852133 true)))

(declare-fun lt!662272 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528961 (= lt!662272 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528962 () Bool)

(declare-fun res!1046670 () Bool)

(assert (=> b!1528962 (=> (not res!1046670) (not e!852129))))

(declare-datatypes ((List!35505 0))(
  ( (Nil!35502) (Cons!35501 (h!36937 (_ BitVec 64)) (t!50199 List!35505)) )
))
(declare-fun arrayNoDuplicates!0 (array!101594 (_ BitVec 32) List!35505) Bool)

(assert (=> b!1528962 (= res!1046670 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35502))))

(declare-fun b!1528963 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101594 (_ BitVec 32)) SeekEntryResult!13187)

(assert (=> b!1528963 (= e!852130 (= (seekEntry!0 (select (arr!49022 a!2804) j!70) a!2804 mask!2512) (Found!13187 j!70)))))

(declare-fun b!1528964 () Bool)

(assert (=> b!1528964 (= e!852129 e!852132)))

(declare-fun res!1046666 () Bool)

(assert (=> b!1528964 (=> (not res!1046666) (not e!852132))))

(declare-fun lt!662273 () SeekEntryResult!13187)

(assert (=> b!1528964 (= res!1046666 (= lt!662273 lt!662275))))

(assert (=> b!1528964 (= lt!662275 (Intermediate!13187 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528964 (= lt!662273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49022 a!2804) j!70) mask!2512) (select (arr!49022 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528965 () Bool)

(declare-fun res!1046672 () Bool)

(assert (=> b!1528965 (=> (not res!1046672) (not e!852129))))

(assert (=> b!1528965 (= res!1046672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528966 () Bool)

(declare-fun res!1046673 () Bool)

(assert (=> b!1528966 (=> (not res!1046673) (not e!852129))))

(assert (=> b!1528966 (= res!1046673 (validKeyInArray!0 (select (arr!49022 a!2804) j!70)))))

(declare-fun b!1528967 () Bool)

(declare-fun res!1046667 () Bool)

(assert (=> b!1528967 (=> (not res!1046667) (not e!852132))))

(assert (=> b!1528967 (= res!1046667 (= lt!662273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49022 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49022 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101595 (store (arr!49022 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49572 a!2804)) mask!2512)))))

(assert (= (and start!130244 res!1046669) b!1528959))

(assert (= (and b!1528959 res!1046671) b!1528958))

(assert (= (and b!1528958 res!1046665) b!1528966))

(assert (= (and b!1528966 res!1046673) b!1528965))

(assert (= (and b!1528965 res!1046672) b!1528962))

(assert (= (and b!1528962 res!1046670) b!1528956))

(assert (= (and b!1528956 res!1046663) b!1528964))

(assert (= (and b!1528964 res!1046666) b!1528957))

(assert (= (and b!1528957 res!1046674) b!1528967))

(assert (= (and b!1528967 res!1046667) b!1528960))

(assert (= (and b!1528960 res!1046668) b!1528963))

(assert (= (and b!1528960 (not res!1046664)) b!1528961))

(declare-fun m!1411875 () Bool)

(assert (=> b!1528967 m!1411875))

(declare-fun m!1411877 () Bool)

(assert (=> b!1528967 m!1411877))

(assert (=> b!1528967 m!1411877))

(declare-fun m!1411879 () Bool)

(assert (=> b!1528967 m!1411879))

(assert (=> b!1528967 m!1411879))

(assert (=> b!1528967 m!1411877))

(declare-fun m!1411881 () Bool)

(assert (=> b!1528967 m!1411881))

(declare-fun m!1411883 () Bool)

(assert (=> start!130244 m!1411883))

(declare-fun m!1411885 () Bool)

(assert (=> start!130244 m!1411885))

(declare-fun m!1411887 () Bool)

(assert (=> b!1528962 m!1411887))

(declare-fun m!1411889 () Bool)

(assert (=> b!1528961 m!1411889))

(declare-fun m!1411891 () Bool)

(assert (=> b!1528957 m!1411891))

(assert (=> b!1528957 m!1411891))

(declare-fun m!1411893 () Bool)

(assert (=> b!1528957 m!1411893))

(declare-fun m!1411895 () Bool)

(assert (=> b!1528965 m!1411895))

(assert (=> b!1528963 m!1411891))

(assert (=> b!1528963 m!1411891))

(declare-fun m!1411897 () Bool)

(assert (=> b!1528963 m!1411897))

(assert (=> b!1528964 m!1411891))

(assert (=> b!1528964 m!1411891))

(declare-fun m!1411899 () Bool)

(assert (=> b!1528964 m!1411899))

(assert (=> b!1528964 m!1411899))

(assert (=> b!1528964 m!1411891))

(declare-fun m!1411901 () Bool)

(assert (=> b!1528964 m!1411901))

(declare-fun m!1411903 () Bool)

(assert (=> b!1528958 m!1411903))

(assert (=> b!1528958 m!1411903))

(declare-fun m!1411905 () Bool)

(assert (=> b!1528958 m!1411905))

(assert (=> b!1528960 m!1411891))

(declare-fun m!1411907 () Bool)

(assert (=> b!1528960 m!1411907))

(assert (=> b!1528960 m!1411875))

(assert (=> b!1528960 m!1411877))

(declare-fun m!1411909 () Bool)

(assert (=> b!1528960 m!1411909))

(assert (=> b!1528966 m!1411891))

(assert (=> b!1528966 m!1411891))

(declare-fun m!1411911 () Bool)

(assert (=> b!1528966 m!1411911))

(push 1)

