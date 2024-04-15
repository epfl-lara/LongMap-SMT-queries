; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128430 () Bool)

(assert start!128430)

(declare-fun b!1506208 () Bool)

(declare-fun res!1026737 () Bool)

(declare-fun e!841724 () Bool)

(assert (=> b!1506208 (=> (not res!1026737) (not e!841724))))

(declare-datatypes ((array!100442 0))(
  ( (array!100443 (arr!48465 (Array (_ BitVec 32) (_ BitVec 64))) (size!49017 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100442)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100442 (_ BitVec 32)) Bool)

(assert (=> b!1506208 (= res!1026737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506209 () Bool)

(declare-fun res!1026742 () Bool)

(assert (=> b!1506209 (=> (not res!1026742) (not e!841724))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506209 (= res!1026742 (and (= (size!49017 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49017 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49017 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506210 () Bool)

(declare-fun res!1026740 () Bool)

(assert (=> b!1506210 (=> (not res!1026740) (not e!841724))))

(declare-datatypes ((List!35026 0))(
  ( (Nil!35023) (Cons!35022 (h!36423 (_ BitVec 64)) (t!49712 List!35026)) )
))
(declare-fun arrayNoDuplicates!0 (array!100442 (_ BitVec 32) List!35026) Bool)

(assert (=> b!1506210 (= res!1026740 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35023))))

(declare-fun b!1506211 () Bool)

(declare-fun res!1026739 () Bool)

(assert (=> b!1506211 (=> (not res!1026739) (not e!841724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506211 (= res!1026739 (validKeyInArray!0 (select (arr!48465 a!2804) i!961)))))

(declare-fun b!1506212 () Bool)

(declare-fun res!1026738 () Bool)

(assert (=> b!1506212 (=> (not res!1026738) (not e!841724))))

(assert (=> b!1506212 (= res!1026738 (validKeyInArray!0 (select (arr!48465 a!2804) j!70)))))

(declare-fun res!1026743 () Bool)

(assert (=> start!128430 (=> (not res!1026743) (not e!841724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128430 (= res!1026743 (validMask!0 mask!2512))))

(assert (=> start!128430 e!841724))

(assert (=> start!128430 true))

(declare-fun array_inv!37698 (array!100442) Bool)

(assert (=> start!128430 (array_inv!37698 a!2804)))

(declare-fun b!1506213 () Bool)

(assert (=> b!1506213 (= e!841724 false)))

(declare-datatypes ((SeekEntryResult!12659 0))(
  ( (MissingZero!12659 (index!53031 (_ BitVec 32))) (Found!12659 (index!53032 (_ BitVec 32))) (Intermediate!12659 (undefined!13471 Bool) (index!53033 (_ BitVec 32)) (x!134787 (_ BitVec 32))) (Undefined!12659) (MissingVacant!12659 (index!53034 (_ BitVec 32))) )
))
(declare-fun lt!653955 () SeekEntryResult!12659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100442 (_ BitVec 32)) SeekEntryResult!12659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506213 (= lt!653955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48465 a!2804) j!70) mask!2512) (select (arr!48465 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506214 () Bool)

(declare-fun res!1026741 () Bool)

(assert (=> b!1506214 (=> (not res!1026741) (not e!841724))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506214 (= res!1026741 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49017 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49017 a!2804))))))

(assert (= (and start!128430 res!1026743) b!1506209))

(assert (= (and b!1506209 res!1026742) b!1506211))

(assert (= (and b!1506211 res!1026739) b!1506212))

(assert (= (and b!1506212 res!1026738) b!1506208))

(assert (= (and b!1506208 res!1026737) b!1506210))

(assert (= (and b!1506210 res!1026740) b!1506214))

(assert (= (and b!1506214 res!1026741) b!1506213))

(declare-fun m!1388571 () Bool)

(assert (=> start!128430 m!1388571))

(declare-fun m!1388573 () Bool)

(assert (=> start!128430 m!1388573))

(declare-fun m!1388575 () Bool)

(assert (=> b!1506212 m!1388575))

(assert (=> b!1506212 m!1388575))

(declare-fun m!1388577 () Bool)

(assert (=> b!1506212 m!1388577))

(declare-fun m!1388579 () Bool)

(assert (=> b!1506210 m!1388579))

(assert (=> b!1506213 m!1388575))

(assert (=> b!1506213 m!1388575))

(declare-fun m!1388581 () Bool)

(assert (=> b!1506213 m!1388581))

(assert (=> b!1506213 m!1388581))

(assert (=> b!1506213 m!1388575))

(declare-fun m!1388583 () Bool)

(assert (=> b!1506213 m!1388583))

(declare-fun m!1388585 () Bool)

(assert (=> b!1506211 m!1388585))

(assert (=> b!1506211 m!1388585))

(declare-fun m!1388587 () Bool)

(assert (=> b!1506211 m!1388587))

(declare-fun m!1388589 () Bool)

(assert (=> b!1506208 m!1388589))

(push 1)

(assert (not b!1506212))

(assert (not b!1506210))

(assert (not b!1506211))

(assert (not b!1506213))

(assert (not b!1506208))

(assert (not start!128430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

