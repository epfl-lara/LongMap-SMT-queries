; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129016 () Bool)

(assert start!129016)

(declare-fun b!1512985 () Bool)

(declare-fun res!1032897 () Bool)

(declare-fun e!844443 () Bool)

(assert (=> b!1512985 (=> (not res!1032897) (not e!844443))))

(declare-datatypes ((array!100872 0))(
  ( (array!100873 (arr!48673 (Array (_ BitVec 32) (_ BitVec 64))) (size!49223 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100872)

(declare-datatypes ((List!35156 0))(
  ( (Nil!35153) (Cons!35152 (h!36564 (_ BitVec 64)) (t!49850 List!35156)) )
))
(declare-fun arrayNoDuplicates!0 (array!100872 (_ BitVec 32) List!35156) Bool)

(assert (=> b!1512985 (= res!1032897 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35153))))

(declare-fun b!1512986 () Bool)

(declare-fun res!1032891 () Bool)

(declare-fun e!844441 () Bool)

(assert (=> b!1512986 (=> (not res!1032891) (not e!844441))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12844 0))(
  ( (MissingZero!12844 (index!53771 (_ BitVec 32))) (Found!12844 (index!53772 (_ BitVec 32))) (Intermediate!12844 (undefined!13656 Bool) (index!53773 (_ BitVec 32)) (x!135490 (_ BitVec 32))) (Undefined!12844) (MissingVacant!12844 (index!53774 (_ BitVec 32))) )
))
(declare-fun lt!655817 () SeekEntryResult!12844)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100872 (_ BitVec 32)) SeekEntryResult!12844)

(assert (=> b!1512986 (= res!1032891 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) lt!655817))))

(declare-fun b!1512987 () Bool)

(declare-fun e!844445 () Bool)

(declare-fun lt!655816 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512987 (= e!844445 (validKeyInArray!0 lt!655816))))

(declare-fun b!1512988 () Bool)

(declare-fun e!844446 () Bool)

(assert (=> b!1512988 (= e!844441 e!844446)))

(declare-fun res!1032889 () Bool)

(assert (=> b!1512988 (=> (not res!1032889) (not e!844446))))

(declare-fun lt!655818 () SeekEntryResult!12844)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512988 (= res!1032889 (= lt!655818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655816 mask!2512) lt!655816 (array!100873 (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49223 a!2804)) mask!2512)))))

(assert (=> b!1512988 (= lt!655816 (select (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512989 () Bool)

(declare-fun res!1032898 () Bool)

(assert (=> b!1512989 (=> (not res!1032898) (not e!844443))))

(assert (=> b!1512989 (= res!1032898 (and (= (size!49223 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49223 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49223 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512990 () Bool)

(declare-fun res!1032894 () Bool)

(declare-fun e!844444 () Bool)

(assert (=> b!1512990 (=> (not res!1032894) (not e!844444))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100872 (_ BitVec 32)) SeekEntryResult!12844)

(assert (=> b!1512990 (= res!1032894 (= (seekEntry!0 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) (Found!12844 j!70)))))

(declare-fun res!1032896 () Bool)

(assert (=> start!129016 (=> (not res!1032896) (not e!844443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129016 (= res!1032896 (validMask!0 mask!2512))))

(assert (=> start!129016 e!844443))

(assert (=> start!129016 true))

(declare-fun array_inv!37701 (array!100872) Bool)

(assert (=> start!129016 (array_inv!37701 a!2804)))

(declare-fun b!1512991 () Bool)

(declare-fun e!844442 () Bool)

(assert (=> b!1512991 (= e!844444 e!844442)))

(declare-fun res!1032901 () Bool)

(assert (=> b!1512991 (=> res!1032901 e!844442)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512991 (= res!1032901 (or (not (= (select (arr!48673 a!2804) j!70) lt!655816)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48673 a!2804) index!487) (select (arr!48673 a!2804) j!70)) (not (= (select (arr!48673 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512992 () Bool)

(declare-fun res!1032893 () Bool)

(assert (=> b!1512992 (=> (not res!1032893) (not e!844443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100872 (_ BitVec 32)) Bool)

(assert (=> b!1512992 (= res!1032893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512993 () Bool)

(declare-fun res!1032900 () Bool)

(assert (=> b!1512993 (=> (not res!1032900) (not e!844443))))

(assert (=> b!1512993 (= res!1032900 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49223 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49223 a!2804))))))

(declare-fun b!1512994 () Bool)

(declare-fun res!1032899 () Bool)

(assert (=> b!1512994 (=> (not res!1032899) (not e!844443))))

(assert (=> b!1512994 (= res!1032899 (validKeyInArray!0 (select (arr!48673 a!2804) j!70)))))

(declare-fun b!1512995 () Bool)

(assert (=> b!1512995 (= e!844446 (not e!844445))))

(declare-fun res!1032890 () Bool)

(assert (=> b!1512995 (=> res!1032890 e!844445)))

(assert (=> b!1512995 (= res!1032890 (or (not (= (select (arr!48673 a!2804) j!70) lt!655816)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48673 a!2804) index!487) (select (arr!48673 a!2804) j!70)) (not (= (select (arr!48673 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (not (= (select (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1512995 e!844444))

(declare-fun res!1032888 () Bool)

(assert (=> b!1512995 (=> (not res!1032888) (not e!844444))))

(assert (=> b!1512995 (= res!1032888 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50556 0))(
  ( (Unit!50557) )
))
(declare-fun lt!655819 () Unit!50556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50556)

(assert (=> b!1512995 (= lt!655819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512996 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100872 (_ BitVec 32)) SeekEntryResult!12844)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100872 (_ BitVec 32)) SeekEntryResult!12844)

(assert (=> b!1512996 (= e!844442 (= (seekEntryOrOpen!0 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48673 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512997 () Bool)

(declare-fun res!1032895 () Bool)

(assert (=> b!1512997 (=> (not res!1032895) (not e!844443))))

(assert (=> b!1512997 (= res!1032895 (validKeyInArray!0 (select (arr!48673 a!2804) i!961)))))

(declare-fun b!1512998 () Bool)

(assert (=> b!1512998 (= e!844443 e!844441)))

(declare-fun res!1032892 () Bool)

(assert (=> b!1512998 (=> (not res!1032892) (not e!844441))))

(assert (=> b!1512998 (= res!1032892 (= lt!655818 lt!655817))))

(assert (=> b!1512998 (= lt!655817 (Intermediate!12844 false resIndex!21 resX!21))))

(assert (=> b!1512998 (= lt!655818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48673 a!2804) j!70) mask!2512) (select (arr!48673 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129016 res!1032896) b!1512989))

(assert (= (and b!1512989 res!1032898) b!1512997))

(assert (= (and b!1512997 res!1032895) b!1512994))

(assert (= (and b!1512994 res!1032899) b!1512992))

(assert (= (and b!1512992 res!1032893) b!1512985))

(assert (= (and b!1512985 res!1032897) b!1512993))

(assert (= (and b!1512993 res!1032900) b!1512998))

(assert (= (and b!1512998 res!1032892) b!1512986))

(assert (= (and b!1512986 res!1032891) b!1512988))

(assert (= (and b!1512988 res!1032889) b!1512995))

(assert (= (and b!1512995 res!1032888) b!1512990))

(assert (= (and b!1512990 res!1032894) b!1512991))

(assert (= (and b!1512991 (not res!1032901)) b!1512996))

(assert (= (and b!1512995 (not res!1032890)) b!1512987))

(declare-fun m!1395801 () Bool)

(assert (=> b!1512994 m!1395801))

(assert (=> b!1512994 m!1395801))

(declare-fun m!1395803 () Bool)

(assert (=> b!1512994 m!1395803))

(assert (=> b!1512991 m!1395801))

(declare-fun m!1395805 () Bool)

(assert (=> b!1512991 m!1395805))

(declare-fun m!1395807 () Bool)

(assert (=> start!129016 m!1395807))

(declare-fun m!1395809 () Bool)

(assert (=> start!129016 m!1395809))

(assert (=> b!1512986 m!1395801))

(assert (=> b!1512986 m!1395801))

(declare-fun m!1395811 () Bool)

(assert (=> b!1512986 m!1395811))

(assert (=> b!1512995 m!1395801))

(declare-fun m!1395813 () Bool)

(assert (=> b!1512995 m!1395813))

(declare-fun m!1395815 () Bool)

(assert (=> b!1512995 m!1395815))

(assert (=> b!1512995 m!1395805))

(declare-fun m!1395817 () Bool)

(assert (=> b!1512995 m!1395817))

(declare-fun m!1395819 () Bool)

(assert (=> b!1512995 m!1395819))

(assert (=> b!1512998 m!1395801))

(assert (=> b!1512998 m!1395801))

(declare-fun m!1395821 () Bool)

(assert (=> b!1512998 m!1395821))

(assert (=> b!1512998 m!1395821))

(assert (=> b!1512998 m!1395801))

(declare-fun m!1395823 () Bool)

(assert (=> b!1512998 m!1395823))

(declare-fun m!1395825 () Bool)

(assert (=> b!1512985 m!1395825))

(declare-fun m!1395827 () Bool)

(assert (=> b!1512997 m!1395827))

(assert (=> b!1512997 m!1395827))

(declare-fun m!1395829 () Bool)

(assert (=> b!1512997 m!1395829))

(assert (=> b!1512990 m!1395801))

(assert (=> b!1512990 m!1395801))

(declare-fun m!1395831 () Bool)

(assert (=> b!1512990 m!1395831))

(declare-fun m!1395833 () Bool)

(assert (=> b!1512992 m!1395833))

(assert (=> b!1512996 m!1395801))

(assert (=> b!1512996 m!1395801))

(declare-fun m!1395835 () Bool)

(assert (=> b!1512996 m!1395835))

(assert (=> b!1512996 m!1395801))

(declare-fun m!1395837 () Bool)

(assert (=> b!1512996 m!1395837))

(declare-fun m!1395839 () Bool)

(assert (=> b!1512987 m!1395839))

(declare-fun m!1395841 () Bool)

(assert (=> b!1512988 m!1395841))

(assert (=> b!1512988 m!1395815))

(assert (=> b!1512988 m!1395841))

(declare-fun m!1395843 () Bool)

(assert (=> b!1512988 m!1395843))

(declare-fun m!1395845 () Bool)

(assert (=> b!1512988 m!1395845))

(push 1)

