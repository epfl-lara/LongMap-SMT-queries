; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129102 () Bool)

(assert start!129102)

(declare-fun b!1514791 () Bool)

(declare-fun res!1034698 () Bool)

(declare-fun e!845344 () Bool)

(assert (=> b!1514791 (=> (not res!1034698) (not e!845344))))

(declare-datatypes ((array!100958 0))(
  ( (array!100959 (arr!48716 (Array (_ BitVec 32) (_ BitVec 64))) (size!49266 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100958)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100958 (_ BitVec 32)) Bool)

(assert (=> b!1514791 (= res!1034698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514792 () Bool)

(declare-fun res!1034699 () Bool)

(declare-fun e!845345 () Bool)

(assert (=> b!1514792 (=> (not res!1034699) (not e!845345))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12887 0))(
  ( (MissingZero!12887 (index!53943 (_ BitVec 32))) (Found!12887 (index!53944 (_ BitVec 32))) (Intermediate!12887 (undefined!13699 Bool) (index!53945 (_ BitVec 32)) (x!135653 (_ BitVec 32))) (Undefined!12887) (MissingVacant!12887 (index!53946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100958 (_ BitVec 32)) SeekEntryResult!12887)

(assert (=> b!1514792 (= res!1034699 (= (seekEntry!0 (select (arr!48716 a!2804) j!70) a!2804 mask!2512) (Found!12887 j!70)))))

(declare-fun b!1514793 () Bool)

(declare-fun e!845350 () Bool)

(declare-fun e!845347 () Bool)

(assert (=> b!1514793 (= e!845350 e!845347)))

(declare-fun res!1034705 () Bool)

(assert (=> b!1514793 (=> (not res!1034705) (not e!845347))))

(declare-fun lt!656460 () SeekEntryResult!12887)

(declare-fun lt!656463 () (_ BitVec 64))

(declare-fun lt!656464 () array!100958)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100958 (_ BitVec 32)) SeekEntryResult!12887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514793 (= res!1034705 (= lt!656460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656463 mask!2512) lt!656463 lt!656464 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514793 (= lt!656463 (select (store (arr!48716 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514793 (= lt!656464 (array!100959 (store (arr!48716 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49266 a!2804)))))

(declare-fun b!1514794 () Bool)

(assert (=> b!1514794 (= e!845344 e!845350)))

(declare-fun res!1034704 () Bool)

(assert (=> b!1514794 (=> (not res!1034704) (not e!845350))))

(declare-fun lt!656462 () SeekEntryResult!12887)

(assert (=> b!1514794 (= res!1034704 (= lt!656460 lt!656462))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514794 (= lt!656462 (Intermediate!12887 false resIndex!21 resX!21))))

(assert (=> b!1514794 (= lt!656460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48716 a!2804) j!70) mask!2512) (select (arr!48716 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1034703 () Bool)

(assert (=> start!129102 (=> (not res!1034703) (not e!845344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129102 (= res!1034703 (validMask!0 mask!2512))))

(assert (=> start!129102 e!845344))

(assert (=> start!129102 true))

(declare-fun array_inv!37744 (array!100958) Bool)

(assert (=> start!129102 (array_inv!37744 a!2804)))

(declare-fun b!1514795 () Bool)

(declare-fun res!1034695 () Bool)

(assert (=> b!1514795 (=> (not res!1034695) (not e!845350))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1514795 (= res!1034695 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48716 a!2804) j!70) a!2804 mask!2512) lt!656462))))

(declare-fun b!1514796 () Bool)

(declare-fun e!845348 () Bool)

(declare-fun e!845349 () Bool)

(assert (=> b!1514796 (= e!845348 e!845349)))

(declare-fun res!1034694 () Bool)

(assert (=> b!1514796 (=> (not res!1034694) (not e!845349))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100958 (_ BitVec 32)) SeekEntryResult!12887)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100958 (_ BitVec 32)) SeekEntryResult!12887)

(assert (=> b!1514796 (= res!1034694 (= (seekEntryOrOpen!0 (select (arr!48716 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48716 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514797 () Bool)

(declare-fun res!1034700 () Bool)

(assert (=> b!1514797 (=> (not res!1034700) (not e!845344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514797 (= res!1034700 (validKeyInArray!0 (select (arr!48716 a!2804) j!70)))))

(declare-fun b!1514798 () Bool)

(declare-fun res!1034707 () Bool)

(assert (=> b!1514798 (=> (not res!1034707) (not e!845344))))

(declare-datatypes ((List!35199 0))(
  ( (Nil!35196) (Cons!35195 (h!36607 (_ BitVec 64)) (t!49893 List!35199)) )
))
(declare-fun arrayNoDuplicates!0 (array!100958 (_ BitVec 32) List!35199) Bool)

(assert (=> b!1514798 (= res!1034707 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35196))))

(declare-fun b!1514799 () Bool)

(declare-fun res!1034701 () Bool)

(assert (=> b!1514799 (=> (not res!1034701) (not e!845344))))

(assert (=> b!1514799 (= res!1034701 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49266 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49266 a!2804))))))

(declare-fun b!1514800 () Bool)

(assert (=> b!1514800 (= e!845347 (not true))))

(assert (=> b!1514800 e!845345))

(declare-fun res!1034696 () Bool)

(assert (=> b!1514800 (=> (not res!1034696) (not e!845345))))

(assert (=> b!1514800 (= res!1034696 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50642 0))(
  ( (Unit!50643) )
))
(declare-fun lt!656461 () Unit!50642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50642)

(assert (=> b!1514800 (= lt!656461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514801 () Bool)

(assert (=> b!1514801 (= e!845345 e!845348)))

(declare-fun res!1034702 () Bool)

(assert (=> b!1514801 (=> res!1034702 e!845348)))

(assert (=> b!1514801 (= res!1034702 (or (not (= (select (arr!48716 a!2804) j!70) lt!656463)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48716 a!2804) index!487) (select (arr!48716 a!2804) j!70)) (not (= (select (arr!48716 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514802 () Bool)

(assert (=> b!1514802 (= e!845349 (= (seekEntryOrOpen!0 lt!656463 lt!656464 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656463 lt!656464 mask!2512)))))

(declare-fun b!1514803 () Bool)

(declare-fun res!1034697 () Bool)

(assert (=> b!1514803 (=> (not res!1034697) (not e!845344))))

(assert (=> b!1514803 (= res!1034697 (validKeyInArray!0 (select (arr!48716 a!2804) i!961)))))

(declare-fun b!1514804 () Bool)

(declare-fun res!1034706 () Bool)

(assert (=> b!1514804 (=> (not res!1034706) (not e!845344))))

(assert (=> b!1514804 (= res!1034706 (and (= (size!49266 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49266 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49266 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129102 res!1034703) b!1514804))

(assert (= (and b!1514804 res!1034706) b!1514803))

(assert (= (and b!1514803 res!1034697) b!1514797))

(assert (= (and b!1514797 res!1034700) b!1514791))

(assert (= (and b!1514791 res!1034698) b!1514798))

(assert (= (and b!1514798 res!1034707) b!1514799))

(assert (= (and b!1514799 res!1034701) b!1514794))

(assert (= (and b!1514794 res!1034704) b!1514795))

(assert (= (and b!1514795 res!1034695) b!1514793))

(assert (= (and b!1514793 res!1034705) b!1514800))

(assert (= (and b!1514800 res!1034696) b!1514792))

(assert (= (and b!1514792 res!1034699) b!1514801))

(assert (= (and b!1514801 (not res!1034702)) b!1514796))

(assert (= (and b!1514796 res!1034694) b!1514802))

(declare-fun m!1397779 () Bool)

(assert (=> b!1514794 m!1397779))

(assert (=> b!1514794 m!1397779))

(declare-fun m!1397781 () Bool)

(assert (=> b!1514794 m!1397781))

(assert (=> b!1514794 m!1397781))

(assert (=> b!1514794 m!1397779))

(declare-fun m!1397783 () Bool)

(assert (=> b!1514794 m!1397783))

(declare-fun m!1397785 () Bool)

(assert (=> b!1514791 m!1397785))

(declare-fun m!1397787 () Bool)

(assert (=> b!1514802 m!1397787))

(declare-fun m!1397789 () Bool)

(assert (=> b!1514802 m!1397789))

(declare-fun m!1397791 () Bool)

(assert (=> b!1514800 m!1397791))

(declare-fun m!1397793 () Bool)

(assert (=> b!1514800 m!1397793))

(assert (=> b!1514796 m!1397779))

(assert (=> b!1514796 m!1397779))

(declare-fun m!1397795 () Bool)

(assert (=> b!1514796 m!1397795))

(assert (=> b!1514796 m!1397779))

(declare-fun m!1397797 () Bool)

(assert (=> b!1514796 m!1397797))

(declare-fun m!1397799 () Bool)

(assert (=> b!1514793 m!1397799))

(assert (=> b!1514793 m!1397799))

(declare-fun m!1397801 () Bool)

(assert (=> b!1514793 m!1397801))

(declare-fun m!1397803 () Bool)

(assert (=> b!1514793 m!1397803))

(declare-fun m!1397805 () Bool)

(assert (=> b!1514793 m!1397805))

(assert (=> b!1514801 m!1397779))

(declare-fun m!1397807 () Bool)

(assert (=> b!1514801 m!1397807))

(declare-fun m!1397809 () Bool)

(assert (=> b!1514798 m!1397809))

(assert (=> b!1514795 m!1397779))

(assert (=> b!1514795 m!1397779))

(declare-fun m!1397811 () Bool)

(assert (=> b!1514795 m!1397811))

(assert (=> b!1514792 m!1397779))

(assert (=> b!1514792 m!1397779))

(declare-fun m!1397813 () Bool)

(assert (=> b!1514792 m!1397813))

(declare-fun m!1397815 () Bool)

(assert (=> b!1514803 m!1397815))

(assert (=> b!1514803 m!1397815))

(declare-fun m!1397817 () Bool)

(assert (=> b!1514803 m!1397817))

(assert (=> b!1514797 m!1397779))

(assert (=> b!1514797 m!1397779))

(declare-fun m!1397819 () Bool)

(assert (=> b!1514797 m!1397819))

(declare-fun m!1397821 () Bool)

(assert (=> start!129102 m!1397821))

(declare-fun m!1397823 () Bool)

(assert (=> start!129102 m!1397823))

(push 1)

