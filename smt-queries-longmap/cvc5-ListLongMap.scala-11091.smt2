; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129568 () Bool)

(assert start!129568)

(declare-fun b!1521035 () Bool)

(declare-fun res!1040261 () Bool)

(declare-fun e!848424 () Bool)

(assert (=> b!1521035 (=> (not res!1040261) (not e!848424))))

(declare-datatypes ((array!101243 0))(
  ( (array!101244 (arr!48854 (Array (_ BitVec 32) (_ BitVec 64))) (size!49404 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101243)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521035 (= res!1040261 (validKeyInArray!0 (select (arr!48854 a!2804) j!70)))))

(declare-fun b!1521036 () Bool)

(declare-fun res!1040263 () Bool)

(assert (=> b!1521036 (=> (not res!1040263) (not e!848424))))

(declare-datatypes ((List!35337 0))(
  ( (Nil!35334) (Cons!35333 (h!36754 (_ BitVec 64)) (t!50031 List!35337)) )
))
(declare-fun arrayNoDuplicates!0 (array!101243 (_ BitVec 32) List!35337) Bool)

(assert (=> b!1521036 (= res!1040263 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35334))))

(declare-fun b!1521037 () Bool)

(assert (=> b!1521037 (= e!848424 false)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13019 0))(
  ( (MissingZero!13019 (index!54471 (_ BitVec 32))) (Found!13019 (index!54472 (_ BitVec 32))) (Intermediate!13019 (undefined!13831 Bool) (index!54473 (_ BitVec 32)) (x!136175 (_ BitVec 32))) (Undefined!13019) (MissingVacant!13019 (index!54474 (_ BitVec 32))) )
))
(declare-fun lt!659299 () SeekEntryResult!13019)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101243 (_ BitVec 32)) SeekEntryResult!13019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521037 (= lt!659299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48854 a!2804) j!70) mask!2512) (select (arr!48854 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521038 () Bool)

(declare-fun res!1040262 () Bool)

(assert (=> b!1521038 (=> (not res!1040262) (not e!848424))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521038 (= res!1040262 (and (= (size!49404 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49404 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49404 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521039 () Bool)

(declare-fun res!1040258 () Bool)

(assert (=> b!1521039 (=> (not res!1040258) (not e!848424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101243 (_ BitVec 32)) Bool)

(assert (=> b!1521039 (= res!1040258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1040260 () Bool)

(assert (=> start!129568 (=> (not res!1040260) (not e!848424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129568 (= res!1040260 (validMask!0 mask!2512))))

(assert (=> start!129568 e!848424))

(assert (=> start!129568 true))

(declare-fun array_inv!37882 (array!101243) Bool)

(assert (=> start!129568 (array_inv!37882 a!2804)))

(declare-fun b!1521040 () Bool)

(declare-fun res!1040257 () Bool)

(assert (=> b!1521040 (=> (not res!1040257) (not e!848424))))

(assert (=> b!1521040 (= res!1040257 (validKeyInArray!0 (select (arr!48854 a!2804) i!961)))))

(declare-fun b!1521041 () Bool)

(declare-fun res!1040259 () Bool)

(assert (=> b!1521041 (=> (not res!1040259) (not e!848424))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521041 (= res!1040259 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49404 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49404 a!2804))))))

(assert (= (and start!129568 res!1040260) b!1521038))

(assert (= (and b!1521038 res!1040262) b!1521040))

(assert (= (and b!1521040 res!1040257) b!1521035))

(assert (= (and b!1521035 res!1040261) b!1521039))

(assert (= (and b!1521039 res!1040258) b!1521036))

(assert (= (and b!1521036 res!1040263) b!1521041))

(assert (= (and b!1521041 res!1040259) b!1521037))

(declare-fun m!1404161 () Bool)

(assert (=> start!129568 m!1404161))

(declare-fun m!1404163 () Bool)

(assert (=> start!129568 m!1404163))

(declare-fun m!1404165 () Bool)

(assert (=> b!1521035 m!1404165))

(assert (=> b!1521035 m!1404165))

(declare-fun m!1404167 () Bool)

(assert (=> b!1521035 m!1404167))

(assert (=> b!1521037 m!1404165))

(assert (=> b!1521037 m!1404165))

(declare-fun m!1404169 () Bool)

(assert (=> b!1521037 m!1404169))

(assert (=> b!1521037 m!1404169))

(assert (=> b!1521037 m!1404165))

(declare-fun m!1404171 () Bool)

(assert (=> b!1521037 m!1404171))

(declare-fun m!1404173 () Bool)

(assert (=> b!1521036 m!1404173))

(declare-fun m!1404175 () Bool)

(assert (=> b!1521040 m!1404175))

(assert (=> b!1521040 m!1404175))

(declare-fun m!1404177 () Bool)

(assert (=> b!1521040 m!1404177))

(declare-fun m!1404179 () Bool)

(assert (=> b!1521039 m!1404179))

(push 1)

(assert (not b!1521035))

(assert (not b!1521039))

(assert (not start!129568))

(assert (not b!1521037))

(assert (not b!1521036))

(assert (not b!1521040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

