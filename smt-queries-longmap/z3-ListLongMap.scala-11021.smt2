; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128960 () Bool)

(assert start!128960)

(declare-fun b!1511876 () Bool)

(declare-fun res!1031779 () Bool)

(declare-fun e!843991 () Bool)

(assert (=> b!1511876 (=> (not res!1031779) (not e!843991))))

(declare-datatypes ((array!100816 0))(
  ( (array!100817 (arr!48645 (Array (_ BitVec 32) (_ BitVec 64))) (size!49195 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100816)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511876 (= res!1031779 (validKeyInArray!0 (select (arr!48645 a!2804) j!70)))))

(declare-fun b!1511877 () Bool)

(declare-fun res!1031785 () Bool)

(assert (=> b!1511877 (=> (not res!1031785) (not e!843991))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511877 (= res!1031785 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49195 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49195 a!2804))))))

(declare-fun res!1031784 () Bool)

(assert (=> start!128960 (=> (not res!1031784) (not e!843991))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128960 (= res!1031784 (validMask!0 mask!2512))))

(assert (=> start!128960 e!843991))

(assert (=> start!128960 true))

(declare-fun array_inv!37673 (array!100816) Bool)

(assert (=> start!128960 (array_inv!37673 a!2804)))

(declare-fun b!1511878 () Bool)

(declare-fun res!1031790 () Bool)

(assert (=> b!1511878 (=> (not res!1031790) (not e!843991))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511878 (= res!1031790 (validKeyInArray!0 (select (arr!48645 a!2804) i!961)))))

(declare-fun b!1511879 () Bool)

(declare-fun e!843990 () Bool)

(assert (=> b!1511879 (= e!843990 (not true))))

(declare-fun e!843987 () Bool)

(assert (=> b!1511879 e!843987))

(declare-fun res!1031791 () Bool)

(assert (=> b!1511879 (=> (not res!1031791) (not e!843987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100816 (_ BitVec 32)) Bool)

(assert (=> b!1511879 (= res!1031791 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50500 0))(
  ( (Unit!50501) )
))
(declare-fun lt!655548 () Unit!50500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50500)

(assert (=> b!1511879 (= lt!655548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511880 () Bool)

(assert (=> b!1511880 (= e!843991 e!843990)))

(declare-fun res!1031781 () Bool)

(assert (=> b!1511880 (=> (not res!1031781) (not e!843990))))

(declare-datatypes ((SeekEntryResult!12816 0))(
  ( (MissingZero!12816 (index!53659 (_ BitVec 32))) (Found!12816 (index!53660 (_ BitVec 32))) (Intermediate!12816 (undefined!13628 Bool) (index!53661 (_ BitVec 32)) (x!135390 (_ BitVec 32))) (Undefined!12816) (MissingVacant!12816 (index!53662 (_ BitVec 32))) )
))
(declare-fun lt!655547 () SeekEntryResult!12816)

(declare-fun lt!655549 () SeekEntryResult!12816)

(assert (=> b!1511880 (= res!1031781 (= lt!655547 lt!655549))))

(assert (=> b!1511880 (= lt!655549 (Intermediate!12816 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511880 (= lt!655547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48645 a!2804) j!70) mask!2512) (select (arr!48645 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511881 () Bool)

(declare-fun res!1031789 () Bool)

(assert (=> b!1511881 (=> (not res!1031789) (not e!843987))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12816)

(assert (=> b!1511881 (= res!1031789 (= (seekEntry!0 (select (arr!48645 a!2804) j!70) a!2804 mask!2512) (Found!12816 j!70)))))

(declare-fun b!1511882 () Bool)

(declare-fun res!1031786 () Bool)

(assert (=> b!1511882 (=> (not res!1031786) (not e!843990))))

(assert (=> b!1511882 (= res!1031786 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48645 a!2804) j!70) a!2804 mask!2512) lt!655549))))

(declare-fun b!1511883 () Bool)

(declare-fun e!843988 () Bool)

(assert (=> b!1511883 (= e!843987 e!843988)))

(declare-fun res!1031788 () Bool)

(assert (=> b!1511883 (=> res!1031788 e!843988)))

(assert (=> b!1511883 (= res!1031788 (or (not (= (select (arr!48645 a!2804) j!70) (select (store (arr!48645 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48645 a!2804) index!487) (select (arr!48645 a!2804) j!70)) (not (= (select (arr!48645 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511884 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12816)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12816)

(assert (=> b!1511884 (= e!843988 (= (seekEntryOrOpen!0 (select (arr!48645 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48645 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511885 () Bool)

(declare-fun res!1031782 () Bool)

(assert (=> b!1511885 (=> (not res!1031782) (not e!843991))))

(assert (=> b!1511885 (= res!1031782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511886 () Bool)

(declare-fun res!1031783 () Bool)

(assert (=> b!1511886 (=> (not res!1031783) (not e!843990))))

(assert (=> b!1511886 (= res!1031783 (= lt!655547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48645 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48645 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100817 (store (arr!48645 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49195 a!2804)) mask!2512)))))

(declare-fun b!1511887 () Bool)

(declare-fun res!1031780 () Bool)

(assert (=> b!1511887 (=> (not res!1031780) (not e!843991))))

(assert (=> b!1511887 (= res!1031780 (and (= (size!49195 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49195 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49195 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511888 () Bool)

(declare-fun res!1031787 () Bool)

(assert (=> b!1511888 (=> (not res!1031787) (not e!843991))))

(declare-datatypes ((List!35128 0))(
  ( (Nil!35125) (Cons!35124 (h!36536 (_ BitVec 64)) (t!49822 List!35128)) )
))
(declare-fun arrayNoDuplicates!0 (array!100816 (_ BitVec 32) List!35128) Bool)

(assert (=> b!1511888 (= res!1031787 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35125))))

(assert (= (and start!128960 res!1031784) b!1511887))

(assert (= (and b!1511887 res!1031780) b!1511878))

(assert (= (and b!1511878 res!1031790) b!1511876))

(assert (= (and b!1511876 res!1031779) b!1511885))

(assert (= (and b!1511885 res!1031782) b!1511888))

(assert (= (and b!1511888 res!1031787) b!1511877))

(assert (= (and b!1511877 res!1031785) b!1511880))

(assert (= (and b!1511880 res!1031781) b!1511882))

(assert (= (and b!1511882 res!1031786) b!1511886))

(assert (= (and b!1511886 res!1031783) b!1511879))

(assert (= (and b!1511879 res!1031791) b!1511881))

(assert (= (and b!1511881 res!1031789) b!1511883))

(assert (= (and b!1511883 (not res!1031788)) b!1511884))

(declare-fun m!1394605 () Bool)

(assert (=> b!1511886 m!1394605))

(declare-fun m!1394607 () Bool)

(assert (=> b!1511886 m!1394607))

(assert (=> b!1511886 m!1394607))

(declare-fun m!1394609 () Bool)

(assert (=> b!1511886 m!1394609))

(assert (=> b!1511886 m!1394609))

(assert (=> b!1511886 m!1394607))

(declare-fun m!1394611 () Bool)

(assert (=> b!1511886 m!1394611))

(declare-fun m!1394613 () Bool)

(assert (=> b!1511878 m!1394613))

(assert (=> b!1511878 m!1394613))

(declare-fun m!1394615 () Bool)

(assert (=> b!1511878 m!1394615))

(declare-fun m!1394617 () Bool)

(assert (=> b!1511884 m!1394617))

(assert (=> b!1511884 m!1394617))

(declare-fun m!1394619 () Bool)

(assert (=> b!1511884 m!1394619))

(assert (=> b!1511884 m!1394617))

(declare-fun m!1394621 () Bool)

(assert (=> b!1511884 m!1394621))

(declare-fun m!1394623 () Bool)

(assert (=> b!1511888 m!1394623))

(declare-fun m!1394625 () Bool)

(assert (=> b!1511885 m!1394625))

(assert (=> b!1511883 m!1394617))

(assert (=> b!1511883 m!1394605))

(assert (=> b!1511883 m!1394607))

(declare-fun m!1394627 () Bool)

(assert (=> b!1511883 m!1394627))

(assert (=> b!1511876 m!1394617))

(assert (=> b!1511876 m!1394617))

(declare-fun m!1394629 () Bool)

(assert (=> b!1511876 m!1394629))

(assert (=> b!1511882 m!1394617))

(assert (=> b!1511882 m!1394617))

(declare-fun m!1394631 () Bool)

(assert (=> b!1511882 m!1394631))

(assert (=> b!1511880 m!1394617))

(assert (=> b!1511880 m!1394617))

(declare-fun m!1394633 () Bool)

(assert (=> b!1511880 m!1394633))

(assert (=> b!1511880 m!1394633))

(assert (=> b!1511880 m!1394617))

(declare-fun m!1394635 () Bool)

(assert (=> b!1511880 m!1394635))

(declare-fun m!1394637 () Bool)

(assert (=> start!128960 m!1394637))

(declare-fun m!1394639 () Bool)

(assert (=> start!128960 m!1394639))

(assert (=> b!1511881 m!1394617))

(assert (=> b!1511881 m!1394617))

(declare-fun m!1394641 () Bool)

(assert (=> b!1511881 m!1394641))

(declare-fun m!1394643 () Bool)

(assert (=> b!1511879 m!1394643))

(declare-fun m!1394645 () Bool)

(assert (=> b!1511879 m!1394645))

(check-sat (not b!1511888) (not start!128960) (not b!1511876) (not b!1511881) (not b!1511884) (not b!1511880) (not b!1511886) (not b!1511878) (not b!1511885) (not b!1511879) (not b!1511882))
(check-sat)
