; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130044 () Bool)

(assert start!130044)

(declare-fun b!1526547 () Bool)

(declare-fun e!850844 () Bool)

(assert (=> b!1526547 (= e!850844 (not true))))

(declare-fun e!850847 () Bool)

(assert (=> b!1526547 e!850847))

(declare-fun res!1044769 () Bool)

(assert (=> b!1526547 (=> (not res!1044769) (not e!850847))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101455 0))(
  ( (array!101456 (arr!48955 (Array (_ BitVec 32) (_ BitVec 64))) (size!49507 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101455)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101455 (_ BitVec 32)) Bool)

(assert (=> b!1526547 (= res!1044769 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50909 0))(
  ( (Unit!50910) )
))
(declare-fun lt!660938 () Unit!50909)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50909)

(assert (=> b!1526547 (= lt!660938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526548 () Bool)

(declare-fun res!1044778 () Bool)

(assert (=> b!1526548 (=> (not res!1044778) (not e!850847))))

(declare-datatypes ((SeekEntryResult!13143 0))(
  ( (MissingZero!13143 (index!54967 (_ BitVec 32))) (Found!13143 (index!54968 (_ BitVec 32))) (Intermediate!13143 (undefined!13955 Bool) (index!54969 (_ BitVec 32)) (x!136664 (_ BitVec 32))) (Undefined!13143) (MissingVacant!13143 (index!54970 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13143)

(assert (=> b!1526548 (= res!1044778 (= (seekEntry!0 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) (Found!13143 j!70)))))

(declare-fun b!1526549 () Bool)

(declare-fun e!850843 () Bool)

(declare-fun e!850848 () Bool)

(assert (=> b!1526549 (= e!850843 e!850848)))

(declare-fun res!1044773 () Bool)

(assert (=> b!1526549 (=> (not res!1044773) (not e!850848))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13143)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13143)

(assert (=> b!1526549 (= res!1044773 (= (seekEntryOrOpen!0 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48955 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun lt!660939 () (_ BitVec 64))

(declare-fun lt!660942 () array!101455)

(declare-fun b!1526550 () Bool)

(assert (=> b!1526550 (= e!850848 (= (seekEntryOrOpen!0 lt!660939 lt!660942 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660939 lt!660942 mask!2512)))))

(declare-fun b!1526551 () Bool)

(assert (=> b!1526551 (= e!850847 e!850843)))

(declare-fun res!1044767 () Bool)

(assert (=> b!1526551 (=> res!1044767 e!850843)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526551 (= res!1044767 (or (not (= (select (arr!48955 a!2804) j!70) lt!660939)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48955 a!2804) index!487) (select (arr!48955 a!2804) j!70)) (not (= (select (arr!48955 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526552 () Bool)

(declare-fun res!1044765 () Bool)

(declare-fun e!850846 () Bool)

(assert (=> b!1526552 (=> (not res!1044765) (not e!850846))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526552 (= res!1044765 (validKeyInArray!0 (select (arr!48955 a!2804) i!961)))))

(declare-fun res!1044774 () Bool)

(assert (=> start!130044 (=> (not res!1044774) (not e!850846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130044 (= res!1044774 (validMask!0 mask!2512))))

(assert (=> start!130044 e!850846))

(assert (=> start!130044 true))

(declare-fun array_inv!38188 (array!101455) Bool)

(assert (=> start!130044 (array_inv!38188 a!2804)))

(declare-fun b!1526553 () Bool)

(declare-fun res!1044768 () Bool)

(assert (=> b!1526553 (=> (not res!1044768) (not e!850846))))

(assert (=> b!1526553 (= res!1044768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526554 () Bool)

(declare-fun res!1044772 () Bool)

(declare-fun e!850849 () Bool)

(assert (=> b!1526554 (=> (not res!1044772) (not e!850849))))

(declare-fun lt!660940 () SeekEntryResult!13143)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13143)

(assert (=> b!1526554 (= res!1044772 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) lt!660940))))

(declare-fun b!1526555 () Bool)

(declare-fun res!1044770 () Bool)

(assert (=> b!1526555 (=> (not res!1044770) (not e!850846))))

(assert (=> b!1526555 (= res!1044770 (and (= (size!49507 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49507 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49507 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526556 () Bool)

(assert (=> b!1526556 (= e!850846 e!850849)))

(declare-fun res!1044766 () Bool)

(assert (=> b!1526556 (=> (not res!1044766) (not e!850849))))

(declare-fun lt!660941 () SeekEntryResult!13143)

(assert (=> b!1526556 (= res!1044766 (= lt!660941 lt!660940))))

(assert (=> b!1526556 (= lt!660940 (Intermediate!13143 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526556 (= lt!660941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48955 a!2804) j!70) mask!2512) (select (arr!48955 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526557 () Bool)

(declare-fun res!1044777 () Bool)

(assert (=> b!1526557 (=> (not res!1044777) (not e!850846))))

(assert (=> b!1526557 (= res!1044777 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49507 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49507 a!2804))))))

(declare-fun b!1526558 () Bool)

(declare-fun res!1044771 () Bool)

(assert (=> b!1526558 (=> (not res!1044771) (not e!850846))))

(declare-datatypes ((List!35516 0))(
  ( (Nil!35513) (Cons!35512 (h!36946 (_ BitVec 64)) (t!50202 List!35516)) )
))
(declare-fun arrayNoDuplicates!0 (array!101455 (_ BitVec 32) List!35516) Bool)

(assert (=> b!1526558 (= res!1044771 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35513))))

(declare-fun b!1526559 () Bool)

(declare-fun res!1044775 () Bool)

(assert (=> b!1526559 (=> (not res!1044775) (not e!850846))))

(assert (=> b!1526559 (= res!1044775 (validKeyInArray!0 (select (arr!48955 a!2804) j!70)))))

(declare-fun b!1526560 () Bool)

(assert (=> b!1526560 (= e!850849 e!850844)))

(declare-fun res!1044776 () Bool)

(assert (=> b!1526560 (=> (not res!1044776) (not e!850844))))

(assert (=> b!1526560 (= res!1044776 (= lt!660941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660939 mask!2512) lt!660939 lt!660942 mask!2512)))))

(assert (=> b!1526560 (= lt!660939 (select (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526560 (= lt!660942 (array!101456 (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49507 a!2804)))))

(assert (= (and start!130044 res!1044774) b!1526555))

(assert (= (and b!1526555 res!1044770) b!1526552))

(assert (= (and b!1526552 res!1044765) b!1526559))

(assert (= (and b!1526559 res!1044775) b!1526553))

(assert (= (and b!1526553 res!1044768) b!1526558))

(assert (= (and b!1526558 res!1044771) b!1526557))

(assert (= (and b!1526557 res!1044777) b!1526556))

(assert (= (and b!1526556 res!1044766) b!1526554))

(assert (= (and b!1526554 res!1044772) b!1526560))

(assert (= (and b!1526560 res!1044776) b!1526547))

(assert (= (and b!1526547 res!1044769) b!1526548))

(assert (= (and b!1526548 res!1044778) b!1526551))

(assert (= (and b!1526551 (not res!1044767)) b!1526549))

(assert (= (and b!1526549 res!1044773) b!1526550))

(declare-fun m!1408811 () Bool)

(assert (=> start!130044 m!1408811))

(declare-fun m!1408813 () Bool)

(assert (=> start!130044 m!1408813))

(declare-fun m!1408815 () Bool)

(assert (=> b!1526550 m!1408815))

(declare-fun m!1408817 () Bool)

(assert (=> b!1526550 m!1408817))

(declare-fun m!1408819 () Bool)

(assert (=> b!1526556 m!1408819))

(assert (=> b!1526556 m!1408819))

(declare-fun m!1408821 () Bool)

(assert (=> b!1526556 m!1408821))

(assert (=> b!1526556 m!1408821))

(assert (=> b!1526556 m!1408819))

(declare-fun m!1408823 () Bool)

(assert (=> b!1526556 m!1408823))

(assert (=> b!1526559 m!1408819))

(assert (=> b!1526559 m!1408819))

(declare-fun m!1408825 () Bool)

(assert (=> b!1526559 m!1408825))

(declare-fun m!1408827 () Bool)

(assert (=> b!1526547 m!1408827))

(declare-fun m!1408829 () Bool)

(assert (=> b!1526547 m!1408829))

(declare-fun m!1408831 () Bool)

(assert (=> b!1526560 m!1408831))

(assert (=> b!1526560 m!1408831))

(declare-fun m!1408833 () Bool)

(assert (=> b!1526560 m!1408833))

(declare-fun m!1408835 () Bool)

(assert (=> b!1526560 m!1408835))

(declare-fun m!1408837 () Bool)

(assert (=> b!1526560 m!1408837))

(assert (=> b!1526554 m!1408819))

(assert (=> b!1526554 m!1408819))

(declare-fun m!1408839 () Bool)

(assert (=> b!1526554 m!1408839))

(declare-fun m!1408841 () Bool)

(assert (=> b!1526552 m!1408841))

(assert (=> b!1526552 m!1408841))

(declare-fun m!1408843 () Bool)

(assert (=> b!1526552 m!1408843))

(assert (=> b!1526551 m!1408819))

(declare-fun m!1408845 () Bool)

(assert (=> b!1526551 m!1408845))

(declare-fun m!1408847 () Bool)

(assert (=> b!1526558 m!1408847))

(declare-fun m!1408849 () Bool)

(assert (=> b!1526553 m!1408849))

(assert (=> b!1526548 m!1408819))

(assert (=> b!1526548 m!1408819))

(declare-fun m!1408851 () Bool)

(assert (=> b!1526548 m!1408851))

(assert (=> b!1526549 m!1408819))

(assert (=> b!1526549 m!1408819))

(declare-fun m!1408853 () Bool)

(assert (=> b!1526549 m!1408853))

(assert (=> b!1526549 m!1408819))

(declare-fun m!1408855 () Bool)

(assert (=> b!1526549 m!1408855))

(check-sat (not b!1526554) (not b!1526558) (not start!130044) (not b!1526560) (not b!1526550) (not b!1526552) (not b!1526556) (not b!1526548) (not b!1526553) (not b!1526559) (not b!1526549) (not b!1526547))
(check-sat)
