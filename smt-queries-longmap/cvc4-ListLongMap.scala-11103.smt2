; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129644 () Bool)

(assert start!129644)

(declare-fun b!1522019 () Bool)

(declare-fun res!1041241 () Bool)

(declare-fun e!848716 () Bool)

(assert (=> b!1522019 (=> (not res!1041241) (not e!848716))))

(declare-datatypes ((array!101319 0))(
  ( (array!101320 (arr!48892 (Array (_ BitVec 32) (_ BitVec 64))) (size!49442 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101319)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522019 (= res!1041241 (validKeyInArray!0 (select (arr!48892 a!2804) i!961)))))

(declare-fun b!1522020 () Bool)

(declare-fun res!1041245 () Bool)

(declare-fun e!848714 () Bool)

(assert (=> b!1522020 (=> (not res!1041245) (not e!848714))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13057 0))(
  ( (MissingZero!13057 (index!54623 (_ BitVec 32))) (Found!13057 (index!54624 (_ BitVec 32))) (Intermediate!13057 (undefined!13869 Bool) (index!54625 (_ BitVec 32)) (x!136309 (_ BitVec 32))) (Undefined!13057) (MissingVacant!13057 (index!54626 (_ BitVec 32))) )
))
(declare-fun lt!659475 () SeekEntryResult!13057)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101319 (_ BitVec 32)) SeekEntryResult!13057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522020 (= res!1041245 (= lt!659475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101320 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49442 a!2804)) mask!2512)))))

(declare-fun b!1522021 () Bool)

(declare-fun res!1041247 () Bool)

(assert (=> b!1522021 (=> (not res!1041247) (not e!848716))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522021 (= res!1041247 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49442 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49442 a!2804))))))

(declare-fun b!1522022 () Bool)

(assert (=> b!1522022 (= e!848714 (and (bvsle #b00000000000000000000000000000000 (size!49442 a!2804)) (bvsgt j!70 (size!49442 a!2804))))))

(declare-fun b!1522023 () Bool)

(declare-fun res!1041242 () Bool)

(assert (=> b!1522023 (=> (not res!1041242) (not e!848716))))

(declare-datatypes ((List!35375 0))(
  ( (Nil!35372) (Cons!35371 (h!36792 (_ BitVec 64)) (t!50069 List!35375)) )
))
(declare-fun arrayNoDuplicates!0 (array!101319 (_ BitVec 32) List!35375) Bool)

(assert (=> b!1522023 (= res!1041242 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35372))))

(declare-fun b!1522024 () Bool)

(assert (=> b!1522024 (= e!848716 e!848714)))

(declare-fun res!1041248 () Bool)

(assert (=> b!1522024 (=> (not res!1041248) (not e!848714))))

(declare-fun lt!659476 () SeekEntryResult!13057)

(assert (=> b!1522024 (= res!1041248 (= lt!659475 lt!659476))))

(assert (=> b!1522024 (= lt!659476 (Intermediate!13057 false resIndex!21 resX!21))))

(assert (=> b!1522024 (= lt!659475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1041243 () Bool)

(assert (=> start!129644 (=> (not res!1041243) (not e!848716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129644 (= res!1041243 (validMask!0 mask!2512))))

(assert (=> start!129644 e!848716))

(assert (=> start!129644 true))

(declare-fun array_inv!37920 (array!101319) Bool)

(assert (=> start!129644 (array_inv!37920 a!2804)))

(declare-fun b!1522025 () Bool)

(declare-fun res!1041246 () Bool)

(assert (=> b!1522025 (=> (not res!1041246) (not e!848714))))

(assert (=> b!1522025 (= res!1041246 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659476))))

(declare-fun b!1522026 () Bool)

(declare-fun res!1041250 () Bool)

(assert (=> b!1522026 (=> (not res!1041250) (not e!848716))))

(assert (=> b!1522026 (= res!1041250 (validKeyInArray!0 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1522027 () Bool)

(declare-fun res!1041244 () Bool)

(assert (=> b!1522027 (=> (not res!1041244) (not e!848716))))

(assert (=> b!1522027 (= res!1041244 (and (= (size!49442 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49442 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49442 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522028 () Bool)

(declare-fun res!1041249 () Bool)

(assert (=> b!1522028 (=> (not res!1041249) (not e!848716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101319 (_ BitVec 32)) Bool)

(assert (=> b!1522028 (= res!1041249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129644 res!1041243) b!1522027))

(assert (= (and b!1522027 res!1041244) b!1522019))

(assert (= (and b!1522019 res!1041241) b!1522026))

(assert (= (and b!1522026 res!1041250) b!1522028))

(assert (= (and b!1522028 res!1041249) b!1522023))

(assert (= (and b!1522023 res!1041242) b!1522021))

(assert (= (and b!1522021 res!1041247) b!1522024))

(assert (= (and b!1522024 res!1041248) b!1522025))

(assert (= (and b!1522025 res!1041246) b!1522020))

(assert (= (and b!1522020 res!1041245) b!1522022))

(declare-fun m!1405139 () Bool)

(assert (=> b!1522020 m!1405139))

(declare-fun m!1405141 () Bool)

(assert (=> b!1522020 m!1405141))

(assert (=> b!1522020 m!1405141))

(declare-fun m!1405143 () Bool)

(assert (=> b!1522020 m!1405143))

(assert (=> b!1522020 m!1405143))

(assert (=> b!1522020 m!1405141))

(declare-fun m!1405145 () Bool)

(assert (=> b!1522020 m!1405145))

(declare-fun m!1405147 () Bool)

(assert (=> start!129644 m!1405147))

(declare-fun m!1405149 () Bool)

(assert (=> start!129644 m!1405149))

(declare-fun m!1405151 () Bool)

(assert (=> b!1522023 m!1405151))

(declare-fun m!1405153 () Bool)

(assert (=> b!1522024 m!1405153))

(assert (=> b!1522024 m!1405153))

(declare-fun m!1405155 () Bool)

(assert (=> b!1522024 m!1405155))

(assert (=> b!1522024 m!1405155))

(assert (=> b!1522024 m!1405153))

(declare-fun m!1405157 () Bool)

(assert (=> b!1522024 m!1405157))

(assert (=> b!1522026 m!1405153))

(assert (=> b!1522026 m!1405153))

(declare-fun m!1405159 () Bool)

(assert (=> b!1522026 m!1405159))

(declare-fun m!1405161 () Bool)

(assert (=> b!1522028 m!1405161))

(declare-fun m!1405163 () Bool)

(assert (=> b!1522019 m!1405163))

(assert (=> b!1522019 m!1405163))

(declare-fun m!1405165 () Bool)

(assert (=> b!1522019 m!1405165))

(assert (=> b!1522025 m!1405153))

(assert (=> b!1522025 m!1405153))

(declare-fun m!1405167 () Bool)

(assert (=> b!1522025 m!1405167))

(push 1)

(assert (not b!1522019))

(assert (not b!1522023))

(assert (not b!1522024))

(assert (not b!1522026))

(assert (not b!1522025))

(assert (not b!1522028))

(assert (not start!129644))

(assert (not b!1522020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

