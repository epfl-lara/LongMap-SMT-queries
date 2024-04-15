; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128798 () Bool)

(assert start!128798)

(declare-fun b!1509666 () Bool)

(declare-fun res!1029775 () Bool)

(declare-fun e!843083 () Bool)

(assert (=> b!1509666 (=> (not res!1029775) (not e!843083))))

(declare-datatypes ((array!100654 0))(
  ( (array!100655 (arr!48565 (Array (_ BitVec 32) (_ BitVec 64))) (size!49117 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100654)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100654 (_ BitVec 32)) Bool)

(assert (=> b!1509666 (= res!1029775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509667 () Bool)

(declare-fun res!1029778 () Bool)

(declare-fun e!843084 () Bool)

(assert (=> b!1509667 (=> (not res!1029778) (not e!843084))))

(declare-datatypes ((SeekEntryResult!12759 0))(
  ( (MissingZero!12759 (index!53431 (_ BitVec 32))) (Found!12759 (index!53432 (_ BitVec 32))) (Intermediate!12759 (undefined!13571 Bool) (index!53433 (_ BitVec 32)) (x!135183 (_ BitVec 32))) (Undefined!12759) (MissingVacant!12759 (index!53434 (_ BitVec 32))) )
))
(declare-fun lt!654757 () SeekEntryResult!12759)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100654 (_ BitVec 32)) SeekEntryResult!12759)

(assert (=> b!1509667 (= res!1029778 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48565 a!2804) j!70) a!2804 mask!2512) lt!654757))))

(declare-fun b!1509668 () Bool)

(declare-fun res!1029780 () Bool)

(assert (=> b!1509668 (=> (not res!1029780) (not e!843083))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509668 (= res!1029780 (validKeyInArray!0 (select (arr!48565 a!2804) i!961)))))

(declare-fun b!1509669 () Bool)

(declare-fun res!1029783 () Bool)

(assert (=> b!1509669 (=> (not res!1029783) (not e!843083))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509669 (= res!1029783 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49117 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49117 a!2804))))))

(declare-fun e!843082 () Bool)

(declare-fun b!1509670 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100654 (_ BitVec 32)) SeekEntryResult!12759)

(assert (=> b!1509670 (= e!843082 (= (seekEntry!0 (select (arr!48565 a!2804) j!70) a!2804 mask!2512) (Found!12759 j!70)))))

(declare-fun res!1029782 () Bool)

(assert (=> start!128798 (=> (not res!1029782) (not e!843083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128798 (= res!1029782 (validMask!0 mask!2512))))

(assert (=> start!128798 e!843083))

(assert (=> start!128798 true))

(declare-fun array_inv!37798 (array!100654) Bool)

(assert (=> start!128798 (array_inv!37798 a!2804)))

(declare-fun b!1509671 () Bool)

(declare-fun res!1029781 () Bool)

(assert (=> b!1509671 (=> (not res!1029781) (not e!843083))))

(declare-datatypes ((List!35126 0))(
  ( (Nil!35123) (Cons!35122 (h!36535 (_ BitVec 64)) (t!49812 List!35126)) )
))
(declare-fun arrayNoDuplicates!0 (array!100654 (_ BitVec 32) List!35126) Bool)

(assert (=> b!1509671 (= res!1029781 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35123))))

(declare-fun b!1509672 () Bool)

(assert (=> b!1509672 (= e!843083 e!843084)))

(declare-fun res!1029779 () Bool)

(assert (=> b!1509672 (=> (not res!1029779) (not e!843084))))

(declare-fun lt!654759 () SeekEntryResult!12759)

(assert (=> b!1509672 (= res!1029779 (= lt!654759 lt!654757))))

(assert (=> b!1509672 (= lt!654757 (Intermediate!12759 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509672 (= lt!654759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48565 a!2804) j!70) mask!2512) (select (arr!48565 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509673 () Bool)

(declare-fun res!1029777 () Bool)

(assert (=> b!1509673 (=> (not res!1029777) (not e!843083))))

(assert (=> b!1509673 (= res!1029777 (validKeyInArray!0 (select (arr!48565 a!2804) j!70)))))

(declare-fun b!1509674 () Bool)

(declare-fun res!1029784 () Bool)

(assert (=> b!1509674 (=> (not res!1029784) (not e!843084))))

(assert (=> b!1509674 (= res!1029784 (= lt!654759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100655 (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49117 a!2804)) mask!2512)))))

(declare-fun b!1509675 () Bool)

(assert (=> b!1509675 (= e!843084 (not true))))

(assert (=> b!1509675 e!843082))

(declare-fun res!1029785 () Bool)

(assert (=> b!1509675 (=> (not res!1029785) (not e!843082))))

(assert (=> b!1509675 (= res!1029785 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50225 0))(
  ( (Unit!50226) )
))
(declare-fun lt!654758 () Unit!50225)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50225)

(assert (=> b!1509675 (= lt!654758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509676 () Bool)

(declare-fun res!1029776 () Bool)

(assert (=> b!1509676 (=> (not res!1029776) (not e!843083))))

(assert (=> b!1509676 (= res!1029776 (and (= (size!49117 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49117 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49117 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128798 res!1029782) b!1509676))

(assert (= (and b!1509676 res!1029776) b!1509668))

(assert (= (and b!1509668 res!1029780) b!1509673))

(assert (= (and b!1509673 res!1029777) b!1509666))

(assert (= (and b!1509666 res!1029775) b!1509671))

(assert (= (and b!1509671 res!1029781) b!1509669))

(assert (= (and b!1509669 res!1029783) b!1509672))

(assert (= (and b!1509672 res!1029779) b!1509667))

(assert (= (and b!1509667 res!1029778) b!1509674))

(assert (= (and b!1509674 res!1029784) b!1509675))

(assert (= (and b!1509675 res!1029785) b!1509670))

(declare-fun m!1391639 () Bool)

(assert (=> b!1509675 m!1391639))

(declare-fun m!1391641 () Bool)

(assert (=> b!1509675 m!1391641))

(declare-fun m!1391643 () Bool)

(assert (=> b!1509671 m!1391643))

(declare-fun m!1391645 () Bool)

(assert (=> start!128798 m!1391645))

(declare-fun m!1391647 () Bool)

(assert (=> start!128798 m!1391647))

(declare-fun m!1391649 () Bool)

(assert (=> b!1509667 m!1391649))

(assert (=> b!1509667 m!1391649))

(declare-fun m!1391651 () Bool)

(assert (=> b!1509667 m!1391651))

(assert (=> b!1509673 m!1391649))

(assert (=> b!1509673 m!1391649))

(declare-fun m!1391653 () Bool)

(assert (=> b!1509673 m!1391653))

(declare-fun m!1391655 () Bool)

(assert (=> b!1509666 m!1391655))

(assert (=> b!1509672 m!1391649))

(assert (=> b!1509672 m!1391649))

(declare-fun m!1391657 () Bool)

(assert (=> b!1509672 m!1391657))

(assert (=> b!1509672 m!1391657))

(assert (=> b!1509672 m!1391649))

(declare-fun m!1391659 () Bool)

(assert (=> b!1509672 m!1391659))

(assert (=> b!1509670 m!1391649))

(assert (=> b!1509670 m!1391649))

(declare-fun m!1391661 () Bool)

(assert (=> b!1509670 m!1391661))

(declare-fun m!1391663 () Bool)

(assert (=> b!1509668 m!1391663))

(assert (=> b!1509668 m!1391663))

(declare-fun m!1391665 () Bool)

(assert (=> b!1509668 m!1391665))

(declare-fun m!1391667 () Bool)

(assert (=> b!1509674 m!1391667))

(declare-fun m!1391669 () Bool)

(assert (=> b!1509674 m!1391669))

(assert (=> b!1509674 m!1391669))

(declare-fun m!1391671 () Bool)

(assert (=> b!1509674 m!1391671))

(assert (=> b!1509674 m!1391671))

(assert (=> b!1509674 m!1391669))

(declare-fun m!1391673 () Bool)

(assert (=> b!1509674 m!1391673))

(check-sat (not b!1509674) (not b!1509666) (not b!1509671) (not b!1509675) (not b!1509673) (not b!1509667) (not b!1509672) (not b!1509668) (not start!128798) (not b!1509670))
(check-sat)
