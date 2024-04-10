; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130088 () Bool)

(assert start!130088)

(declare-fun b!1526734 () Bool)

(declare-datatypes ((array!101501 0))(
  ( (array!101502 (arr!48977 (Array (_ BitVec 32) (_ BitVec 64))) (size!49527 (_ BitVec 32))) )
))
(declare-fun lt!661181 () array!101501)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!850984 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!661180 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13142 0))(
  ( (MissingZero!13142 (index!54963 (_ BitVec 32))) (Found!13142 (index!54964 (_ BitVec 32))) (Intermediate!13142 (undefined!13954 Bool) (index!54965 (_ BitVec 32)) (x!136660 (_ BitVec 32))) (Undefined!13142) (MissingVacant!13142 (index!54966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101501 (_ BitVec 32)) SeekEntryResult!13142)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101501 (_ BitVec 32)) SeekEntryResult!13142)

(assert (=> b!1526734 (= e!850984 (= (seekEntryOrOpen!0 lt!661180 lt!661181 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661180 lt!661181 mask!2512)))))

(declare-fun b!1526735 () Bool)

(declare-fun e!850981 () Bool)

(declare-fun e!850983 () Bool)

(assert (=> b!1526735 (= e!850981 e!850983)))

(declare-fun res!1044775 () Bool)

(assert (=> b!1526735 (=> (not res!1044775) (not e!850983))))

(declare-fun lt!661179 () SeekEntryResult!13142)

(declare-fun lt!661182 () SeekEntryResult!13142)

(assert (=> b!1526735 (= res!1044775 (= lt!661179 lt!661182))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526735 (= lt!661182 (Intermediate!13142 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101501 (_ BitVec 32)) SeekEntryResult!13142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526735 (= lt!661179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48977 a!2804) j!70) mask!2512) (select (arr!48977 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526736 () Bool)

(declare-fun res!1044777 () Bool)

(assert (=> b!1526736 (=> (not res!1044777) (not e!850983))))

(assert (=> b!1526736 (= res!1044777 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48977 a!2804) j!70) a!2804 mask!2512) lt!661182))))

(declare-fun b!1526737 () Bool)

(declare-fun res!1044776 () Bool)

(assert (=> b!1526737 (=> (not res!1044776) (not e!850981))))

(declare-datatypes ((List!35460 0))(
  ( (Nil!35457) (Cons!35456 (h!36889 (_ BitVec 64)) (t!50154 List!35460)) )
))
(declare-fun arrayNoDuplicates!0 (array!101501 (_ BitVec 32) List!35460) Bool)

(assert (=> b!1526737 (= res!1044776 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35457))))

(declare-fun b!1526738 () Bool)

(declare-fun e!850979 () Bool)

(assert (=> b!1526738 (= e!850979 (not true))))

(declare-fun e!850978 () Bool)

(assert (=> b!1526738 e!850978))

(declare-fun res!1044781 () Bool)

(assert (=> b!1526738 (=> (not res!1044781) (not e!850978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101501 (_ BitVec 32)) Bool)

(assert (=> b!1526738 (= res!1044781 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51068 0))(
  ( (Unit!51069) )
))
(declare-fun lt!661183 () Unit!51068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51068)

(assert (=> b!1526738 (= lt!661183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526739 () Bool)

(declare-fun res!1044779 () Bool)

(assert (=> b!1526739 (=> (not res!1044779) (not e!850981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526739 (= res!1044779 (validKeyInArray!0 (select (arr!48977 a!2804) j!70)))))

(declare-fun b!1526740 () Bool)

(assert (=> b!1526740 (= e!850983 e!850979)))

(declare-fun res!1044769 () Bool)

(assert (=> b!1526740 (=> (not res!1044769) (not e!850979))))

(assert (=> b!1526740 (= res!1044769 (= lt!661179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661180 mask!2512) lt!661180 lt!661181 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526740 (= lt!661180 (select (store (arr!48977 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526740 (= lt!661181 (array!101502 (store (arr!48977 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49527 a!2804)))))

(declare-fun b!1526741 () Bool)

(declare-fun e!850982 () Bool)

(assert (=> b!1526741 (= e!850982 e!850984)))

(declare-fun res!1044772 () Bool)

(assert (=> b!1526741 (=> (not res!1044772) (not e!850984))))

(assert (=> b!1526741 (= res!1044772 (= (seekEntryOrOpen!0 (select (arr!48977 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48977 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526742 () Bool)

(assert (=> b!1526742 (= e!850978 e!850982)))

(declare-fun res!1044774 () Bool)

(assert (=> b!1526742 (=> res!1044774 e!850982)))

(assert (=> b!1526742 (= res!1044774 (or (not (= (select (arr!48977 a!2804) j!70) lt!661180)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48977 a!2804) index!487) (select (arr!48977 a!2804) j!70)) (not (= (select (arr!48977 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526744 () Bool)

(declare-fun res!1044768 () Bool)

(assert (=> b!1526744 (=> (not res!1044768) (not e!850978))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101501 (_ BitVec 32)) SeekEntryResult!13142)

(assert (=> b!1526744 (= res!1044768 (= (seekEntry!0 (select (arr!48977 a!2804) j!70) a!2804 mask!2512) (Found!13142 j!70)))))

(declare-fun b!1526745 () Bool)

(declare-fun res!1044770 () Bool)

(assert (=> b!1526745 (=> (not res!1044770) (not e!850981))))

(assert (=> b!1526745 (= res!1044770 (and (= (size!49527 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49527 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49527 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526746 () Bool)

(declare-fun res!1044771 () Bool)

(assert (=> b!1526746 (=> (not res!1044771) (not e!850981))))

(assert (=> b!1526746 (= res!1044771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526747 () Bool)

(declare-fun res!1044778 () Bool)

(assert (=> b!1526747 (=> (not res!1044778) (not e!850981))))

(assert (=> b!1526747 (= res!1044778 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49527 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49527 a!2804))))))

(declare-fun res!1044780 () Bool)

(assert (=> start!130088 (=> (not res!1044780) (not e!850981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130088 (= res!1044780 (validMask!0 mask!2512))))

(assert (=> start!130088 e!850981))

(assert (=> start!130088 true))

(declare-fun array_inv!38005 (array!101501) Bool)

(assert (=> start!130088 (array_inv!38005 a!2804)))

(declare-fun b!1526743 () Bool)

(declare-fun res!1044773 () Bool)

(assert (=> b!1526743 (=> (not res!1044773) (not e!850981))))

(assert (=> b!1526743 (= res!1044773 (validKeyInArray!0 (select (arr!48977 a!2804) i!961)))))

(assert (= (and start!130088 res!1044780) b!1526745))

(assert (= (and b!1526745 res!1044770) b!1526743))

(assert (= (and b!1526743 res!1044773) b!1526739))

(assert (= (and b!1526739 res!1044779) b!1526746))

(assert (= (and b!1526746 res!1044771) b!1526737))

(assert (= (and b!1526737 res!1044776) b!1526747))

(assert (= (and b!1526747 res!1044778) b!1526735))

(assert (= (and b!1526735 res!1044775) b!1526736))

(assert (= (and b!1526736 res!1044777) b!1526740))

(assert (= (and b!1526740 res!1044769) b!1526738))

(assert (= (and b!1526738 res!1044781) b!1526744))

(assert (= (and b!1526744 res!1044768) b!1526742))

(assert (= (and b!1526742 (not res!1044774)) b!1526741))

(assert (= (and b!1526741 res!1044772) b!1526734))

(declare-fun m!1409565 () Bool)

(assert (=> b!1526741 m!1409565))

(assert (=> b!1526741 m!1409565))

(declare-fun m!1409567 () Bool)

(assert (=> b!1526741 m!1409567))

(assert (=> b!1526741 m!1409565))

(declare-fun m!1409569 () Bool)

(assert (=> b!1526741 m!1409569))

(declare-fun m!1409571 () Bool)

(assert (=> b!1526740 m!1409571))

(assert (=> b!1526740 m!1409571))

(declare-fun m!1409573 () Bool)

(assert (=> b!1526740 m!1409573))

(declare-fun m!1409575 () Bool)

(assert (=> b!1526740 m!1409575))

(declare-fun m!1409577 () Bool)

(assert (=> b!1526740 m!1409577))

(declare-fun m!1409579 () Bool)

(assert (=> start!130088 m!1409579))

(declare-fun m!1409581 () Bool)

(assert (=> start!130088 m!1409581))

(declare-fun m!1409583 () Bool)

(assert (=> b!1526743 m!1409583))

(assert (=> b!1526743 m!1409583))

(declare-fun m!1409585 () Bool)

(assert (=> b!1526743 m!1409585))

(assert (=> b!1526744 m!1409565))

(assert (=> b!1526744 m!1409565))

(declare-fun m!1409587 () Bool)

(assert (=> b!1526744 m!1409587))

(declare-fun m!1409589 () Bool)

(assert (=> b!1526734 m!1409589))

(declare-fun m!1409591 () Bool)

(assert (=> b!1526734 m!1409591))

(declare-fun m!1409593 () Bool)

(assert (=> b!1526738 m!1409593))

(declare-fun m!1409595 () Bool)

(assert (=> b!1526738 m!1409595))

(declare-fun m!1409597 () Bool)

(assert (=> b!1526737 m!1409597))

(assert (=> b!1526736 m!1409565))

(assert (=> b!1526736 m!1409565))

(declare-fun m!1409599 () Bool)

(assert (=> b!1526736 m!1409599))

(assert (=> b!1526739 m!1409565))

(assert (=> b!1526739 m!1409565))

(declare-fun m!1409601 () Bool)

(assert (=> b!1526739 m!1409601))

(declare-fun m!1409603 () Bool)

(assert (=> b!1526746 m!1409603))

(assert (=> b!1526742 m!1409565))

(declare-fun m!1409605 () Bool)

(assert (=> b!1526742 m!1409605))

(assert (=> b!1526735 m!1409565))

(assert (=> b!1526735 m!1409565))

(declare-fun m!1409607 () Bool)

(assert (=> b!1526735 m!1409607))

(assert (=> b!1526735 m!1409607))

(assert (=> b!1526735 m!1409565))

(declare-fun m!1409609 () Bool)

(assert (=> b!1526735 m!1409609))

(push 1)

