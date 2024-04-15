; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128460 () Bool)

(assert start!128460)

(declare-fun b!1506541 () Bool)

(declare-fun res!1027071 () Bool)

(declare-fun e!841814 () Bool)

(assert (=> b!1506541 (=> (not res!1027071) (not e!841814))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100472 0))(
  ( (array!100473 (arr!48480 (Array (_ BitVec 32) (_ BitVec 64))) (size!49032 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100472)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506541 (= res!1027071 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49032 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49032 a!2804))))))

(declare-fun b!1506542 () Bool)

(assert (=> b!1506542 (= e!841814 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12674 0))(
  ( (MissingZero!12674 (index!53091 (_ BitVec 32))) (Found!12674 (index!53092 (_ BitVec 32))) (Intermediate!12674 (undefined!13486 Bool) (index!53093 (_ BitVec 32)) (x!134842 (_ BitVec 32))) (Undefined!12674) (MissingVacant!12674 (index!53094 (_ BitVec 32))) )
))
(declare-fun lt!653982 () SeekEntryResult!12674)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100472 (_ BitVec 32)) SeekEntryResult!12674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506542 (= lt!653982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48480 a!2804) j!70) mask!2512) (select (arr!48480 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506543 () Bool)

(declare-fun res!1027073 () Bool)

(assert (=> b!1506543 (=> (not res!1027073) (not e!841814))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506543 (= res!1027073 (validKeyInArray!0 (select (arr!48480 a!2804) i!961)))))

(declare-fun b!1506544 () Bool)

(declare-fun res!1027074 () Bool)

(assert (=> b!1506544 (=> (not res!1027074) (not e!841814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100472 (_ BitVec 32)) Bool)

(assert (=> b!1506544 (= res!1027074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1027075 () Bool)

(assert (=> start!128460 (=> (not res!1027075) (not e!841814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128460 (= res!1027075 (validMask!0 mask!2512))))

(assert (=> start!128460 e!841814))

(assert (=> start!128460 true))

(declare-fun array_inv!37713 (array!100472) Bool)

(assert (=> start!128460 (array_inv!37713 a!2804)))

(declare-fun b!1506545 () Bool)

(declare-fun res!1027070 () Bool)

(assert (=> b!1506545 (=> (not res!1027070) (not e!841814))))

(assert (=> b!1506545 (= res!1027070 (and (= (size!49032 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49032 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49032 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506546 () Bool)

(declare-fun res!1027072 () Bool)

(assert (=> b!1506546 (=> (not res!1027072) (not e!841814))))

(assert (=> b!1506546 (= res!1027072 (validKeyInArray!0 (select (arr!48480 a!2804) j!70)))))

(declare-fun b!1506547 () Bool)

(declare-fun res!1027076 () Bool)

(assert (=> b!1506547 (=> (not res!1027076) (not e!841814))))

(declare-datatypes ((List!35041 0))(
  ( (Nil!35038) (Cons!35037 (h!36438 (_ BitVec 64)) (t!49727 List!35041)) )
))
(declare-fun arrayNoDuplicates!0 (array!100472 (_ BitVec 32) List!35041) Bool)

(assert (=> b!1506547 (= res!1027076 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35038))))

(assert (= (and start!128460 res!1027075) b!1506545))

(assert (= (and b!1506545 res!1027070) b!1506543))

(assert (= (and b!1506543 res!1027073) b!1506546))

(assert (= (and b!1506546 res!1027072) b!1506544))

(assert (= (and b!1506544 res!1027074) b!1506547))

(assert (= (and b!1506547 res!1027076) b!1506541))

(assert (= (and b!1506541 res!1027071) b!1506542))

(declare-fun m!1388871 () Bool)

(assert (=> b!1506547 m!1388871))

(declare-fun m!1388873 () Bool)

(assert (=> b!1506544 m!1388873))

(declare-fun m!1388875 () Bool)

(assert (=> start!128460 m!1388875))

(declare-fun m!1388877 () Bool)

(assert (=> start!128460 m!1388877))

(declare-fun m!1388879 () Bool)

(assert (=> b!1506546 m!1388879))

(assert (=> b!1506546 m!1388879))

(declare-fun m!1388881 () Bool)

(assert (=> b!1506546 m!1388881))

(declare-fun m!1388883 () Bool)

(assert (=> b!1506543 m!1388883))

(assert (=> b!1506543 m!1388883))

(declare-fun m!1388885 () Bool)

(assert (=> b!1506543 m!1388885))

(assert (=> b!1506542 m!1388879))

(assert (=> b!1506542 m!1388879))

(declare-fun m!1388887 () Bool)

(assert (=> b!1506542 m!1388887))

(assert (=> b!1506542 m!1388887))

(assert (=> b!1506542 m!1388879))

(declare-fun m!1388889 () Bool)

(assert (=> b!1506542 m!1388889))

(push 1)

(assert (not b!1506542))

(assert (not b!1506544))

(assert (not b!1506547))

(assert (not b!1506543))

(assert (not start!128460))

(assert (not b!1506546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

