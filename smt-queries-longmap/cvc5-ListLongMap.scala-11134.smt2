; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130100 () Bool)

(assert start!130100)

(declare-fun b!1526986 () Bool)

(declare-fun res!1045032 () Bool)

(declare-fun e!851106 () Bool)

(assert (=> b!1526986 (=> (not res!1045032) (not e!851106))))

(declare-datatypes ((array!101513 0))(
  ( (array!101514 (arr!48983 (Array (_ BitVec 32) (_ BitVec 64))) (size!49533 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101513)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526986 (= res!1045032 (validKeyInArray!0 (select (arr!48983 a!2804) j!70)))))

(declare-fun b!1526987 () Bool)

(declare-fun res!1045033 () Bool)

(declare-fun e!851105 () Bool)

(assert (=> b!1526987 (=> (not res!1045033) (not e!851105))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13148 0))(
  ( (MissingZero!13148 (index!54987 (_ BitVec 32))) (Found!13148 (index!54988 (_ BitVec 32))) (Intermediate!13148 (undefined!13960 Bool) (index!54989 (_ BitVec 32)) (x!136682 (_ BitVec 32))) (Undefined!13148) (MissingVacant!13148 (index!54990 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101513 (_ BitVec 32)) SeekEntryResult!13148)

(assert (=> b!1526987 (= res!1045033 (= (seekEntry!0 (select (arr!48983 a!2804) j!70) a!2804 mask!2512) (Found!13148 j!70)))))

(declare-fun b!1526988 () Bool)

(declare-fun e!851110 () Bool)

(assert (=> b!1526988 (= e!851106 e!851110)))

(declare-fun res!1045028 () Bool)

(assert (=> b!1526988 (=> (not res!1045028) (not e!851110))))

(declare-fun lt!661273 () SeekEntryResult!13148)

(declare-fun lt!661270 () SeekEntryResult!13148)

(assert (=> b!1526988 (= res!1045028 (= lt!661273 lt!661270))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526988 (= lt!661270 (Intermediate!13148 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101513 (_ BitVec 32)) SeekEntryResult!13148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526988 (= lt!661273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48983 a!2804) j!70) mask!2512) (select (arr!48983 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526989 () Bool)

(declare-fun e!851109 () Bool)

(assert (=> b!1526989 (= e!851105 e!851109)))

(declare-fun res!1045023 () Bool)

(assert (=> b!1526989 (=> res!1045023 e!851109)))

(declare-fun lt!661271 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1526989 (= res!1045023 (or (not (= (select (arr!48983 a!2804) j!70) lt!661271)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48983 a!2804) index!487) (select (arr!48983 a!2804) j!70)) (not (= (select (arr!48983 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526990 () Bool)

(declare-fun lt!661272 () array!101513)

(declare-fun e!851104 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101513 (_ BitVec 32)) SeekEntryResult!13148)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101513 (_ BitVec 32)) SeekEntryResult!13148)

(assert (=> b!1526990 (= e!851104 (= (seekEntryOrOpen!0 lt!661271 lt!661272 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661271 lt!661272 mask!2512)))))

(declare-fun b!1526991 () Bool)

(declare-fun res!1045027 () Bool)

(assert (=> b!1526991 (=> (not res!1045027) (not e!851106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101513 (_ BitVec 32)) Bool)

(assert (=> b!1526991 (= res!1045027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526992 () Bool)

(declare-fun res!1045030 () Bool)

(assert (=> b!1526992 (=> (not res!1045030) (not e!851106))))

(declare-datatypes ((List!35466 0))(
  ( (Nil!35463) (Cons!35462 (h!36895 (_ BitVec 64)) (t!50160 List!35466)) )
))
(declare-fun arrayNoDuplicates!0 (array!101513 (_ BitVec 32) List!35466) Bool)

(assert (=> b!1526992 (= res!1045030 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35463))))

(declare-fun b!1526993 () Bool)

(declare-fun res!1045020 () Bool)

(assert (=> b!1526993 (=> (not res!1045020) (not e!851106))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526993 (= res!1045020 (and (= (size!49533 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49533 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49533 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1045024 () Bool)

(assert (=> start!130100 (=> (not res!1045024) (not e!851106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130100 (= res!1045024 (validMask!0 mask!2512))))

(assert (=> start!130100 e!851106))

(assert (=> start!130100 true))

(declare-fun array_inv!38011 (array!101513) Bool)

(assert (=> start!130100 (array_inv!38011 a!2804)))

(declare-fun b!1526994 () Bool)

(declare-fun res!1045022 () Bool)

(assert (=> b!1526994 (=> (not res!1045022) (not e!851106))))

(assert (=> b!1526994 (= res!1045022 (validKeyInArray!0 (select (arr!48983 a!2804) i!961)))))

(declare-fun b!1526995 () Bool)

(declare-fun res!1045026 () Bool)

(assert (=> b!1526995 (=> (not res!1045026) (not e!851110))))

(assert (=> b!1526995 (= res!1045026 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48983 a!2804) j!70) a!2804 mask!2512) lt!661270))))

(declare-fun b!1526996 () Bool)

(declare-fun res!1045021 () Bool)

(assert (=> b!1526996 (=> (not res!1045021) (not e!851106))))

(assert (=> b!1526996 (= res!1045021 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49533 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49533 a!2804))))))

(declare-fun b!1526997 () Bool)

(declare-fun e!851108 () Bool)

(assert (=> b!1526997 (= e!851108 (not true))))

(assert (=> b!1526997 e!851105))

(declare-fun res!1045025 () Bool)

(assert (=> b!1526997 (=> (not res!1045025) (not e!851105))))

(assert (=> b!1526997 (= res!1045025 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51080 0))(
  ( (Unit!51081) )
))
(declare-fun lt!661269 () Unit!51080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51080)

(assert (=> b!1526997 (= lt!661269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526998 () Bool)

(assert (=> b!1526998 (= e!851110 e!851108)))

(declare-fun res!1045029 () Bool)

(assert (=> b!1526998 (=> (not res!1045029) (not e!851108))))

(assert (=> b!1526998 (= res!1045029 (= lt!661273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661271 mask!2512) lt!661271 lt!661272 mask!2512)))))

(assert (=> b!1526998 (= lt!661271 (select (store (arr!48983 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526998 (= lt!661272 (array!101514 (store (arr!48983 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49533 a!2804)))))

(declare-fun b!1526999 () Bool)

(assert (=> b!1526999 (= e!851109 e!851104)))

(declare-fun res!1045031 () Bool)

(assert (=> b!1526999 (=> (not res!1045031) (not e!851104))))

(assert (=> b!1526999 (= res!1045031 (= (seekEntryOrOpen!0 (select (arr!48983 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48983 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130100 res!1045024) b!1526993))

(assert (= (and b!1526993 res!1045020) b!1526994))

(assert (= (and b!1526994 res!1045022) b!1526986))

(assert (= (and b!1526986 res!1045032) b!1526991))

(assert (= (and b!1526991 res!1045027) b!1526992))

(assert (= (and b!1526992 res!1045030) b!1526996))

(assert (= (and b!1526996 res!1045021) b!1526988))

(assert (= (and b!1526988 res!1045028) b!1526995))

(assert (= (and b!1526995 res!1045026) b!1526998))

(assert (= (and b!1526998 res!1045029) b!1526997))

(assert (= (and b!1526997 res!1045025) b!1526987))

(assert (= (and b!1526987 res!1045033) b!1526989))

(assert (= (and b!1526989 (not res!1045023)) b!1526999))

(assert (= (and b!1526999 res!1045031) b!1526990))

(declare-fun m!1409841 () Bool)

(assert (=> b!1526994 m!1409841))

(assert (=> b!1526994 m!1409841))

(declare-fun m!1409843 () Bool)

(assert (=> b!1526994 m!1409843))

(declare-fun m!1409845 () Bool)

(assert (=> b!1526998 m!1409845))

(assert (=> b!1526998 m!1409845))

(declare-fun m!1409847 () Bool)

(assert (=> b!1526998 m!1409847))

(declare-fun m!1409849 () Bool)

(assert (=> b!1526998 m!1409849))

(declare-fun m!1409851 () Bool)

(assert (=> b!1526998 m!1409851))

(declare-fun m!1409853 () Bool)

(assert (=> b!1526991 m!1409853))

(declare-fun m!1409855 () Bool)

(assert (=> start!130100 m!1409855))

(declare-fun m!1409857 () Bool)

(assert (=> start!130100 m!1409857))

(declare-fun m!1409859 () Bool)

(assert (=> b!1526989 m!1409859))

(declare-fun m!1409861 () Bool)

(assert (=> b!1526989 m!1409861))

(assert (=> b!1526987 m!1409859))

(assert (=> b!1526987 m!1409859))

(declare-fun m!1409863 () Bool)

(assert (=> b!1526987 m!1409863))

(declare-fun m!1409865 () Bool)

(assert (=> b!1526990 m!1409865))

(declare-fun m!1409867 () Bool)

(assert (=> b!1526990 m!1409867))

(declare-fun m!1409869 () Bool)

(assert (=> b!1526992 m!1409869))

(assert (=> b!1526986 m!1409859))

(assert (=> b!1526986 m!1409859))

(declare-fun m!1409871 () Bool)

(assert (=> b!1526986 m!1409871))

(assert (=> b!1526995 m!1409859))

(assert (=> b!1526995 m!1409859))

(declare-fun m!1409873 () Bool)

(assert (=> b!1526995 m!1409873))

(declare-fun m!1409875 () Bool)

(assert (=> b!1526997 m!1409875))

(declare-fun m!1409877 () Bool)

(assert (=> b!1526997 m!1409877))

(assert (=> b!1526988 m!1409859))

(assert (=> b!1526988 m!1409859))

(declare-fun m!1409879 () Bool)

(assert (=> b!1526988 m!1409879))

(assert (=> b!1526988 m!1409879))

(assert (=> b!1526988 m!1409859))

(declare-fun m!1409881 () Bool)

(assert (=> b!1526988 m!1409881))

(assert (=> b!1526999 m!1409859))

(assert (=> b!1526999 m!1409859))

(declare-fun m!1409883 () Bool)

(assert (=> b!1526999 m!1409883))

(assert (=> b!1526999 m!1409859))

(declare-fun m!1409885 () Bool)

(assert (=> b!1526999 m!1409885))

(push 1)

