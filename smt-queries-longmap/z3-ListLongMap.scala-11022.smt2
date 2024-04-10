; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128966 () Bool)

(assert start!128966)

(declare-fun b!1511998 () Bool)

(declare-fun res!1031905 () Bool)

(declare-fun e!844041 () Bool)

(assert (=> b!1511998 (=> (not res!1031905) (not e!844041))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100822 0))(
  ( (array!100823 (arr!48648 (Array (_ BitVec 32) (_ BitVec 64))) (size!49198 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100822)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12819 0))(
  ( (MissingZero!12819 (index!53671 (_ BitVec 32))) (Found!12819 (index!53672 (_ BitVec 32))) (Intermediate!12819 (undefined!13631 Bool) (index!53673 (_ BitVec 32)) (x!135401 (_ BitVec 32))) (Undefined!12819) (MissingVacant!12819 (index!53674 (_ BitVec 32))) )
))
(declare-fun lt!655575 () SeekEntryResult!12819)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12819)

(assert (=> b!1511998 (= res!1031905 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48648 a!2804) j!70) a!2804 mask!2512) lt!655575))))

(declare-fun e!844037 () Bool)

(declare-fun b!1511999 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12819)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12819)

(assert (=> b!1511999 (= e!844037 (= (seekEntryOrOpen!0 (select (arr!48648 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48648 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512000 () Bool)

(declare-fun res!1031909 () Bool)

(declare-fun e!844042 () Bool)

(assert (=> b!1512000 (=> (not res!1031909) (not e!844042))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512000 (= res!1031909 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49198 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49198 a!2804))))))

(declare-fun res!1031908 () Bool)

(assert (=> start!128966 (=> (not res!1031908) (not e!844042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128966 (= res!1031908 (validMask!0 mask!2512))))

(assert (=> start!128966 e!844042))

(assert (=> start!128966 true))

(declare-fun array_inv!37676 (array!100822) Bool)

(assert (=> start!128966 (array_inv!37676 a!2804)))

(declare-fun b!1512001 () Bool)

(declare-fun res!1031902 () Bool)

(assert (=> b!1512001 (=> (not res!1031902) (not e!844042))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512001 (= res!1031902 (and (= (size!49198 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49198 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49198 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512002 () Bool)

(declare-fun e!844040 () Bool)

(assert (=> b!1512002 (= e!844041 (not e!844040))))

(declare-fun res!1031911 () Bool)

(assert (=> b!1512002 (=> res!1031911 e!844040)))

(assert (=> b!1512002 (= res!1031911 (or (not (= (select (arr!48648 a!2804) j!70) (select (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48648 a!2804) index!487) (select (arr!48648 a!2804) j!70)) (not (= (select (arr!48648 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun e!844038 () Bool)

(assert (=> b!1512002 e!844038))

(declare-fun res!1031903 () Bool)

(assert (=> b!1512002 (=> (not res!1031903) (not e!844038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100822 (_ BitVec 32)) Bool)

(assert (=> b!1512002 (= res!1031903 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50506 0))(
  ( (Unit!50507) )
))
(declare-fun lt!655574 () Unit!50506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50506)

(assert (=> b!1512002 (= lt!655574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512003 () Bool)

(declare-fun res!1031910 () Bool)

(assert (=> b!1512003 (=> (not res!1031910) (not e!844042))))

(assert (=> b!1512003 (= res!1031910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512004 () Bool)

(declare-fun res!1031912 () Bool)

(assert (=> b!1512004 (=> (not res!1031912) (not e!844042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512004 (= res!1031912 (validKeyInArray!0 (select (arr!48648 a!2804) j!70)))))

(declare-fun b!1512005 () Bool)

(declare-fun res!1031913 () Bool)

(assert (=> b!1512005 (=> (not res!1031913) (not e!844041))))

(declare-fun lt!655576 () SeekEntryResult!12819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512005 (= res!1031913 (= lt!655576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100823 (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49198 a!2804)) mask!2512)))))

(declare-fun b!1512006 () Bool)

(declare-fun res!1031914 () Bool)

(assert (=> b!1512006 (=> (not res!1031914) (not e!844042))))

(declare-datatypes ((List!35131 0))(
  ( (Nil!35128) (Cons!35127 (h!36539 (_ BitVec 64)) (t!49825 List!35131)) )
))
(declare-fun arrayNoDuplicates!0 (array!100822 (_ BitVec 32) List!35131) Bool)

(assert (=> b!1512006 (= res!1031914 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35128))))

(declare-fun b!1512007 () Bool)

(declare-fun res!1031901 () Bool)

(assert (=> b!1512007 (=> (not res!1031901) (not e!844038))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12819)

(assert (=> b!1512007 (= res!1031901 (= (seekEntry!0 (select (arr!48648 a!2804) j!70) a!2804 mask!2512) (Found!12819 j!70)))))

(declare-fun b!1512008 () Bool)

(assert (=> b!1512008 (= e!844038 e!844037)))

(declare-fun res!1031904 () Bool)

(assert (=> b!1512008 (=> res!1031904 e!844037)))

(assert (=> b!1512008 (= res!1031904 (or (not (= (select (arr!48648 a!2804) j!70) (select (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48648 a!2804) index!487) (select (arr!48648 a!2804) j!70)) (not (= (select (arr!48648 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512009 () Bool)

(assert (=> b!1512009 (= e!844040 (validKeyInArray!0 (select (store (arr!48648 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1512010 () Bool)

(assert (=> b!1512010 (= e!844042 e!844041)))

(declare-fun res!1031906 () Bool)

(assert (=> b!1512010 (=> (not res!1031906) (not e!844041))))

(assert (=> b!1512010 (= res!1031906 (= lt!655576 lt!655575))))

(assert (=> b!1512010 (= lt!655575 (Intermediate!12819 false resIndex!21 resX!21))))

(assert (=> b!1512010 (= lt!655576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48648 a!2804) j!70) mask!2512) (select (arr!48648 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512011 () Bool)

(declare-fun res!1031907 () Bool)

(assert (=> b!1512011 (=> (not res!1031907) (not e!844042))))

(assert (=> b!1512011 (= res!1031907 (validKeyInArray!0 (select (arr!48648 a!2804) i!961)))))

(assert (= (and start!128966 res!1031908) b!1512001))

(assert (= (and b!1512001 res!1031902) b!1512011))

(assert (= (and b!1512011 res!1031907) b!1512004))

(assert (= (and b!1512004 res!1031912) b!1512003))

(assert (= (and b!1512003 res!1031910) b!1512006))

(assert (= (and b!1512006 res!1031914) b!1512000))

(assert (= (and b!1512000 res!1031909) b!1512010))

(assert (= (and b!1512010 res!1031906) b!1511998))

(assert (= (and b!1511998 res!1031905) b!1512005))

(assert (= (and b!1512005 res!1031913) b!1512002))

(assert (= (and b!1512002 res!1031903) b!1512007))

(assert (= (and b!1512007 res!1031901) b!1512008))

(assert (= (and b!1512008 (not res!1031904)) b!1511999))

(assert (= (and b!1512002 (not res!1031911)) b!1512009))

(declare-fun m!1394733 () Bool)

(assert (=> b!1512003 m!1394733))

(declare-fun m!1394735 () Bool)

(assert (=> b!1512008 m!1394735))

(declare-fun m!1394737 () Bool)

(assert (=> b!1512008 m!1394737))

(declare-fun m!1394739 () Bool)

(assert (=> b!1512008 m!1394739))

(declare-fun m!1394741 () Bool)

(assert (=> b!1512008 m!1394741))

(declare-fun m!1394743 () Bool)

(assert (=> b!1512011 m!1394743))

(assert (=> b!1512011 m!1394743))

(declare-fun m!1394745 () Bool)

(assert (=> b!1512011 m!1394745))

(assert (=> b!1512005 m!1394737))

(assert (=> b!1512005 m!1394739))

(assert (=> b!1512005 m!1394739))

(declare-fun m!1394747 () Bool)

(assert (=> b!1512005 m!1394747))

(assert (=> b!1512005 m!1394747))

(assert (=> b!1512005 m!1394739))

(declare-fun m!1394749 () Bool)

(assert (=> b!1512005 m!1394749))

(assert (=> b!1512007 m!1394735))

(assert (=> b!1512007 m!1394735))

(declare-fun m!1394751 () Bool)

(assert (=> b!1512007 m!1394751))

(assert (=> b!1512009 m!1394737))

(assert (=> b!1512009 m!1394739))

(assert (=> b!1512009 m!1394739))

(declare-fun m!1394753 () Bool)

(assert (=> b!1512009 m!1394753))

(assert (=> b!1512002 m!1394735))

(declare-fun m!1394755 () Bool)

(assert (=> b!1512002 m!1394755))

(assert (=> b!1512002 m!1394737))

(assert (=> b!1512002 m!1394741))

(assert (=> b!1512002 m!1394739))

(declare-fun m!1394757 () Bool)

(assert (=> b!1512002 m!1394757))

(assert (=> b!1511998 m!1394735))

(assert (=> b!1511998 m!1394735))

(declare-fun m!1394759 () Bool)

(assert (=> b!1511998 m!1394759))

(declare-fun m!1394761 () Bool)

(assert (=> b!1512006 m!1394761))

(assert (=> b!1512004 m!1394735))

(assert (=> b!1512004 m!1394735))

(declare-fun m!1394763 () Bool)

(assert (=> b!1512004 m!1394763))

(declare-fun m!1394765 () Bool)

(assert (=> start!128966 m!1394765))

(declare-fun m!1394767 () Bool)

(assert (=> start!128966 m!1394767))

(assert (=> b!1511999 m!1394735))

(assert (=> b!1511999 m!1394735))

(declare-fun m!1394769 () Bool)

(assert (=> b!1511999 m!1394769))

(assert (=> b!1511999 m!1394735))

(declare-fun m!1394771 () Bool)

(assert (=> b!1511999 m!1394771))

(assert (=> b!1512010 m!1394735))

(assert (=> b!1512010 m!1394735))

(declare-fun m!1394773 () Bool)

(assert (=> b!1512010 m!1394773))

(assert (=> b!1512010 m!1394773))

(assert (=> b!1512010 m!1394735))

(declare-fun m!1394775 () Bool)

(assert (=> b!1512010 m!1394775))

(check-sat (not b!1512002) (not b!1512009) (not b!1512005) (not b!1512004) (not b!1512010) (not b!1512006) (not b!1511998) (not b!1512011) (not start!128966) (not b!1512003) (not b!1512007) (not b!1511999))
(check-sat)
