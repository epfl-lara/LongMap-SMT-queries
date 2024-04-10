; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129064 () Bool)

(assert start!129064)

(declare-fun b!1513993 () Bool)

(declare-fun e!844950 () Bool)

(declare-fun e!844949 () Bool)

(assert (=> b!1513993 (= e!844950 e!844949)))

(declare-fun res!1033898 () Bool)

(assert (=> b!1513993 (=> (not res!1033898) (not e!844949))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100920 0))(
  ( (array!100921 (arr!48697 (Array (_ BitVec 32) (_ BitVec 64))) (size!49247 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100920)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12868 0))(
  ( (MissingZero!12868 (index!53867 (_ BitVec 32))) (Found!12868 (index!53868 (_ BitVec 32))) (Intermediate!12868 (undefined!13680 Bool) (index!53869 (_ BitVec 32)) (x!135578 (_ BitVec 32))) (Undefined!12868) (MissingVacant!12868 (index!53870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100920 (_ BitVec 32)) SeekEntryResult!12868)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100920 (_ BitVec 32)) SeekEntryResult!12868)

(assert (=> b!1513993 (= res!1033898 (= (seekEntryOrOpen!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513994 () Bool)

(declare-fun res!1033900 () Bool)

(declare-fun e!844947 () Bool)

(assert (=> b!1513994 (=> (not res!1033900) (not e!844947))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513994 (= res!1033900 (and (= (size!49247 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49247 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49247 a!2804)) (not (= i!961 j!70))))))

(declare-fun lt!656178 () array!100920)

(declare-fun b!1513995 () Bool)

(declare-fun lt!656176 () (_ BitVec 64))

(assert (=> b!1513995 (= e!844949 (= (seekEntryOrOpen!0 lt!656176 lt!656178 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656176 lt!656178 mask!2512)))))

(declare-fun b!1513996 () Bool)

(declare-fun res!1033904 () Bool)

(declare-fun e!844951 () Bool)

(assert (=> b!1513996 (=> (not res!1033904) (not e!844951))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100920 (_ BitVec 32)) SeekEntryResult!12868)

(assert (=> b!1513996 (= res!1033904 (= (seekEntry!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) (Found!12868 j!70)))))

(declare-fun b!1513998 () Bool)

(declare-fun res!1033896 () Bool)

(declare-fun e!844948 () Bool)

(assert (=> b!1513998 (=> (not res!1033896) (not e!844948))))

(declare-fun lt!656175 () SeekEntryResult!12868)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100920 (_ BitVec 32)) SeekEntryResult!12868)

(assert (=> b!1513998 (= res!1033896 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) lt!656175))))

(declare-fun b!1513999 () Bool)

(declare-fun e!844946 () Bool)

(assert (=> b!1513999 (= e!844948 e!844946)))

(declare-fun res!1033906 () Bool)

(assert (=> b!1513999 (=> (not res!1033906) (not e!844946))))

(declare-fun lt!656179 () SeekEntryResult!12868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513999 (= res!1033906 (= lt!656179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656176 mask!2512) lt!656176 lt!656178 mask!2512)))))

(assert (=> b!1513999 (= lt!656176 (select (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513999 (= lt!656178 (array!100921 (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49247 a!2804)))))

(declare-fun b!1514000 () Bool)

(declare-fun res!1033907 () Bool)

(assert (=> b!1514000 (=> (not res!1033907) (not e!844947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514000 (= res!1033907 (validKeyInArray!0 (select (arr!48697 a!2804) i!961)))))

(declare-fun b!1514001 () Bool)

(assert (=> b!1514001 (= e!844947 e!844948)))

(declare-fun res!1033897 () Bool)

(assert (=> b!1514001 (=> (not res!1033897) (not e!844948))))

(assert (=> b!1514001 (= res!1033897 (= lt!656179 lt!656175))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514001 (= lt!656175 (Intermediate!12868 false resIndex!21 resX!21))))

(assert (=> b!1514001 (= lt!656179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48697 a!2804) j!70) mask!2512) (select (arr!48697 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514002 () Bool)

(assert (=> b!1514002 (= e!844946 (not true))))

(assert (=> b!1514002 e!844951))

(declare-fun res!1033908 () Bool)

(assert (=> b!1514002 (=> (not res!1033908) (not e!844951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100920 (_ BitVec 32)) Bool)

(assert (=> b!1514002 (= res!1033908 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50604 0))(
  ( (Unit!50605) )
))
(declare-fun lt!656177 () Unit!50604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50604)

(assert (=> b!1514002 (= lt!656177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514003 () Bool)

(assert (=> b!1514003 (= e!844951 e!844950)))

(declare-fun res!1033902 () Bool)

(assert (=> b!1514003 (=> res!1033902 e!844950)))

(assert (=> b!1514003 (= res!1033902 (or (not (= (select (arr!48697 a!2804) j!70) lt!656176)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48697 a!2804) index!487) (select (arr!48697 a!2804) j!70)) (not (= (select (arr!48697 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514004 () Bool)

(declare-fun res!1033905 () Bool)

(assert (=> b!1514004 (=> (not res!1033905) (not e!844947))))

(assert (=> b!1514004 (= res!1033905 (validKeyInArray!0 (select (arr!48697 a!2804) j!70)))))

(declare-fun b!1514005 () Bool)

(declare-fun res!1033903 () Bool)

(assert (=> b!1514005 (=> (not res!1033903) (not e!844947))))

(assert (=> b!1514005 (= res!1033903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514006 () Bool)

(declare-fun res!1033899 () Bool)

(assert (=> b!1514006 (=> (not res!1033899) (not e!844947))))

(declare-datatypes ((List!35180 0))(
  ( (Nil!35177) (Cons!35176 (h!36588 (_ BitVec 64)) (t!49874 List!35180)) )
))
(declare-fun arrayNoDuplicates!0 (array!100920 (_ BitVec 32) List!35180) Bool)

(assert (=> b!1514006 (= res!1033899 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35177))))

(declare-fun b!1513997 () Bool)

(declare-fun res!1033901 () Bool)

(assert (=> b!1513997 (=> (not res!1033901) (not e!844947))))

(assert (=> b!1513997 (= res!1033901 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49247 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49247 a!2804))))))

(declare-fun res!1033909 () Bool)

(assert (=> start!129064 (=> (not res!1033909) (not e!844947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129064 (= res!1033909 (validMask!0 mask!2512))))

(assert (=> start!129064 e!844947))

(assert (=> start!129064 true))

(declare-fun array_inv!37725 (array!100920) Bool)

(assert (=> start!129064 (array_inv!37725 a!2804)))

(assert (= (and start!129064 res!1033909) b!1513994))

(assert (= (and b!1513994 res!1033900) b!1514000))

(assert (= (and b!1514000 res!1033907) b!1514004))

(assert (= (and b!1514004 res!1033905) b!1514005))

(assert (= (and b!1514005 res!1033903) b!1514006))

(assert (= (and b!1514006 res!1033899) b!1513997))

(assert (= (and b!1513997 res!1033901) b!1514001))

(assert (= (and b!1514001 res!1033897) b!1513998))

(assert (= (and b!1513998 res!1033896) b!1513999))

(assert (= (and b!1513999 res!1033906) b!1514002))

(assert (= (and b!1514002 res!1033908) b!1513996))

(assert (= (and b!1513996 res!1033904) b!1514003))

(assert (= (and b!1514003 (not res!1033902)) b!1513993))

(assert (= (and b!1513993 res!1033898) b!1513995))

(declare-fun m!1396905 () Bool)

(assert (=> b!1514005 m!1396905))

(declare-fun m!1396907 () Bool)

(assert (=> b!1513993 m!1396907))

(assert (=> b!1513993 m!1396907))

(declare-fun m!1396909 () Bool)

(assert (=> b!1513993 m!1396909))

(assert (=> b!1513993 m!1396907))

(declare-fun m!1396911 () Bool)

(assert (=> b!1513993 m!1396911))

(assert (=> b!1513998 m!1396907))

(assert (=> b!1513998 m!1396907))

(declare-fun m!1396913 () Bool)

(assert (=> b!1513998 m!1396913))

(assert (=> b!1513996 m!1396907))

(assert (=> b!1513996 m!1396907))

(declare-fun m!1396915 () Bool)

(assert (=> b!1513996 m!1396915))

(declare-fun m!1396917 () Bool)

(assert (=> b!1514000 m!1396917))

(assert (=> b!1514000 m!1396917))

(declare-fun m!1396919 () Bool)

(assert (=> b!1514000 m!1396919))

(assert (=> b!1514004 m!1396907))

(assert (=> b!1514004 m!1396907))

(declare-fun m!1396921 () Bool)

(assert (=> b!1514004 m!1396921))

(declare-fun m!1396923 () Bool)

(assert (=> b!1514002 m!1396923))

(declare-fun m!1396925 () Bool)

(assert (=> b!1514002 m!1396925))

(declare-fun m!1396927 () Bool)

(assert (=> start!129064 m!1396927))

(declare-fun m!1396929 () Bool)

(assert (=> start!129064 m!1396929))

(declare-fun m!1396931 () Bool)

(assert (=> b!1513999 m!1396931))

(assert (=> b!1513999 m!1396931))

(declare-fun m!1396933 () Bool)

(assert (=> b!1513999 m!1396933))

(declare-fun m!1396935 () Bool)

(assert (=> b!1513999 m!1396935))

(declare-fun m!1396937 () Bool)

(assert (=> b!1513999 m!1396937))

(assert (=> b!1514003 m!1396907))

(declare-fun m!1396939 () Bool)

(assert (=> b!1514003 m!1396939))

(assert (=> b!1514001 m!1396907))

(assert (=> b!1514001 m!1396907))

(declare-fun m!1396941 () Bool)

(assert (=> b!1514001 m!1396941))

(assert (=> b!1514001 m!1396941))

(assert (=> b!1514001 m!1396907))

(declare-fun m!1396943 () Bool)

(assert (=> b!1514001 m!1396943))

(declare-fun m!1396945 () Bool)

(assert (=> b!1514006 m!1396945))

(declare-fun m!1396947 () Bool)

(assert (=> b!1513995 m!1396947))

(declare-fun m!1396949 () Bool)

(assert (=> b!1513995 m!1396949))

(push 1)

