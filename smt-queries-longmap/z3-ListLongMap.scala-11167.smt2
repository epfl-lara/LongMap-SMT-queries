; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130494 () Bool)

(assert start!130494)

(declare-fun b!1531770 () Bool)

(declare-fun res!1049098 () Bool)

(declare-fun e!853454 () Bool)

(assert (=> b!1531770 (=> (not res!1049098) (not e!853454))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101671 0))(
  ( (array!101672 (arr!49057 (Array (_ BitVec 32) (_ BitVec 64))) (size!49609 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101671)

(assert (=> b!1531770 (= res!1049098 (and (= (size!49609 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49609 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49609 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531771 () Bool)

(declare-fun e!853456 () Bool)

(assert (=> b!1531771 (= e!853456 true)))

(declare-fun lt!663245 () (_ BitVec 64))

(declare-fun lt!663240 () array!101671)

(declare-datatypes ((SeekEntryResult!13245 0))(
  ( (MissingZero!13245 (index!55375 (_ BitVec 32))) (Found!13245 (index!55376 (_ BitVec 32))) (Intermediate!13245 (undefined!14057 Bool) (index!55377 (_ BitVec 32)) (x!137074 (_ BitVec 32))) (Undefined!13245) (MissingVacant!13245 (index!55378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1531771 (= (seekEntryOrOpen!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663245 lt!663240 mask!2512))))

(declare-fun lt!663244 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51113 0))(
  ( (Unit!51114) )
))
(declare-fun lt!663241 () Unit!51113)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51113)

(assert (=> b!1531771 (= lt!663241 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663244 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531772 () Bool)

(declare-fun res!1049094 () Bool)

(assert (=> b!1531772 (=> (not res!1049094) (not e!853454))))

(declare-datatypes ((List!35618 0))(
  ( (Nil!35615) (Cons!35614 (h!37060 (_ BitVec 64)) (t!50304 List!35618)) )
))
(declare-fun arrayNoDuplicates!0 (array!101671 (_ BitVec 32) List!35618) Bool)

(assert (=> b!1531772 (= res!1049094 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35615))))

(declare-fun b!1531773 () Bool)

(declare-fun res!1049105 () Bool)

(assert (=> b!1531773 (=> (not res!1049105) (not e!853454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101671 (_ BitVec 32)) Bool)

(assert (=> b!1531773 (= res!1049105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531774 () Bool)

(declare-fun res!1049100 () Bool)

(assert (=> b!1531774 (=> (not res!1049100) (not e!853454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531774 (= res!1049100 (validKeyInArray!0 (select (arr!49057 a!2804) j!70)))))

(declare-fun b!1531775 () Bool)

(declare-fun res!1049107 () Bool)

(assert (=> b!1531775 (=> (not res!1049107) (not e!853454))))

(assert (=> b!1531775 (= res!1049107 (validKeyInArray!0 (select (arr!49057 a!2804) i!961)))))

(declare-fun res!1049096 () Bool)

(assert (=> start!130494 (=> (not res!1049096) (not e!853454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130494 (= res!1049096 (validMask!0 mask!2512))))

(assert (=> start!130494 e!853454))

(assert (=> start!130494 true))

(declare-fun array_inv!38290 (array!101671) Bool)

(assert (=> start!130494 (array_inv!38290 a!2804)))

(declare-fun b!1531776 () Bool)

(declare-fun e!853455 () Bool)

(assert (=> b!1531776 (= e!853455 e!853456)))

(declare-fun res!1049103 () Bool)

(assert (=> b!1531776 (=> res!1049103 e!853456)))

(assert (=> b!1531776 (= res!1049103 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663244 #b00000000000000000000000000000000) (bvsge lt!663244 (size!49609 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531776 (= lt!663244 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531777 () Bool)

(declare-fun e!853453 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1531777 (= e!853453 (= (seekEntry!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) (Found!13245 j!70)))))

(declare-fun b!1531778 () Bool)

(declare-fun e!853459 () Bool)

(assert (=> b!1531778 (= e!853454 e!853459)))

(declare-fun res!1049104 () Bool)

(assert (=> b!1531778 (=> (not res!1049104) (not e!853459))))

(declare-fun lt!663242 () SeekEntryResult!13245)

(declare-fun lt!663243 () SeekEntryResult!13245)

(assert (=> b!1531778 (= res!1049104 (= lt!663242 lt!663243))))

(assert (=> b!1531778 (= lt!663243 (Intermediate!13245 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531778 (= lt!663242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531779 () Bool)

(declare-fun e!853458 () Bool)

(assert (=> b!1531779 (= e!853458 (not e!853455))))

(declare-fun res!1049097 () Bool)

(assert (=> b!1531779 (=> res!1049097 e!853455)))

(assert (=> b!1531779 (= res!1049097 (or (not (= (select (arr!49057 a!2804) j!70) lt!663245)) (= x!534 resX!21)))))

(assert (=> b!1531779 e!853453))

(declare-fun res!1049106 () Bool)

(assert (=> b!1531779 (=> (not res!1049106) (not e!853453))))

(assert (=> b!1531779 (= res!1049106 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663246 () Unit!51113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51113)

(assert (=> b!1531779 (= lt!663246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531780 () Bool)

(declare-fun res!1049095 () Bool)

(assert (=> b!1531780 (=> (not res!1049095) (not e!853454))))

(assert (=> b!1531780 (= res!1049095 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49609 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49609 a!2804))))))

(declare-fun b!1531781 () Bool)

(assert (=> b!1531781 (= e!853459 e!853458)))

(declare-fun res!1049102 () Bool)

(assert (=> b!1531781 (=> (not res!1049102) (not e!853458))))

(assert (=> b!1531781 (= res!1049102 (= lt!663242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663245 mask!2512) lt!663245 lt!663240 mask!2512)))))

(assert (=> b!1531781 (= lt!663245 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531781 (= lt!663240 (array!101672 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49609 a!2804)))))

(declare-fun b!1531782 () Bool)

(declare-fun res!1049101 () Bool)

(assert (=> b!1531782 (=> res!1049101 e!853456)))

(assert (=> b!1531782 (= res!1049101 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663244 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!663243)))))

(declare-fun b!1531783 () Bool)

(declare-fun res!1049099 () Bool)

(assert (=> b!1531783 (=> (not res!1049099) (not e!853459))))

(assert (=> b!1531783 (= res!1049099 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!663243))))

(assert (= (and start!130494 res!1049096) b!1531770))

(assert (= (and b!1531770 res!1049098) b!1531775))

(assert (= (and b!1531775 res!1049107) b!1531774))

(assert (= (and b!1531774 res!1049100) b!1531773))

(assert (= (and b!1531773 res!1049105) b!1531772))

(assert (= (and b!1531772 res!1049094) b!1531780))

(assert (= (and b!1531780 res!1049095) b!1531778))

(assert (= (and b!1531778 res!1049104) b!1531783))

(assert (= (and b!1531783 res!1049099) b!1531781))

(assert (= (and b!1531781 res!1049102) b!1531779))

(assert (= (and b!1531779 res!1049106) b!1531777))

(assert (= (and b!1531779 (not res!1049097)) b!1531776))

(assert (= (and b!1531776 (not res!1049103)) b!1531782))

(assert (= (and b!1531782 (not res!1049101)) b!1531771))

(declare-fun m!1413881 () Bool)

(assert (=> b!1531775 m!1413881))

(assert (=> b!1531775 m!1413881))

(declare-fun m!1413883 () Bool)

(assert (=> b!1531775 m!1413883))

(declare-fun m!1413885 () Bool)

(assert (=> b!1531772 m!1413885))

(declare-fun m!1413887 () Bool)

(assert (=> b!1531771 m!1413887))

(assert (=> b!1531771 m!1413887))

(declare-fun m!1413889 () Bool)

(assert (=> b!1531771 m!1413889))

(declare-fun m!1413891 () Bool)

(assert (=> b!1531771 m!1413891))

(declare-fun m!1413893 () Bool)

(assert (=> b!1531771 m!1413893))

(assert (=> b!1531777 m!1413887))

(assert (=> b!1531777 m!1413887))

(declare-fun m!1413895 () Bool)

(assert (=> b!1531777 m!1413895))

(assert (=> b!1531778 m!1413887))

(assert (=> b!1531778 m!1413887))

(declare-fun m!1413897 () Bool)

(assert (=> b!1531778 m!1413897))

(assert (=> b!1531778 m!1413897))

(assert (=> b!1531778 m!1413887))

(declare-fun m!1413899 () Bool)

(assert (=> b!1531778 m!1413899))

(assert (=> b!1531783 m!1413887))

(assert (=> b!1531783 m!1413887))

(declare-fun m!1413901 () Bool)

(assert (=> b!1531783 m!1413901))

(declare-fun m!1413903 () Bool)

(assert (=> b!1531776 m!1413903))

(declare-fun m!1413905 () Bool)

(assert (=> b!1531773 m!1413905))

(assert (=> b!1531782 m!1413887))

(assert (=> b!1531782 m!1413887))

(declare-fun m!1413907 () Bool)

(assert (=> b!1531782 m!1413907))

(assert (=> b!1531779 m!1413887))

(declare-fun m!1413909 () Bool)

(assert (=> b!1531779 m!1413909))

(declare-fun m!1413911 () Bool)

(assert (=> b!1531779 m!1413911))

(assert (=> b!1531774 m!1413887))

(assert (=> b!1531774 m!1413887))

(declare-fun m!1413913 () Bool)

(assert (=> b!1531774 m!1413913))

(declare-fun m!1413915 () Bool)

(assert (=> b!1531781 m!1413915))

(assert (=> b!1531781 m!1413915))

(declare-fun m!1413917 () Bool)

(assert (=> b!1531781 m!1413917))

(declare-fun m!1413919 () Bool)

(assert (=> b!1531781 m!1413919))

(declare-fun m!1413921 () Bool)

(assert (=> b!1531781 m!1413921))

(declare-fun m!1413923 () Bool)

(assert (=> start!130494 m!1413923))

(declare-fun m!1413925 () Bool)

(assert (=> start!130494 m!1413925))

(check-sat (not b!1531777) (not b!1531771) (not b!1531776) (not b!1531782) (not b!1531774) (not b!1531783) (not b!1531775) (not b!1531779) (not b!1531781) (not b!1531778) (not b!1531773) (not b!1531772) (not start!130494))
(check-sat)
