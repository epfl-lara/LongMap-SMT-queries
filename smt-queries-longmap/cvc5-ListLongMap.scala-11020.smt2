; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128952 () Bool)

(assert start!128952)

(declare-fun b!1511720 () Bool)

(declare-fun res!1031635 () Bool)

(declare-fun e!843931 () Bool)

(assert (=> b!1511720 (=> (not res!1031635) (not e!843931))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100808 0))(
  ( (array!100809 (arr!48641 (Array (_ BitVec 32) (_ BitVec 64))) (size!49191 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100808)

(assert (=> b!1511720 (= res!1031635 (and (= (size!49191 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49191 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49191 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511721 () Bool)

(declare-fun res!1031634 () Bool)

(assert (=> b!1511721 (=> (not res!1031634) (not e!843931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511721 (= res!1031634 (validKeyInArray!0 (select (arr!48641 a!2804) i!961)))))

(declare-fun b!1511722 () Bool)

(declare-fun res!1031632 () Bool)

(assert (=> b!1511722 (=> (not res!1031632) (not e!843931))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511722 (= res!1031632 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49191 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49191 a!2804))))))

(declare-fun e!843930 () Bool)

(declare-fun b!1511723 () Bool)

(declare-datatypes ((SeekEntryResult!12812 0))(
  ( (MissingZero!12812 (index!53643 (_ BitVec 32))) (Found!12812 (index!53644 (_ BitVec 32))) (Intermediate!12812 (undefined!13624 Bool) (index!53645 (_ BitVec 32)) (x!135378 (_ BitVec 32))) (Undefined!12812) (MissingVacant!12812 (index!53646 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100808 (_ BitVec 32)) SeekEntryResult!12812)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100808 (_ BitVec 32)) SeekEntryResult!12812)

(assert (=> b!1511723 (= e!843930 (= (seekEntryOrOpen!0 (select (arr!48641 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48641 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511724 () Bool)

(declare-fun res!1031633 () Bool)

(declare-fun e!843927 () Bool)

(assert (=> b!1511724 (=> (not res!1031633) (not e!843927))))

(declare-fun lt!655511 () SeekEntryResult!12812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100808 (_ BitVec 32)) SeekEntryResult!12812)

(assert (=> b!1511724 (= res!1031633 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48641 a!2804) j!70) a!2804 mask!2512) lt!655511))))

(declare-fun b!1511725 () Bool)

(assert (=> b!1511725 (= e!843927 (not (or (not (= (select (arr!48641 a!2804) j!70) (select (store (arr!48641 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48641 a!2804) index!487) (select (arr!48641 a!2804) j!70)) (not (= (select (arr!48641 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843928 () Bool)

(assert (=> b!1511725 e!843928))

(declare-fun res!1031626 () Bool)

(assert (=> b!1511725 (=> (not res!1031626) (not e!843928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100808 (_ BitVec 32)) Bool)

(assert (=> b!1511725 (= res!1031626 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50492 0))(
  ( (Unit!50493) )
))
(declare-fun lt!655513 () Unit!50492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50492)

(assert (=> b!1511725 (= lt!655513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511726 () Bool)

(assert (=> b!1511726 (= e!843931 e!843927)))

(declare-fun res!1031631 () Bool)

(assert (=> b!1511726 (=> (not res!1031631) (not e!843927))))

(declare-fun lt!655512 () SeekEntryResult!12812)

(assert (=> b!1511726 (= res!1031631 (= lt!655512 lt!655511))))

(assert (=> b!1511726 (= lt!655511 (Intermediate!12812 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511726 (= lt!655512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48641 a!2804) j!70) mask!2512) (select (arr!48641 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511727 () Bool)

(declare-fun res!1031629 () Bool)

(assert (=> b!1511727 (=> (not res!1031629) (not e!843928))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100808 (_ BitVec 32)) SeekEntryResult!12812)

(assert (=> b!1511727 (= res!1031629 (= (seekEntry!0 (select (arr!48641 a!2804) j!70) a!2804 mask!2512) (Found!12812 j!70)))))

(declare-fun b!1511729 () Bool)

(assert (=> b!1511729 (= e!843928 e!843930)))

(declare-fun res!1031630 () Bool)

(assert (=> b!1511729 (=> res!1031630 e!843930)))

(assert (=> b!1511729 (= res!1031630 (or (not (= (select (arr!48641 a!2804) j!70) (select (store (arr!48641 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48641 a!2804) index!487) (select (arr!48641 a!2804) j!70)) (not (= (select (arr!48641 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511730 () Bool)

(declare-fun res!1031627 () Bool)

(assert (=> b!1511730 (=> (not res!1031627) (not e!843931))))

(declare-datatypes ((List!35124 0))(
  ( (Nil!35121) (Cons!35120 (h!36532 (_ BitVec 64)) (t!49818 List!35124)) )
))
(declare-fun arrayNoDuplicates!0 (array!100808 (_ BitVec 32) List!35124) Bool)

(assert (=> b!1511730 (= res!1031627 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35121))))

(declare-fun b!1511731 () Bool)

(declare-fun res!1031628 () Bool)

(assert (=> b!1511731 (=> (not res!1031628) (not e!843931))))

(assert (=> b!1511731 (= res!1031628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511732 () Bool)

(declare-fun res!1031623 () Bool)

(assert (=> b!1511732 (=> (not res!1031623) (not e!843927))))

(assert (=> b!1511732 (= res!1031623 (= lt!655512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48641 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48641 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100809 (store (arr!48641 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49191 a!2804)) mask!2512)))))

(declare-fun res!1031625 () Bool)

(assert (=> start!128952 (=> (not res!1031625) (not e!843931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128952 (= res!1031625 (validMask!0 mask!2512))))

(assert (=> start!128952 e!843931))

(assert (=> start!128952 true))

(declare-fun array_inv!37669 (array!100808) Bool)

(assert (=> start!128952 (array_inv!37669 a!2804)))

(declare-fun b!1511728 () Bool)

(declare-fun res!1031624 () Bool)

(assert (=> b!1511728 (=> (not res!1031624) (not e!843931))))

(assert (=> b!1511728 (= res!1031624 (validKeyInArray!0 (select (arr!48641 a!2804) j!70)))))

(assert (= (and start!128952 res!1031625) b!1511720))

(assert (= (and b!1511720 res!1031635) b!1511721))

(assert (= (and b!1511721 res!1031634) b!1511728))

(assert (= (and b!1511728 res!1031624) b!1511731))

(assert (= (and b!1511731 res!1031628) b!1511730))

(assert (= (and b!1511730 res!1031627) b!1511722))

(assert (= (and b!1511722 res!1031632) b!1511726))

(assert (= (and b!1511726 res!1031631) b!1511724))

(assert (= (and b!1511724 res!1031633) b!1511732))

(assert (= (and b!1511732 res!1031623) b!1511725))

(assert (= (and b!1511725 res!1031626) b!1511727))

(assert (= (and b!1511727 res!1031629) b!1511729))

(assert (= (and b!1511729 (not res!1031630)) b!1511723))

(declare-fun m!1394437 () Bool)

(assert (=> b!1511728 m!1394437))

(assert (=> b!1511728 m!1394437))

(declare-fun m!1394439 () Bool)

(assert (=> b!1511728 m!1394439))

(assert (=> b!1511726 m!1394437))

(assert (=> b!1511726 m!1394437))

(declare-fun m!1394441 () Bool)

(assert (=> b!1511726 m!1394441))

(assert (=> b!1511726 m!1394441))

(assert (=> b!1511726 m!1394437))

(declare-fun m!1394443 () Bool)

(assert (=> b!1511726 m!1394443))

(assert (=> b!1511729 m!1394437))

(declare-fun m!1394445 () Bool)

(assert (=> b!1511729 m!1394445))

(declare-fun m!1394447 () Bool)

(assert (=> b!1511729 m!1394447))

(declare-fun m!1394449 () Bool)

(assert (=> b!1511729 m!1394449))

(declare-fun m!1394451 () Bool)

(assert (=> b!1511731 m!1394451))

(assert (=> b!1511732 m!1394445))

(assert (=> b!1511732 m!1394447))

(assert (=> b!1511732 m!1394447))

(declare-fun m!1394453 () Bool)

(assert (=> b!1511732 m!1394453))

(assert (=> b!1511732 m!1394453))

(assert (=> b!1511732 m!1394447))

(declare-fun m!1394455 () Bool)

(assert (=> b!1511732 m!1394455))

(assert (=> b!1511723 m!1394437))

(assert (=> b!1511723 m!1394437))

(declare-fun m!1394457 () Bool)

(assert (=> b!1511723 m!1394457))

(assert (=> b!1511723 m!1394437))

(declare-fun m!1394459 () Bool)

(assert (=> b!1511723 m!1394459))

(declare-fun m!1394461 () Bool)

(assert (=> b!1511730 m!1394461))

(assert (=> b!1511724 m!1394437))

(assert (=> b!1511724 m!1394437))

(declare-fun m!1394463 () Bool)

(assert (=> b!1511724 m!1394463))

(declare-fun m!1394465 () Bool)

(assert (=> b!1511721 m!1394465))

(assert (=> b!1511721 m!1394465))

(declare-fun m!1394467 () Bool)

(assert (=> b!1511721 m!1394467))

(assert (=> b!1511727 m!1394437))

(assert (=> b!1511727 m!1394437))

(declare-fun m!1394469 () Bool)

(assert (=> b!1511727 m!1394469))

(declare-fun m!1394471 () Bool)

(assert (=> start!128952 m!1394471))

(declare-fun m!1394473 () Bool)

(assert (=> start!128952 m!1394473))

(assert (=> b!1511725 m!1394437))

(declare-fun m!1394475 () Bool)

(assert (=> b!1511725 m!1394475))

(assert (=> b!1511725 m!1394445))

(assert (=> b!1511725 m!1394449))

(assert (=> b!1511725 m!1394447))

(declare-fun m!1394477 () Bool)

(assert (=> b!1511725 m!1394477))

(push 1)

