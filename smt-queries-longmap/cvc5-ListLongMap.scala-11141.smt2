; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130208 () Bool)

(assert start!130208)

(declare-fun b!1528274 () Bool)

(declare-fun res!1045988 () Bool)

(declare-fun e!851792 () Bool)

(assert (=> b!1528274 (=> (not res!1045988) (not e!851792))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!101558 0))(
  ( (array!101559 (arr!49004 (Array (_ BitVec 32) (_ BitVec 64))) (size!49554 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101558)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1528274 (= res!1045988 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49554 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49554 a!2804))))))

(declare-fun b!1528275 () Bool)

(declare-fun e!851794 () Bool)

(assert (=> b!1528275 (= e!851792 e!851794)))

(declare-fun res!1045990 () Bool)

(assert (=> b!1528275 (=> (not res!1045990) (not e!851794))))

(declare-datatypes ((SeekEntryResult!13169 0))(
  ( (MissingZero!13169 (index!55071 (_ BitVec 32))) (Found!13169 (index!55072 (_ BitVec 32))) (Intermediate!13169 (undefined!13981 Bool) (index!55073 (_ BitVec 32)) (x!136768 (_ BitVec 32))) (Undefined!13169) (MissingVacant!13169 (index!55074 (_ BitVec 32))) )
))
(declare-fun lt!661853 () SeekEntryResult!13169)

(declare-fun lt!661859 () SeekEntryResult!13169)

(assert (=> b!1528275 (= res!1045990 (= lt!661853 lt!661859))))

(assert (=> b!1528275 (= lt!661859 (Intermediate!13169 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101558 (_ BitVec 32)) SeekEntryResult!13169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528275 (= lt!661853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49004 a!2804) j!70) mask!2512) (select (arr!49004 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528276 () Bool)

(declare-fun res!1045985 () Bool)

(assert (=> b!1528276 (=> (not res!1045985) (not e!851792))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528276 (= res!1045985 (validKeyInArray!0 (select (arr!49004 a!2804) i!961)))))

(declare-fun b!1528277 () Bool)

(declare-fun e!851797 () Bool)

(assert (=> b!1528277 (= e!851797 true)))

(declare-fun lt!661858 () SeekEntryResult!13169)

(declare-fun lt!661857 () SeekEntryResult!13169)

(assert (=> b!1528277 (= lt!661858 lt!661857)))

(declare-datatypes ((Unit!51122 0))(
  ( (Unit!51123) )
))
(declare-fun lt!661856 () Unit!51122)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51122)

(assert (=> b!1528277 (= lt!661856 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1045984 () Bool)

(assert (=> start!130208 (=> (not res!1045984) (not e!851792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130208 (= res!1045984 (validMask!0 mask!2512))))

(assert (=> start!130208 e!851792))

(assert (=> start!130208 true))

(declare-fun array_inv!38032 (array!101558) Bool)

(assert (=> start!130208 (array_inv!38032 a!2804)))

(declare-fun b!1528278 () Bool)

(declare-fun res!1045981 () Bool)

(assert (=> b!1528278 (=> (not res!1045981) (not e!851792))))

(assert (=> b!1528278 (= res!1045981 (and (= (size!49554 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49554 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49554 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528279 () Bool)

(declare-fun res!1045989 () Bool)

(assert (=> b!1528279 (=> (not res!1045989) (not e!851792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101558 (_ BitVec 32)) Bool)

(assert (=> b!1528279 (= res!1045989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528280 () Bool)

(declare-fun e!851793 () Bool)

(assert (=> b!1528280 (= e!851794 e!851793)))

(declare-fun res!1045991 () Bool)

(assert (=> b!1528280 (=> (not res!1045991) (not e!851793))))

(declare-fun lt!661855 () (_ BitVec 64))

(declare-fun lt!661852 () array!101558)

(assert (=> b!1528280 (= res!1045991 (= lt!661853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661855 mask!2512) lt!661855 lt!661852 mask!2512)))))

(assert (=> b!1528280 (= lt!661855 (select (store (arr!49004 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528280 (= lt!661852 (array!101559 (store (arr!49004 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49554 a!2804)))))

(declare-fun b!1528281 () Bool)

(declare-fun res!1045986 () Bool)

(assert (=> b!1528281 (=> (not res!1045986) (not e!851792))))

(assert (=> b!1528281 (= res!1045986 (validKeyInArray!0 (select (arr!49004 a!2804) j!70)))))

(declare-fun b!1528282 () Bool)

(declare-fun e!851791 () Bool)

(assert (=> b!1528282 (= e!851791 e!851797)))

(declare-fun res!1045987 () Bool)

(assert (=> b!1528282 (=> res!1045987 e!851797)))

(assert (=> b!1528282 (= res!1045987 (not (= lt!661857 (Found!13169 j!70))))))

(declare-fun lt!661861 () SeekEntryResult!13169)

(assert (=> b!1528282 (= lt!661861 lt!661858)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101558 (_ BitVec 32)) SeekEntryResult!13169)

(assert (=> b!1528282 (= lt!661858 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661855 lt!661852 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101558 (_ BitVec 32)) SeekEntryResult!13169)

(assert (=> b!1528282 (= lt!661861 (seekEntryOrOpen!0 lt!661855 lt!661852 mask!2512))))

(declare-fun lt!661860 () SeekEntryResult!13169)

(assert (=> b!1528282 (= lt!661860 lt!661857)))

(assert (=> b!1528282 (= lt!661857 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49004 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528282 (= lt!661860 (seekEntryOrOpen!0 (select (arr!49004 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528283 () Bool)

(declare-fun res!1045982 () Bool)

(assert (=> b!1528283 (=> (not res!1045982) (not e!851792))))

(declare-datatypes ((List!35487 0))(
  ( (Nil!35484) (Cons!35483 (h!36919 (_ BitVec 64)) (t!50181 List!35487)) )
))
(declare-fun arrayNoDuplicates!0 (array!101558 (_ BitVec 32) List!35487) Bool)

(assert (=> b!1528283 (= res!1045982 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35484))))

(declare-fun b!1528284 () Bool)

(declare-fun res!1045993 () Bool)

(assert (=> b!1528284 (=> (not res!1045993) (not e!851794))))

(assert (=> b!1528284 (= res!1045993 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49004 a!2804) j!70) a!2804 mask!2512) lt!661859))))

(declare-fun b!1528285 () Bool)

(declare-fun e!851796 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101558 (_ BitVec 32)) SeekEntryResult!13169)

(assert (=> b!1528285 (= e!851796 (= (seekEntry!0 (select (arr!49004 a!2804) j!70) a!2804 mask!2512) (Found!13169 j!70)))))

(declare-fun b!1528286 () Bool)

(assert (=> b!1528286 (= e!851793 (not e!851791))))

(declare-fun res!1045983 () Bool)

(assert (=> b!1528286 (=> res!1045983 e!851791)))

(assert (=> b!1528286 (= res!1045983 (or (not (= (select (arr!49004 a!2804) j!70) lt!661855)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49004 a!2804) index!487) (select (arr!49004 a!2804) j!70)) (not (= (select (arr!49004 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528286 e!851796))

(declare-fun res!1045992 () Bool)

(assert (=> b!1528286 (=> (not res!1045992) (not e!851796))))

(assert (=> b!1528286 (= res!1045992 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!661854 () Unit!51122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51122)

(assert (=> b!1528286 (= lt!661854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130208 res!1045984) b!1528278))

(assert (= (and b!1528278 res!1045981) b!1528276))

(assert (= (and b!1528276 res!1045985) b!1528281))

(assert (= (and b!1528281 res!1045986) b!1528279))

(assert (= (and b!1528279 res!1045989) b!1528283))

(assert (= (and b!1528283 res!1045982) b!1528274))

(assert (= (and b!1528274 res!1045988) b!1528275))

(assert (= (and b!1528275 res!1045990) b!1528284))

(assert (= (and b!1528284 res!1045993) b!1528280))

(assert (= (and b!1528280 res!1045991) b!1528286))

(assert (= (and b!1528286 res!1045992) b!1528285))

(assert (= (and b!1528286 (not res!1045983)) b!1528282))

(assert (= (and b!1528282 (not res!1045987)) b!1528277))

(declare-fun m!1411071 () Bool)

(assert (=> b!1528280 m!1411071))

(assert (=> b!1528280 m!1411071))

(declare-fun m!1411073 () Bool)

(assert (=> b!1528280 m!1411073))

(declare-fun m!1411075 () Bool)

(assert (=> b!1528280 m!1411075))

(declare-fun m!1411077 () Bool)

(assert (=> b!1528280 m!1411077))

(declare-fun m!1411079 () Bool)

(assert (=> b!1528276 m!1411079))

(assert (=> b!1528276 m!1411079))

(declare-fun m!1411081 () Bool)

(assert (=> b!1528276 m!1411081))

(declare-fun m!1411083 () Bool)

(assert (=> b!1528281 m!1411083))

(assert (=> b!1528281 m!1411083))

(declare-fun m!1411085 () Bool)

(assert (=> b!1528281 m!1411085))

(assert (=> b!1528275 m!1411083))

(assert (=> b!1528275 m!1411083))

(declare-fun m!1411087 () Bool)

(assert (=> b!1528275 m!1411087))

(assert (=> b!1528275 m!1411087))

(assert (=> b!1528275 m!1411083))

(declare-fun m!1411089 () Bool)

(assert (=> b!1528275 m!1411089))

(declare-fun m!1411091 () Bool)

(assert (=> b!1528282 m!1411091))

(assert (=> b!1528282 m!1411083))

(declare-fun m!1411093 () Bool)

(assert (=> b!1528282 m!1411093))

(assert (=> b!1528282 m!1411083))

(declare-fun m!1411095 () Bool)

(assert (=> b!1528282 m!1411095))

(declare-fun m!1411097 () Bool)

(assert (=> b!1528282 m!1411097))

(assert (=> b!1528282 m!1411083))

(assert (=> b!1528285 m!1411083))

(assert (=> b!1528285 m!1411083))

(declare-fun m!1411099 () Bool)

(assert (=> b!1528285 m!1411099))

(assert (=> b!1528284 m!1411083))

(assert (=> b!1528284 m!1411083))

(declare-fun m!1411101 () Bool)

(assert (=> b!1528284 m!1411101))

(declare-fun m!1411103 () Bool)

(assert (=> start!130208 m!1411103))

(declare-fun m!1411105 () Bool)

(assert (=> start!130208 m!1411105))

(declare-fun m!1411107 () Bool)

(assert (=> b!1528277 m!1411107))

(declare-fun m!1411109 () Bool)

(assert (=> b!1528279 m!1411109))

(assert (=> b!1528286 m!1411083))

(declare-fun m!1411111 () Bool)

(assert (=> b!1528286 m!1411111))

(declare-fun m!1411113 () Bool)

(assert (=> b!1528286 m!1411113))

(declare-fun m!1411115 () Bool)

(assert (=> b!1528286 m!1411115))

(declare-fun m!1411117 () Bool)

(assert (=> b!1528283 m!1411117))

(push 1)

