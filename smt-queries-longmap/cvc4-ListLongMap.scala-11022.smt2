; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128968 () Bool)

(assert start!128968)

(declare-fun b!1512040 () Bool)

(declare-fun e!844056 () Bool)

(declare-fun e!844060 () Bool)

(assert (=> b!1512040 (= e!844056 (not e!844060))))

(declare-fun res!1031955 () Bool)

(assert (=> b!1512040 (=> res!1031955 e!844060)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100824 0))(
  ( (array!100825 (arr!48649 (Array (_ BitVec 32) (_ BitVec 64))) (size!49199 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100824)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512040 (= res!1031955 (or (not (= (select (arr!48649 a!2804) j!70) (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48649 a!2804) index!487) (select (arr!48649 a!2804) j!70)) (not (= (select (arr!48649 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun e!844057 () Bool)

(assert (=> b!1512040 e!844057))

(declare-fun res!1031953 () Bool)

(assert (=> b!1512040 (=> (not res!1031953) (not e!844057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100824 (_ BitVec 32)) Bool)

(assert (=> b!1512040 (= res!1031953 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50508 0))(
  ( (Unit!50509) )
))
(declare-fun lt!655584 () Unit!50508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50508)

(assert (=> b!1512040 (= lt!655584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512041 () Bool)

(declare-fun res!1031947 () Bool)

(declare-fun e!844055 () Bool)

(assert (=> b!1512041 (=> (not res!1031947) (not e!844055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512041 (= res!1031947 (validKeyInArray!0 (select (arr!48649 a!2804) i!961)))))

(declare-fun b!1512042 () Bool)

(declare-fun res!1031954 () Bool)

(assert (=> b!1512042 (=> (not res!1031954) (not e!844055))))

(assert (=> b!1512042 (= res!1031954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1031948 () Bool)

(assert (=> start!128968 (=> (not res!1031948) (not e!844055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128968 (= res!1031948 (validMask!0 mask!2512))))

(assert (=> start!128968 e!844055))

(assert (=> start!128968 true))

(declare-fun array_inv!37677 (array!100824) Bool)

(assert (=> start!128968 (array_inv!37677 a!2804)))

(declare-fun b!1512043 () Bool)

(declare-fun res!1031951 () Bool)

(assert (=> b!1512043 (=> (not res!1031951) (not e!844057))))

(declare-datatypes ((SeekEntryResult!12820 0))(
  ( (MissingZero!12820 (index!53675 (_ BitVec 32))) (Found!12820 (index!53676 (_ BitVec 32))) (Intermediate!12820 (undefined!13632 Bool) (index!53677 (_ BitVec 32)) (x!135402 (_ BitVec 32))) (Undefined!12820) (MissingVacant!12820 (index!53678 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100824 (_ BitVec 32)) SeekEntryResult!12820)

(assert (=> b!1512043 (= res!1031951 (= (seekEntry!0 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) (Found!12820 j!70)))))

(declare-fun b!1512044 () Bool)

(declare-fun e!844058 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100824 (_ BitVec 32)) SeekEntryResult!12820)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100824 (_ BitVec 32)) SeekEntryResult!12820)

(assert (=> b!1512044 (= e!844058 (= (seekEntryOrOpen!0 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48649 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512045 () Bool)

(assert (=> b!1512045 (= e!844060 (validKeyInArray!0 (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1512046 () Bool)

(declare-fun res!1031950 () Bool)

(assert (=> b!1512046 (=> (not res!1031950) (not e!844055))))

(assert (=> b!1512046 (= res!1031950 (validKeyInArray!0 (select (arr!48649 a!2804) j!70)))))

(declare-fun b!1512047 () Bool)

(declare-fun res!1031946 () Bool)

(assert (=> b!1512047 (=> (not res!1031946) (not e!844055))))

(assert (=> b!1512047 (= res!1031946 (and (= (size!49199 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49199 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49199 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512048 () Bool)

(declare-fun res!1031949 () Bool)

(assert (=> b!1512048 (=> (not res!1031949) (not e!844056))))

(declare-fun lt!655583 () SeekEntryResult!12820)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100824 (_ BitVec 32)) SeekEntryResult!12820)

(assert (=> b!1512048 (= res!1031949 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) lt!655583))))

(declare-fun b!1512049 () Bool)

(declare-fun res!1031944 () Bool)

(assert (=> b!1512049 (=> (not res!1031944) (not e!844056))))

(declare-fun lt!655585 () SeekEntryResult!12820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512049 (= res!1031944 (= lt!655585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100825 (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49199 a!2804)) mask!2512)))))

(declare-fun b!1512050 () Bool)

(declare-fun res!1031952 () Bool)

(assert (=> b!1512050 (=> (not res!1031952) (not e!844055))))

(assert (=> b!1512050 (= res!1031952 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49199 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49199 a!2804))))))

(declare-fun b!1512051 () Bool)

(declare-fun res!1031943 () Bool)

(assert (=> b!1512051 (=> (not res!1031943) (not e!844055))))

(declare-datatypes ((List!35132 0))(
  ( (Nil!35129) (Cons!35128 (h!36540 (_ BitVec 64)) (t!49826 List!35132)) )
))
(declare-fun arrayNoDuplicates!0 (array!100824 (_ BitVec 32) List!35132) Bool)

(assert (=> b!1512051 (= res!1031943 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35129))))

(declare-fun b!1512052 () Bool)

(assert (=> b!1512052 (= e!844055 e!844056)))

(declare-fun res!1031956 () Bool)

(assert (=> b!1512052 (=> (not res!1031956) (not e!844056))))

(assert (=> b!1512052 (= res!1031956 (= lt!655585 lt!655583))))

(assert (=> b!1512052 (= lt!655583 (Intermediate!12820 false resIndex!21 resX!21))))

(assert (=> b!1512052 (= lt!655585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48649 a!2804) j!70) mask!2512) (select (arr!48649 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512053 () Bool)

(assert (=> b!1512053 (= e!844057 e!844058)))

(declare-fun res!1031945 () Bool)

(assert (=> b!1512053 (=> res!1031945 e!844058)))

(assert (=> b!1512053 (= res!1031945 (or (not (= (select (arr!48649 a!2804) j!70) (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48649 a!2804) index!487) (select (arr!48649 a!2804) j!70)) (not (= (select (arr!48649 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!128968 res!1031948) b!1512047))

(assert (= (and b!1512047 res!1031946) b!1512041))

(assert (= (and b!1512041 res!1031947) b!1512046))

(assert (= (and b!1512046 res!1031950) b!1512042))

(assert (= (and b!1512042 res!1031954) b!1512051))

(assert (= (and b!1512051 res!1031943) b!1512050))

(assert (= (and b!1512050 res!1031952) b!1512052))

(assert (= (and b!1512052 res!1031956) b!1512048))

(assert (= (and b!1512048 res!1031949) b!1512049))

(assert (= (and b!1512049 res!1031944) b!1512040))

(assert (= (and b!1512040 res!1031953) b!1512043))

(assert (= (and b!1512043 res!1031951) b!1512053))

(assert (= (and b!1512053 (not res!1031945)) b!1512044))

(assert (= (and b!1512040 (not res!1031955)) b!1512045))

(declare-fun m!1394777 () Bool)

(assert (=> b!1512044 m!1394777))

(assert (=> b!1512044 m!1394777))

(declare-fun m!1394779 () Bool)

(assert (=> b!1512044 m!1394779))

(assert (=> b!1512044 m!1394777))

(declare-fun m!1394781 () Bool)

(assert (=> b!1512044 m!1394781))

(declare-fun m!1394783 () Bool)

(assert (=> b!1512045 m!1394783))

(declare-fun m!1394785 () Bool)

(assert (=> b!1512045 m!1394785))

(assert (=> b!1512045 m!1394785))

(declare-fun m!1394787 () Bool)

(assert (=> b!1512045 m!1394787))

(assert (=> b!1512040 m!1394777))

(declare-fun m!1394789 () Bool)

(assert (=> b!1512040 m!1394789))

(assert (=> b!1512040 m!1394783))

(declare-fun m!1394791 () Bool)

(assert (=> b!1512040 m!1394791))

(assert (=> b!1512040 m!1394785))

(declare-fun m!1394793 () Bool)

(assert (=> b!1512040 m!1394793))

(declare-fun m!1394795 () Bool)

(assert (=> b!1512041 m!1394795))

(assert (=> b!1512041 m!1394795))

(declare-fun m!1394797 () Bool)

(assert (=> b!1512041 m!1394797))

(assert (=> b!1512052 m!1394777))

(assert (=> b!1512052 m!1394777))

(declare-fun m!1394799 () Bool)

(assert (=> b!1512052 m!1394799))

(assert (=> b!1512052 m!1394799))

(assert (=> b!1512052 m!1394777))

(declare-fun m!1394801 () Bool)

(assert (=> b!1512052 m!1394801))

(assert (=> b!1512049 m!1394783))

(assert (=> b!1512049 m!1394785))

(assert (=> b!1512049 m!1394785))

(declare-fun m!1394803 () Bool)

(assert (=> b!1512049 m!1394803))

(assert (=> b!1512049 m!1394803))

(assert (=> b!1512049 m!1394785))

(declare-fun m!1394805 () Bool)

(assert (=> b!1512049 m!1394805))

(declare-fun m!1394807 () Bool)

(assert (=> b!1512051 m!1394807))

(assert (=> b!1512048 m!1394777))

(assert (=> b!1512048 m!1394777))

(declare-fun m!1394809 () Bool)

(assert (=> b!1512048 m!1394809))

(assert (=> b!1512043 m!1394777))

(assert (=> b!1512043 m!1394777))

(declare-fun m!1394811 () Bool)

(assert (=> b!1512043 m!1394811))

(declare-fun m!1394813 () Bool)

(assert (=> b!1512042 m!1394813))

(declare-fun m!1394815 () Bool)

(assert (=> start!128968 m!1394815))

(declare-fun m!1394817 () Bool)

(assert (=> start!128968 m!1394817))

(assert (=> b!1512046 m!1394777))

(assert (=> b!1512046 m!1394777))

(declare-fun m!1394819 () Bool)

(assert (=> b!1512046 m!1394819))

(assert (=> b!1512053 m!1394777))

(assert (=> b!1512053 m!1394783))

(assert (=> b!1512053 m!1394785))

(assert (=> b!1512053 m!1394791))

(push 1)

