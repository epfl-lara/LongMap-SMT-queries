; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130218 () Bool)

(assert start!130218)

(declare-fun b!1528469 () Bool)

(declare-fun res!1046188 () Bool)

(declare-fun e!851897 () Bool)

(assert (=> b!1528469 (=> (not res!1046188) (not e!851897))))

(declare-datatypes ((array!101568 0))(
  ( (array!101569 (arr!49009 (Array (_ BitVec 32) (_ BitVec 64))) (size!49559 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101568)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528469 (= res!1046188 (validKeyInArray!0 (select (arr!49009 a!2804) i!961)))))

(declare-fun b!1528470 () Bool)

(declare-fun res!1046182 () Bool)

(assert (=> b!1528470 (=> (not res!1046182) (not e!851897))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528470 (= res!1046182 (and (= (size!49559 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49559 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49559 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1046177 () Bool)

(assert (=> start!130218 (=> (not res!1046177) (not e!851897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130218 (= res!1046177 (validMask!0 mask!2512))))

(assert (=> start!130218 e!851897))

(assert (=> start!130218 true))

(declare-fun array_inv!38037 (array!101568) Bool)

(assert (=> start!130218 (array_inv!38037 a!2804)))

(declare-fun b!1528471 () Bool)

(declare-fun e!851898 () Bool)

(assert (=> b!1528471 (= e!851898 true)))

(declare-datatypes ((SeekEntryResult!13174 0))(
  ( (MissingZero!13174 (index!55091 (_ BitVec 32))) (Found!13174 (index!55092 (_ BitVec 32))) (Intermediate!13174 (undefined!13986 Bool) (index!55093 (_ BitVec 32)) (x!136781 (_ BitVec 32))) (Undefined!13174) (MissingVacant!13174 (index!55094 (_ BitVec 32))) )
))
(declare-fun lt!662009 () SeekEntryResult!13174)

(declare-fun lt!662005 () SeekEntryResult!13174)

(assert (=> b!1528471 (= lt!662009 lt!662005)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!51132 0))(
  ( (Unit!51133) )
))
(declare-fun lt!662007 () Unit!51132)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51132)

(assert (=> b!1528471 (= lt!662007 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528472 () Bool)

(declare-fun res!1046179 () Bool)

(assert (=> b!1528472 (=> (not res!1046179) (not e!851897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101568 (_ BitVec 32)) Bool)

(assert (=> b!1528472 (= res!1046179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528473 () Bool)

(declare-fun res!1046184 () Bool)

(assert (=> b!1528473 (=> (not res!1046184) (not e!851897))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528473 (= res!1046184 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49559 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49559 a!2804))))))

(declare-fun e!851896 () Bool)

(declare-fun b!1528474 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101568 (_ BitVec 32)) SeekEntryResult!13174)

(assert (=> b!1528474 (= e!851896 (= (seekEntry!0 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) (Found!13174 j!70)))))

(declare-fun b!1528475 () Bool)

(declare-fun e!851901 () Bool)

(declare-fun e!851902 () Bool)

(assert (=> b!1528475 (= e!851901 (not e!851902))))

(declare-fun res!1046185 () Bool)

(assert (=> b!1528475 (=> res!1046185 e!851902)))

(declare-fun lt!662011 () (_ BitVec 64))

(assert (=> b!1528475 (= res!1046185 (or (not (= (select (arr!49009 a!2804) j!70) lt!662011)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49009 a!2804) index!487) (select (arr!49009 a!2804) j!70)) (not (= (select (arr!49009 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528475 e!851896))

(declare-fun res!1046187 () Bool)

(assert (=> b!1528475 (=> (not res!1046187) (not e!851896))))

(assert (=> b!1528475 (= res!1046187 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!662004 () Unit!51132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51132)

(assert (=> b!1528475 (= lt!662004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528476 () Bool)

(declare-fun e!851899 () Bool)

(assert (=> b!1528476 (= e!851897 e!851899)))

(declare-fun res!1046183 () Bool)

(assert (=> b!1528476 (=> (not res!1046183) (not e!851899))))

(declare-fun lt!662008 () SeekEntryResult!13174)

(declare-fun lt!662006 () SeekEntryResult!13174)

(assert (=> b!1528476 (= res!1046183 (= lt!662008 lt!662006))))

(assert (=> b!1528476 (= lt!662006 (Intermediate!13174 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101568 (_ BitVec 32)) SeekEntryResult!13174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528476 (= lt!662008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49009 a!2804) j!70) mask!2512) (select (arr!49009 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528477 () Bool)

(declare-fun res!1046176 () Bool)

(assert (=> b!1528477 (=> (not res!1046176) (not e!851899))))

(assert (=> b!1528477 (= res!1046176 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) lt!662006))))

(declare-fun b!1528478 () Bool)

(declare-fun res!1046178 () Bool)

(assert (=> b!1528478 (=> (not res!1046178) (not e!851897))))

(assert (=> b!1528478 (= res!1046178 (validKeyInArray!0 (select (arr!49009 a!2804) j!70)))))

(declare-fun b!1528479 () Bool)

(declare-fun res!1046181 () Bool)

(assert (=> b!1528479 (=> (not res!1046181) (not e!851897))))

(declare-datatypes ((List!35492 0))(
  ( (Nil!35489) (Cons!35488 (h!36924 (_ BitVec 64)) (t!50186 List!35492)) )
))
(declare-fun arrayNoDuplicates!0 (array!101568 (_ BitVec 32) List!35492) Bool)

(assert (=> b!1528479 (= res!1046181 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35489))))

(declare-fun b!1528480 () Bool)

(assert (=> b!1528480 (= e!851902 e!851898)))

(declare-fun res!1046186 () Bool)

(assert (=> b!1528480 (=> res!1046186 e!851898)))

(assert (=> b!1528480 (= res!1046186 (not (= lt!662005 (Found!13174 j!70))))))

(declare-fun lt!662003 () SeekEntryResult!13174)

(assert (=> b!1528480 (= lt!662003 lt!662009)))

(declare-fun lt!662010 () array!101568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101568 (_ BitVec 32)) SeekEntryResult!13174)

(assert (=> b!1528480 (= lt!662009 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662011 lt!662010 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101568 (_ BitVec 32)) SeekEntryResult!13174)

(assert (=> b!1528480 (= lt!662003 (seekEntryOrOpen!0 lt!662011 lt!662010 mask!2512))))

(declare-fun lt!662002 () SeekEntryResult!13174)

(assert (=> b!1528480 (= lt!662002 lt!662005)))

(assert (=> b!1528480 (= lt!662005 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49009 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528480 (= lt!662002 (seekEntryOrOpen!0 (select (arr!49009 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528481 () Bool)

(assert (=> b!1528481 (= e!851899 e!851901)))

(declare-fun res!1046180 () Bool)

(assert (=> b!1528481 (=> (not res!1046180) (not e!851901))))

(assert (=> b!1528481 (= res!1046180 (= lt!662008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662011 mask!2512) lt!662011 lt!662010 mask!2512)))))

(assert (=> b!1528481 (= lt!662011 (select (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528481 (= lt!662010 (array!101569 (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49559 a!2804)))))

(assert (= (and start!130218 res!1046177) b!1528470))

(assert (= (and b!1528470 res!1046182) b!1528469))

(assert (= (and b!1528469 res!1046188) b!1528478))

(assert (= (and b!1528478 res!1046178) b!1528472))

(assert (= (and b!1528472 res!1046179) b!1528479))

(assert (= (and b!1528479 res!1046181) b!1528473))

(assert (= (and b!1528473 res!1046184) b!1528476))

(assert (= (and b!1528476 res!1046183) b!1528477))

(assert (= (and b!1528477 res!1046176) b!1528481))

(assert (= (and b!1528481 res!1046180) b!1528475))

(assert (= (and b!1528475 res!1046187) b!1528474))

(assert (= (and b!1528475 (not res!1046185)) b!1528480))

(assert (= (and b!1528480 (not res!1046186)) b!1528471))

(declare-fun m!1411311 () Bool)

(assert (=> b!1528480 m!1411311))

(declare-fun m!1411313 () Bool)

(assert (=> b!1528480 m!1411313))

(assert (=> b!1528480 m!1411311))

(declare-fun m!1411315 () Bool)

(assert (=> b!1528480 m!1411315))

(declare-fun m!1411317 () Bool)

(assert (=> b!1528480 m!1411317))

(assert (=> b!1528480 m!1411311))

(declare-fun m!1411319 () Bool)

(assert (=> b!1528480 m!1411319))

(declare-fun m!1411321 () Bool)

(assert (=> b!1528469 m!1411321))

(assert (=> b!1528469 m!1411321))

(declare-fun m!1411323 () Bool)

(assert (=> b!1528469 m!1411323))

(declare-fun m!1411325 () Bool)

(assert (=> b!1528472 m!1411325))

(declare-fun m!1411327 () Bool)

(assert (=> b!1528471 m!1411327))

(assert (=> b!1528474 m!1411311))

(assert (=> b!1528474 m!1411311))

(declare-fun m!1411329 () Bool)

(assert (=> b!1528474 m!1411329))

(assert (=> b!1528478 m!1411311))

(assert (=> b!1528478 m!1411311))

(declare-fun m!1411331 () Bool)

(assert (=> b!1528478 m!1411331))

(declare-fun m!1411333 () Bool)

(assert (=> b!1528481 m!1411333))

(assert (=> b!1528481 m!1411333))

(declare-fun m!1411335 () Bool)

(assert (=> b!1528481 m!1411335))

(declare-fun m!1411337 () Bool)

(assert (=> b!1528481 m!1411337))

(declare-fun m!1411339 () Bool)

(assert (=> b!1528481 m!1411339))

(assert (=> b!1528475 m!1411311))

(declare-fun m!1411341 () Bool)

(assert (=> b!1528475 m!1411341))

(declare-fun m!1411343 () Bool)

(assert (=> b!1528475 m!1411343))

(declare-fun m!1411345 () Bool)

(assert (=> b!1528475 m!1411345))

(declare-fun m!1411347 () Bool)

(assert (=> b!1528479 m!1411347))

(assert (=> b!1528476 m!1411311))

(assert (=> b!1528476 m!1411311))

(declare-fun m!1411349 () Bool)

(assert (=> b!1528476 m!1411349))

(assert (=> b!1528476 m!1411349))

(assert (=> b!1528476 m!1411311))

(declare-fun m!1411351 () Bool)

(assert (=> b!1528476 m!1411351))

(assert (=> b!1528477 m!1411311))

(assert (=> b!1528477 m!1411311))

(declare-fun m!1411353 () Bool)

(assert (=> b!1528477 m!1411353))

(declare-fun m!1411355 () Bool)

(assert (=> start!130218 m!1411355))

(declare-fun m!1411357 () Bool)

(assert (=> start!130218 m!1411357))

(push 1)

