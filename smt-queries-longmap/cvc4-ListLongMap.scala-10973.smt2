; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128806 () Bool)

(assert start!128806)

(declare-fun b!1508629 () Bool)

(declare-fun res!1027778 () Bool)

(declare-fun e!843140 () Bool)

(assert (=> b!1508629 (=> (not res!1027778) (not e!843140))))

(declare-datatypes ((array!100632 0))(
  ( (array!100633 (arr!48554 (Array (_ BitVec 32) (_ BitVec 64))) (size!49105 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100632)

(declare-datatypes ((List!35024 0))(
  ( (Nil!35021) (Cons!35020 (h!36435 (_ BitVec 64)) (t!49710 List!35024)) )
))
(declare-fun arrayNoDuplicates!0 (array!100632 (_ BitVec 32) List!35024) Bool)

(assert (=> b!1508629 (= res!1027778 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35021))))

(declare-fun b!1508630 () Bool)

(declare-fun res!1027779 () Bool)

(assert (=> b!1508630 (=> (not res!1027779) (not e!843140))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508630 (= res!1027779 (and (= (size!49105 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49105 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49105 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508631 () Bool)

(declare-fun res!1027775 () Bool)

(assert (=> b!1508631 (=> (not res!1027775) (not e!843140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508631 (= res!1027775 (validKeyInArray!0 (select (arr!48554 a!2804) i!961)))))

(declare-fun b!1508632 () Bool)

(declare-fun res!1027780 () Bool)

(assert (=> b!1508632 (=> (not res!1027780) (not e!843140))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508632 (= res!1027780 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49105 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49105 a!2804))))))

(declare-fun b!1508633 () Bool)

(declare-fun res!1027781 () Bool)

(assert (=> b!1508633 (=> (not res!1027781) (not e!843140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100632 (_ BitVec 32)) Bool)

(assert (=> b!1508633 (= res!1027781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508634 () Bool)

(assert (=> b!1508634 (= e!843140 false)))

(declare-datatypes ((SeekEntryResult!12618 0))(
  ( (MissingZero!12618 (index!52867 (_ BitVec 32))) (Found!12618 (index!52868 (_ BitVec 32))) (Intermediate!12618 (undefined!13430 Bool) (index!52869 (_ BitVec 32)) (x!134821 (_ BitVec 32))) (Undefined!12618) (MissingVacant!12618 (index!52870 (_ BitVec 32))) )
))
(declare-fun lt!654928 () SeekEntryResult!12618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100632 (_ BitVec 32)) SeekEntryResult!12618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508634 (= lt!654928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48554 a!2804) j!70) mask!2512) (select (arr!48554 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1027776 () Bool)

(assert (=> start!128806 (=> (not res!1027776) (not e!843140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128806 (= res!1027776 (validMask!0 mask!2512))))

(assert (=> start!128806 e!843140))

(assert (=> start!128806 true))

(declare-fun array_inv!37835 (array!100632) Bool)

(assert (=> start!128806 (array_inv!37835 a!2804)))

(declare-fun b!1508635 () Bool)

(declare-fun res!1027777 () Bool)

(assert (=> b!1508635 (=> (not res!1027777) (not e!843140))))

(assert (=> b!1508635 (= res!1027777 (validKeyInArray!0 (select (arr!48554 a!2804) j!70)))))

(assert (= (and start!128806 res!1027776) b!1508630))

(assert (= (and b!1508630 res!1027779) b!1508631))

(assert (= (and b!1508631 res!1027775) b!1508635))

(assert (= (and b!1508635 res!1027777) b!1508633))

(assert (= (and b!1508633 res!1027781) b!1508629))

(assert (= (and b!1508629 res!1027778) b!1508632))

(assert (= (and b!1508632 res!1027780) b!1508634))

(declare-fun m!1391495 () Bool)

(assert (=> b!1508634 m!1391495))

(assert (=> b!1508634 m!1391495))

(declare-fun m!1391497 () Bool)

(assert (=> b!1508634 m!1391497))

(assert (=> b!1508634 m!1391497))

(assert (=> b!1508634 m!1391495))

(declare-fun m!1391499 () Bool)

(assert (=> b!1508634 m!1391499))

(assert (=> b!1508635 m!1391495))

(assert (=> b!1508635 m!1391495))

(declare-fun m!1391501 () Bool)

(assert (=> b!1508635 m!1391501))

(declare-fun m!1391503 () Bool)

(assert (=> b!1508631 m!1391503))

(assert (=> b!1508631 m!1391503))

(declare-fun m!1391505 () Bool)

(assert (=> b!1508631 m!1391505))

(declare-fun m!1391507 () Bool)

(assert (=> b!1508633 m!1391507))

(declare-fun m!1391509 () Bool)

(assert (=> b!1508629 m!1391509))

(declare-fun m!1391511 () Bool)

(assert (=> start!128806 m!1391511))

(declare-fun m!1391513 () Bool)

(assert (=> start!128806 m!1391513))

(push 1)

(assert (not b!1508633))

(assert (not b!1508629))

(assert (not b!1508634))

(assert (not start!128806))

(assert (not b!1508631))

(assert (not b!1508635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

