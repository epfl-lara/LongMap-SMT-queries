; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129614 () Bool)

(assert start!129614)

(declare-fun b!1521597 () Bool)

(declare-fun res!1040822 () Bool)

(declare-fun e!848581 () Bool)

(assert (=> b!1521597 (=> (not res!1040822) (not e!848581))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101289 0))(
  ( (array!101290 (arr!48877 (Array (_ BitVec 32) (_ BitVec 64))) (size!49427 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101289)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521597 (= res!1040822 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49427 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49427 a!2804))))))

(declare-fun res!1040826 () Bool)

(assert (=> start!129614 (=> (not res!1040826) (not e!848581))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129614 (= res!1040826 (validMask!0 mask!2512))))

(assert (=> start!129614 e!848581))

(assert (=> start!129614 true))

(declare-fun array_inv!37905 (array!101289) Bool)

(assert (=> start!129614 (array_inv!37905 a!2804)))

(declare-fun b!1521598 () Bool)

(declare-fun res!1040823 () Bool)

(assert (=> b!1521598 (=> (not res!1040823) (not e!848581))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521598 (= res!1040823 (validKeyInArray!0 (select (arr!48877 a!2804) i!961)))))

(declare-fun b!1521599 () Bool)

(declare-fun e!848580 () Bool)

(assert (=> b!1521599 (= e!848581 e!848580)))

(declare-fun res!1040820 () Bool)

(assert (=> b!1521599 (=> (not res!1040820) (not e!848580))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13042 0))(
  ( (MissingZero!13042 (index!54563 (_ BitVec 32))) (Found!13042 (index!54564 (_ BitVec 32))) (Intermediate!13042 (undefined!13854 Bool) (index!54565 (_ BitVec 32)) (x!136254 (_ BitVec 32))) (Undefined!13042) (MissingVacant!13042 (index!54566 (_ BitVec 32))) )
))
(declare-fun lt!659386 () SeekEntryResult!13042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101289 (_ BitVec 32)) SeekEntryResult!13042)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521599 (= res!1040820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48877 a!2804) j!70) mask!2512) (select (arr!48877 a!2804) j!70) a!2804 mask!2512) lt!659386))))

(assert (=> b!1521599 (= lt!659386 (Intermediate!13042 false resIndex!21 resX!21))))

(declare-fun b!1521600 () Bool)

(declare-fun res!1040825 () Bool)

(assert (=> b!1521600 (=> (not res!1040825) (not e!848581))))

(assert (=> b!1521600 (= res!1040825 (validKeyInArray!0 (select (arr!48877 a!2804) j!70)))))

(declare-fun b!1521601 () Bool)

(declare-fun res!1040824 () Bool)

(assert (=> b!1521601 (=> (not res!1040824) (not e!848581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101289 (_ BitVec 32)) Bool)

(assert (=> b!1521601 (= res!1040824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521602 () Bool)

(assert (=> b!1521602 (= e!848580 false)))

(declare-fun lt!659385 () (_ BitVec 32))

(assert (=> b!1521602 (= lt!659385 (toIndex!0 (select (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1521603 () Bool)

(declare-fun res!1040819 () Bool)

(assert (=> b!1521603 (=> (not res!1040819) (not e!848581))))

(assert (=> b!1521603 (= res!1040819 (and (= (size!49427 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49427 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49427 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521604 () Bool)

(declare-fun res!1040821 () Bool)

(assert (=> b!1521604 (=> (not res!1040821) (not e!848580))))

(assert (=> b!1521604 (= res!1040821 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) lt!659386))))

(declare-fun b!1521605 () Bool)

(declare-fun res!1040827 () Bool)

(assert (=> b!1521605 (=> (not res!1040827) (not e!848581))))

(declare-datatypes ((List!35360 0))(
  ( (Nil!35357) (Cons!35356 (h!36777 (_ BitVec 64)) (t!50054 List!35360)) )
))
(declare-fun arrayNoDuplicates!0 (array!101289 (_ BitVec 32) List!35360) Bool)

(assert (=> b!1521605 (= res!1040827 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35357))))

(assert (= (and start!129614 res!1040826) b!1521603))

(assert (= (and b!1521603 res!1040819) b!1521598))

(assert (= (and b!1521598 res!1040823) b!1521600))

(assert (= (and b!1521600 res!1040825) b!1521601))

(assert (= (and b!1521601 res!1040824) b!1521605))

(assert (= (and b!1521605 res!1040827) b!1521597))

(assert (= (and b!1521597 res!1040822) b!1521599))

(assert (= (and b!1521599 res!1040820) b!1521604))

(assert (= (and b!1521604 res!1040821) b!1521602))

(declare-fun m!1404691 () Bool)

(assert (=> b!1521599 m!1404691))

(assert (=> b!1521599 m!1404691))

(declare-fun m!1404693 () Bool)

(assert (=> b!1521599 m!1404693))

(assert (=> b!1521599 m!1404693))

(assert (=> b!1521599 m!1404691))

(declare-fun m!1404695 () Bool)

(assert (=> b!1521599 m!1404695))

(declare-fun m!1404697 () Bool)

(assert (=> b!1521601 m!1404697))

(declare-fun m!1404699 () Bool)

(assert (=> start!129614 m!1404699))

(declare-fun m!1404701 () Bool)

(assert (=> start!129614 m!1404701))

(assert (=> b!1521600 m!1404691))

(assert (=> b!1521600 m!1404691))

(declare-fun m!1404703 () Bool)

(assert (=> b!1521600 m!1404703))

(declare-fun m!1404705 () Bool)

(assert (=> b!1521602 m!1404705))

(declare-fun m!1404707 () Bool)

(assert (=> b!1521602 m!1404707))

(assert (=> b!1521602 m!1404707))

(declare-fun m!1404709 () Bool)

(assert (=> b!1521602 m!1404709))

(assert (=> b!1521604 m!1404691))

(assert (=> b!1521604 m!1404691))

(declare-fun m!1404711 () Bool)

(assert (=> b!1521604 m!1404711))

(declare-fun m!1404713 () Bool)

(assert (=> b!1521605 m!1404713))

(declare-fun m!1404715 () Bool)

(assert (=> b!1521598 m!1404715))

(assert (=> b!1521598 m!1404715))

(declare-fun m!1404717 () Bool)

(assert (=> b!1521598 m!1404717))

(push 1)

(assert (not b!1521605))

(assert (not b!1521604))

(assert (not b!1521601))

(assert (not start!129614))

(assert (not b!1521602))

