; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128858 () Bool)

(assert start!128858)

(declare-fun b!1510665 () Bool)

(declare-fun res!1030784 () Bool)

(declare-fun e!843453 () Bool)

(assert (=> b!1510665 (=> (not res!1030784) (not e!843453))))

(declare-datatypes ((array!100714 0))(
  ( (array!100715 (arr!48595 (Array (_ BitVec 32) (_ BitVec 64))) (size!49147 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100714)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510665 (= res!1030784 (validKeyInArray!0 (select (arr!48595 a!2804) i!961)))))

(declare-fun b!1510666 () Bool)

(declare-fun e!843452 () Bool)

(assert (=> b!1510666 (= e!843453 e!843452)))

(declare-fun res!1030779 () Bool)

(assert (=> b!1510666 (=> (not res!1030779) (not e!843452))))

(declare-datatypes ((SeekEntryResult!12789 0))(
  ( (MissingZero!12789 (index!53551 (_ BitVec 32))) (Found!12789 (index!53552 (_ BitVec 32))) (Intermediate!12789 (undefined!13601 Bool) (index!53553 (_ BitVec 32)) (x!135293 (_ BitVec 32))) (Undefined!12789) (MissingVacant!12789 (index!53554 (_ BitVec 32))) )
))
(declare-fun lt!655029 () SeekEntryResult!12789)

(declare-fun lt!655028 () SeekEntryResult!12789)

(assert (=> b!1510666 (= res!1030779 (= lt!655029 lt!655028))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510666 (= lt!655028 (Intermediate!12789 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100714 (_ BitVec 32)) SeekEntryResult!12789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510666 (= lt!655029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48595 a!2804) j!70) mask!2512) (select (arr!48595 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510667 () Bool)

(declare-fun res!1030775 () Bool)

(assert (=> b!1510667 (=> (not res!1030775) (not e!843453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100714 (_ BitVec 32)) Bool)

(assert (=> b!1510667 (= res!1030775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030782 () Bool)

(assert (=> start!128858 (=> (not res!1030782) (not e!843453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128858 (= res!1030782 (validMask!0 mask!2512))))

(assert (=> start!128858 e!843453))

(assert (=> start!128858 true))

(declare-fun array_inv!37828 (array!100714) Bool)

(assert (=> start!128858 (array_inv!37828 a!2804)))

(declare-fun e!843451 () Bool)

(declare-fun b!1510668 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100714 (_ BitVec 32)) SeekEntryResult!12789)

(assert (=> b!1510668 (= e!843451 (= (seekEntry!0 (select (arr!48595 a!2804) j!70) a!2804 mask!2512) (Found!12789 j!70)))))

(declare-fun b!1510669 () Bool)

(declare-fun res!1030783 () Bool)

(assert (=> b!1510669 (=> (not res!1030783) (not e!843452))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510669 (= res!1030783 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48595 a!2804) j!70) a!2804 mask!2512) lt!655028))))

(declare-fun b!1510670 () Bool)

(declare-fun res!1030776 () Bool)

(assert (=> b!1510670 (=> (not res!1030776) (not e!843453))))

(assert (=> b!1510670 (= res!1030776 (and (= (size!49147 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49147 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49147 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510671 () Bool)

(declare-fun res!1030781 () Bool)

(assert (=> b!1510671 (=> (not res!1030781) (not e!843452))))

(assert (=> b!1510671 (= res!1030781 (= lt!655029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100715 (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49147 a!2804)) mask!2512)))))

(declare-fun b!1510672 () Bool)

(declare-fun res!1030774 () Bool)

(assert (=> b!1510672 (=> (not res!1030774) (not e!843453))))

(declare-datatypes ((List!35156 0))(
  ( (Nil!35153) (Cons!35152 (h!36565 (_ BitVec 64)) (t!49842 List!35156)) )
))
(declare-fun arrayNoDuplicates!0 (array!100714 (_ BitVec 32) List!35156) Bool)

(assert (=> b!1510672 (= res!1030774 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35153))))

(declare-fun b!1510673 () Bool)

(declare-fun res!1030780 () Bool)

(assert (=> b!1510673 (=> (not res!1030780) (not e!843453))))

(assert (=> b!1510673 (= res!1030780 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49147 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49147 a!2804))))))

(declare-fun b!1510674 () Bool)

(declare-fun res!1030777 () Bool)

(assert (=> b!1510674 (=> (not res!1030777) (not e!843453))))

(assert (=> b!1510674 (= res!1030777 (validKeyInArray!0 (select (arr!48595 a!2804) j!70)))))

(declare-fun b!1510675 () Bool)

(assert (=> b!1510675 (= e!843452 (not true))))

(assert (=> b!1510675 e!843451))

(declare-fun res!1030778 () Bool)

(assert (=> b!1510675 (=> (not res!1030778) (not e!843451))))

(assert (=> b!1510675 (= res!1030778 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50285 0))(
  ( (Unit!50286) )
))
(declare-fun lt!655027 () Unit!50285)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50285)

(assert (=> b!1510675 (= lt!655027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128858 res!1030782) b!1510670))

(assert (= (and b!1510670 res!1030776) b!1510665))

(assert (= (and b!1510665 res!1030784) b!1510674))

(assert (= (and b!1510674 res!1030777) b!1510667))

(assert (= (and b!1510667 res!1030775) b!1510672))

(assert (= (and b!1510672 res!1030774) b!1510673))

(assert (= (and b!1510673 res!1030780) b!1510666))

(assert (= (and b!1510666 res!1030779) b!1510669))

(assert (= (and b!1510669 res!1030783) b!1510671))

(assert (= (and b!1510671 res!1030781) b!1510675))

(assert (= (and b!1510675 res!1030778) b!1510668))

(declare-fun m!1392749 () Bool)

(assert (=> b!1510674 m!1392749))

(assert (=> b!1510674 m!1392749))

(declare-fun m!1392751 () Bool)

(assert (=> b!1510674 m!1392751))

(declare-fun m!1392753 () Bool)

(assert (=> b!1510672 m!1392753))

(declare-fun m!1392755 () Bool)

(assert (=> b!1510675 m!1392755))

(declare-fun m!1392757 () Bool)

(assert (=> b!1510675 m!1392757))

(declare-fun m!1392759 () Bool)

(assert (=> b!1510665 m!1392759))

(assert (=> b!1510665 m!1392759))

(declare-fun m!1392761 () Bool)

(assert (=> b!1510665 m!1392761))

(assert (=> b!1510668 m!1392749))

(assert (=> b!1510668 m!1392749))

(declare-fun m!1392763 () Bool)

(assert (=> b!1510668 m!1392763))

(declare-fun m!1392765 () Bool)

(assert (=> b!1510671 m!1392765))

(declare-fun m!1392767 () Bool)

(assert (=> b!1510671 m!1392767))

(assert (=> b!1510671 m!1392767))

(declare-fun m!1392769 () Bool)

(assert (=> b!1510671 m!1392769))

(assert (=> b!1510671 m!1392769))

(assert (=> b!1510671 m!1392767))

(declare-fun m!1392771 () Bool)

(assert (=> b!1510671 m!1392771))

(assert (=> b!1510666 m!1392749))

(assert (=> b!1510666 m!1392749))

(declare-fun m!1392773 () Bool)

(assert (=> b!1510666 m!1392773))

(assert (=> b!1510666 m!1392773))

(assert (=> b!1510666 m!1392749))

(declare-fun m!1392775 () Bool)

(assert (=> b!1510666 m!1392775))

(assert (=> b!1510669 m!1392749))

(assert (=> b!1510669 m!1392749))

(declare-fun m!1392777 () Bool)

(assert (=> b!1510669 m!1392777))

(declare-fun m!1392779 () Bool)

(assert (=> start!128858 m!1392779))

(declare-fun m!1392781 () Bool)

(assert (=> start!128858 m!1392781))

(declare-fun m!1392783 () Bool)

(assert (=> b!1510667 m!1392783))

(check-sat (not b!1510666) (not b!1510668) (not b!1510674) (not b!1510671) (not b!1510665) (not b!1510672) (not b!1510675) (not b!1510667) (not start!128858) (not b!1510669))
(check-sat)
