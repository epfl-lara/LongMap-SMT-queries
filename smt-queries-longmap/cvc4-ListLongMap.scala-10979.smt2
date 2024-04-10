; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128584 () Bool)

(assert start!128584)

(declare-fun b!1507456 () Bool)

(declare-fun res!1027678 () Bool)

(declare-fun e!842269 () Bool)

(assert (=> b!1507456 (=> (not res!1027678) (not e!842269))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100557 0))(
  ( (array!100558 (arr!48520 (Array (_ BitVec 32) (_ BitVec 64))) (size!49070 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100557)

(assert (=> b!1507456 (= res!1027678 (and (= (size!49070 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49070 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49070 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507457 () Bool)

(declare-fun res!1027675 () Bool)

(assert (=> b!1507457 (=> (not res!1027675) (not e!842269))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12691 0))(
  ( (MissingZero!12691 (index!53159 (_ BitVec 32))) (Found!12691 (index!53160 (_ BitVec 32))) (Intermediate!12691 (undefined!13503 Bool) (index!53161 (_ BitVec 32)) (x!134911 (_ BitVec 32))) (Undefined!12691) (MissingVacant!12691 (index!53162 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100557 (_ BitVec 32)) SeekEntryResult!12691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507457 (= res!1027675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) (select (arr!48520 a!2804) j!70) a!2804 mask!2512) (Intermediate!12691 false resIndex!21 resX!21)))))

(declare-fun res!1027679 () Bool)

(assert (=> start!128584 (=> (not res!1027679) (not e!842269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128584 (= res!1027679 (validMask!0 mask!2512))))

(assert (=> start!128584 e!842269))

(assert (=> start!128584 true))

(declare-fun array_inv!37548 (array!100557) Bool)

(assert (=> start!128584 (array_inv!37548 a!2804)))

(declare-fun b!1507458 () Bool)

(declare-fun res!1027680 () Bool)

(assert (=> b!1507458 (=> (not res!1027680) (not e!842269))))

(declare-datatypes ((List!35003 0))(
  ( (Nil!35000) (Cons!34999 (h!36402 (_ BitVec 64)) (t!49697 List!35003)) )
))
(declare-fun arrayNoDuplicates!0 (array!100557 (_ BitVec 32) List!35003) Bool)

(assert (=> b!1507458 (= res!1027680 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35000))))

(declare-fun b!1507459 () Bool)

(assert (=> b!1507459 (= e!842269 false)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!654391 () SeekEntryResult!12691)

(assert (=> b!1507459 (= lt!654391 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48520 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507460 () Bool)

(declare-fun res!1027674 () Bool)

(assert (=> b!1507460 (=> (not res!1027674) (not e!842269))))

(assert (=> b!1507460 (= res!1027674 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49070 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49070 a!2804))))))

(declare-fun b!1507461 () Bool)

(declare-fun res!1027677 () Bool)

(assert (=> b!1507461 (=> (not res!1027677) (not e!842269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507461 (= res!1027677 (validKeyInArray!0 (select (arr!48520 a!2804) j!70)))))

(declare-fun b!1507462 () Bool)

(declare-fun res!1027676 () Bool)

(assert (=> b!1507462 (=> (not res!1027676) (not e!842269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100557 (_ BitVec 32)) Bool)

(assert (=> b!1507462 (= res!1027676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507463 () Bool)

(declare-fun res!1027681 () Bool)

(assert (=> b!1507463 (=> (not res!1027681) (not e!842269))))

(assert (=> b!1507463 (= res!1027681 (validKeyInArray!0 (select (arr!48520 a!2804) i!961)))))

(assert (= (and start!128584 res!1027679) b!1507456))

(assert (= (and b!1507456 res!1027678) b!1507463))

(assert (= (and b!1507463 res!1027681) b!1507461))

(assert (= (and b!1507461 res!1027677) b!1507462))

(assert (= (and b!1507462 res!1027676) b!1507458))

(assert (= (and b!1507458 res!1027680) b!1507460))

(assert (= (and b!1507460 res!1027674) b!1507457))

(assert (= (and b!1507457 res!1027675) b!1507459))

(declare-fun m!1390203 () Bool)

(assert (=> b!1507459 m!1390203))

(assert (=> b!1507459 m!1390203))

(declare-fun m!1390205 () Bool)

(assert (=> b!1507459 m!1390205))

(declare-fun m!1390207 () Bool)

(assert (=> b!1507463 m!1390207))

(assert (=> b!1507463 m!1390207))

(declare-fun m!1390209 () Bool)

(assert (=> b!1507463 m!1390209))

(declare-fun m!1390211 () Bool)

(assert (=> start!128584 m!1390211))

(declare-fun m!1390213 () Bool)

(assert (=> start!128584 m!1390213))

(assert (=> b!1507461 m!1390203))

(assert (=> b!1507461 m!1390203))

(declare-fun m!1390215 () Bool)

(assert (=> b!1507461 m!1390215))

(declare-fun m!1390217 () Bool)

(assert (=> b!1507462 m!1390217))

(declare-fun m!1390219 () Bool)

(assert (=> b!1507458 m!1390219))

(assert (=> b!1507457 m!1390203))

(assert (=> b!1507457 m!1390203))

(declare-fun m!1390221 () Bool)

(assert (=> b!1507457 m!1390221))

(assert (=> b!1507457 m!1390221))

(assert (=> b!1507457 m!1390203))

(declare-fun m!1390223 () Bool)

(assert (=> b!1507457 m!1390223))

(push 1)

(assert (not b!1507459))

(assert (not start!128584))

(assert (not b!1507463))

(assert (not b!1507461))

(assert (not b!1507457))

(assert (not b!1507462))

(assert (not b!1507458))

(check-sat)

