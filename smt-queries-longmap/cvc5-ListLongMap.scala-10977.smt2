; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128520 () Bool)

(assert start!128520)

(declare-fun res!1027390 () Bool)

(declare-fun e!842009 () Bool)

(assert (=> start!128520 (=> (not res!1027390) (not e!842009))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128520 (= res!1027390 (validMask!0 mask!2512))))

(assert (=> start!128520 e!842009))

(assert (=> start!128520 true))

(declare-datatypes ((array!100493 0))(
  ( (array!100494 (arr!48489 (Array (_ BitVec 32) (_ BitVec 64))) (size!49041 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100493)

(declare-fun array_inv!37722 (array!100493) Bool)

(assert (=> start!128520 (array_inv!37722 a!2804)))

(declare-fun b!1506963 () Bool)

(declare-fun res!1027388 () Bool)

(assert (=> b!1506963 (=> (not res!1027388) (not e!842009))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506963 (= res!1027388 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49041 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49041 a!2804))))))

(declare-fun b!1506964 () Bool)

(declare-fun res!1027389 () Bool)

(assert (=> b!1506964 (=> (not res!1027389) (not e!842009))))

(declare-datatypes ((List!35050 0))(
  ( (Nil!35047) (Cons!35046 (h!36450 (_ BitVec 64)) (t!49736 List!35050)) )
))
(declare-fun arrayNoDuplicates!0 (array!100493 (_ BitVec 32) List!35050) Bool)

(assert (=> b!1506964 (= res!1027389 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35047))))

(declare-fun b!1506965 () Bool)

(declare-fun res!1027394 () Bool)

(assert (=> b!1506965 (=> (not res!1027394) (not e!842009))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12683 0))(
  ( (MissingZero!12683 (index!53127 (_ BitVec 32))) (Found!12683 (index!53128 (_ BitVec 32))) (Intermediate!12683 (undefined!13495 Bool) (index!53129 (_ BitVec 32)) (x!134881 (_ BitVec 32))) (Undefined!12683) (MissingVacant!12683 (index!53130 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100493 (_ BitVec 32)) SeekEntryResult!12683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506965 (= res!1027394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48489 a!2804) j!70) mask!2512) (select (arr!48489 a!2804) j!70) a!2804 mask!2512) (Intermediate!12683 false resIndex!21 resX!21)))))

(declare-fun b!1506966 () Bool)

(declare-fun res!1027392 () Bool)

(assert (=> b!1506966 (=> (not res!1027392) (not e!842009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100493 (_ BitVec 32)) Bool)

(assert (=> b!1506966 (= res!1027392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506967 () Bool)

(declare-fun res!1027393 () Bool)

(assert (=> b!1506967 (=> (not res!1027393) (not e!842009))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506967 (= res!1027393 (and (= (size!49041 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49041 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49041 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506968 () Bool)

(assert (=> b!1506968 (= e!842009 false)))

(declare-fun lt!654078 () SeekEntryResult!12683)

(assert (=> b!1506968 (= lt!654078 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48489 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506969 () Bool)

(declare-fun res!1027387 () Bool)

(assert (=> b!1506969 (=> (not res!1027387) (not e!842009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506969 (= res!1027387 (validKeyInArray!0 (select (arr!48489 a!2804) j!70)))))

(declare-fun b!1506970 () Bool)

(declare-fun res!1027391 () Bool)

(assert (=> b!1506970 (=> (not res!1027391) (not e!842009))))

(assert (=> b!1506970 (= res!1027391 (validKeyInArray!0 (select (arr!48489 a!2804) i!961)))))

(assert (= (and start!128520 res!1027390) b!1506967))

(assert (= (and b!1506967 res!1027393) b!1506970))

(assert (= (and b!1506970 res!1027391) b!1506969))

(assert (= (and b!1506969 res!1027387) b!1506966))

(assert (= (and b!1506966 res!1027392) b!1506964))

(assert (= (and b!1506964 res!1027389) b!1506963))

(assert (= (and b!1506963 res!1027388) b!1506965))

(assert (= (and b!1506965 res!1027394) b!1506968))

(declare-fun m!1389163 () Bool)

(assert (=> b!1506969 m!1389163))

(assert (=> b!1506969 m!1389163))

(declare-fun m!1389165 () Bool)

(assert (=> b!1506969 m!1389165))

(assert (=> b!1506965 m!1389163))

(assert (=> b!1506965 m!1389163))

(declare-fun m!1389167 () Bool)

(assert (=> b!1506965 m!1389167))

(assert (=> b!1506965 m!1389167))

(assert (=> b!1506965 m!1389163))

(declare-fun m!1389169 () Bool)

(assert (=> b!1506965 m!1389169))

(assert (=> b!1506968 m!1389163))

(assert (=> b!1506968 m!1389163))

(declare-fun m!1389171 () Bool)

(assert (=> b!1506968 m!1389171))

(declare-fun m!1389173 () Bool)

(assert (=> b!1506970 m!1389173))

(assert (=> b!1506970 m!1389173))

(declare-fun m!1389175 () Bool)

(assert (=> b!1506970 m!1389175))

(declare-fun m!1389177 () Bool)

(assert (=> start!128520 m!1389177))

(declare-fun m!1389179 () Bool)

(assert (=> start!128520 m!1389179))

(declare-fun m!1389181 () Bool)

(assert (=> b!1506964 m!1389181))

(declare-fun m!1389183 () Bool)

(assert (=> b!1506966 m!1389183))

(push 1)

(assert (not b!1506966))

(assert (not start!128520))

(assert (not b!1506965))

(assert (not b!1506970))

(assert (not b!1506964))

(assert (not b!1506968))

(assert (not b!1506969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

