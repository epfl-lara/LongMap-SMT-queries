; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129558 () Bool)

(assert start!129558)

(declare-fun b!1521203 () Bool)

(declare-fun res!1040631 () Bool)

(declare-fun e!848348 () Bool)

(assert (=> b!1521203 (=> (not res!1040631) (not e!848348))))

(declare-datatypes ((array!101233 0))(
  ( (array!101234 (arr!48850 (Array (_ BitVec 32) (_ BitVec 64))) (size!49402 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101233)

(declare-datatypes ((List!35411 0))(
  ( (Nil!35408) (Cons!35407 (h!36829 (_ BitVec 64)) (t!50097 List!35411)) )
))
(declare-fun arrayNoDuplicates!0 (array!101233 (_ BitVec 32) List!35411) Bool)

(assert (=> b!1521203 (= res!1040631 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35408))))

(declare-fun b!1521204 () Bool)

(declare-fun res!1040639 () Bool)

(assert (=> b!1521204 (=> (not res!1040639) (not e!848348))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521204 (= res!1040639 (validKeyInArray!0 (select (arr!48850 a!2804) j!70)))))

(declare-fun b!1521205 () Bool)

(declare-fun e!848347 () Bool)

(assert (=> b!1521205 (= e!848348 e!848347)))

(declare-fun res!1040633 () Bool)

(assert (=> b!1521205 (=> (not res!1040633) (not e!848347))))

(declare-datatypes ((SeekEntryResult!13038 0))(
  ( (MissingZero!13038 (index!54547 (_ BitVec 32))) (Found!13038 (index!54548 (_ BitVec 32))) (Intermediate!13038 (undefined!13850 Bool) (index!54549 (_ BitVec 32)) (x!136244 (_ BitVec 32))) (Undefined!13038) (MissingVacant!13038 (index!54550 (_ BitVec 32))) )
))
(declare-fun lt!659079 () SeekEntryResult!13038)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101233 (_ BitVec 32)) SeekEntryResult!13038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521205 (= res!1040633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48850 a!2804) j!70) mask!2512) (select (arr!48850 a!2804) j!70) a!2804 mask!2512) lt!659079))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521205 (= lt!659079 (Intermediate!13038 false resIndex!21 resX!21))))

(declare-fun b!1521206 () Bool)

(declare-fun res!1040632 () Bool)

(assert (=> b!1521206 (=> (not res!1040632) (not e!848348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101233 (_ BitVec 32)) Bool)

(assert (=> b!1521206 (= res!1040632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521207 () Bool)

(declare-fun res!1040634 () Bool)

(assert (=> b!1521207 (=> (not res!1040634) (not e!848347))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521207 (= res!1040634 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48850 a!2804) j!70) a!2804 mask!2512) lt!659079))))

(declare-fun b!1521208 () Bool)

(declare-fun res!1040638 () Bool)

(assert (=> b!1521208 (=> (not res!1040638) (not e!848348))))

(assert (=> b!1521208 (= res!1040638 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49402 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49402 a!2804))))))

(declare-fun b!1521209 () Bool)

(assert (=> b!1521209 (= e!848347 false)))

(declare-fun lt!659078 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521209 (= lt!659078 (toIndex!0 (select (store (arr!48850 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1521210 () Bool)

(declare-fun res!1040635 () Bool)

(assert (=> b!1521210 (=> (not res!1040635) (not e!848348))))

(assert (=> b!1521210 (= res!1040635 (validKeyInArray!0 (select (arr!48850 a!2804) i!961)))))

(declare-fun b!1521211 () Bool)

(declare-fun res!1040636 () Bool)

(assert (=> b!1521211 (=> (not res!1040636) (not e!848348))))

(assert (=> b!1521211 (= res!1040636 (and (= (size!49402 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49402 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49402 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1040637 () Bool)

(assert (=> start!129558 (=> (not res!1040637) (not e!848348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129558 (= res!1040637 (validMask!0 mask!2512))))

(assert (=> start!129558 e!848348))

(assert (=> start!129558 true))

(declare-fun array_inv!38083 (array!101233) Bool)

(assert (=> start!129558 (array_inv!38083 a!2804)))

(assert (= (and start!129558 res!1040637) b!1521211))

(assert (= (and b!1521211 res!1040636) b!1521210))

(assert (= (and b!1521210 res!1040635) b!1521204))

(assert (= (and b!1521204 res!1040639) b!1521206))

(assert (= (and b!1521206 res!1040632) b!1521203))

(assert (= (and b!1521203 res!1040631) b!1521208))

(assert (= (and b!1521208 res!1040638) b!1521205))

(assert (= (and b!1521205 res!1040633) b!1521207))

(assert (= (and b!1521207 res!1040634) b!1521209))

(declare-fun m!1403727 () Bool)

(assert (=> b!1521209 m!1403727))

(declare-fun m!1403729 () Bool)

(assert (=> b!1521209 m!1403729))

(assert (=> b!1521209 m!1403729))

(declare-fun m!1403731 () Bool)

(assert (=> b!1521209 m!1403731))

(declare-fun m!1403733 () Bool)

(assert (=> b!1521205 m!1403733))

(assert (=> b!1521205 m!1403733))

(declare-fun m!1403735 () Bool)

(assert (=> b!1521205 m!1403735))

(assert (=> b!1521205 m!1403735))

(assert (=> b!1521205 m!1403733))

(declare-fun m!1403737 () Bool)

(assert (=> b!1521205 m!1403737))

(assert (=> b!1521207 m!1403733))

(assert (=> b!1521207 m!1403733))

(declare-fun m!1403739 () Bool)

(assert (=> b!1521207 m!1403739))

(declare-fun m!1403741 () Bool)

(assert (=> b!1521206 m!1403741))

(assert (=> b!1521204 m!1403733))

(assert (=> b!1521204 m!1403733))

(declare-fun m!1403743 () Bool)

(assert (=> b!1521204 m!1403743))

(declare-fun m!1403745 () Bool)

(assert (=> start!129558 m!1403745))

(declare-fun m!1403747 () Bool)

(assert (=> start!129558 m!1403747))

(declare-fun m!1403749 () Bool)

(assert (=> b!1521210 m!1403749))

(assert (=> b!1521210 m!1403749))

(declare-fun m!1403751 () Bool)

(assert (=> b!1521210 m!1403751))

(declare-fun m!1403753 () Bool)

(assert (=> b!1521203 m!1403753))

(check-sat (not start!129558) (not b!1521203) (not b!1521209) (not b!1521207) (not b!1521204) (not b!1521210) (not b!1521206) (not b!1521205))
(check-sat)
