; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128954 () Bool)

(assert start!128954)

(declare-fun b!1511759 () Bool)

(declare-fun res!1031667 () Bool)

(declare-fun e!843946 () Bool)

(assert (=> b!1511759 (=> (not res!1031667) (not e!843946))))

(declare-datatypes ((SeekEntryResult!12813 0))(
  ( (MissingZero!12813 (index!53647 (_ BitVec 32))) (Found!12813 (index!53648 (_ BitVec 32))) (Intermediate!12813 (undefined!13625 Bool) (index!53649 (_ BitVec 32)) (x!135379 (_ BitVec 32))) (Undefined!12813) (MissingVacant!12813 (index!53650 (_ BitVec 32))) )
))
(declare-fun lt!655520 () SeekEntryResult!12813)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!100810 0))(
  ( (array!100811 (arr!48642 (Array (_ BitVec 32) (_ BitVec 64))) (size!49192 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12813)

(assert (=> b!1511759 (= res!1031667 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48642 a!2804) j!70) a!2804 mask!2512) lt!655520))))

(declare-fun b!1511760 () Bool)

(declare-fun e!843943 () Bool)

(declare-fun e!843944 () Bool)

(assert (=> b!1511760 (= e!843943 e!843944)))

(declare-fun res!1031662 () Bool)

(assert (=> b!1511760 (=> res!1031662 e!843944)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511760 (= res!1031662 (or (not (= (select (arr!48642 a!2804) j!70) (select (store (arr!48642 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48642 a!2804) index!487) (select (arr!48642 a!2804) j!70)) (not (= (select (arr!48642 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511761 () Bool)

(declare-fun res!1031664 () Bool)

(declare-fun e!843942 () Bool)

(assert (=> b!1511761 (=> (not res!1031664) (not e!843942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511761 (= res!1031664 (validKeyInArray!0 (select (arr!48642 a!2804) i!961)))))

(declare-fun b!1511762 () Bool)

(declare-fun res!1031674 () Bool)

(assert (=> b!1511762 (=> (not res!1031674) (not e!843942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100810 (_ BitVec 32)) Bool)

(assert (=> b!1511762 (= res!1031674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511763 () Bool)

(assert (=> b!1511763 (= e!843942 e!843946)))

(declare-fun res!1031671 () Bool)

(assert (=> b!1511763 (=> (not res!1031671) (not e!843946))))

(declare-fun lt!655522 () SeekEntryResult!12813)

(assert (=> b!1511763 (= res!1031671 (= lt!655522 lt!655520))))

(assert (=> b!1511763 (= lt!655520 (Intermediate!12813 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511763 (= lt!655522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48642 a!2804) j!70) mask!2512) (select (arr!48642 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511764 () Bool)

(declare-fun res!1031672 () Bool)

(assert (=> b!1511764 (=> (not res!1031672) (not e!843942))))

(declare-datatypes ((List!35125 0))(
  ( (Nil!35122) (Cons!35121 (h!36533 (_ BitVec 64)) (t!49819 List!35125)) )
))
(declare-fun arrayNoDuplicates!0 (array!100810 (_ BitVec 32) List!35125) Bool)

(assert (=> b!1511764 (= res!1031672 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35122))))

(declare-fun b!1511765 () Bool)

(declare-fun res!1031666 () Bool)

(assert (=> b!1511765 (=> (not res!1031666) (not e!843942))))

(assert (=> b!1511765 (= res!1031666 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49192 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49192 a!2804))))))

(declare-fun res!1031663 () Bool)

(assert (=> start!128954 (=> (not res!1031663) (not e!843942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128954 (= res!1031663 (validMask!0 mask!2512))))

(assert (=> start!128954 e!843942))

(assert (=> start!128954 true))

(declare-fun array_inv!37670 (array!100810) Bool)

(assert (=> start!128954 (array_inv!37670 a!2804)))

(declare-fun b!1511766 () Bool)

(declare-fun res!1031669 () Bool)

(assert (=> b!1511766 (=> (not res!1031669) (not e!843942))))

(assert (=> b!1511766 (= res!1031669 (validKeyInArray!0 (select (arr!48642 a!2804) j!70)))))

(declare-fun b!1511767 () Bool)

(assert (=> b!1511767 (= e!843946 (not (or (not (= (select (arr!48642 a!2804) j!70) (select (store (arr!48642 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48642 a!2804) index!487) (select (arr!48642 a!2804) j!70)) (not (= (select (arr!48642 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1511767 e!843943))

(declare-fun res!1031665 () Bool)

(assert (=> b!1511767 (=> (not res!1031665) (not e!843943))))

(assert (=> b!1511767 (= res!1031665 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50494 0))(
  ( (Unit!50495) )
))
(declare-fun lt!655521 () Unit!50494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50494)

(assert (=> b!1511767 (= lt!655521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511768 () Bool)

(declare-fun res!1031668 () Bool)

(assert (=> b!1511768 (=> (not res!1031668) (not e!843946))))

(assert (=> b!1511768 (= res!1031668 (= lt!655522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48642 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48642 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100811 (store (arr!48642 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49192 a!2804)) mask!2512)))))

(declare-fun b!1511769 () Bool)

(declare-fun res!1031670 () Bool)

(assert (=> b!1511769 (=> (not res!1031670) (not e!843943))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12813)

(assert (=> b!1511769 (= res!1031670 (= (seekEntry!0 (select (arr!48642 a!2804) j!70) a!2804 mask!2512) (Found!12813 j!70)))))

(declare-fun b!1511770 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12813)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12813)

(assert (=> b!1511770 (= e!843944 (= (seekEntryOrOpen!0 (select (arr!48642 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48642 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511771 () Bool)

(declare-fun res!1031673 () Bool)

(assert (=> b!1511771 (=> (not res!1031673) (not e!843942))))

(assert (=> b!1511771 (= res!1031673 (and (= (size!49192 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49192 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49192 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128954 res!1031663) b!1511771))

(assert (= (and b!1511771 res!1031673) b!1511761))

(assert (= (and b!1511761 res!1031664) b!1511766))

(assert (= (and b!1511766 res!1031669) b!1511762))

(assert (= (and b!1511762 res!1031674) b!1511764))

(assert (= (and b!1511764 res!1031672) b!1511765))

(assert (= (and b!1511765 res!1031666) b!1511763))

(assert (= (and b!1511763 res!1031671) b!1511759))

(assert (= (and b!1511759 res!1031667) b!1511768))

(assert (= (and b!1511768 res!1031668) b!1511767))

(assert (= (and b!1511767 res!1031665) b!1511769))

(assert (= (and b!1511769 res!1031670) b!1511760))

(assert (= (and b!1511760 (not res!1031662)) b!1511770))

(declare-fun m!1394479 () Bool)

(assert (=> b!1511761 m!1394479))

(assert (=> b!1511761 m!1394479))

(declare-fun m!1394481 () Bool)

(assert (=> b!1511761 m!1394481))

(declare-fun m!1394483 () Bool)

(assert (=> b!1511769 m!1394483))

(assert (=> b!1511769 m!1394483))

(declare-fun m!1394485 () Bool)

(assert (=> b!1511769 m!1394485))

(assert (=> b!1511763 m!1394483))

(assert (=> b!1511763 m!1394483))

(declare-fun m!1394487 () Bool)

(assert (=> b!1511763 m!1394487))

(assert (=> b!1511763 m!1394487))

(assert (=> b!1511763 m!1394483))

(declare-fun m!1394489 () Bool)

(assert (=> b!1511763 m!1394489))

(declare-fun m!1394491 () Bool)

(assert (=> b!1511762 m!1394491))

(assert (=> b!1511760 m!1394483))

(declare-fun m!1394493 () Bool)

(assert (=> b!1511760 m!1394493))

(declare-fun m!1394495 () Bool)

(assert (=> b!1511760 m!1394495))

(declare-fun m!1394497 () Bool)

(assert (=> b!1511760 m!1394497))

(assert (=> b!1511759 m!1394483))

(assert (=> b!1511759 m!1394483))

(declare-fun m!1394499 () Bool)

(assert (=> b!1511759 m!1394499))

(declare-fun m!1394501 () Bool)

(assert (=> b!1511764 m!1394501))

(assert (=> b!1511766 m!1394483))

(assert (=> b!1511766 m!1394483))

(declare-fun m!1394503 () Bool)

(assert (=> b!1511766 m!1394503))

(assert (=> b!1511768 m!1394493))

(assert (=> b!1511768 m!1394495))

(assert (=> b!1511768 m!1394495))

(declare-fun m!1394505 () Bool)

(assert (=> b!1511768 m!1394505))

(assert (=> b!1511768 m!1394505))

(assert (=> b!1511768 m!1394495))

(declare-fun m!1394507 () Bool)

(assert (=> b!1511768 m!1394507))

(declare-fun m!1394509 () Bool)

(assert (=> start!128954 m!1394509))

(declare-fun m!1394511 () Bool)

(assert (=> start!128954 m!1394511))

(assert (=> b!1511767 m!1394483))

(declare-fun m!1394513 () Bool)

(assert (=> b!1511767 m!1394513))

(assert (=> b!1511767 m!1394493))

(assert (=> b!1511767 m!1394497))

(assert (=> b!1511767 m!1394495))

(declare-fun m!1394515 () Bool)

(assert (=> b!1511767 m!1394515))

(assert (=> b!1511770 m!1394483))

(assert (=> b!1511770 m!1394483))

(declare-fun m!1394517 () Bool)

(assert (=> b!1511770 m!1394517))

(assert (=> b!1511770 m!1394483))

(declare-fun m!1394519 () Bool)

(assert (=> b!1511770 m!1394519))

(check-sat (not b!1511761) (not b!1511764) (not start!128954) (not b!1511769) (not b!1511770) (not b!1511763) (not b!1511759) (not b!1511768) (not b!1511766) (not b!1511767) (not b!1511762))
(check-sat)
