; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129762 () Bool)

(assert start!129762)

(declare-fun b!1523050 () Bool)

(declare-fun res!1041966 () Bool)

(declare-fun e!849199 () Bool)

(assert (=> b!1523050 (=> (not res!1041966) (not e!849199))))

(declare-datatypes ((SeekEntryResult!13075 0))(
  ( (MissingZero!13075 (index!54695 (_ BitVec 32))) (Found!13075 (index!54696 (_ BitVec 32))) (Intermediate!13075 (undefined!13887 Bool) (index!54697 (_ BitVec 32)) (x!136385 (_ BitVec 32))) (Undefined!13075) (MissingVacant!13075 (index!54698 (_ BitVec 32))) )
))
(declare-fun lt!659846 () SeekEntryResult!13075)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101358 0))(
  ( (array!101359 (arr!48910 (Array (_ BitVec 32) (_ BitVec 64))) (size!49460 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101358)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101358 (_ BitVec 32)) SeekEntryResult!13075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523050 (= res!1041966 (= lt!659846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101359 (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49460 a!2804)) mask!2512)))))

(declare-fun b!1523051 () Bool)

(declare-fun res!1041961 () Bool)

(assert (=> b!1523051 (=> (not res!1041961) (not e!849199))))

(declare-fun lt!659848 () SeekEntryResult!13075)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523051 (= res!1041961 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48910 a!2804) j!70) a!2804 mask!2512) lt!659848))))

(declare-fun b!1523052 () Bool)

(declare-fun res!1041958 () Bool)

(declare-fun e!849196 () Bool)

(assert (=> b!1523052 (=> (not res!1041958) (not e!849196))))

(assert (=> b!1523052 (= res!1041958 (and (= (size!49460 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49460 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49460 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523053 () Bool)

(assert (=> b!1523053 (= e!849196 e!849199)))

(declare-fun res!1041965 () Bool)

(assert (=> b!1523053 (=> (not res!1041965) (not e!849199))))

(assert (=> b!1523053 (= res!1041965 (= lt!659846 lt!659848))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523053 (= lt!659848 (Intermediate!13075 false resIndex!21 resX!21))))

(assert (=> b!1523053 (= lt!659846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48910 a!2804) j!70) mask!2512) (select (arr!48910 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523054 () Bool)

(declare-fun res!1041960 () Bool)

(assert (=> b!1523054 (=> (not res!1041960) (not e!849196))))

(declare-datatypes ((List!35393 0))(
  ( (Nil!35390) (Cons!35389 (h!36813 (_ BitVec 64)) (t!50087 List!35393)) )
))
(declare-fun arrayNoDuplicates!0 (array!101358 (_ BitVec 32) List!35393) Bool)

(assert (=> b!1523054 (= res!1041960 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35390))))

(declare-fun b!1523055 () Bool)

(declare-fun res!1041957 () Bool)

(assert (=> b!1523055 (=> (not res!1041957) (not e!849196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523055 (= res!1041957 (validKeyInArray!0 (select (arr!48910 a!2804) j!70)))))

(declare-fun b!1523056 () Bool)

(declare-fun res!1041964 () Bool)

(assert (=> b!1523056 (=> (not res!1041964) (not e!849196))))

(assert (=> b!1523056 (= res!1041964 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49460 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49460 a!2804))))))

(declare-fun b!1523057 () Bool)

(declare-fun e!849197 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101358 (_ BitVec 32)) SeekEntryResult!13075)

(assert (=> b!1523057 (= e!849197 (= (seekEntry!0 (select (arr!48910 a!2804) j!70) a!2804 mask!2512) (Found!13075 j!70)))))

(declare-fun b!1523058 () Bool)

(declare-fun res!1041959 () Bool)

(assert (=> b!1523058 (=> (not res!1041959) (not e!849196))))

(assert (=> b!1523058 (= res!1041959 (validKeyInArray!0 (select (arr!48910 a!2804) i!961)))))

(declare-fun res!1041962 () Bool)

(assert (=> start!129762 (=> (not res!1041962) (not e!849196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129762 (= res!1041962 (validMask!0 mask!2512))))

(assert (=> start!129762 e!849196))

(assert (=> start!129762 true))

(declare-fun array_inv!37938 (array!101358) Bool)

(assert (=> start!129762 (array_inv!37938 a!2804)))

(declare-fun b!1523059 () Bool)

(assert (=> b!1523059 (= e!849199 (not true))))

(assert (=> b!1523059 e!849197))

(declare-fun res!1041967 () Bool)

(assert (=> b!1523059 (=> (not res!1041967) (not e!849197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101358 (_ BitVec 32)) Bool)

(assert (=> b!1523059 (= res!1041967 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50934 0))(
  ( (Unit!50935) )
))
(declare-fun lt!659847 () Unit!50934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50934)

(assert (=> b!1523059 (= lt!659847 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523060 () Bool)

(declare-fun res!1041963 () Bool)

(assert (=> b!1523060 (=> (not res!1041963) (not e!849196))))

(assert (=> b!1523060 (= res!1041963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129762 res!1041962) b!1523052))

(assert (= (and b!1523052 res!1041958) b!1523058))

(assert (= (and b!1523058 res!1041959) b!1523055))

(assert (= (and b!1523055 res!1041957) b!1523060))

(assert (= (and b!1523060 res!1041963) b!1523054))

(assert (= (and b!1523054 res!1041960) b!1523056))

(assert (= (and b!1523056 res!1041964) b!1523053))

(assert (= (and b!1523053 res!1041965) b!1523051))

(assert (= (and b!1523051 res!1041961) b!1523050))

(assert (= (and b!1523050 res!1041966) b!1523059))

(assert (= (and b!1523059 res!1041967) b!1523057))

(declare-fun m!1406133 () Bool)

(assert (=> b!1523059 m!1406133))

(declare-fun m!1406135 () Bool)

(assert (=> b!1523059 m!1406135))

(declare-fun m!1406137 () Bool)

(assert (=> b!1523057 m!1406137))

(assert (=> b!1523057 m!1406137))

(declare-fun m!1406139 () Bool)

(assert (=> b!1523057 m!1406139))

(assert (=> b!1523051 m!1406137))

(assert (=> b!1523051 m!1406137))

(declare-fun m!1406141 () Bool)

(assert (=> b!1523051 m!1406141))

(declare-fun m!1406143 () Bool)

(assert (=> start!129762 m!1406143))

(declare-fun m!1406145 () Bool)

(assert (=> start!129762 m!1406145))

(declare-fun m!1406147 () Bool)

(assert (=> b!1523058 m!1406147))

(assert (=> b!1523058 m!1406147))

(declare-fun m!1406149 () Bool)

(assert (=> b!1523058 m!1406149))

(declare-fun m!1406151 () Bool)

(assert (=> b!1523050 m!1406151))

(declare-fun m!1406153 () Bool)

(assert (=> b!1523050 m!1406153))

(assert (=> b!1523050 m!1406153))

(declare-fun m!1406155 () Bool)

(assert (=> b!1523050 m!1406155))

(assert (=> b!1523050 m!1406155))

(assert (=> b!1523050 m!1406153))

(declare-fun m!1406157 () Bool)

(assert (=> b!1523050 m!1406157))

(declare-fun m!1406159 () Bool)

(assert (=> b!1523060 m!1406159))

(declare-fun m!1406161 () Bool)

(assert (=> b!1523054 m!1406161))

(assert (=> b!1523055 m!1406137))

(assert (=> b!1523055 m!1406137))

(declare-fun m!1406163 () Bool)

(assert (=> b!1523055 m!1406163))

(assert (=> b!1523053 m!1406137))

(assert (=> b!1523053 m!1406137))

(declare-fun m!1406165 () Bool)

(assert (=> b!1523053 m!1406165))

(assert (=> b!1523053 m!1406165))

(assert (=> b!1523053 m!1406137))

(declare-fun m!1406167 () Bool)

(assert (=> b!1523053 m!1406167))

(push 1)

(assert (not b!1523051))

(assert (not b!1523057))

(assert (not b!1523055))

