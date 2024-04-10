; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129006 () Bool)

(assert start!129006)

(declare-fun b!1512783 () Bool)

(declare-fun res!1032694 () Bool)

(declare-fun e!844344 () Bool)

(assert (=> b!1512783 (=> (not res!1032694) (not e!844344))))

(declare-datatypes ((array!100862 0))(
  ( (array!100863 (arr!48668 (Array (_ BitVec 32) (_ BitVec 64))) (size!49218 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100862)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512783 (= res!1032694 (validKeyInArray!0 (select (arr!48668 a!2804) i!961)))))

(declare-fun b!1512784 () Bool)

(declare-fun res!1032696 () Bool)

(assert (=> b!1512784 (=> (not res!1032696) (not e!844344))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1512784 (= res!1032696 (and (= (size!49218 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49218 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49218 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512785 () Bool)

(declare-fun res!1032697 () Bool)

(declare-fun e!844346 () Bool)

(assert (=> b!1512785 (=> (not res!1032697) (not e!844346))))

(declare-datatypes ((SeekEntryResult!12839 0))(
  ( (MissingZero!12839 (index!53751 (_ BitVec 32))) (Found!12839 (index!53752 (_ BitVec 32))) (Intermediate!12839 (undefined!13651 Bool) (index!53753 (_ BitVec 32)) (x!135477 (_ BitVec 32))) (Undefined!12839) (MissingVacant!12839 (index!53754 (_ BitVec 32))) )
))
(declare-fun lt!655758 () SeekEntryResult!12839)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100862 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1512785 (= res!1032697 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48668 a!2804) j!70) a!2804 mask!2512) lt!655758))))

(declare-fun res!1032692 () Bool)

(assert (=> start!129006 (=> (not res!1032692) (not e!844344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129006 (= res!1032692 (validMask!0 mask!2512))))

(assert (=> start!129006 e!844344))

(assert (=> start!129006 true))

(declare-fun array_inv!37696 (array!100862) Bool)

(assert (=> start!129006 (array_inv!37696 a!2804)))

(declare-fun b!1512782 () Bool)

(declare-fun res!1032685 () Bool)

(assert (=> b!1512782 (=> (not res!1032685) (not e!844344))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512782 (= res!1032685 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49218 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49218 a!2804))))))

(declare-fun e!844347 () Bool)

(declare-fun b!1512786 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100862 (_ BitVec 32)) SeekEntryResult!12839)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100862 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1512786 (= e!844347 (= (seekEntryOrOpen!0 (select (arr!48668 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48668 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512787 () Bool)

(declare-fun res!1032689 () Bool)

(declare-fun e!844345 () Bool)

(assert (=> b!1512787 (=> (not res!1032689) (not e!844345))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100862 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1512787 (= res!1032689 (= (seekEntry!0 (select (arr!48668 a!2804) j!70) a!2804 mask!2512) (Found!12839 j!70)))))

(declare-fun b!1512788 () Bool)

(declare-fun e!844343 () Bool)

(assert (=> b!1512788 (= e!844346 e!844343)))

(declare-fun res!1032693 () Bool)

(assert (=> b!1512788 (=> (not res!1032693) (not e!844343))))

(declare-fun lt!655759 () SeekEntryResult!12839)

(declare-fun lt!655757 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512788 (= res!1032693 (= lt!655759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655757 mask!2512) lt!655757 (array!100863 (store (arr!48668 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49218 a!2804)) mask!2512)))))

(assert (=> b!1512788 (= lt!655757 (select (store (arr!48668 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512789 () Bool)

(assert (=> b!1512789 (= e!844343 (not (or (not (= (select (arr!48668 a!2804) j!70) lt!655757)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48668 a!2804) index!487) (select (arr!48668 a!2804) j!70)) (not (= (select (arr!48668 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (= (select (store (arr!48668 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1512789 e!844345))

(declare-fun res!1032690 () Bool)

(assert (=> b!1512789 (=> (not res!1032690) (not e!844345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100862 (_ BitVec 32)) Bool)

(assert (=> b!1512789 (= res!1032690 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50546 0))(
  ( (Unit!50547) )
))
(declare-fun lt!655756 () Unit!50546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50546)

(assert (=> b!1512789 (= lt!655756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512790 () Bool)

(declare-fun res!1032688 () Bool)

(assert (=> b!1512790 (=> (not res!1032688) (not e!844344))))

(assert (=> b!1512790 (= res!1032688 (validKeyInArray!0 (select (arr!48668 a!2804) j!70)))))

(declare-fun b!1512791 () Bool)

(assert (=> b!1512791 (= e!844344 e!844346)))

(declare-fun res!1032695 () Bool)

(assert (=> b!1512791 (=> (not res!1032695) (not e!844346))))

(assert (=> b!1512791 (= res!1032695 (= lt!655759 lt!655758))))

(assert (=> b!1512791 (= lt!655758 (Intermediate!12839 false resIndex!21 resX!21))))

(assert (=> b!1512791 (= lt!655759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48668 a!2804) j!70) mask!2512) (select (arr!48668 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512792 () Bool)

(declare-fun res!1032691 () Bool)

(assert (=> b!1512792 (=> (not res!1032691) (not e!844344))))

(assert (=> b!1512792 (= res!1032691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512793 () Bool)

(assert (=> b!1512793 (= e!844345 e!844347)))

(declare-fun res!1032687 () Bool)

(assert (=> b!1512793 (=> res!1032687 e!844347)))

(assert (=> b!1512793 (= res!1032687 (or (not (= (select (arr!48668 a!2804) j!70) lt!655757)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48668 a!2804) index!487) (select (arr!48668 a!2804) j!70)) (not (= (select (arr!48668 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512794 () Bool)

(declare-fun res!1032686 () Bool)

(assert (=> b!1512794 (=> (not res!1032686) (not e!844344))))

(declare-datatypes ((List!35151 0))(
  ( (Nil!35148) (Cons!35147 (h!36559 (_ BitVec 64)) (t!49845 List!35151)) )
))
(declare-fun arrayNoDuplicates!0 (array!100862 (_ BitVec 32) List!35151) Bool)

(assert (=> b!1512794 (= res!1032686 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35148))))

(assert (= (and start!129006 res!1032692) b!1512784))

(assert (= (and b!1512784 res!1032696) b!1512783))

(assert (= (and b!1512783 res!1032694) b!1512790))

(assert (= (and b!1512790 res!1032688) b!1512792))

(assert (= (and b!1512792 res!1032691) b!1512794))

(assert (= (and b!1512794 res!1032686) b!1512782))

(assert (= (and b!1512782 res!1032685) b!1512791))

(assert (= (and b!1512791 res!1032695) b!1512785))

(assert (= (and b!1512785 res!1032697) b!1512788))

(assert (= (and b!1512788 res!1032693) b!1512789))

(assert (= (and b!1512789 res!1032690) b!1512787))

(assert (= (and b!1512787 res!1032689) b!1512793))

(assert (= (and b!1512793 (not res!1032687)) b!1512786))

(declare-fun m!1395577 () Bool)

(assert (=> b!1512791 m!1395577))

(assert (=> b!1512791 m!1395577))

(declare-fun m!1395579 () Bool)

(assert (=> b!1512791 m!1395579))

(assert (=> b!1512791 m!1395579))

(assert (=> b!1512791 m!1395577))

(declare-fun m!1395581 () Bool)

(assert (=> b!1512791 m!1395581))

(assert (=> b!1512785 m!1395577))

(assert (=> b!1512785 m!1395577))

(declare-fun m!1395583 () Bool)

(assert (=> b!1512785 m!1395583))

(declare-fun m!1395585 () Bool)

(assert (=> b!1512783 m!1395585))

(assert (=> b!1512783 m!1395585))

(declare-fun m!1395587 () Bool)

(assert (=> b!1512783 m!1395587))

(assert (=> b!1512790 m!1395577))

(assert (=> b!1512790 m!1395577))

(declare-fun m!1395589 () Bool)

(assert (=> b!1512790 m!1395589))

(assert (=> b!1512789 m!1395577))

(declare-fun m!1395591 () Bool)

(assert (=> b!1512789 m!1395591))

(declare-fun m!1395593 () Bool)

(assert (=> b!1512789 m!1395593))

(declare-fun m!1395595 () Bool)

(assert (=> b!1512789 m!1395595))

(declare-fun m!1395597 () Bool)

(assert (=> b!1512789 m!1395597))

(declare-fun m!1395599 () Bool)

(assert (=> b!1512789 m!1395599))

(assert (=> b!1512793 m!1395577))

(assert (=> b!1512793 m!1395595))

(assert (=> b!1512786 m!1395577))

(assert (=> b!1512786 m!1395577))

(declare-fun m!1395601 () Bool)

(assert (=> b!1512786 m!1395601))

(assert (=> b!1512786 m!1395577))

(declare-fun m!1395603 () Bool)

(assert (=> b!1512786 m!1395603))

(declare-fun m!1395605 () Bool)

(assert (=> b!1512794 m!1395605))

(assert (=> b!1512787 m!1395577))

(assert (=> b!1512787 m!1395577))

(declare-fun m!1395607 () Bool)

(assert (=> b!1512787 m!1395607))

(declare-fun m!1395609 () Bool)

(assert (=> b!1512792 m!1395609))

(declare-fun m!1395611 () Bool)

(assert (=> start!129006 m!1395611))

(declare-fun m!1395613 () Bool)

(assert (=> start!129006 m!1395613))

(declare-fun m!1395615 () Bool)

(assert (=> b!1512788 m!1395615))

(assert (=> b!1512788 m!1395593))

(assert (=> b!1512788 m!1395615))

(declare-fun m!1395617 () Bool)

(assert (=> b!1512788 m!1395617))

(declare-fun m!1395619 () Bool)

(assert (=> b!1512788 m!1395619))

(push 1)

(assert (not b!1512792))

(assert (not b!1512783))

(assert (not b!1512789))

(assert (not b!1512785))

(assert (not b!1512786))

(assert (not b!1512791))

(assert (not b!1512788))

(assert (not start!129006))

(assert (not b!1512794))

(assert (not b!1512790))

(assert (not b!1512787))

(check-sat)

