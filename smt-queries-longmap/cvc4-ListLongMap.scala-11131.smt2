; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130086 () Bool)

(assert start!130086)

(declare-fun b!1526693 () Bool)

(declare-datatypes ((array!101499 0))(
  ( (array!101500 (arr!48976 (Array (_ BitVec 32) (_ BitVec 64))) (size!49526 (_ BitVec 32))) )
))
(declare-fun lt!661164 () array!101499)

(declare-fun e!850959 () Bool)

(declare-fun lt!661168 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13141 0))(
  ( (MissingZero!13141 (index!54959 (_ BitVec 32))) (Found!13141 (index!54960 (_ BitVec 32))) (Intermediate!13141 (undefined!13953 Bool) (index!54961 (_ BitVec 32)) (x!136651 (_ BitVec 32))) (Undefined!13141) (MissingVacant!13141 (index!54962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101499 (_ BitVec 32)) SeekEntryResult!13141)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101499 (_ BitVec 32)) SeekEntryResult!13141)

(assert (=> b!1526693 (= e!850959 (= (seekEntryOrOpen!0 lt!661168 lt!661164 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661168 lt!661164 mask!2512)))))

(declare-fun b!1526694 () Bool)

(declare-fun res!1044731 () Bool)

(declare-fun e!850963 () Bool)

(assert (=> b!1526694 (=> (not res!1044731) (not e!850963))))

(declare-fun a!2804 () array!101499)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526694 (= res!1044731 (validKeyInArray!0 (select (arr!48976 a!2804) i!961)))))

(declare-fun b!1526695 () Bool)

(declare-fun res!1044730 () Bool)

(assert (=> b!1526695 (=> (not res!1044730) (not e!850963))))

(declare-datatypes ((List!35459 0))(
  ( (Nil!35456) (Cons!35455 (h!36888 (_ BitVec 64)) (t!50153 List!35459)) )
))
(declare-fun arrayNoDuplicates!0 (array!101499 (_ BitVec 32) List!35459) Bool)

(assert (=> b!1526695 (= res!1044730 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35456))))

(declare-fun b!1526696 () Bool)

(declare-fun res!1044735 () Bool)

(assert (=> b!1526696 (=> (not res!1044735) (not e!850963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101499 (_ BitVec 32)) Bool)

(assert (=> b!1526696 (= res!1044735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526697 () Bool)

(declare-fun e!850960 () Bool)

(assert (=> b!1526697 (= e!850960 (not true))))

(declare-fun e!850957 () Bool)

(assert (=> b!1526697 e!850957))

(declare-fun res!1044739 () Bool)

(assert (=> b!1526697 (=> (not res!1044739) (not e!850957))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526697 (= res!1044739 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51066 0))(
  ( (Unit!51067) )
))
(declare-fun lt!661166 () Unit!51066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51066)

(assert (=> b!1526697 (= lt!661166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526698 () Bool)

(declare-fun e!850961 () Bool)

(assert (=> b!1526698 (= e!850957 e!850961)))

(declare-fun res!1044734 () Bool)

(assert (=> b!1526698 (=> res!1044734 e!850961)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526698 (= res!1044734 (or (not (= (select (arr!48976 a!2804) j!70) lt!661168)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48976 a!2804) index!487) (select (arr!48976 a!2804) j!70)) (not (= (select (arr!48976 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526699 () Bool)

(declare-fun res!1044729 () Bool)

(declare-fun e!850962 () Bool)

(assert (=> b!1526699 (=> (not res!1044729) (not e!850962))))

(declare-fun lt!661165 () SeekEntryResult!13141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101499 (_ BitVec 32)) SeekEntryResult!13141)

(assert (=> b!1526699 (= res!1044729 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) lt!661165))))

(declare-fun b!1526700 () Bool)

(declare-fun res!1044732 () Bool)

(assert (=> b!1526700 (=> (not res!1044732) (not e!850963))))

(assert (=> b!1526700 (= res!1044732 (and (= (size!49526 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49526 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49526 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526701 () Bool)

(declare-fun res!1044736 () Bool)

(assert (=> b!1526701 (=> (not res!1044736) (not e!850963))))

(assert (=> b!1526701 (= res!1044736 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49526 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49526 a!2804))))))

(declare-fun b!1526702 () Bool)

(assert (=> b!1526702 (= e!850962 e!850960)))

(declare-fun res!1044737 () Bool)

(assert (=> b!1526702 (=> (not res!1044737) (not e!850960))))

(declare-fun lt!661167 () SeekEntryResult!13141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526702 (= res!1044737 (= lt!661167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661168 mask!2512) lt!661168 lt!661164 mask!2512)))))

(assert (=> b!1526702 (= lt!661168 (select (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526702 (= lt!661164 (array!101500 (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49526 a!2804)))))

(declare-fun b!1526703 () Bool)

(declare-fun res!1044728 () Bool)

(assert (=> b!1526703 (=> (not res!1044728) (not e!850957))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101499 (_ BitVec 32)) SeekEntryResult!13141)

(assert (=> b!1526703 (= res!1044728 (= (seekEntry!0 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) (Found!13141 j!70)))))

(declare-fun res!1044738 () Bool)

(assert (=> start!130086 (=> (not res!1044738) (not e!850963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130086 (= res!1044738 (validMask!0 mask!2512))))

(assert (=> start!130086 e!850963))

(assert (=> start!130086 true))

(declare-fun array_inv!38004 (array!101499) Bool)

(assert (=> start!130086 (array_inv!38004 a!2804)))

(declare-fun b!1526692 () Bool)

(assert (=> b!1526692 (= e!850963 e!850962)))

(declare-fun res!1044727 () Bool)

(assert (=> b!1526692 (=> (not res!1044727) (not e!850962))))

(assert (=> b!1526692 (= res!1044727 (= lt!661167 lt!661165))))

(assert (=> b!1526692 (= lt!661165 (Intermediate!13141 false resIndex!21 resX!21))))

(assert (=> b!1526692 (= lt!661167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48976 a!2804) j!70) mask!2512) (select (arr!48976 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526704 () Bool)

(declare-fun res!1044733 () Bool)

(assert (=> b!1526704 (=> (not res!1044733) (not e!850963))))

(assert (=> b!1526704 (= res!1044733 (validKeyInArray!0 (select (arr!48976 a!2804) j!70)))))

(declare-fun b!1526705 () Bool)

(assert (=> b!1526705 (= e!850961 e!850959)))

(declare-fun res!1044726 () Bool)

(assert (=> b!1526705 (=> (not res!1044726) (not e!850959))))

(assert (=> b!1526705 (= res!1044726 (= (seekEntryOrOpen!0 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48976 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130086 res!1044738) b!1526700))

(assert (= (and b!1526700 res!1044732) b!1526694))

(assert (= (and b!1526694 res!1044731) b!1526704))

(assert (= (and b!1526704 res!1044733) b!1526696))

(assert (= (and b!1526696 res!1044735) b!1526695))

(assert (= (and b!1526695 res!1044730) b!1526701))

(assert (= (and b!1526701 res!1044736) b!1526692))

(assert (= (and b!1526692 res!1044727) b!1526699))

(assert (= (and b!1526699 res!1044729) b!1526702))

(assert (= (and b!1526702 res!1044737) b!1526697))

(assert (= (and b!1526697 res!1044739) b!1526703))

(assert (= (and b!1526703 res!1044728) b!1526698))

(assert (= (and b!1526698 (not res!1044734)) b!1526705))

(assert (= (and b!1526705 res!1044726) b!1526693))

(declare-fun m!1409519 () Bool)

(assert (=> b!1526695 m!1409519))

(declare-fun m!1409521 () Bool)

(assert (=> b!1526705 m!1409521))

(assert (=> b!1526705 m!1409521))

(declare-fun m!1409523 () Bool)

(assert (=> b!1526705 m!1409523))

(assert (=> b!1526705 m!1409521))

(declare-fun m!1409525 () Bool)

(assert (=> b!1526705 m!1409525))

(declare-fun m!1409527 () Bool)

(assert (=> b!1526694 m!1409527))

(assert (=> b!1526694 m!1409527))

(declare-fun m!1409529 () Bool)

(assert (=> b!1526694 m!1409529))

(assert (=> b!1526703 m!1409521))

(assert (=> b!1526703 m!1409521))

(declare-fun m!1409531 () Bool)

(assert (=> b!1526703 m!1409531))

(declare-fun m!1409533 () Bool)

(assert (=> b!1526702 m!1409533))

(assert (=> b!1526702 m!1409533))

(declare-fun m!1409535 () Bool)

(assert (=> b!1526702 m!1409535))

(declare-fun m!1409537 () Bool)

(assert (=> b!1526702 m!1409537))

(declare-fun m!1409539 () Bool)

(assert (=> b!1526702 m!1409539))

(assert (=> b!1526704 m!1409521))

(assert (=> b!1526704 m!1409521))

(declare-fun m!1409541 () Bool)

(assert (=> b!1526704 m!1409541))

(declare-fun m!1409543 () Bool)

(assert (=> b!1526696 m!1409543))

(declare-fun m!1409545 () Bool)

(assert (=> b!1526693 m!1409545))

(declare-fun m!1409547 () Bool)

(assert (=> b!1526693 m!1409547))

(assert (=> b!1526692 m!1409521))

(assert (=> b!1526692 m!1409521))

(declare-fun m!1409549 () Bool)

(assert (=> b!1526692 m!1409549))

(assert (=> b!1526692 m!1409549))

(assert (=> b!1526692 m!1409521))

(declare-fun m!1409551 () Bool)

(assert (=> b!1526692 m!1409551))

(assert (=> b!1526699 m!1409521))

(assert (=> b!1526699 m!1409521))

(declare-fun m!1409553 () Bool)

(assert (=> b!1526699 m!1409553))

(declare-fun m!1409555 () Bool)

(assert (=> start!130086 m!1409555))

(declare-fun m!1409557 () Bool)

(assert (=> start!130086 m!1409557))

(declare-fun m!1409559 () Bool)

(assert (=> b!1526697 m!1409559))

(declare-fun m!1409561 () Bool)

(assert (=> b!1526697 m!1409561))

(assert (=> b!1526698 m!1409521))

(declare-fun m!1409563 () Bool)

(assert (=> b!1526698 m!1409563))

(push 1)

