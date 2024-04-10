; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128912 () Bool)

(assert start!128912)

(declare-fun res!1030941 () Bool)

(declare-fun e!843679 () Bool)

(assert (=> start!128912 (=> (not res!1030941) (not e!843679))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128912 (= res!1030941 (validMask!0 mask!2512))))

(assert (=> start!128912 e!843679))

(assert (=> start!128912 true))

(declare-datatypes ((array!100768 0))(
  ( (array!100769 (arr!48621 (Array (_ BitVec 32) (_ BitVec 64))) (size!49171 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100768)

(declare-fun array_inv!37649 (array!100768) Bool)

(assert (=> start!128912 (array_inv!37649 a!2804)))

(declare-fun b!1511038 () Bool)

(declare-fun res!1030948 () Bool)

(assert (=> b!1511038 (=> (not res!1030948) (not e!843679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100768 (_ BitVec 32)) Bool)

(assert (=> b!1511038 (= res!1030948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511039 () Bool)

(declare-fun res!1030943 () Bool)

(declare-fun e!843678 () Bool)

(assert (=> b!1511039 (=> (not res!1030943) (not e!843678))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12792 0))(
  ( (MissingZero!12792 (index!53563 (_ BitVec 32))) (Found!12792 (index!53564 (_ BitVec 32))) (Intermediate!12792 (undefined!13604 Bool) (index!53565 (_ BitVec 32)) (x!135302 (_ BitVec 32))) (Undefined!12792) (MissingVacant!12792 (index!53566 (_ BitVec 32))) )
))
(declare-fun lt!655332 () SeekEntryResult!12792)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511039 (= res!1030943 (= lt!655332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48621 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48621 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100769 (store (arr!48621 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49171 a!2804)) mask!2512)))))

(declare-fun b!1511040 () Bool)

(declare-fun e!843676 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12792)

(assert (=> b!1511040 (= e!843676 (= (seekEntry!0 (select (arr!48621 a!2804) j!70) a!2804 mask!2512) (Found!12792 j!70)))))

(declare-fun b!1511041 () Bool)

(declare-fun res!1030944 () Bool)

(assert (=> b!1511041 (=> (not res!1030944) (not e!843679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511041 (= res!1030944 (validKeyInArray!0 (select (arr!48621 a!2804) j!70)))))

(declare-fun b!1511042 () Bool)

(declare-fun res!1030942 () Bool)

(assert (=> b!1511042 (=> (not res!1030942) (not e!843679))))

(declare-datatypes ((List!35104 0))(
  ( (Nil!35101) (Cons!35100 (h!36512 (_ BitVec 64)) (t!49798 List!35104)) )
))
(declare-fun arrayNoDuplicates!0 (array!100768 (_ BitVec 32) List!35104) Bool)

(assert (=> b!1511042 (= res!1030942 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35101))))

(declare-fun b!1511043 () Bool)

(assert (=> b!1511043 (= e!843678 (not true))))

(assert (=> b!1511043 e!843676))

(declare-fun res!1030950 () Bool)

(assert (=> b!1511043 (=> (not res!1030950) (not e!843676))))

(assert (=> b!1511043 (= res!1030950 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50452 0))(
  ( (Unit!50453) )
))
(declare-fun lt!655331 () Unit!50452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50452)

(assert (=> b!1511043 (= lt!655331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511044 () Bool)

(declare-fun res!1030949 () Bool)

(assert (=> b!1511044 (=> (not res!1030949) (not e!843679))))

(assert (=> b!1511044 (= res!1030949 (and (= (size!49171 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49171 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49171 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511045 () Bool)

(declare-fun res!1030947 () Bool)

(assert (=> b!1511045 (=> (not res!1030947) (not e!843679))))

(assert (=> b!1511045 (= res!1030947 (validKeyInArray!0 (select (arr!48621 a!2804) i!961)))))

(declare-fun b!1511046 () Bool)

(assert (=> b!1511046 (= e!843679 e!843678)))

(declare-fun res!1030951 () Bool)

(assert (=> b!1511046 (=> (not res!1030951) (not e!843678))))

(declare-fun lt!655333 () SeekEntryResult!12792)

(assert (=> b!1511046 (= res!1030951 (= lt!655332 lt!655333))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511046 (= lt!655333 (Intermediate!12792 false resIndex!21 resX!21))))

(assert (=> b!1511046 (= lt!655332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48621 a!2804) j!70) mask!2512) (select (arr!48621 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511047 () Bool)

(declare-fun res!1030946 () Bool)

(assert (=> b!1511047 (=> (not res!1030946) (not e!843679))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1511047 (= res!1030946 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49171 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49171 a!2804))))))

(declare-fun b!1511048 () Bool)

(declare-fun res!1030945 () Bool)

(assert (=> b!1511048 (=> (not res!1030945) (not e!843678))))

(assert (=> b!1511048 (= res!1030945 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48621 a!2804) j!70) a!2804 mask!2512) lt!655333))))

(assert (= (and start!128912 res!1030941) b!1511044))

(assert (= (and b!1511044 res!1030949) b!1511045))

(assert (= (and b!1511045 res!1030947) b!1511041))

(assert (= (and b!1511041 res!1030944) b!1511038))

(assert (= (and b!1511038 res!1030948) b!1511042))

(assert (= (and b!1511042 res!1030942) b!1511047))

(assert (= (and b!1511047 res!1030946) b!1511046))

(assert (= (and b!1511046 res!1030951) b!1511048))

(assert (= (and b!1511048 res!1030945) b!1511039))

(assert (= (and b!1511039 res!1030943) b!1511043))

(assert (= (and b!1511043 res!1030950) b!1511040))

(declare-fun m!1393693 () Bool)

(assert (=> b!1511048 m!1393693))

(assert (=> b!1511048 m!1393693))

(declare-fun m!1393695 () Bool)

(assert (=> b!1511048 m!1393695))

(declare-fun m!1393697 () Bool)

(assert (=> start!128912 m!1393697))

(declare-fun m!1393699 () Bool)

(assert (=> start!128912 m!1393699))

(declare-fun m!1393701 () Bool)

(assert (=> b!1511045 m!1393701))

(assert (=> b!1511045 m!1393701))

(declare-fun m!1393703 () Bool)

(assert (=> b!1511045 m!1393703))

(assert (=> b!1511040 m!1393693))

(assert (=> b!1511040 m!1393693))

(declare-fun m!1393705 () Bool)

(assert (=> b!1511040 m!1393705))

(declare-fun m!1393707 () Bool)

(assert (=> b!1511039 m!1393707))

(declare-fun m!1393709 () Bool)

(assert (=> b!1511039 m!1393709))

(assert (=> b!1511039 m!1393709))

(declare-fun m!1393711 () Bool)

(assert (=> b!1511039 m!1393711))

(assert (=> b!1511039 m!1393711))

(assert (=> b!1511039 m!1393709))

(declare-fun m!1393713 () Bool)

(assert (=> b!1511039 m!1393713))

(declare-fun m!1393715 () Bool)

(assert (=> b!1511043 m!1393715))

(declare-fun m!1393717 () Bool)

(assert (=> b!1511043 m!1393717))

(assert (=> b!1511041 m!1393693))

(assert (=> b!1511041 m!1393693))

(declare-fun m!1393719 () Bool)

(assert (=> b!1511041 m!1393719))

(assert (=> b!1511046 m!1393693))

(assert (=> b!1511046 m!1393693))

(declare-fun m!1393721 () Bool)

(assert (=> b!1511046 m!1393721))

(assert (=> b!1511046 m!1393721))

(assert (=> b!1511046 m!1393693))

(declare-fun m!1393723 () Bool)

(assert (=> b!1511046 m!1393723))

(declare-fun m!1393725 () Bool)

(assert (=> b!1511042 m!1393725))

(declare-fun m!1393727 () Bool)

(assert (=> b!1511038 m!1393727))

(check-sat (not b!1511039) (not b!1511045) (not b!1511043) (not b!1511042) (not b!1511040) (not b!1511041) (not b!1511048) (not b!1511038) (not start!128912) (not b!1511046))
(check-sat)
