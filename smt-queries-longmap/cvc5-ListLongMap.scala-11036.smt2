; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129048 () Bool)

(assert start!129048)

(declare-fun lt!656055 () (_ BitVec 64))

(declare-fun b!1513657 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844777 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100904 0))(
  ( (array!100905 (arr!48689 (Array (_ BitVec 32) (_ BitVec 64))) (size!49239 (_ BitVec 32))) )
))
(declare-fun lt!656057 () array!100904)

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12860 0))(
  ( (MissingZero!12860 (index!53835 (_ BitVec 32))) (Found!12860 (index!53836 (_ BitVec 32))) (Intermediate!12860 (undefined!13672 Bool) (index!53837 (_ BitVec 32)) (x!135554 (_ BitVec 32))) (Undefined!12860) (MissingVacant!12860 (index!53838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100904 (_ BitVec 32)) SeekEntryResult!12860)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100904 (_ BitVec 32)) SeekEntryResult!12860)

(assert (=> b!1513657 (= e!844777 (= (seekEntryOrOpen!0 lt!656055 lt!656057 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656055 lt!656057 mask!2512)))))

(declare-fun b!1513658 () Bool)

(declare-fun e!844782 () Bool)

(assert (=> b!1513658 (= e!844782 e!844777)))

(declare-fun res!1033567 () Bool)

(assert (=> b!1513658 (=> (not res!1033567) (not e!844777))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100904)

(assert (=> b!1513658 (= res!1033567 (= (seekEntryOrOpen!0 (select (arr!48689 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48689 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513659 () Bool)

(declare-fun res!1033569 () Bool)

(declare-fun e!844779 () Bool)

(assert (=> b!1513659 (=> (not res!1033569) (not e!844779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100904 (_ BitVec 32)) Bool)

(assert (=> b!1513659 (= res!1033569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513660 () Bool)

(declare-fun res!1033564 () Bool)

(assert (=> b!1513660 (=> (not res!1033564) (not e!844779))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513660 (= res!1033564 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49239 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49239 a!2804))))))

(declare-fun b!1513661 () Bool)

(declare-fun res!1033561 () Bool)

(assert (=> b!1513661 (=> (not res!1033561) (not e!844779))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513661 (= res!1033561 (validKeyInArray!0 (select (arr!48689 a!2804) i!961)))))

(declare-fun b!1513663 () Bool)

(declare-fun e!844783 () Bool)

(assert (=> b!1513663 (= e!844779 e!844783)))

(declare-fun res!1033560 () Bool)

(assert (=> b!1513663 (=> (not res!1033560) (not e!844783))))

(declare-fun lt!656059 () SeekEntryResult!12860)

(declare-fun lt!656056 () SeekEntryResult!12860)

(assert (=> b!1513663 (= res!1033560 (= lt!656059 lt!656056))))

(assert (=> b!1513663 (= lt!656056 (Intermediate!12860 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100904 (_ BitVec 32)) SeekEntryResult!12860)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513663 (= lt!656059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48689 a!2804) j!70) mask!2512) (select (arr!48689 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513664 () Bool)

(declare-fun res!1033572 () Bool)

(assert (=> b!1513664 (=> (not res!1033572) (not e!844779))))

(assert (=> b!1513664 (= res!1033572 (and (= (size!49239 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49239 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49239 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513665 () Bool)

(declare-fun res!1033568 () Bool)

(assert (=> b!1513665 (=> (not res!1033568) (not e!844779))))

(declare-datatypes ((List!35172 0))(
  ( (Nil!35169) (Cons!35168 (h!36580 (_ BitVec 64)) (t!49866 List!35172)) )
))
(declare-fun arrayNoDuplicates!0 (array!100904 (_ BitVec 32) List!35172) Bool)

(assert (=> b!1513665 (= res!1033568 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35169))))

(declare-fun b!1513666 () Bool)

(declare-fun res!1033573 () Bool)

(declare-fun e!844781 () Bool)

(assert (=> b!1513666 (=> (not res!1033573) (not e!844781))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100904 (_ BitVec 32)) SeekEntryResult!12860)

(assert (=> b!1513666 (= res!1033573 (= (seekEntry!0 (select (arr!48689 a!2804) j!70) a!2804 mask!2512) (Found!12860 j!70)))))

(declare-fun b!1513667 () Bool)

(declare-fun e!844780 () Bool)

(assert (=> b!1513667 (= e!844780 (not true))))

(assert (=> b!1513667 e!844781))

(declare-fun res!1033566 () Bool)

(assert (=> b!1513667 (=> (not res!1033566) (not e!844781))))

(assert (=> b!1513667 (= res!1033566 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50588 0))(
  ( (Unit!50589) )
))
(declare-fun lt!656058 () Unit!50588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50588)

(assert (=> b!1513667 (= lt!656058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513668 () Bool)

(declare-fun res!1033571 () Bool)

(assert (=> b!1513668 (=> (not res!1033571) (not e!844779))))

(assert (=> b!1513668 (= res!1033571 (validKeyInArray!0 (select (arr!48689 a!2804) j!70)))))

(declare-fun b!1513662 () Bool)

(assert (=> b!1513662 (= e!844783 e!844780)))

(declare-fun res!1033565 () Bool)

(assert (=> b!1513662 (=> (not res!1033565) (not e!844780))))

(assert (=> b!1513662 (= res!1033565 (= lt!656059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656055 mask!2512) lt!656055 lt!656057 mask!2512)))))

(assert (=> b!1513662 (= lt!656055 (select (store (arr!48689 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513662 (= lt!656057 (array!100905 (store (arr!48689 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49239 a!2804)))))

(declare-fun res!1033563 () Bool)

(assert (=> start!129048 (=> (not res!1033563) (not e!844779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129048 (= res!1033563 (validMask!0 mask!2512))))

(assert (=> start!129048 e!844779))

(assert (=> start!129048 true))

(declare-fun array_inv!37717 (array!100904) Bool)

(assert (=> start!129048 (array_inv!37717 a!2804)))

(declare-fun b!1513669 () Bool)

(declare-fun res!1033570 () Bool)

(assert (=> b!1513669 (=> (not res!1033570) (not e!844783))))

(assert (=> b!1513669 (= res!1033570 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48689 a!2804) j!70) a!2804 mask!2512) lt!656056))))

(declare-fun b!1513670 () Bool)

(assert (=> b!1513670 (= e!844781 e!844782)))

(declare-fun res!1033562 () Bool)

(assert (=> b!1513670 (=> res!1033562 e!844782)))

(assert (=> b!1513670 (= res!1033562 (or (not (= (select (arr!48689 a!2804) j!70) lt!656055)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48689 a!2804) index!487) (select (arr!48689 a!2804) j!70)) (not (= (select (arr!48689 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129048 res!1033563) b!1513664))

(assert (= (and b!1513664 res!1033572) b!1513661))

(assert (= (and b!1513661 res!1033561) b!1513668))

(assert (= (and b!1513668 res!1033571) b!1513659))

(assert (= (and b!1513659 res!1033569) b!1513665))

(assert (= (and b!1513665 res!1033568) b!1513660))

(assert (= (and b!1513660 res!1033564) b!1513663))

(assert (= (and b!1513663 res!1033560) b!1513669))

(assert (= (and b!1513669 res!1033570) b!1513662))

(assert (= (and b!1513662 res!1033565) b!1513667))

(assert (= (and b!1513667 res!1033566) b!1513666))

(assert (= (and b!1513666 res!1033573) b!1513670))

(assert (= (and b!1513670 (not res!1033562)) b!1513658))

(assert (= (and b!1513658 res!1033567) b!1513657))

(declare-fun m!1396537 () Bool)

(assert (=> b!1513666 m!1396537))

(assert (=> b!1513666 m!1396537))

(declare-fun m!1396539 () Bool)

(assert (=> b!1513666 m!1396539))

(assert (=> b!1513668 m!1396537))

(assert (=> b!1513668 m!1396537))

(declare-fun m!1396541 () Bool)

(assert (=> b!1513668 m!1396541))

(declare-fun m!1396543 () Bool)

(assert (=> start!129048 m!1396543))

(declare-fun m!1396545 () Bool)

(assert (=> start!129048 m!1396545))

(assert (=> b!1513663 m!1396537))

(assert (=> b!1513663 m!1396537))

(declare-fun m!1396547 () Bool)

(assert (=> b!1513663 m!1396547))

(assert (=> b!1513663 m!1396547))

(assert (=> b!1513663 m!1396537))

(declare-fun m!1396549 () Bool)

(assert (=> b!1513663 m!1396549))

(declare-fun m!1396551 () Bool)

(assert (=> b!1513662 m!1396551))

(assert (=> b!1513662 m!1396551))

(declare-fun m!1396553 () Bool)

(assert (=> b!1513662 m!1396553))

(declare-fun m!1396555 () Bool)

(assert (=> b!1513662 m!1396555))

(declare-fun m!1396557 () Bool)

(assert (=> b!1513662 m!1396557))

(declare-fun m!1396559 () Bool)

(assert (=> b!1513657 m!1396559))

(declare-fun m!1396561 () Bool)

(assert (=> b!1513657 m!1396561))

(declare-fun m!1396563 () Bool)

(assert (=> b!1513667 m!1396563))

(declare-fun m!1396565 () Bool)

(assert (=> b!1513667 m!1396565))

(assert (=> b!1513669 m!1396537))

(assert (=> b!1513669 m!1396537))

(declare-fun m!1396567 () Bool)

(assert (=> b!1513669 m!1396567))

(declare-fun m!1396569 () Bool)

(assert (=> b!1513659 m!1396569))

(declare-fun m!1396571 () Bool)

(assert (=> b!1513665 m!1396571))

(declare-fun m!1396573 () Bool)

(assert (=> b!1513661 m!1396573))

(assert (=> b!1513661 m!1396573))

(declare-fun m!1396575 () Bool)

(assert (=> b!1513661 m!1396575))

(assert (=> b!1513670 m!1396537))

(declare-fun m!1396577 () Bool)

(assert (=> b!1513670 m!1396577))

(assert (=> b!1513658 m!1396537))

(assert (=> b!1513658 m!1396537))

(declare-fun m!1396579 () Bool)

(assert (=> b!1513658 m!1396579))

(assert (=> b!1513658 m!1396537))

(declare-fun m!1396581 () Bool)

(assert (=> b!1513658 m!1396581))

(push 1)

