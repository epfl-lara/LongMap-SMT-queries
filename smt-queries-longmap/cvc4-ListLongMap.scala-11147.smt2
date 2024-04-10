; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130248 () Bool)

(assert start!130248)

(declare-fun b!1529028 () Bool)

(declare-fun res!1046738 () Bool)

(declare-fun e!852161 () Bool)

(assert (=> b!1529028 (=> (not res!1046738) (not e!852161))))

(declare-datatypes ((SeekEntryResult!13189 0))(
  ( (MissingZero!13189 (index!55151 (_ BitVec 32))) (Found!13189 (index!55152 (_ BitVec 32))) (Intermediate!13189 (undefined!14001 Bool) (index!55153 (_ BitVec 32)) (x!136836 (_ BitVec 32))) (Undefined!13189) (MissingVacant!13189 (index!55154 (_ BitVec 32))) )
))
(declare-fun lt!662299 () SeekEntryResult!13189)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101598 0))(
  ( (array!101599 (arr!49024 (Array (_ BitVec 32) (_ BitVec 64))) (size!49574 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101598 (_ BitVec 32)) SeekEntryResult!13189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529028 (= res!1046738 (= lt!662299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101599 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49574 a!2804)) mask!2512)))))

(declare-fun b!1529029 () Bool)

(declare-fun res!1046742 () Bool)

(declare-fun e!852160 () Bool)

(assert (=> b!1529029 (=> (not res!1046742) (not e!852160))))

(assert (=> b!1529029 (= res!1046742 (and (= (size!49574 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49574 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49574 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529030 () Bool)

(declare-fun res!1046736 () Bool)

(assert (=> b!1529030 (=> (not res!1046736) (not e!852160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529030 (= res!1046736 (validKeyInArray!0 (select (arr!49024 a!2804) j!70)))))

(declare-fun res!1046744 () Bool)

(assert (=> start!130248 (=> (not res!1046744) (not e!852160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130248 (= res!1046744 (validMask!0 mask!2512))))

(assert (=> start!130248 e!852160))

(assert (=> start!130248 true))

(declare-fun array_inv!38052 (array!101598) Bool)

(assert (=> start!130248 (array_inv!38052 a!2804)))

(declare-fun b!1529031 () Bool)

(declare-fun res!1046741 () Bool)

(assert (=> b!1529031 (=> (not res!1046741) (not e!852160))))

(assert (=> b!1529031 (= res!1046741 (validKeyInArray!0 (select (arr!49024 a!2804) i!961)))))

(declare-fun b!1529032 () Bool)

(declare-fun e!852162 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101598 (_ BitVec 32)) SeekEntryResult!13189)

(assert (=> b!1529032 (= e!852162 (= (seekEntry!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) (Found!13189 j!70)))))

(declare-fun b!1529033 () Bool)

(assert (=> b!1529033 (= e!852160 e!852161)))

(declare-fun res!1046739 () Bool)

(assert (=> b!1529033 (=> (not res!1046739) (not e!852161))))

(declare-fun lt!662298 () SeekEntryResult!13189)

(assert (=> b!1529033 (= res!1046739 (= lt!662299 lt!662298))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529033 (= lt!662298 (Intermediate!13189 false resIndex!21 resX!21))))

(assert (=> b!1529033 (= lt!662299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529034 () Bool)

(declare-fun res!1046740 () Bool)

(assert (=> b!1529034 (=> (not res!1046740) (not e!852161))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529034 (= res!1046740 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!662298))))

(declare-fun b!1529035 () Bool)

(declare-fun res!1046746 () Bool)

(assert (=> b!1529035 (=> (not res!1046746) (not e!852160))))

(declare-datatypes ((List!35507 0))(
  ( (Nil!35504) (Cons!35503 (h!36939 (_ BitVec 64)) (t!50201 List!35507)) )
))
(declare-fun arrayNoDuplicates!0 (array!101598 (_ BitVec 32) List!35507) Bool)

(assert (=> b!1529035 (= res!1046746 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35504))))

(declare-fun b!1529036 () Bool)

(declare-fun res!1046735 () Bool)

(assert (=> b!1529036 (=> (not res!1046735) (not e!852160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101598 (_ BitVec 32)) Bool)

(assert (=> b!1529036 (= res!1046735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529037 () Bool)

(declare-fun e!852163 () Bool)

(assert (=> b!1529037 (= e!852163 true)))

(declare-fun lt!662297 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529037 (= lt!662297 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529038 () Bool)

(assert (=> b!1529038 (= e!852161 (not e!852163))))

(declare-fun res!1046745 () Bool)

(assert (=> b!1529038 (=> res!1046745 e!852163)))

(assert (=> b!1529038 (= res!1046745 (or (not (= (select (arr!49024 a!2804) j!70) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529038 e!852162))

(declare-fun res!1046737 () Bool)

(assert (=> b!1529038 (=> (not res!1046737) (not e!852162))))

(assert (=> b!1529038 (= res!1046737 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51162 0))(
  ( (Unit!51163) )
))
(declare-fun lt!662296 () Unit!51162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51162)

(assert (=> b!1529038 (= lt!662296 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529039 () Bool)

(declare-fun res!1046743 () Bool)

(assert (=> b!1529039 (=> (not res!1046743) (not e!852160))))

(assert (=> b!1529039 (= res!1046743 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49574 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49574 a!2804))))))

(assert (= (and start!130248 res!1046744) b!1529029))

(assert (= (and b!1529029 res!1046742) b!1529031))

(assert (= (and b!1529031 res!1046741) b!1529030))

(assert (= (and b!1529030 res!1046736) b!1529036))

(assert (= (and b!1529036 res!1046735) b!1529035))

(assert (= (and b!1529035 res!1046746) b!1529039))

(assert (= (and b!1529039 res!1046743) b!1529033))

(assert (= (and b!1529033 res!1046739) b!1529034))

(assert (= (and b!1529034 res!1046740) b!1529028))

(assert (= (and b!1529028 res!1046738) b!1529038))

(assert (= (and b!1529038 res!1046737) b!1529032))

(assert (= (and b!1529038 (not res!1046745)) b!1529037))

(declare-fun m!1411951 () Bool)

(assert (=> b!1529038 m!1411951))

(declare-fun m!1411953 () Bool)

(assert (=> b!1529038 m!1411953))

(declare-fun m!1411955 () Bool)

(assert (=> b!1529038 m!1411955))

(declare-fun m!1411957 () Bool)

(assert (=> b!1529038 m!1411957))

(declare-fun m!1411959 () Bool)

(assert (=> b!1529038 m!1411959))

(assert (=> b!1529032 m!1411951))

(assert (=> b!1529032 m!1411951))

(declare-fun m!1411961 () Bool)

(assert (=> b!1529032 m!1411961))

(declare-fun m!1411963 () Bool)

(assert (=> b!1529036 m!1411963))

(declare-fun m!1411965 () Bool)

(assert (=> start!130248 m!1411965))

(declare-fun m!1411967 () Bool)

(assert (=> start!130248 m!1411967))

(declare-fun m!1411969 () Bool)

(assert (=> b!1529037 m!1411969))

(assert (=> b!1529028 m!1411955))

(assert (=> b!1529028 m!1411957))

(assert (=> b!1529028 m!1411957))

(declare-fun m!1411971 () Bool)

(assert (=> b!1529028 m!1411971))

(assert (=> b!1529028 m!1411971))

(assert (=> b!1529028 m!1411957))

(declare-fun m!1411973 () Bool)

(assert (=> b!1529028 m!1411973))

(assert (=> b!1529033 m!1411951))

(assert (=> b!1529033 m!1411951))

(declare-fun m!1411975 () Bool)

(assert (=> b!1529033 m!1411975))

(assert (=> b!1529033 m!1411975))

(assert (=> b!1529033 m!1411951))

(declare-fun m!1411977 () Bool)

(assert (=> b!1529033 m!1411977))

(declare-fun m!1411979 () Bool)

(assert (=> b!1529031 m!1411979))

(assert (=> b!1529031 m!1411979))

(declare-fun m!1411981 () Bool)

(assert (=> b!1529031 m!1411981))

(assert (=> b!1529034 m!1411951))

(assert (=> b!1529034 m!1411951))

(declare-fun m!1411983 () Bool)

(assert (=> b!1529034 m!1411983))

(declare-fun m!1411985 () Bool)

(assert (=> b!1529035 m!1411985))

(assert (=> b!1529030 m!1411951))

(assert (=> b!1529030 m!1411951))

(declare-fun m!1411987 () Bool)

(assert (=> b!1529030 m!1411987))

(push 1)

