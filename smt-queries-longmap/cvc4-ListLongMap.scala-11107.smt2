; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129750 () Bool)

(assert start!129750)

(declare-fun b!1522852 () Bool)

(declare-fun res!1041761 () Bool)

(declare-fun e!849127 () Bool)

(assert (=> b!1522852 (=> (not res!1041761) (not e!849127))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101346 0))(
  ( (array!101347 (arr!48904 (Array (_ BitVec 32) (_ BitVec 64))) (size!49454 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101346)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522852 (= res!1041761 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49454 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49454 a!2804))))))

(declare-fun b!1522853 () Bool)

(declare-fun res!1041768 () Bool)

(declare-fun e!849126 () Bool)

(assert (=> b!1522853 (=> (not res!1041768) (not e!849126))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13069 0))(
  ( (MissingZero!13069 (index!54671 (_ BitVec 32))) (Found!13069 (index!54672 (_ BitVec 32))) (Intermediate!13069 (undefined!13881 Bool) (index!54673 (_ BitVec 32)) (x!136363 (_ BitVec 32))) (Undefined!13069) (MissingVacant!13069 (index!54674 (_ BitVec 32))) )
))
(declare-fun lt!659792 () SeekEntryResult!13069)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101346 (_ BitVec 32)) SeekEntryResult!13069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522853 (= res!1041768 (= lt!659792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48904 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48904 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101347 (store (arr!48904 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49454 a!2804)) mask!2512)))))

(declare-fun e!849125 () Bool)

(declare-fun b!1522854 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101346 (_ BitVec 32)) SeekEntryResult!13069)

(assert (=> b!1522854 (= e!849125 (= (seekEntry!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) (Found!13069 j!70)))))

(declare-fun res!1041765 () Bool)

(assert (=> start!129750 (=> (not res!1041765) (not e!849127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129750 (= res!1041765 (validMask!0 mask!2512))))

(assert (=> start!129750 e!849127))

(assert (=> start!129750 true))

(declare-fun array_inv!37932 (array!101346) Bool)

(assert (=> start!129750 (array_inv!37932 a!2804)))

(declare-fun b!1522855 () Bool)

(declare-fun res!1041763 () Bool)

(assert (=> b!1522855 (=> (not res!1041763) (not e!849127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522855 (= res!1041763 (validKeyInArray!0 (select (arr!48904 a!2804) j!70)))))

(declare-fun b!1522856 () Bool)

(declare-fun res!1041762 () Bool)

(assert (=> b!1522856 (=> (not res!1041762) (not e!849127))))

(assert (=> b!1522856 (= res!1041762 (and (= (size!49454 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49454 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49454 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522857 () Bool)

(declare-fun res!1041759 () Bool)

(assert (=> b!1522857 (=> (not res!1041759) (not e!849127))))

(assert (=> b!1522857 (= res!1041759 (validKeyInArray!0 (select (arr!48904 a!2804) i!961)))))

(declare-fun b!1522858 () Bool)

(declare-fun res!1041764 () Bool)

(assert (=> b!1522858 (=> (not res!1041764) (not e!849126))))

(declare-fun lt!659794 () SeekEntryResult!13069)

(assert (=> b!1522858 (= res!1041764 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659794))))

(declare-fun b!1522859 () Bool)

(declare-fun res!1041766 () Bool)

(assert (=> b!1522859 (=> (not res!1041766) (not e!849127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101346 (_ BitVec 32)) Bool)

(assert (=> b!1522859 (= res!1041766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522860 () Bool)

(assert (=> b!1522860 (= e!849126 (not true))))

(assert (=> b!1522860 e!849125))

(declare-fun res!1041769 () Bool)

(assert (=> b!1522860 (=> (not res!1041769) (not e!849125))))

(assert (=> b!1522860 (= res!1041769 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50922 0))(
  ( (Unit!50923) )
))
(declare-fun lt!659793 () Unit!50922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50922)

(assert (=> b!1522860 (= lt!659793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522861 () Bool)

(declare-fun res!1041760 () Bool)

(assert (=> b!1522861 (=> (not res!1041760) (not e!849127))))

(declare-datatypes ((List!35387 0))(
  ( (Nil!35384) (Cons!35383 (h!36807 (_ BitVec 64)) (t!50081 List!35387)) )
))
(declare-fun arrayNoDuplicates!0 (array!101346 (_ BitVec 32) List!35387) Bool)

(assert (=> b!1522861 (= res!1041760 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35384))))

(declare-fun b!1522862 () Bool)

(assert (=> b!1522862 (= e!849127 e!849126)))

(declare-fun res!1041767 () Bool)

(assert (=> b!1522862 (=> (not res!1041767) (not e!849126))))

(assert (=> b!1522862 (= res!1041767 (= lt!659792 lt!659794))))

(assert (=> b!1522862 (= lt!659794 (Intermediate!13069 false resIndex!21 resX!21))))

(assert (=> b!1522862 (= lt!659792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129750 res!1041765) b!1522856))

(assert (= (and b!1522856 res!1041762) b!1522857))

(assert (= (and b!1522857 res!1041759) b!1522855))

(assert (= (and b!1522855 res!1041763) b!1522859))

(assert (= (and b!1522859 res!1041766) b!1522861))

(assert (= (and b!1522861 res!1041760) b!1522852))

(assert (= (and b!1522852 res!1041761) b!1522862))

(assert (= (and b!1522862 res!1041767) b!1522858))

(assert (= (and b!1522858 res!1041764) b!1522853))

(assert (= (and b!1522853 res!1041768) b!1522860))

(assert (= (and b!1522860 res!1041769) b!1522854))

(declare-fun m!1405917 () Bool)

(assert (=> b!1522862 m!1405917))

(assert (=> b!1522862 m!1405917))

(declare-fun m!1405919 () Bool)

(assert (=> b!1522862 m!1405919))

(assert (=> b!1522862 m!1405919))

(assert (=> b!1522862 m!1405917))

(declare-fun m!1405921 () Bool)

(assert (=> b!1522862 m!1405921))

(declare-fun m!1405923 () Bool)

(assert (=> b!1522853 m!1405923))

(declare-fun m!1405925 () Bool)

(assert (=> b!1522853 m!1405925))

(assert (=> b!1522853 m!1405925))

(declare-fun m!1405927 () Bool)

(assert (=> b!1522853 m!1405927))

(assert (=> b!1522853 m!1405927))

(assert (=> b!1522853 m!1405925))

(declare-fun m!1405929 () Bool)

(assert (=> b!1522853 m!1405929))

(declare-fun m!1405931 () Bool)

(assert (=> b!1522859 m!1405931))

(assert (=> b!1522854 m!1405917))

(assert (=> b!1522854 m!1405917))

(declare-fun m!1405933 () Bool)

(assert (=> b!1522854 m!1405933))

(declare-fun m!1405935 () Bool)

(assert (=> b!1522860 m!1405935))

(declare-fun m!1405937 () Bool)

(assert (=> b!1522860 m!1405937))

(declare-fun m!1405939 () Bool)

(assert (=> b!1522861 m!1405939))

(declare-fun m!1405941 () Bool)

(assert (=> start!129750 m!1405941))

(declare-fun m!1405943 () Bool)

(assert (=> start!129750 m!1405943))

(assert (=> b!1522858 m!1405917))

(assert (=> b!1522858 m!1405917))

(declare-fun m!1405945 () Bool)

(assert (=> b!1522858 m!1405945))

(assert (=> b!1522855 m!1405917))

(assert (=> b!1522855 m!1405917))

(declare-fun m!1405947 () Bool)

(assert (=> b!1522855 m!1405947))

(declare-fun m!1405949 () Bool)

(assert (=> b!1522857 m!1405949))

(assert (=> b!1522857 m!1405949))

(declare-fun m!1405951 () Bool)

(assert (=> b!1522857 m!1405951))

(push 1)

