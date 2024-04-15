; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129996 () Bool)

(assert start!129996)

(declare-fun b!1525539 () Bool)

(declare-fun res!1043767 () Bool)

(declare-fun e!850340 () Bool)

(assert (=> b!1525539 (=> (not res!1043767) (not e!850340))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101407 0))(
  ( (array!101408 (arr!48931 (Array (_ BitVec 32) (_ BitVec 64))) (size!49483 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101407)

(assert (=> b!1525539 (= res!1043767 (and (= (size!49483 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49483 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49483 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525540 () Bool)

(declare-fun e!850342 () Bool)

(assert (=> b!1525540 (= e!850340 e!850342)))

(declare-fun res!1043759 () Bool)

(assert (=> b!1525540 (=> (not res!1043759) (not e!850342))))

(declare-datatypes ((SeekEntryResult!13119 0))(
  ( (MissingZero!13119 (index!54871 (_ BitVec 32))) (Found!13119 (index!54872 (_ BitVec 32))) (Intermediate!13119 (undefined!13931 Bool) (index!54873 (_ BitVec 32)) (x!136576 (_ BitVec 32))) (Undefined!13119) (MissingVacant!13119 (index!54874 (_ BitVec 32))) )
))
(declare-fun lt!660578 () SeekEntryResult!13119)

(declare-fun lt!660581 () SeekEntryResult!13119)

(assert (=> b!1525540 (= res!1043759 (= lt!660578 lt!660581))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525540 (= lt!660581 (Intermediate!13119 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525540 (= lt!660578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525541 () Bool)

(declare-fun res!1043770 () Bool)

(assert (=> b!1525541 (=> (not res!1043770) (not e!850340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525541 (= res!1043770 (validKeyInArray!0 (select (arr!48931 a!2804) i!961)))))

(declare-fun b!1525542 () Bool)

(declare-fun e!850341 () Bool)

(assert (=> b!1525542 (= e!850342 e!850341)))

(declare-fun res!1043766 () Bool)

(assert (=> b!1525542 (=> (not res!1043766) (not e!850341))))

(declare-fun lt!660579 () array!101407)

(declare-fun lt!660580 () (_ BitVec 64))

(assert (=> b!1525542 (= res!1043766 (= lt!660578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660580 mask!2512) lt!660580 lt!660579 mask!2512)))))

(assert (=> b!1525542 (= lt!660580 (select (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525542 (= lt!660579 (array!101408 (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49483 a!2804)))))

(declare-fun b!1525543 () Bool)

(declare-fun res!1043763 () Bool)

(assert (=> b!1525543 (=> (not res!1043763) (not e!850340))))

(assert (=> b!1525543 (= res!1043763 (validKeyInArray!0 (select (arr!48931 a!2804) j!70)))))

(declare-fun b!1525544 () Bool)

(declare-fun res!1043758 () Bool)

(declare-fun e!850344 () Bool)

(assert (=> b!1525544 (=> (not res!1043758) (not e!850344))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13119)

(assert (=> b!1525544 (= res!1043758 (= (seekEntry!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) (Found!13119 j!70)))))

(declare-fun b!1525545 () Bool)

(declare-fun res!1043768 () Bool)

(assert (=> b!1525545 (=> (not res!1043768) (not e!850340))))

(declare-datatypes ((List!35492 0))(
  ( (Nil!35489) (Cons!35488 (h!36922 (_ BitVec 64)) (t!50178 List!35492)) )
))
(declare-fun arrayNoDuplicates!0 (array!101407 (_ BitVec 32) List!35492) Bool)

(assert (=> b!1525545 (= res!1043768 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35489))))

(declare-fun b!1525547 () Bool)

(declare-fun res!1043761 () Bool)

(assert (=> b!1525547 (=> (not res!1043761) (not e!850340))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525547 (= res!1043761 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49483 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49483 a!2804))))))

(declare-fun b!1525548 () Bool)

(declare-fun res!1043769 () Bool)

(assert (=> b!1525548 (=> (not res!1043769) (not e!850342))))

(assert (=> b!1525548 (= res!1043769 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660581))))

(declare-fun b!1525549 () Bool)

(declare-fun e!850339 () Bool)

(declare-fun e!850345 () Bool)

(assert (=> b!1525549 (= e!850339 e!850345)))

(declare-fun res!1043764 () Bool)

(assert (=> b!1525549 (=> (not res!1043764) (not e!850345))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13119)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13119)

(assert (=> b!1525549 (= res!1043764 (= (seekEntryOrOpen!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48931 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525550 () Bool)

(assert (=> b!1525550 (= e!850345 (= (seekEntryOrOpen!0 lt!660580 lt!660579 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660580 lt!660579 mask!2512)))))

(declare-fun b!1525551 () Bool)

(assert (=> b!1525551 (= e!850344 e!850339)))

(declare-fun res!1043757 () Bool)

(assert (=> b!1525551 (=> res!1043757 e!850339)))

(assert (=> b!1525551 (= res!1043757 (or (not (= (select (arr!48931 a!2804) j!70) lt!660580)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48931 a!2804) index!487) (select (arr!48931 a!2804) j!70)) (not (= (select (arr!48931 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525552 () Bool)

(declare-fun res!1043760 () Bool)

(assert (=> b!1525552 (=> (not res!1043760) (not e!850340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101407 (_ BitVec 32)) Bool)

(assert (=> b!1525552 (= res!1043760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525546 () Bool)

(assert (=> b!1525546 (= e!850341 (not true))))

(assert (=> b!1525546 e!850344))

(declare-fun res!1043765 () Bool)

(assert (=> b!1525546 (=> (not res!1043765) (not e!850344))))

(assert (=> b!1525546 (= res!1043765 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50861 0))(
  ( (Unit!50862) )
))
(declare-fun lt!660582 () Unit!50861)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50861)

(assert (=> b!1525546 (= lt!660582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1043762 () Bool)

(assert (=> start!129996 (=> (not res!1043762) (not e!850340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129996 (= res!1043762 (validMask!0 mask!2512))))

(assert (=> start!129996 e!850340))

(assert (=> start!129996 true))

(declare-fun array_inv!38164 (array!101407) Bool)

(assert (=> start!129996 (array_inv!38164 a!2804)))

(assert (= (and start!129996 res!1043762) b!1525539))

(assert (= (and b!1525539 res!1043767) b!1525541))

(assert (= (and b!1525541 res!1043770) b!1525543))

(assert (= (and b!1525543 res!1043763) b!1525552))

(assert (= (and b!1525552 res!1043760) b!1525545))

(assert (= (and b!1525545 res!1043768) b!1525547))

(assert (= (and b!1525547 res!1043761) b!1525540))

(assert (= (and b!1525540 res!1043759) b!1525548))

(assert (= (and b!1525548 res!1043769) b!1525542))

(assert (= (and b!1525542 res!1043766) b!1525546))

(assert (= (and b!1525546 res!1043765) b!1525544))

(assert (= (and b!1525544 res!1043758) b!1525551))

(assert (= (and b!1525551 (not res!1043757)) b!1525549))

(assert (= (and b!1525549 res!1043764) b!1525550))

(declare-fun m!1407707 () Bool)

(assert (=> b!1525552 m!1407707))

(declare-fun m!1407709 () Bool)

(assert (=> b!1525549 m!1407709))

(assert (=> b!1525549 m!1407709))

(declare-fun m!1407711 () Bool)

(assert (=> b!1525549 m!1407711))

(assert (=> b!1525549 m!1407709))

(declare-fun m!1407713 () Bool)

(assert (=> b!1525549 m!1407713))

(declare-fun m!1407715 () Bool)

(assert (=> b!1525545 m!1407715))

(assert (=> b!1525551 m!1407709))

(declare-fun m!1407717 () Bool)

(assert (=> b!1525551 m!1407717))

(assert (=> b!1525540 m!1407709))

(assert (=> b!1525540 m!1407709))

(declare-fun m!1407719 () Bool)

(assert (=> b!1525540 m!1407719))

(assert (=> b!1525540 m!1407719))

(assert (=> b!1525540 m!1407709))

(declare-fun m!1407721 () Bool)

(assert (=> b!1525540 m!1407721))

(declare-fun m!1407723 () Bool)

(assert (=> b!1525550 m!1407723))

(declare-fun m!1407725 () Bool)

(assert (=> b!1525550 m!1407725))

(declare-fun m!1407727 () Bool)

(assert (=> b!1525541 m!1407727))

(assert (=> b!1525541 m!1407727))

(declare-fun m!1407729 () Bool)

(assert (=> b!1525541 m!1407729))

(declare-fun m!1407731 () Bool)

(assert (=> b!1525542 m!1407731))

(assert (=> b!1525542 m!1407731))

(declare-fun m!1407733 () Bool)

(assert (=> b!1525542 m!1407733))

(declare-fun m!1407735 () Bool)

(assert (=> b!1525542 m!1407735))

(declare-fun m!1407737 () Bool)

(assert (=> b!1525542 m!1407737))

(assert (=> b!1525548 m!1407709))

(assert (=> b!1525548 m!1407709))

(declare-fun m!1407739 () Bool)

(assert (=> b!1525548 m!1407739))

(declare-fun m!1407741 () Bool)

(assert (=> start!129996 m!1407741))

(declare-fun m!1407743 () Bool)

(assert (=> start!129996 m!1407743))

(assert (=> b!1525543 m!1407709))

(assert (=> b!1525543 m!1407709))

(declare-fun m!1407745 () Bool)

(assert (=> b!1525543 m!1407745))

(declare-fun m!1407747 () Bool)

(assert (=> b!1525546 m!1407747))

(declare-fun m!1407749 () Bool)

(assert (=> b!1525546 m!1407749))

(assert (=> b!1525544 m!1407709))

(assert (=> b!1525544 m!1407709))

(declare-fun m!1407751 () Bool)

(assert (=> b!1525544 m!1407751))

(check-sat (not start!129996) (not b!1525552) (not b!1525543) (not b!1525541) (not b!1525545) (not b!1525540) (not b!1525550) (not b!1525548) (not b!1525544) (not b!1525546) (not b!1525542) (not b!1525549))
(check-sat)
