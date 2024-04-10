; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129054 () Bool)

(assert start!129054)

(declare-fun b!1513783 () Bool)

(declare-fun res!1033698 () Bool)

(declare-fun e!844844 () Bool)

(assert (=> b!1513783 (=> (not res!1033698) (not e!844844))))

(declare-datatypes ((array!100910 0))(
  ( (array!100911 (arr!48692 (Array (_ BitVec 32) (_ BitVec 64))) (size!49242 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100910)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513783 (= res!1033698 (validKeyInArray!0 (select (arr!48692 a!2804) j!70)))))

(declare-fun b!1513784 () Bool)

(declare-fun res!1033697 () Bool)

(assert (=> b!1513784 (=> (not res!1033697) (not e!844844))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513784 (= res!1033697 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49242 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49242 a!2804))))))

(declare-fun b!1513785 () Bool)

(declare-fun res!1033687 () Bool)

(declare-fun e!844841 () Bool)

(assert (=> b!1513785 (=> (not res!1033687) (not e!844841))))

(declare-datatypes ((SeekEntryResult!12863 0))(
  ( (MissingZero!12863 (index!53847 (_ BitVec 32))) (Found!12863 (index!53848 (_ BitVec 32))) (Intermediate!12863 (undefined!13675 Bool) (index!53849 (_ BitVec 32)) (x!135565 (_ BitVec 32))) (Undefined!12863) (MissingVacant!12863 (index!53850 (_ BitVec 32))) )
))
(declare-fun lt!656102 () SeekEntryResult!12863)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100910 (_ BitVec 32)) SeekEntryResult!12863)

(assert (=> b!1513785 (= res!1033687 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48692 a!2804) j!70) a!2804 mask!2512) lt!656102))))

(declare-fun b!1513786 () Bool)

(declare-fun e!844840 () Bool)

(declare-fun e!844842 () Bool)

(assert (=> b!1513786 (= e!844840 e!844842)))

(declare-fun res!1033688 () Bool)

(assert (=> b!1513786 (=> (not res!1033688) (not e!844842))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100910 (_ BitVec 32)) SeekEntryResult!12863)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100910 (_ BitVec 32)) SeekEntryResult!12863)

(assert (=> b!1513786 (= res!1033688 (= (seekEntryOrOpen!0 (select (arr!48692 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48692 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513787 () Bool)

(declare-fun lt!656100 () array!100910)

(declare-fun lt!656104 () (_ BitVec 64))

(assert (=> b!1513787 (= e!844842 (= (seekEntryOrOpen!0 lt!656104 lt!656100 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656104 lt!656100 mask!2512)))))

(declare-fun b!1513788 () Bool)

(declare-fun res!1033696 () Bool)

(assert (=> b!1513788 (=> (not res!1033696) (not e!844844))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513788 (= res!1033696 (validKeyInArray!0 (select (arr!48692 a!2804) i!961)))))

(declare-fun b!1513789 () Bool)

(declare-fun e!844846 () Bool)

(assert (=> b!1513789 (= e!844846 (not true))))

(declare-fun e!844845 () Bool)

(assert (=> b!1513789 e!844845))

(declare-fun res!1033689 () Bool)

(assert (=> b!1513789 (=> (not res!1033689) (not e!844845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100910 (_ BitVec 32)) Bool)

(assert (=> b!1513789 (= res!1033689 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50594 0))(
  ( (Unit!50595) )
))
(declare-fun lt!656103 () Unit!50594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50594)

(assert (=> b!1513789 (= lt!656103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513790 () Bool)

(assert (=> b!1513790 (= e!844844 e!844841)))

(declare-fun res!1033690 () Bool)

(assert (=> b!1513790 (=> (not res!1033690) (not e!844841))))

(declare-fun lt!656101 () SeekEntryResult!12863)

(assert (=> b!1513790 (= res!1033690 (= lt!656101 lt!656102))))

(assert (=> b!1513790 (= lt!656102 (Intermediate!12863 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513790 (= lt!656101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48692 a!2804) j!70) mask!2512) (select (arr!48692 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513791 () Bool)

(declare-fun res!1033699 () Bool)

(assert (=> b!1513791 (=> (not res!1033699) (not e!844844))))

(assert (=> b!1513791 (= res!1033699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513792 () Bool)

(assert (=> b!1513792 (= e!844841 e!844846)))

(declare-fun res!1033694 () Bool)

(assert (=> b!1513792 (=> (not res!1033694) (not e!844846))))

(assert (=> b!1513792 (= res!1033694 (= lt!656101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656104 mask!2512) lt!656104 lt!656100 mask!2512)))))

(assert (=> b!1513792 (= lt!656104 (select (store (arr!48692 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513792 (= lt!656100 (array!100911 (store (arr!48692 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49242 a!2804)))))

(declare-fun b!1513793 () Bool)

(declare-fun res!1033693 () Bool)

(assert (=> b!1513793 (=> (not res!1033693) (not e!844844))))

(declare-datatypes ((List!35175 0))(
  ( (Nil!35172) (Cons!35171 (h!36583 (_ BitVec 64)) (t!49869 List!35175)) )
))
(declare-fun arrayNoDuplicates!0 (array!100910 (_ BitVec 32) List!35175) Bool)

(assert (=> b!1513793 (= res!1033693 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35172))))

(declare-fun b!1513794 () Bool)

(assert (=> b!1513794 (= e!844845 e!844840)))

(declare-fun res!1033686 () Bool)

(assert (=> b!1513794 (=> res!1033686 e!844840)))

(assert (=> b!1513794 (= res!1033686 (or (not (= (select (arr!48692 a!2804) j!70) lt!656104)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48692 a!2804) index!487) (select (arr!48692 a!2804) j!70)) (not (= (select (arr!48692 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1033695 () Bool)

(assert (=> start!129054 (=> (not res!1033695) (not e!844844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129054 (= res!1033695 (validMask!0 mask!2512))))

(assert (=> start!129054 e!844844))

(assert (=> start!129054 true))

(declare-fun array_inv!37720 (array!100910) Bool)

(assert (=> start!129054 (array_inv!37720 a!2804)))

(declare-fun b!1513795 () Bool)

(declare-fun res!1033692 () Bool)

(assert (=> b!1513795 (=> (not res!1033692) (not e!844845))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100910 (_ BitVec 32)) SeekEntryResult!12863)

(assert (=> b!1513795 (= res!1033692 (= (seekEntry!0 (select (arr!48692 a!2804) j!70) a!2804 mask!2512) (Found!12863 j!70)))))

(declare-fun b!1513796 () Bool)

(declare-fun res!1033691 () Bool)

(assert (=> b!1513796 (=> (not res!1033691) (not e!844844))))

(assert (=> b!1513796 (= res!1033691 (and (= (size!49242 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49242 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49242 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129054 res!1033695) b!1513796))

(assert (= (and b!1513796 res!1033691) b!1513788))

(assert (= (and b!1513788 res!1033696) b!1513783))

(assert (= (and b!1513783 res!1033698) b!1513791))

(assert (= (and b!1513791 res!1033699) b!1513793))

(assert (= (and b!1513793 res!1033693) b!1513784))

(assert (= (and b!1513784 res!1033697) b!1513790))

(assert (= (and b!1513790 res!1033690) b!1513785))

(assert (= (and b!1513785 res!1033687) b!1513792))

(assert (= (and b!1513792 res!1033694) b!1513789))

(assert (= (and b!1513789 res!1033689) b!1513795))

(assert (= (and b!1513795 res!1033692) b!1513794))

(assert (= (and b!1513794 (not res!1033686)) b!1513786))

(assert (= (and b!1513786 res!1033688) b!1513787))

(declare-fun m!1396675 () Bool)

(assert (=> b!1513783 m!1396675))

(assert (=> b!1513783 m!1396675))

(declare-fun m!1396677 () Bool)

(assert (=> b!1513783 m!1396677))

(assert (=> b!1513794 m!1396675))

(declare-fun m!1396679 () Bool)

(assert (=> b!1513794 m!1396679))

(declare-fun m!1396681 () Bool)

(assert (=> b!1513793 m!1396681))

(declare-fun m!1396683 () Bool)

(assert (=> b!1513789 m!1396683))

(declare-fun m!1396685 () Bool)

(assert (=> b!1513789 m!1396685))

(declare-fun m!1396687 () Bool)

(assert (=> b!1513792 m!1396687))

(assert (=> b!1513792 m!1396687))

(declare-fun m!1396689 () Bool)

(assert (=> b!1513792 m!1396689))

(declare-fun m!1396691 () Bool)

(assert (=> b!1513792 m!1396691))

(declare-fun m!1396693 () Bool)

(assert (=> b!1513792 m!1396693))

(declare-fun m!1396695 () Bool)

(assert (=> start!129054 m!1396695))

(declare-fun m!1396697 () Bool)

(assert (=> start!129054 m!1396697))

(declare-fun m!1396699 () Bool)

(assert (=> b!1513788 m!1396699))

(assert (=> b!1513788 m!1396699))

(declare-fun m!1396701 () Bool)

(assert (=> b!1513788 m!1396701))

(assert (=> b!1513795 m!1396675))

(assert (=> b!1513795 m!1396675))

(declare-fun m!1396703 () Bool)

(assert (=> b!1513795 m!1396703))

(assert (=> b!1513785 m!1396675))

(assert (=> b!1513785 m!1396675))

(declare-fun m!1396705 () Bool)

(assert (=> b!1513785 m!1396705))

(declare-fun m!1396707 () Bool)

(assert (=> b!1513791 m!1396707))

(assert (=> b!1513786 m!1396675))

(assert (=> b!1513786 m!1396675))

(declare-fun m!1396709 () Bool)

(assert (=> b!1513786 m!1396709))

(assert (=> b!1513786 m!1396675))

(declare-fun m!1396711 () Bool)

(assert (=> b!1513786 m!1396711))

(declare-fun m!1396713 () Bool)

(assert (=> b!1513787 m!1396713))

(declare-fun m!1396715 () Bool)

(assert (=> b!1513787 m!1396715))

(assert (=> b!1513790 m!1396675))

(assert (=> b!1513790 m!1396675))

(declare-fun m!1396717 () Bool)

(assert (=> b!1513790 m!1396717))

(assert (=> b!1513790 m!1396717))

(assert (=> b!1513790 m!1396675))

(declare-fun m!1396719 () Bool)

(assert (=> b!1513790 m!1396719))

(push 1)

