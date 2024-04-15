; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128954 () Bool)

(assert start!128954)

(declare-fun res!1032555 () Bool)

(declare-fun e!844130 () Bool)

(assert (=> start!128954 (=> (not res!1032555) (not e!844130))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128954 (= res!1032555 (validMask!0 mask!2512))))

(assert (=> start!128954 e!844130))

(assert (=> start!128954 true))

(declare-datatypes ((array!100810 0))(
  ( (array!100811 (arr!48643 (Array (_ BitVec 32) (_ BitVec 64))) (size!49195 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100810)

(declare-fun array_inv!37876 (array!100810) Bool)

(assert (=> start!128954 (array_inv!37876 a!2804)))

(declare-fun b!1512442 () Bool)

(declare-fun res!1032558 () Bool)

(declare-fun e!844133 () Bool)

(assert (=> b!1512442 (=> (not res!1032558) (not e!844133))))

(declare-datatypes ((SeekEntryResult!12837 0))(
  ( (MissingZero!12837 (index!53743 (_ BitVec 32))) (Found!12837 (index!53744 (_ BitVec 32))) (Intermediate!12837 (undefined!13649 Bool) (index!53745 (_ BitVec 32)) (x!135469 (_ BitVec 32))) (Undefined!12837) (MissingVacant!12837 (index!53746 (_ BitVec 32))) )
))
(declare-fun lt!655464 () SeekEntryResult!12837)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12837)

(assert (=> b!1512442 (= res!1032558 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) lt!655464))))

(declare-fun b!1512443 () Bool)

(assert (=> b!1512443 (= e!844130 e!844133)))

(declare-fun res!1032554 () Bool)

(assert (=> b!1512443 (=> (not res!1032554) (not e!844133))))

(declare-fun lt!655462 () SeekEntryResult!12837)

(assert (=> b!1512443 (= res!1032554 (= lt!655462 lt!655464))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512443 (= lt!655464 (Intermediate!12837 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512443 (= lt!655462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48643 a!2804) j!70) mask!2512) (select (arr!48643 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512444 () Bool)

(declare-fun res!1032563 () Bool)

(declare-fun e!844129 () Bool)

(assert (=> b!1512444 (=> (not res!1032563) (not e!844129))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12837)

(assert (=> b!1512444 (= res!1032563 (= (seekEntry!0 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) (Found!12837 j!70)))))

(declare-fun b!1512445 () Bool)

(declare-fun res!1032562 () Bool)

(assert (=> b!1512445 (=> (not res!1032562) (not e!844130))))

(declare-datatypes ((List!35204 0))(
  ( (Nil!35201) (Cons!35200 (h!36613 (_ BitVec 64)) (t!49890 List!35204)) )
))
(declare-fun arrayNoDuplicates!0 (array!100810 (_ BitVec 32) List!35204) Bool)

(assert (=> b!1512445 (= res!1032562 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35201))))

(declare-fun b!1512446 () Bool)

(declare-fun e!844134 () Bool)

(assert (=> b!1512446 (= e!844133 e!844134)))

(declare-fun res!1032561 () Bool)

(assert (=> b!1512446 (=> (not res!1032561) (not e!844134))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655463 () (_ BitVec 64))

(assert (=> b!1512446 (= res!1032561 (= lt!655462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655463 mask!2512) lt!655463 (array!100811 (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49195 a!2804)) mask!2512)))))

(assert (=> b!1512446 (= lt!655463 (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512447 () Bool)

(declare-fun res!1032553 () Bool)

(assert (=> b!1512447 (=> (not res!1032553) (not e!844130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512447 (= res!1032553 (validKeyInArray!0 (select (arr!48643 a!2804) i!961)))))

(declare-fun b!1512448 () Bool)

(declare-fun res!1032556 () Bool)

(assert (=> b!1512448 (=> (not res!1032556) (not e!844130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100810 (_ BitVec 32)) Bool)

(assert (=> b!1512448 (= res!1032556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512449 () Bool)

(assert (=> b!1512449 (= e!844134 (not (or (not (= (select (arr!48643 a!2804) j!70) lt!655463)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48643 a!2804) index!487) (select (arr!48643 a!2804) j!70)) (not (= (select (arr!48643 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (= (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1512449 e!844129))

(declare-fun res!1032551 () Bool)

(assert (=> b!1512449 (=> (not res!1032551) (not e!844129))))

(assert (=> b!1512449 (= res!1032551 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50381 0))(
  ( (Unit!50382) )
))
(declare-fun lt!655461 () Unit!50381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50381)

(assert (=> b!1512449 (= lt!655461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun e!844132 () Bool)

(declare-fun b!1512450 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12837)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12837)

(assert (=> b!1512450 (= e!844132 (= (seekEntryOrOpen!0 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48643 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512451 () Bool)

(declare-fun res!1032552 () Bool)

(assert (=> b!1512451 (=> (not res!1032552) (not e!844130))))

(assert (=> b!1512451 (= res!1032552 (and (= (size!49195 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49195 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49195 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512452 () Bool)

(declare-fun res!1032557 () Bool)

(assert (=> b!1512452 (=> (not res!1032557) (not e!844130))))

(assert (=> b!1512452 (= res!1032557 (validKeyInArray!0 (select (arr!48643 a!2804) j!70)))))

(declare-fun b!1512453 () Bool)

(declare-fun res!1032559 () Bool)

(assert (=> b!1512453 (=> (not res!1032559) (not e!844130))))

(assert (=> b!1512453 (= res!1032559 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49195 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49195 a!2804))))))

(declare-fun b!1512454 () Bool)

(assert (=> b!1512454 (= e!844129 e!844132)))

(declare-fun res!1032560 () Bool)

(assert (=> b!1512454 (=> res!1032560 e!844132)))

(assert (=> b!1512454 (= res!1032560 (or (not (= (select (arr!48643 a!2804) j!70) lt!655463)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48643 a!2804) index!487) (select (arr!48643 a!2804) j!70)) (not (= (select (arr!48643 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!128954 res!1032555) b!1512451))

(assert (= (and b!1512451 res!1032552) b!1512447))

(assert (= (and b!1512447 res!1032553) b!1512452))

(assert (= (and b!1512452 res!1032557) b!1512448))

(assert (= (and b!1512448 res!1032556) b!1512445))

(assert (= (and b!1512445 res!1032562) b!1512453))

(assert (= (and b!1512453 res!1032559) b!1512443))

(assert (= (and b!1512443 res!1032554) b!1512442))

(assert (= (and b!1512442 res!1032558) b!1512446))

(assert (= (and b!1512446 res!1032561) b!1512449))

(assert (= (and b!1512449 res!1032551) b!1512444))

(assert (= (and b!1512444 res!1032563) b!1512454))

(assert (= (and b!1512454 (not res!1032560)) b!1512450))

(declare-fun m!1394669 () Bool)

(assert (=> b!1512442 m!1394669))

(assert (=> b!1512442 m!1394669))

(declare-fun m!1394671 () Bool)

(assert (=> b!1512442 m!1394671))

(declare-fun m!1394673 () Bool)

(assert (=> b!1512446 m!1394673))

(declare-fun m!1394675 () Bool)

(assert (=> b!1512446 m!1394675))

(assert (=> b!1512446 m!1394673))

(declare-fun m!1394677 () Bool)

(assert (=> b!1512446 m!1394677))

(declare-fun m!1394679 () Bool)

(assert (=> b!1512446 m!1394679))

(assert (=> b!1512450 m!1394669))

(assert (=> b!1512450 m!1394669))

(declare-fun m!1394681 () Bool)

(assert (=> b!1512450 m!1394681))

(assert (=> b!1512450 m!1394669))

(declare-fun m!1394683 () Bool)

(assert (=> b!1512450 m!1394683))

(assert (=> b!1512449 m!1394669))

(declare-fun m!1394685 () Bool)

(assert (=> b!1512449 m!1394685))

(assert (=> b!1512449 m!1394675))

(declare-fun m!1394687 () Bool)

(assert (=> b!1512449 m!1394687))

(declare-fun m!1394689 () Bool)

(assert (=> b!1512449 m!1394689))

(declare-fun m!1394691 () Bool)

(assert (=> b!1512449 m!1394691))

(assert (=> b!1512454 m!1394669))

(assert (=> b!1512454 m!1394687))

(declare-fun m!1394693 () Bool)

(assert (=> b!1512448 m!1394693))

(assert (=> b!1512443 m!1394669))

(assert (=> b!1512443 m!1394669))

(declare-fun m!1394695 () Bool)

(assert (=> b!1512443 m!1394695))

(assert (=> b!1512443 m!1394695))

(assert (=> b!1512443 m!1394669))

(declare-fun m!1394697 () Bool)

(assert (=> b!1512443 m!1394697))

(declare-fun m!1394699 () Bool)

(assert (=> start!128954 m!1394699))

(declare-fun m!1394701 () Bool)

(assert (=> start!128954 m!1394701))

(declare-fun m!1394703 () Bool)

(assert (=> b!1512445 m!1394703))

(declare-fun m!1394705 () Bool)

(assert (=> b!1512447 m!1394705))

(assert (=> b!1512447 m!1394705))

(declare-fun m!1394707 () Bool)

(assert (=> b!1512447 m!1394707))

(assert (=> b!1512452 m!1394669))

(assert (=> b!1512452 m!1394669))

(declare-fun m!1394709 () Bool)

(assert (=> b!1512452 m!1394709))

(assert (=> b!1512444 m!1394669))

(assert (=> b!1512444 m!1394669))

(declare-fun m!1394711 () Bool)

(assert (=> b!1512444 m!1394711))

(check-sat (not b!1512443) (not b!1512445) (not b!1512450) (not b!1512448) (not start!128954) (not b!1512452) (not b!1512444) (not b!1512442) (not b!1512446) (not b!1512449) (not b!1512447))
(check-sat)
