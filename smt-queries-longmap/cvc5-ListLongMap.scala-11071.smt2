; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129258 () Bool)

(assert start!129258)

(declare-fun b!1517786 () Bool)

(declare-fun e!846776 () Bool)

(declare-fun e!846773 () Bool)

(assert (=> b!1517786 (= e!846776 e!846773)))

(declare-fun res!1037694 () Bool)

(assert (=> b!1517786 (=> (not res!1037694) (not e!846773))))

(declare-datatypes ((SeekEntryResult!12965 0))(
  ( (MissingZero!12965 (index!54255 (_ BitVec 32))) (Found!12965 (index!54256 (_ BitVec 32))) (Intermediate!12965 (undefined!13777 Bool) (index!54257 (_ BitVec 32)) (x!135939 (_ BitVec 32))) (Undefined!12965) (MissingVacant!12965 (index!54258 (_ BitVec 32))) )
))
(declare-fun lt!657919 () SeekEntryResult!12965)

(declare-fun lt!657918 () SeekEntryResult!12965)

(assert (=> b!1517786 (= res!1037694 (= lt!657919 lt!657918))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517786 (= lt!657918 (Intermediate!12965 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101114 0))(
  ( (array!101115 (arr!48794 (Array (_ BitVec 32) (_ BitVec 64))) (size!49344 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101114 (_ BitVec 32)) SeekEntryResult!12965)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517786 (= lt!657919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48794 a!2804) j!70) mask!2512) (select (arr!48794 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037699 () Bool)

(assert (=> start!129258 (=> (not res!1037699) (not e!846776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129258 (= res!1037699 (validMask!0 mask!2512))))

(assert (=> start!129258 e!846776))

(assert (=> start!129258 true))

(declare-fun array_inv!37822 (array!101114) Bool)

(assert (=> start!129258 (array_inv!37822 a!2804)))

(declare-fun b!1517787 () Bool)

(declare-fun res!1037691 () Bool)

(assert (=> b!1517787 (=> (not res!1037691) (not e!846776))))

(declare-datatypes ((List!35277 0))(
  ( (Nil!35274) (Cons!35273 (h!36685 (_ BitVec 64)) (t!49971 List!35277)) )
))
(declare-fun arrayNoDuplicates!0 (array!101114 (_ BitVec 32) List!35277) Bool)

(assert (=> b!1517787 (= res!1037691 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35274))))

(declare-fun b!1517788 () Bool)

(declare-fun res!1037689 () Bool)

(assert (=> b!1517788 (=> (not res!1037689) (not e!846776))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517788 (= res!1037689 (validKeyInArray!0 (select (arr!48794 a!2804) i!961)))))

(declare-fun b!1517789 () Bool)

(declare-fun e!846775 () Bool)

(declare-fun e!846774 () Bool)

(assert (=> b!1517789 (= e!846775 e!846774)))

(declare-fun res!1037695 () Bool)

(assert (=> b!1517789 (=> res!1037695 e!846774)))

(declare-fun lt!657922 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517789 (= res!1037695 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657922 #b00000000000000000000000000000000) (bvsge lt!657922 (size!49344 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517789 (= lt!657922 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517790 () Bool)

(assert (=> b!1517790 (= e!846774 true)))

(declare-fun lt!657921 () SeekEntryResult!12965)

(assert (=> b!1517790 (= lt!657921 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657922 (select (arr!48794 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517791 () Bool)

(declare-fun res!1037692 () Bool)

(assert (=> b!1517791 (=> (not res!1037692) (not e!846776))))

(assert (=> b!1517791 (= res!1037692 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49344 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49344 a!2804))))))

(declare-fun b!1517792 () Bool)

(declare-fun res!1037700 () Bool)

(assert (=> b!1517792 (=> (not res!1037700) (not e!846773))))

(assert (=> b!1517792 (= res!1037700 (= lt!657919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48794 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48794 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101115 (store (arr!48794 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49344 a!2804)) mask!2512)))))

(declare-fun b!1517793 () Bool)

(declare-fun res!1037693 () Bool)

(assert (=> b!1517793 (=> (not res!1037693) (not e!846776))))

(assert (=> b!1517793 (= res!1037693 (and (= (size!49344 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49344 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49344 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517794 () Bool)

(declare-fun res!1037698 () Bool)

(assert (=> b!1517794 (=> (not res!1037698) (not e!846776))))

(assert (=> b!1517794 (= res!1037698 (validKeyInArray!0 (select (arr!48794 a!2804) j!70)))))

(declare-fun b!1517795 () Bool)

(declare-fun res!1037690 () Bool)

(assert (=> b!1517795 (=> (not res!1037690) (not e!846773))))

(assert (=> b!1517795 (= res!1037690 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48794 a!2804) j!70) a!2804 mask!2512) lt!657918))))

(declare-fun b!1517796 () Bool)

(declare-fun e!846777 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101114 (_ BitVec 32)) SeekEntryResult!12965)

(assert (=> b!1517796 (= e!846777 (= (seekEntry!0 (select (arr!48794 a!2804) j!70) a!2804 mask!2512) (Found!12965 j!70)))))

(declare-fun b!1517797 () Bool)

(declare-fun res!1037696 () Bool)

(assert (=> b!1517797 (=> (not res!1037696) (not e!846776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101114 (_ BitVec 32)) Bool)

(assert (=> b!1517797 (= res!1037696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517798 () Bool)

(assert (=> b!1517798 (= e!846773 (not e!846775))))

(declare-fun res!1037701 () Bool)

(assert (=> b!1517798 (=> res!1037701 e!846775)))

(assert (=> b!1517798 (= res!1037701 (or (not (= (select (arr!48794 a!2804) j!70) (select (store (arr!48794 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517798 e!846777))

(declare-fun res!1037697 () Bool)

(assert (=> b!1517798 (=> (not res!1037697) (not e!846777))))

(assert (=> b!1517798 (= res!1037697 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50798 0))(
  ( (Unit!50799) )
))
(declare-fun lt!657920 () Unit!50798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50798)

(assert (=> b!1517798 (= lt!657920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129258 res!1037699) b!1517793))

(assert (= (and b!1517793 res!1037693) b!1517788))

(assert (= (and b!1517788 res!1037689) b!1517794))

(assert (= (and b!1517794 res!1037698) b!1517797))

(assert (= (and b!1517797 res!1037696) b!1517787))

(assert (= (and b!1517787 res!1037691) b!1517791))

(assert (= (and b!1517791 res!1037692) b!1517786))

(assert (= (and b!1517786 res!1037694) b!1517795))

(assert (= (and b!1517795 res!1037690) b!1517792))

(assert (= (and b!1517792 res!1037700) b!1517798))

(assert (= (and b!1517798 res!1037697) b!1517796))

(assert (= (and b!1517798 (not res!1037701)) b!1517789))

(assert (= (and b!1517789 (not res!1037695)) b!1517790))

(declare-fun m!1401085 () Bool)

(assert (=> b!1517797 m!1401085))

(declare-fun m!1401087 () Bool)

(assert (=> start!129258 m!1401087))

(declare-fun m!1401089 () Bool)

(assert (=> start!129258 m!1401089))

(declare-fun m!1401091 () Bool)

(assert (=> b!1517786 m!1401091))

(assert (=> b!1517786 m!1401091))

(declare-fun m!1401093 () Bool)

(assert (=> b!1517786 m!1401093))

(assert (=> b!1517786 m!1401093))

(assert (=> b!1517786 m!1401091))

(declare-fun m!1401095 () Bool)

(assert (=> b!1517786 m!1401095))

(assert (=> b!1517794 m!1401091))

(assert (=> b!1517794 m!1401091))

(declare-fun m!1401097 () Bool)

(assert (=> b!1517794 m!1401097))

(assert (=> b!1517790 m!1401091))

(assert (=> b!1517790 m!1401091))

(declare-fun m!1401099 () Bool)

(assert (=> b!1517790 m!1401099))

(assert (=> b!1517798 m!1401091))

(declare-fun m!1401101 () Bool)

(assert (=> b!1517798 m!1401101))

(declare-fun m!1401103 () Bool)

(assert (=> b!1517798 m!1401103))

(declare-fun m!1401105 () Bool)

(assert (=> b!1517798 m!1401105))

(declare-fun m!1401107 () Bool)

(assert (=> b!1517798 m!1401107))

(assert (=> b!1517795 m!1401091))

(assert (=> b!1517795 m!1401091))

(declare-fun m!1401109 () Bool)

(assert (=> b!1517795 m!1401109))

(declare-fun m!1401111 () Bool)

(assert (=> b!1517789 m!1401111))

(assert (=> b!1517796 m!1401091))

(assert (=> b!1517796 m!1401091))

(declare-fun m!1401113 () Bool)

(assert (=> b!1517796 m!1401113))

(declare-fun m!1401115 () Bool)

(assert (=> b!1517788 m!1401115))

(assert (=> b!1517788 m!1401115))

(declare-fun m!1401117 () Bool)

(assert (=> b!1517788 m!1401117))

(assert (=> b!1517792 m!1401103))

(assert (=> b!1517792 m!1401105))

(assert (=> b!1517792 m!1401105))

(declare-fun m!1401119 () Bool)

(assert (=> b!1517792 m!1401119))

(assert (=> b!1517792 m!1401119))

(assert (=> b!1517792 m!1401105))

(declare-fun m!1401121 () Bool)

(assert (=> b!1517792 m!1401121))

(declare-fun m!1401123 () Bool)

(assert (=> b!1517787 m!1401123))

(push 1)

