; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129756 () Bool)

(assert start!129756)

(declare-fun res!1041864 () Bool)

(declare-fun e!849161 () Bool)

(assert (=> start!129756 (=> (not res!1041864) (not e!849161))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129756 (= res!1041864 (validMask!0 mask!2512))))

(assert (=> start!129756 e!849161))

(assert (=> start!129756 true))

(declare-datatypes ((array!101352 0))(
  ( (array!101353 (arr!48907 (Array (_ BitVec 32) (_ BitVec 64))) (size!49457 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101352)

(declare-fun array_inv!37935 (array!101352) Bool)

(assert (=> start!129756 (array_inv!37935 a!2804)))

(declare-fun b!1522951 () Bool)

(declare-fun res!1041861 () Bool)

(declare-fun e!849163 () Bool)

(assert (=> b!1522951 (=> (not res!1041861) (not e!849163))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13072 0))(
  ( (MissingZero!13072 (index!54683 (_ BitVec 32))) (Found!13072 (index!54684 (_ BitVec 32))) (Intermediate!13072 (undefined!13884 Bool) (index!54685 (_ BitVec 32)) (x!136374 (_ BitVec 32))) (Undefined!13072) (MissingVacant!13072 (index!54686 (_ BitVec 32))) )
))
(declare-fun lt!659820 () SeekEntryResult!13072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101352 (_ BitVec 32)) SeekEntryResult!13072)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522951 (= res!1041861 (= lt!659820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101353 (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49457 a!2804)) mask!2512)))))

(declare-fun b!1522952 () Bool)

(declare-fun res!1041865 () Bool)

(assert (=> b!1522952 (=> (not res!1041865) (not e!849163))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!659821 () SeekEntryResult!13072)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522952 (= res!1041865 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48907 a!2804) j!70) a!2804 mask!2512) lt!659821))))

(declare-fun b!1522953 () Bool)

(assert (=> b!1522953 (= e!849161 e!849163)))

(declare-fun res!1041860 () Bool)

(assert (=> b!1522953 (=> (not res!1041860) (not e!849163))))

(assert (=> b!1522953 (= res!1041860 (= lt!659820 lt!659821))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522953 (= lt!659821 (Intermediate!13072 false resIndex!21 resX!21))))

(assert (=> b!1522953 (= lt!659820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48907 a!2804) j!70) mask!2512) (select (arr!48907 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522954 () Bool)

(declare-fun res!1041867 () Bool)

(assert (=> b!1522954 (=> (not res!1041867) (not e!849161))))

(assert (=> b!1522954 (= res!1041867 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49457 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49457 a!2804))))))

(declare-fun b!1522955 () Bool)

(declare-fun res!1041866 () Bool)

(assert (=> b!1522955 (=> (not res!1041866) (not e!849161))))

(declare-datatypes ((List!35390 0))(
  ( (Nil!35387) (Cons!35386 (h!36810 (_ BitVec 64)) (t!50084 List!35390)) )
))
(declare-fun arrayNoDuplicates!0 (array!101352 (_ BitVec 32) List!35390) Bool)

(assert (=> b!1522955 (= res!1041866 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35387))))

(declare-fun e!849160 () Bool)

(declare-fun b!1522956 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101352 (_ BitVec 32)) SeekEntryResult!13072)

(assert (=> b!1522956 (= e!849160 (= (seekEntry!0 (select (arr!48907 a!2804) j!70) a!2804 mask!2512) (Found!13072 j!70)))))

(declare-fun b!1522957 () Bool)

(declare-fun res!1041863 () Bool)

(assert (=> b!1522957 (=> (not res!1041863) (not e!849161))))

(assert (=> b!1522957 (= res!1041863 (and (= (size!49457 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49457 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49457 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522958 () Bool)

(declare-fun res!1041859 () Bool)

(assert (=> b!1522958 (=> (not res!1041859) (not e!849161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522958 (= res!1041859 (validKeyInArray!0 (select (arr!48907 a!2804) j!70)))))

(declare-fun b!1522959 () Bool)

(declare-fun res!1041858 () Bool)

(assert (=> b!1522959 (=> (not res!1041858) (not e!849161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101352 (_ BitVec 32)) Bool)

(assert (=> b!1522959 (= res!1041858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522960 () Bool)

(assert (=> b!1522960 (= e!849163 (not true))))

(assert (=> b!1522960 e!849160))

(declare-fun res!1041862 () Bool)

(assert (=> b!1522960 (=> (not res!1041862) (not e!849160))))

(assert (=> b!1522960 (= res!1041862 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50928 0))(
  ( (Unit!50929) )
))
(declare-fun lt!659819 () Unit!50928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50928)

(assert (=> b!1522960 (= lt!659819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522961 () Bool)

(declare-fun res!1041868 () Bool)

(assert (=> b!1522961 (=> (not res!1041868) (not e!849161))))

(assert (=> b!1522961 (= res!1041868 (validKeyInArray!0 (select (arr!48907 a!2804) i!961)))))

(assert (= (and start!129756 res!1041864) b!1522957))

(assert (= (and b!1522957 res!1041863) b!1522961))

(assert (= (and b!1522961 res!1041868) b!1522958))

(assert (= (and b!1522958 res!1041859) b!1522959))

(assert (= (and b!1522959 res!1041858) b!1522955))

(assert (= (and b!1522955 res!1041866) b!1522954))

(assert (= (and b!1522954 res!1041867) b!1522953))

(assert (= (and b!1522953 res!1041860) b!1522952))

(assert (= (and b!1522952 res!1041865) b!1522951))

(assert (= (and b!1522951 res!1041861) b!1522960))

(assert (= (and b!1522960 res!1041862) b!1522956))

(declare-fun m!1406025 () Bool)

(assert (=> b!1522953 m!1406025))

(assert (=> b!1522953 m!1406025))

(declare-fun m!1406027 () Bool)

(assert (=> b!1522953 m!1406027))

(assert (=> b!1522953 m!1406027))

(assert (=> b!1522953 m!1406025))

(declare-fun m!1406029 () Bool)

(assert (=> b!1522953 m!1406029))

(declare-fun m!1406031 () Bool)

(assert (=> b!1522955 m!1406031))

(declare-fun m!1406033 () Bool)

(assert (=> b!1522961 m!1406033))

(assert (=> b!1522961 m!1406033))

(declare-fun m!1406035 () Bool)

(assert (=> b!1522961 m!1406035))

(declare-fun m!1406037 () Bool)

(assert (=> start!129756 m!1406037))

(declare-fun m!1406039 () Bool)

(assert (=> start!129756 m!1406039))

(assert (=> b!1522958 m!1406025))

(assert (=> b!1522958 m!1406025))

(declare-fun m!1406041 () Bool)

(assert (=> b!1522958 m!1406041))

(declare-fun m!1406043 () Bool)

(assert (=> b!1522951 m!1406043))

(declare-fun m!1406045 () Bool)

(assert (=> b!1522951 m!1406045))

(assert (=> b!1522951 m!1406045))

(declare-fun m!1406047 () Bool)

(assert (=> b!1522951 m!1406047))

(assert (=> b!1522951 m!1406047))

(assert (=> b!1522951 m!1406045))

(declare-fun m!1406049 () Bool)

(assert (=> b!1522951 m!1406049))

(assert (=> b!1522952 m!1406025))

(assert (=> b!1522952 m!1406025))

(declare-fun m!1406051 () Bool)

(assert (=> b!1522952 m!1406051))

(assert (=> b!1522956 m!1406025))

(assert (=> b!1522956 m!1406025))

(declare-fun m!1406053 () Bool)

(assert (=> b!1522956 m!1406053))

(declare-fun m!1406055 () Bool)

(assert (=> b!1522959 m!1406055))

(declare-fun m!1406057 () Bool)

(assert (=> b!1522960 m!1406057))

(declare-fun m!1406059 () Bool)

(assert (=> b!1522960 m!1406059))

(push 1)

(assert (not b!1522959))

(assert (not b!1522958))

(assert (not b!1522960))

