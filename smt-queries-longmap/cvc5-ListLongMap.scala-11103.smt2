; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129640 () Bool)

(assert start!129640)

(declare-fun b!1521959 () Bool)

(declare-fun res!1041181 () Bool)

(declare-fun e!848698 () Bool)

(assert (=> b!1521959 (=> (not res!1041181) (not e!848698))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101315 0))(
  ( (array!101316 (arr!48890 (Array (_ BitVec 32) (_ BitVec 64))) (size!49440 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101315)

(declare-datatypes ((SeekEntryResult!13055 0))(
  ( (MissingZero!13055 (index!54615 (_ BitVec 32))) (Found!13055 (index!54616 (_ BitVec 32))) (Intermediate!13055 (undefined!13867 Bool) (index!54617 (_ BitVec 32)) (x!136307 (_ BitVec 32))) (Undefined!13055) (MissingVacant!13055 (index!54618 (_ BitVec 32))) )
))
(declare-fun lt!659463 () SeekEntryResult!13055)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101315 (_ BitVec 32)) SeekEntryResult!13055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521959 (= res!1041181 (= lt!659463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48890 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48890 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101316 (store (arr!48890 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49440 a!2804)) mask!2512)))))

(declare-fun res!1041184 () Bool)

(declare-fun e!848696 () Bool)

(assert (=> start!129640 (=> (not res!1041184) (not e!848696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129640 (= res!1041184 (validMask!0 mask!2512))))

(assert (=> start!129640 e!848696))

(assert (=> start!129640 true))

(declare-fun array_inv!37918 (array!101315) Bool)

(assert (=> start!129640 (array_inv!37918 a!2804)))

(declare-fun b!1521960 () Bool)

(declare-fun res!1041189 () Bool)

(assert (=> b!1521960 (=> (not res!1041189) (not e!848696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521960 (= res!1041189 (validKeyInArray!0 (select (arr!48890 a!2804) j!70)))))

(declare-fun b!1521961 () Bool)

(assert (=> b!1521961 (= e!848696 e!848698)))

(declare-fun res!1041185 () Bool)

(assert (=> b!1521961 (=> (not res!1041185) (not e!848698))))

(declare-fun lt!659464 () SeekEntryResult!13055)

(assert (=> b!1521961 (= res!1041185 (= lt!659463 lt!659464))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521961 (= lt!659464 (Intermediate!13055 false resIndex!21 resX!21))))

(assert (=> b!1521961 (= lt!659463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48890 a!2804) j!70) mask!2512) (select (arr!48890 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521962 () Bool)

(declare-fun res!1041183 () Bool)

(assert (=> b!1521962 (=> (not res!1041183) (not e!848696))))

(assert (=> b!1521962 (= res!1041183 (validKeyInArray!0 (select (arr!48890 a!2804) i!961)))))

(declare-fun b!1521963 () Bool)

(declare-fun res!1041186 () Bool)

(assert (=> b!1521963 (=> (not res!1041186) (not e!848696))))

(declare-datatypes ((List!35373 0))(
  ( (Nil!35370) (Cons!35369 (h!36790 (_ BitVec 64)) (t!50067 List!35373)) )
))
(declare-fun arrayNoDuplicates!0 (array!101315 (_ BitVec 32) List!35373) Bool)

(assert (=> b!1521963 (= res!1041186 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35370))))

(declare-fun b!1521964 () Bool)

(assert (=> b!1521964 (= e!848698 (and (bvsle #b00000000000000000000000000000000 (size!49440 a!2804)) (bvsgt j!70 (size!49440 a!2804))))))

(declare-fun b!1521965 () Bool)

(declare-fun res!1041187 () Bool)

(assert (=> b!1521965 (=> (not res!1041187) (not e!848696))))

(assert (=> b!1521965 (= res!1041187 (and (= (size!49440 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49440 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49440 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521966 () Bool)

(declare-fun res!1041190 () Bool)

(assert (=> b!1521966 (=> (not res!1041190) (not e!848698))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521966 (= res!1041190 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48890 a!2804) j!70) a!2804 mask!2512) lt!659464))))

(declare-fun b!1521967 () Bool)

(declare-fun res!1041182 () Bool)

(assert (=> b!1521967 (=> (not res!1041182) (not e!848696))))

(assert (=> b!1521967 (= res!1041182 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49440 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49440 a!2804))))))

(declare-fun b!1521968 () Bool)

(declare-fun res!1041188 () Bool)

(assert (=> b!1521968 (=> (not res!1041188) (not e!848696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101315 (_ BitVec 32)) Bool)

(assert (=> b!1521968 (= res!1041188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129640 res!1041184) b!1521965))

(assert (= (and b!1521965 res!1041187) b!1521962))

(assert (= (and b!1521962 res!1041183) b!1521960))

(assert (= (and b!1521960 res!1041189) b!1521968))

(assert (= (and b!1521968 res!1041188) b!1521963))

(assert (= (and b!1521963 res!1041186) b!1521967))

(assert (= (and b!1521967 res!1041182) b!1521961))

(assert (= (and b!1521961 res!1041185) b!1521966))

(assert (= (and b!1521966 res!1041190) b!1521959))

(assert (= (and b!1521959 res!1041181) b!1521964))

(declare-fun m!1405079 () Bool)

(assert (=> b!1521968 m!1405079))

(declare-fun m!1405081 () Bool)

(assert (=> b!1521966 m!1405081))

(assert (=> b!1521966 m!1405081))

(declare-fun m!1405083 () Bool)

(assert (=> b!1521966 m!1405083))

(assert (=> b!1521961 m!1405081))

(assert (=> b!1521961 m!1405081))

(declare-fun m!1405085 () Bool)

(assert (=> b!1521961 m!1405085))

(assert (=> b!1521961 m!1405085))

(assert (=> b!1521961 m!1405081))

(declare-fun m!1405087 () Bool)

(assert (=> b!1521961 m!1405087))

(assert (=> b!1521960 m!1405081))

(assert (=> b!1521960 m!1405081))

(declare-fun m!1405089 () Bool)

(assert (=> b!1521960 m!1405089))

(declare-fun m!1405091 () Bool)

(assert (=> b!1521959 m!1405091))

(declare-fun m!1405093 () Bool)

(assert (=> b!1521959 m!1405093))

(assert (=> b!1521959 m!1405093))

(declare-fun m!1405095 () Bool)

(assert (=> b!1521959 m!1405095))

(assert (=> b!1521959 m!1405095))

(assert (=> b!1521959 m!1405093))

(declare-fun m!1405097 () Bool)

(assert (=> b!1521959 m!1405097))

(declare-fun m!1405099 () Bool)

(assert (=> start!129640 m!1405099))

(declare-fun m!1405101 () Bool)

(assert (=> start!129640 m!1405101))

(declare-fun m!1405103 () Bool)

(assert (=> b!1521962 m!1405103))

(assert (=> b!1521962 m!1405103))

(declare-fun m!1405105 () Bool)

(assert (=> b!1521962 m!1405105))

(declare-fun m!1405107 () Bool)

(assert (=> b!1521963 m!1405107))

(push 1)

(assert (not b!1521968))

(assert (not b!1521959))

(assert (not b!1521960))

(assert (not b!1521961))

(assert (not b!1521963))

(assert (not b!1521962))

(assert (not b!1521966))

(assert (not start!129640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

