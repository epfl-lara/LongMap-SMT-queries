; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128796 () Bool)

(assert start!128796)

(declare-fun b!1508515 () Bool)

(declare-fun res!1027661 () Bool)

(declare-fun e!843111 () Bool)

(assert (=> b!1508515 (=> (not res!1027661) (not e!843111))))

(declare-datatypes ((array!100622 0))(
  ( (array!100623 (arr!48549 (Array (_ BitVec 32) (_ BitVec 64))) (size!49100 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100622)

(declare-datatypes ((List!35019 0))(
  ( (Nil!35016) (Cons!35015 (h!36430 (_ BitVec 64)) (t!49705 List!35019)) )
))
(declare-fun arrayNoDuplicates!0 (array!100622 (_ BitVec 32) List!35019) Bool)

(assert (=> b!1508515 (= res!1027661 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35016))))

(declare-fun b!1508516 () Bool)

(declare-fun res!1027662 () Bool)

(assert (=> b!1508516 (=> (not res!1027662) (not e!843111))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508516 (= res!1027662 (validKeyInArray!0 (select (arr!48549 a!2804) j!70)))))

(declare-fun res!1027663 () Bool)

(assert (=> start!128796 (=> (not res!1027663) (not e!843111))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128796 (= res!1027663 (validMask!0 mask!2512))))

(assert (=> start!128796 e!843111))

(assert (=> start!128796 true))

(declare-fun array_inv!37830 (array!100622) Bool)

(assert (=> start!128796 (array_inv!37830 a!2804)))

(declare-fun b!1508517 () Bool)

(declare-fun res!1027666 () Bool)

(assert (=> b!1508517 (=> (not res!1027666) (not e!843111))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508517 (= res!1027666 (and (= (size!49100 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49100 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49100 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508518 () Bool)

(assert (=> b!1508518 (= e!843111 false)))

(declare-datatypes ((SeekEntryResult!12613 0))(
  ( (MissingZero!12613 (index!52847 (_ BitVec 32))) (Found!12613 (index!52848 (_ BitVec 32))) (Intermediate!12613 (undefined!13425 Bool) (index!52849 (_ BitVec 32)) (x!134800 (_ BitVec 32))) (Undefined!12613) (MissingVacant!12613 (index!52850 (_ BitVec 32))) )
))
(declare-fun lt!654922 () SeekEntryResult!12613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100622 (_ BitVec 32)) SeekEntryResult!12613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508518 (= lt!654922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48549 a!2804) j!70) mask!2512) (select (arr!48549 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508519 () Bool)

(declare-fun res!1027667 () Bool)

(assert (=> b!1508519 (=> (not res!1027667) (not e!843111))))

(assert (=> b!1508519 (= res!1027667 (validKeyInArray!0 (select (arr!48549 a!2804) i!961)))))

(declare-fun b!1508520 () Bool)

(declare-fun res!1027664 () Bool)

(assert (=> b!1508520 (=> (not res!1027664) (not e!843111))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508520 (= res!1027664 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49100 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49100 a!2804))))))

(declare-fun b!1508521 () Bool)

(declare-fun res!1027665 () Bool)

(assert (=> b!1508521 (=> (not res!1027665) (not e!843111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100622 (_ BitVec 32)) Bool)

(assert (=> b!1508521 (= res!1027665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128796 res!1027663) b!1508517))

(assert (= (and b!1508517 res!1027666) b!1508519))

(assert (= (and b!1508519 res!1027667) b!1508516))

(assert (= (and b!1508516 res!1027662) b!1508521))

(assert (= (and b!1508521 res!1027665) b!1508515))

(assert (= (and b!1508515 res!1027661) b!1508520))

(assert (= (and b!1508520 res!1027664) b!1508518))

(declare-fun m!1391395 () Bool)

(assert (=> b!1508516 m!1391395))

(assert (=> b!1508516 m!1391395))

(declare-fun m!1391397 () Bool)

(assert (=> b!1508516 m!1391397))

(declare-fun m!1391399 () Bool)

(assert (=> b!1508515 m!1391399))

(declare-fun m!1391401 () Bool)

(assert (=> b!1508519 m!1391401))

(assert (=> b!1508519 m!1391401))

(declare-fun m!1391403 () Bool)

(assert (=> b!1508519 m!1391403))

(assert (=> b!1508518 m!1391395))

(assert (=> b!1508518 m!1391395))

(declare-fun m!1391405 () Bool)

(assert (=> b!1508518 m!1391405))

(assert (=> b!1508518 m!1391405))

(assert (=> b!1508518 m!1391395))

(declare-fun m!1391407 () Bool)

(assert (=> b!1508518 m!1391407))

(declare-fun m!1391409 () Bool)

(assert (=> start!128796 m!1391409))

(declare-fun m!1391411 () Bool)

(assert (=> start!128796 m!1391411))

(declare-fun m!1391413 () Bool)

(assert (=> b!1508521 m!1391413))

(push 1)

(assert (not b!1508519))

(assert (not b!1508515))

(assert (not b!1508521))

(assert (not b!1508516))

(assert (not b!1508518))

(assert (not start!128796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

