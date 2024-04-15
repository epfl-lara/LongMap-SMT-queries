; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128432 () Bool)

(assert start!128432)

(declare-fun b!1506231 () Bool)

(declare-fun res!1026763 () Bool)

(declare-fun e!841730 () Bool)

(assert (=> b!1506231 (=> (not res!1026763) (not e!841730))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100444 0))(
  ( (array!100445 (arr!48466 (Array (_ BitVec 32) (_ BitVec 64))) (size!49018 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100444)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506231 (= res!1026763 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49018 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49018 a!2804))))))

(declare-fun b!1506232 () Bool)

(declare-fun res!1026762 () Bool)

(assert (=> b!1506232 (=> (not res!1026762) (not e!841730))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506232 (= res!1026762 (and (= (size!49018 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49018 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49018 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026761 () Bool)

(assert (=> start!128432 (=> (not res!1026761) (not e!841730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128432 (= res!1026761 (validMask!0 mask!2512))))

(assert (=> start!128432 e!841730))

(assert (=> start!128432 true))

(declare-fun array_inv!37699 (array!100444) Bool)

(assert (=> start!128432 (array_inv!37699 a!2804)))

(declare-fun b!1506233 () Bool)

(declare-fun res!1026764 () Bool)

(assert (=> b!1506233 (=> (not res!1026764) (not e!841730))))

(declare-datatypes ((List!35027 0))(
  ( (Nil!35024) (Cons!35023 (h!36424 (_ BitVec 64)) (t!49713 List!35027)) )
))
(declare-fun arrayNoDuplicates!0 (array!100444 (_ BitVec 32) List!35027) Bool)

(assert (=> b!1506233 (= res!1026764 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35024))))

(declare-fun b!1506234 () Bool)

(declare-fun res!1026760 () Bool)

(assert (=> b!1506234 (=> (not res!1026760) (not e!841730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506234 (= res!1026760 (validKeyInArray!0 (select (arr!48466 a!2804) i!961)))))

(declare-fun b!1506235 () Bool)

(assert (=> b!1506235 (= e!841730 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506236 () Bool)

(declare-fun res!1026765 () Bool)

(assert (=> b!1506236 (=> (not res!1026765) (not e!841730))))

(declare-datatypes ((SeekEntryResult!12660 0))(
  ( (MissingZero!12660 (index!53035 (_ BitVec 32))) (Found!12660 (index!53036 (_ BitVec 32))) (Intermediate!12660 (undefined!13472 Bool) (index!53037 (_ BitVec 32)) (x!134796 (_ BitVec 32))) (Undefined!12660) (MissingVacant!12660 (index!53038 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100444 (_ BitVec 32)) SeekEntryResult!12660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506236 (= res!1026765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48466 a!2804) j!70) mask!2512) (select (arr!48466 a!2804) j!70) a!2804 mask!2512) (Intermediate!12660 false resIndex!21 resX!21)))))

(declare-fun b!1506237 () Bool)

(declare-fun res!1026767 () Bool)

(assert (=> b!1506237 (=> (not res!1026767) (not e!841730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100444 (_ BitVec 32)) Bool)

(assert (=> b!1506237 (= res!1026767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506238 () Bool)

(declare-fun res!1026766 () Bool)

(assert (=> b!1506238 (=> (not res!1026766) (not e!841730))))

(assert (=> b!1506238 (= res!1026766 (validKeyInArray!0 (select (arr!48466 a!2804) j!70)))))

(assert (= (and start!128432 res!1026761) b!1506232))

(assert (= (and b!1506232 res!1026762) b!1506234))

(assert (= (and b!1506234 res!1026760) b!1506238))

(assert (= (and b!1506238 res!1026766) b!1506237))

(assert (= (and b!1506237 res!1026767) b!1506233))

(assert (= (and b!1506233 res!1026764) b!1506231))

(assert (= (and b!1506231 res!1026763) b!1506236))

(assert (= (and b!1506236 res!1026765) b!1506235))

(declare-fun m!1388591 () Bool)

(assert (=> start!128432 m!1388591))

(declare-fun m!1388593 () Bool)

(assert (=> start!128432 m!1388593))

(declare-fun m!1388595 () Bool)

(assert (=> b!1506234 m!1388595))

(assert (=> b!1506234 m!1388595))

(declare-fun m!1388597 () Bool)

(assert (=> b!1506234 m!1388597))

(declare-fun m!1388599 () Bool)

(assert (=> b!1506237 m!1388599))

(declare-fun m!1388601 () Bool)

(assert (=> b!1506236 m!1388601))

(assert (=> b!1506236 m!1388601))

(declare-fun m!1388603 () Bool)

(assert (=> b!1506236 m!1388603))

(assert (=> b!1506236 m!1388603))

(assert (=> b!1506236 m!1388601))

(declare-fun m!1388605 () Bool)

(assert (=> b!1506236 m!1388605))

(assert (=> b!1506238 m!1388601))

(assert (=> b!1506238 m!1388601))

(declare-fun m!1388607 () Bool)

(assert (=> b!1506238 m!1388607))

(declare-fun m!1388609 () Bool)

(assert (=> b!1506233 m!1388609))

(check-sat (not b!1506234) (not b!1506236) (not b!1506237) (not b!1506238) (not b!1506233) (not start!128432))
(check-sat)
