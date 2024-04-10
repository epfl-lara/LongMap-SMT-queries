; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129746 () Bool)

(assert start!129746)

(declare-fun b!1522786 () Bool)

(declare-fun res!1041698 () Bool)

(declare-fun e!849102 () Bool)

(assert (=> b!1522786 (=> (not res!1041698) (not e!849102))))

(declare-datatypes ((array!101342 0))(
  ( (array!101343 (arr!48902 (Array (_ BitVec 32) (_ BitVec 64))) (size!49452 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101342)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522786 (= res!1041698 (validKeyInArray!0 (select (arr!48902 a!2804) i!961)))))

(declare-fun b!1522787 () Bool)

(declare-fun res!1041697 () Bool)

(declare-fun e!849103 () Bool)

(assert (=> b!1522787 (=> (not res!1041697) (not e!849103))))

(declare-datatypes ((SeekEntryResult!13067 0))(
  ( (MissingZero!13067 (index!54663 (_ BitVec 32))) (Found!13067 (index!54664 (_ BitVec 32))) (Intermediate!13067 (undefined!13879 Bool) (index!54665 (_ BitVec 32)) (x!136361 (_ BitVec 32))) (Undefined!13067) (MissingVacant!13067 (index!54666 (_ BitVec 32))) )
))
(declare-fun lt!659774 () SeekEntryResult!13067)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101342 (_ BitVec 32)) SeekEntryResult!13067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522787 (= res!1041697 (= lt!659774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48902 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48902 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101343 (store (arr!48902 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49452 a!2804)) mask!2512)))))

(declare-fun b!1522788 () Bool)

(declare-fun res!1041702 () Bool)

(assert (=> b!1522788 (=> (not res!1041702) (not e!849103))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!659775 () SeekEntryResult!13067)

(assert (=> b!1522788 (= res!1041702 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48902 a!2804) j!70) a!2804 mask!2512) lt!659775))))

(declare-fun res!1041693 () Bool)

(assert (=> start!129746 (=> (not res!1041693) (not e!849102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129746 (= res!1041693 (validMask!0 mask!2512))))

(assert (=> start!129746 e!849102))

(assert (=> start!129746 true))

(declare-fun array_inv!37930 (array!101342) Bool)

(assert (=> start!129746 (array_inv!37930 a!2804)))

(declare-fun b!1522789 () Bool)

(declare-fun res!1041700 () Bool)

(assert (=> b!1522789 (=> (not res!1041700) (not e!849102))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522789 (= res!1041700 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49452 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49452 a!2804))))))

(declare-fun b!1522790 () Bool)

(declare-fun res!1041703 () Bool)

(assert (=> b!1522790 (=> (not res!1041703) (not e!849102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101342 (_ BitVec 32)) Bool)

(assert (=> b!1522790 (= res!1041703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!849100 () Bool)

(declare-fun b!1522791 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101342 (_ BitVec 32)) SeekEntryResult!13067)

(assert (=> b!1522791 (= e!849100 (= (seekEntry!0 (select (arr!48902 a!2804) j!70) a!2804 mask!2512) (Found!13067 j!70)))))

(declare-fun b!1522792 () Bool)

(declare-fun res!1041699 () Bool)

(assert (=> b!1522792 (=> (not res!1041699) (not e!849102))))

(assert (=> b!1522792 (= res!1041699 (validKeyInArray!0 (select (arr!48902 a!2804) j!70)))))

(declare-fun b!1522793 () Bool)

(declare-fun res!1041696 () Bool)

(assert (=> b!1522793 (=> (not res!1041696) (not e!849102))))

(declare-datatypes ((List!35385 0))(
  ( (Nil!35382) (Cons!35381 (h!36805 (_ BitVec 64)) (t!50079 List!35385)) )
))
(declare-fun arrayNoDuplicates!0 (array!101342 (_ BitVec 32) List!35385) Bool)

(assert (=> b!1522793 (= res!1041696 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35382))))

(declare-fun b!1522794 () Bool)

(assert (=> b!1522794 (= e!849102 e!849103)))

(declare-fun res!1041694 () Bool)

(assert (=> b!1522794 (=> (not res!1041694) (not e!849103))))

(assert (=> b!1522794 (= res!1041694 (= lt!659774 lt!659775))))

(assert (=> b!1522794 (= lt!659775 (Intermediate!13067 false resIndex!21 resX!21))))

(assert (=> b!1522794 (= lt!659774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48902 a!2804) j!70) mask!2512) (select (arr!48902 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522795 () Bool)

(declare-fun res!1041695 () Bool)

(assert (=> b!1522795 (=> (not res!1041695) (not e!849102))))

(assert (=> b!1522795 (= res!1041695 (and (= (size!49452 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49452 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49452 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522796 () Bool)

(assert (=> b!1522796 (= e!849103 (not true))))

(assert (=> b!1522796 e!849100))

(declare-fun res!1041701 () Bool)

(assert (=> b!1522796 (=> (not res!1041701) (not e!849100))))

(assert (=> b!1522796 (= res!1041701 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50918 0))(
  ( (Unit!50919) )
))
(declare-fun lt!659776 () Unit!50918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50918)

(assert (=> b!1522796 (= lt!659776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129746 res!1041693) b!1522795))

(assert (= (and b!1522795 res!1041695) b!1522786))

(assert (= (and b!1522786 res!1041698) b!1522792))

(assert (= (and b!1522792 res!1041699) b!1522790))

(assert (= (and b!1522790 res!1041703) b!1522793))

(assert (= (and b!1522793 res!1041696) b!1522789))

(assert (= (and b!1522789 res!1041700) b!1522794))

(assert (= (and b!1522794 res!1041694) b!1522788))

(assert (= (and b!1522788 res!1041702) b!1522787))

(assert (= (and b!1522787 res!1041697) b!1522796))

(assert (= (and b!1522796 res!1041701) b!1522791))

(declare-fun m!1405845 () Bool)

(assert (=> b!1522790 m!1405845))

(declare-fun m!1405847 () Bool)

(assert (=> b!1522794 m!1405847))

(assert (=> b!1522794 m!1405847))

(declare-fun m!1405849 () Bool)

(assert (=> b!1522794 m!1405849))

(assert (=> b!1522794 m!1405849))

(assert (=> b!1522794 m!1405847))

(declare-fun m!1405851 () Bool)

(assert (=> b!1522794 m!1405851))

(assert (=> b!1522791 m!1405847))

(assert (=> b!1522791 m!1405847))

(declare-fun m!1405853 () Bool)

(assert (=> b!1522791 m!1405853))

(assert (=> b!1522788 m!1405847))

(assert (=> b!1522788 m!1405847))

(declare-fun m!1405855 () Bool)

(assert (=> b!1522788 m!1405855))

(declare-fun m!1405857 () Bool)

(assert (=> b!1522793 m!1405857))

(declare-fun m!1405859 () Bool)

(assert (=> b!1522796 m!1405859))

(declare-fun m!1405861 () Bool)

(assert (=> b!1522796 m!1405861))

(declare-fun m!1405863 () Bool)

(assert (=> start!129746 m!1405863))

(declare-fun m!1405865 () Bool)

(assert (=> start!129746 m!1405865))

(assert (=> b!1522792 m!1405847))

(assert (=> b!1522792 m!1405847))

(declare-fun m!1405867 () Bool)

(assert (=> b!1522792 m!1405867))

(declare-fun m!1405869 () Bool)

(assert (=> b!1522786 m!1405869))

(assert (=> b!1522786 m!1405869))

(declare-fun m!1405871 () Bool)

(assert (=> b!1522786 m!1405871))

(declare-fun m!1405873 () Bool)

(assert (=> b!1522787 m!1405873))

(declare-fun m!1405875 () Bool)

(assert (=> b!1522787 m!1405875))

(assert (=> b!1522787 m!1405875))

(declare-fun m!1405877 () Bool)

(assert (=> b!1522787 m!1405877))

(assert (=> b!1522787 m!1405877))

(assert (=> b!1522787 m!1405875))

(declare-fun m!1405879 () Bool)

(assert (=> b!1522787 m!1405879))

(push 1)

