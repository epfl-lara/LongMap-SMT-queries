; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128948 () Bool)

(assert start!128948)

(declare-fun b!1509728 () Bool)

(declare-fun res!1028667 () Bool)

(declare-fun e!843599 () Bool)

(assert (=> b!1509728 (=> (not res!1028667) (not e!843599))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!100696 0))(
  ( (array!100697 (arr!48583 (Array (_ BitVec 32) (_ BitVec 64))) (size!49134 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100696)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1509728 (= res!1028667 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49134 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49134 a!2804))))))

(declare-fun b!1509729 () Bool)

(declare-fun e!843598 () Bool)

(assert (=> b!1509729 (= e!843599 e!843598)))

(declare-fun res!1028670 () Bool)

(assert (=> b!1509729 (=> (not res!1028670) (not e!843598))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12647 0))(
  ( (MissingZero!12647 (index!52983 (_ BitVec 32))) (Found!12647 (index!52984 (_ BitVec 32))) (Intermediate!12647 (undefined!13459 Bool) (index!52985 (_ BitVec 32)) (x!134942 (_ BitVec 32))) (Undefined!12647) (MissingVacant!12647 (index!52986 (_ BitVec 32))) )
))
(declare-fun lt!655162 () SeekEntryResult!12647)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100696 (_ BitVec 32)) SeekEntryResult!12647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509729 (= res!1028670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48583 a!2804) j!70) mask!2512) (select (arr!48583 a!2804) j!70) a!2804 mask!2512) lt!655162))))

(assert (=> b!1509729 (= lt!655162 (Intermediate!12647 false resIndex!21 resX!21))))

(declare-fun b!1509730 () Bool)

(declare-fun res!1028666 () Bool)

(assert (=> b!1509730 (=> (not res!1028666) (not e!843598))))

(assert (=> b!1509730 (= res!1028666 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48583 a!2804) j!70) a!2804 mask!2512) lt!655162))))

(declare-fun b!1509731 () Bool)

(declare-fun res!1028664 () Bool)

(assert (=> b!1509731 (=> (not res!1028664) (not e!843599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509731 (= res!1028664 (validKeyInArray!0 (select (arr!48583 a!2804) j!70)))))

(declare-fun b!1509732 () Bool)

(declare-fun res!1028665 () Bool)

(assert (=> b!1509732 (=> (not res!1028665) (not e!843599))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509732 (= res!1028665 (validKeyInArray!0 (select (arr!48583 a!2804) i!961)))))

(declare-fun b!1509733 () Bool)

(declare-fun res!1028668 () Bool)

(assert (=> b!1509733 (=> (not res!1028668) (not e!843599))))

(assert (=> b!1509733 (= res!1028668 (and (= (size!49134 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49134 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49134 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509734 () Bool)

(declare-fun res!1028669 () Bool)

(assert (=> b!1509734 (=> (not res!1028669) (not e!843599))))

(declare-datatypes ((List!35053 0))(
  ( (Nil!35050) (Cons!35049 (h!36470 (_ BitVec 64)) (t!49739 List!35053)) )
))
(declare-fun arrayNoDuplicates!0 (array!100696 (_ BitVec 32) List!35053) Bool)

(assert (=> b!1509734 (= res!1028669 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35050))))

(declare-fun res!1028671 () Bool)

(assert (=> start!128948 (=> (not res!1028671) (not e!843599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128948 (= res!1028671 (validMask!0 mask!2512))))

(assert (=> start!128948 e!843599))

(assert (=> start!128948 true))

(declare-fun array_inv!37864 (array!100696) Bool)

(assert (=> start!128948 (array_inv!37864 a!2804)))

(declare-fun b!1509735 () Bool)

(assert (=> b!1509735 (= e!843598 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1509736 () Bool)

(declare-fun res!1028672 () Bool)

(assert (=> b!1509736 (=> (not res!1028672) (not e!843599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100696 (_ BitVec 32)) Bool)

(assert (=> b!1509736 (= res!1028672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128948 res!1028671) b!1509733))

(assert (= (and b!1509733 res!1028668) b!1509732))

(assert (= (and b!1509732 res!1028665) b!1509731))

(assert (= (and b!1509731 res!1028664) b!1509736))

(assert (= (and b!1509736 res!1028672) b!1509734))

(assert (= (and b!1509734 res!1028669) b!1509728))

(assert (= (and b!1509728 res!1028667) b!1509729))

(assert (= (and b!1509729 res!1028670) b!1509730))

(assert (= (and b!1509730 res!1028666) b!1509735))

(declare-fun m!1392315 () Bool)

(assert (=> b!1509730 m!1392315))

(assert (=> b!1509730 m!1392315))

(declare-fun m!1392317 () Bool)

(assert (=> b!1509730 m!1392317))

(declare-fun m!1392319 () Bool)

(assert (=> b!1509732 m!1392319))

(assert (=> b!1509732 m!1392319))

(declare-fun m!1392321 () Bool)

(assert (=> b!1509732 m!1392321))

(assert (=> b!1509731 m!1392315))

(assert (=> b!1509731 m!1392315))

(declare-fun m!1392323 () Bool)

(assert (=> b!1509731 m!1392323))

(declare-fun m!1392325 () Bool)

(assert (=> start!128948 m!1392325))

(declare-fun m!1392327 () Bool)

(assert (=> start!128948 m!1392327))

(declare-fun m!1392329 () Bool)

(assert (=> b!1509736 m!1392329))

(assert (=> b!1509729 m!1392315))

(assert (=> b!1509729 m!1392315))

(declare-fun m!1392331 () Bool)

(assert (=> b!1509729 m!1392331))

(assert (=> b!1509729 m!1392331))

(assert (=> b!1509729 m!1392315))

(declare-fun m!1392333 () Bool)

(assert (=> b!1509729 m!1392333))

(declare-fun m!1392335 () Bool)

(assert (=> b!1509734 m!1392335))

(check-sat (not b!1509731) (not b!1509732) (not b!1509734) (not b!1509729) (not start!128948) (not b!1509736) (not b!1509730))
(check-sat)
