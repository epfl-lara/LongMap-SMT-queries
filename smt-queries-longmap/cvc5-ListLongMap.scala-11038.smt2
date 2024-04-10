; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129060 () Bool)

(assert start!129060)

(declare-fun b!1513909 () Bool)

(declare-fun e!844907 () Bool)

(declare-fun e!844906 () Bool)

(assert (=> b!1513909 (= e!844907 e!844906)))

(declare-fun res!1033821 () Bool)

(assert (=> b!1513909 (=> (not res!1033821) (not e!844906))))

(declare-fun lt!656147 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12866 0))(
  ( (MissingZero!12866 (index!53859 (_ BitVec 32))) (Found!12866 (index!53860 (_ BitVec 32))) (Intermediate!12866 (undefined!13678 Bool) (index!53861 (_ BitVec 32)) (x!135576 (_ BitVec 32))) (Undefined!12866) (MissingVacant!12866 (index!53862 (_ BitVec 32))) )
))
(declare-fun lt!656146 () SeekEntryResult!12866)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100916 0))(
  ( (array!100917 (arr!48695 (Array (_ BitVec 32) (_ BitVec 64))) (size!49245 (_ BitVec 32))) )
))
(declare-fun lt!656149 () array!100916)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100916 (_ BitVec 32)) SeekEntryResult!12866)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513909 (= res!1033821 (= lt!656146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656147 mask!2512) lt!656147 lt!656149 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100916)

(assert (=> b!1513909 (= lt!656147 (select (store (arr!48695 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513909 (= lt!656149 (array!100917 (store (arr!48695 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49245 a!2804)))))

(declare-fun b!1513910 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844903 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100916 (_ BitVec 32)) SeekEntryResult!12866)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100916 (_ BitVec 32)) SeekEntryResult!12866)

(assert (=> b!1513910 (= e!844903 (= (seekEntryOrOpen!0 lt!656147 lt!656149 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656147 lt!656149 mask!2512)))))

(declare-fun b!1513911 () Bool)

(declare-fun res!1033817 () Bool)

(declare-fun e!844908 () Bool)

(assert (=> b!1513911 (=> (not res!1033817) (not e!844908))))

(declare-datatypes ((List!35178 0))(
  ( (Nil!35175) (Cons!35174 (h!36586 (_ BitVec 64)) (t!49872 List!35178)) )
))
(declare-fun arrayNoDuplicates!0 (array!100916 (_ BitVec 32) List!35178) Bool)

(assert (=> b!1513911 (= res!1033817 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35175))))

(declare-fun b!1513912 () Bool)

(declare-fun res!1033815 () Bool)

(assert (=> b!1513912 (=> (not res!1033815) (not e!844908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513912 (= res!1033815 (validKeyInArray!0 (select (arr!48695 a!2804) i!961)))))

(declare-fun b!1513913 () Bool)

(declare-fun res!1033825 () Bool)

(assert (=> b!1513913 (=> (not res!1033825) (not e!844907))))

(declare-fun lt!656148 () SeekEntryResult!12866)

(assert (=> b!1513913 (= res!1033825 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48695 a!2804) j!70) a!2804 mask!2512) lt!656148))))

(declare-fun b!1513915 () Bool)

(assert (=> b!1513915 (= e!844908 e!844907)))

(declare-fun res!1033816 () Bool)

(assert (=> b!1513915 (=> (not res!1033816) (not e!844907))))

(assert (=> b!1513915 (= res!1033816 (= lt!656146 lt!656148))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513915 (= lt!656148 (Intermediate!12866 false resIndex!21 resX!21))))

(assert (=> b!1513915 (= lt!656146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48695 a!2804) j!70) mask!2512) (select (arr!48695 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513916 () Bool)

(declare-fun res!1033824 () Bool)

(assert (=> b!1513916 (=> (not res!1033824) (not e!844908))))

(assert (=> b!1513916 (= res!1033824 (validKeyInArray!0 (select (arr!48695 a!2804) j!70)))))

(declare-fun b!1513917 () Bool)

(declare-fun e!844905 () Bool)

(declare-fun e!844909 () Bool)

(assert (=> b!1513917 (= e!844905 e!844909)))

(declare-fun res!1033823 () Bool)

(assert (=> b!1513917 (=> res!1033823 e!844909)))

(assert (=> b!1513917 (= res!1033823 (or (not (= (select (arr!48695 a!2804) j!70) lt!656147)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48695 a!2804) index!487) (select (arr!48695 a!2804) j!70)) (not (= (select (arr!48695 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513918 () Bool)

(declare-fun res!1033812 () Bool)

(assert (=> b!1513918 (=> (not res!1033812) (not e!844908))))

(assert (=> b!1513918 (= res!1033812 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49245 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49245 a!2804))))))

(declare-fun b!1513919 () Bool)

(declare-fun res!1033822 () Bool)

(assert (=> b!1513919 (=> (not res!1033822) (not e!844908))))

(assert (=> b!1513919 (= res!1033822 (and (= (size!49245 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49245 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49245 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513920 () Bool)

(declare-fun res!1033814 () Bool)

(assert (=> b!1513920 (=> (not res!1033814) (not e!844908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100916 (_ BitVec 32)) Bool)

(assert (=> b!1513920 (= res!1033814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513914 () Bool)

(declare-fun res!1033813 () Bool)

(assert (=> b!1513914 (=> (not res!1033813) (not e!844905))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100916 (_ BitVec 32)) SeekEntryResult!12866)

(assert (=> b!1513914 (= res!1033813 (= (seekEntry!0 (select (arr!48695 a!2804) j!70) a!2804 mask!2512) (Found!12866 j!70)))))

(declare-fun res!1033820 () Bool)

(assert (=> start!129060 (=> (not res!1033820) (not e!844908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129060 (= res!1033820 (validMask!0 mask!2512))))

(assert (=> start!129060 e!844908))

(assert (=> start!129060 true))

(declare-fun array_inv!37723 (array!100916) Bool)

(assert (=> start!129060 (array_inv!37723 a!2804)))

(declare-fun b!1513921 () Bool)

(assert (=> b!1513921 (= e!844909 e!844903)))

(declare-fun res!1033818 () Bool)

(assert (=> b!1513921 (=> (not res!1033818) (not e!844903))))

(assert (=> b!1513921 (= res!1033818 (= (seekEntryOrOpen!0 (select (arr!48695 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48695 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513922 () Bool)

(assert (=> b!1513922 (= e!844906 (not true))))

(assert (=> b!1513922 e!844905))

(declare-fun res!1033819 () Bool)

(assert (=> b!1513922 (=> (not res!1033819) (not e!844905))))

(assert (=> b!1513922 (= res!1033819 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50600 0))(
  ( (Unit!50601) )
))
(declare-fun lt!656145 () Unit!50600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50600)

(assert (=> b!1513922 (= lt!656145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129060 res!1033820) b!1513919))

(assert (= (and b!1513919 res!1033822) b!1513912))

(assert (= (and b!1513912 res!1033815) b!1513916))

(assert (= (and b!1513916 res!1033824) b!1513920))

(assert (= (and b!1513920 res!1033814) b!1513911))

(assert (= (and b!1513911 res!1033817) b!1513918))

(assert (= (and b!1513918 res!1033812) b!1513915))

(assert (= (and b!1513915 res!1033816) b!1513913))

(assert (= (and b!1513913 res!1033825) b!1513909))

(assert (= (and b!1513909 res!1033821) b!1513922))

(assert (= (and b!1513922 res!1033819) b!1513914))

(assert (= (and b!1513914 res!1033813) b!1513917))

(assert (= (and b!1513917 (not res!1033823)) b!1513921))

(assert (= (and b!1513921 res!1033818) b!1513910))

(declare-fun m!1396813 () Bool)

(assert (=> b!1513914 m!1396813))

(assert (=> b!1513914 m!1396813))

(declare-fun m!1396815 () Bool)

(assert (=> b!1513914 m!1396815))

(declare-fun m!1396817 () Bool)

(assert (=> b!1513911 m!1396817))

(assert (=> b!1513916 m!1396813))

(assert (=> b!1513916 m!1396813))

(declare-fun m!1396819 () Bool)

(assert (=> b!1513916 m!1396819))

(declare-fun m!1396821 () Bool)

(assert (=> b!1513922 m!1396821))

(declare-fun m!1396823 () Bool)

(assert (=> b!1513922 m!1396823))

(assert (=> b!1513915 m!1396813))

(assert (=> b!1513915 m!1396813))

(declare-fun m!1396825 () Bool)

(assert (=> b!1513915 m!1396825))

(assert (=> b!1513915 m!1396825))

(assert (=> b!1513915 m!1396813))

(declare-fun m!1396827 () Bool)

(assert (=> b!1513915 m!1396827))

(declare-fun m!1396829 () Bool)

(assert (=> start!129060 m!1396829))

(declare-fun m!1396831 () Bool)

(assert (=> start!129060 m!1396831))

(assert (=> b!1513921 m!1396813))

(assert (=> b!1513921 m!1396813))

(declare-fun m!1396833 () Bool)

(assert (=> b!1513921 m!1396833))

(assert (=> b!1513921 m!1396813))

(declare-fun m!1396835 () Bool)

(assert (=> b!1513921 m!1396835))

(assert (=> b!1513913 m!1396813))

(assert (=> b!1513913 m!1396813))

(declare-fun m!1396837 () Bool)

(assert (=> b!1513913 m!1396837))

(declare-fun m!1396839 () Bool)

(assert (=> b!1513920 m!1396839))

(declare-fun m!1396841 () Bool)

(assert (=> b!1513912 m!1396841))

(assert (=> b!1513912 m!1396841))

(declare-fun m!1396843 () Bool)

(assert (=> b!1513912 m!1396843))

(declare-fun m!1396845 () Bool)

(assert (=> b!1513909 m!1396845))

(assert (=> b!1513909 m!1396845))

(declare-fun m!1396847 () Bool)

(assert (=> b!1513909 m!1396847))

(declare-fun m!1396849 () Bool)

(assert (=> b!1513909 m!1396849))

(declare-fun m!1396851 () Bool)

(assert (=> b!1513909 m!1396851))

(assert (=> b!1513917 m!1396813))

(declare-fun m!1396853 () Bool)

(assert (=> b!1513917 m!1396853))

(declare-fun m!1396855 () Bool)

(assert (=> b!1513910 m!1396855))

(declare-fun m!1396857 () Bool)

(assert (=> b!1513910 m!1396857))

(push 1)

