; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130212 () Bool)

(assert start!130212)

(declare-fun b!1528352 () Bool)

(declare-fun e!851839 () Bool)

(declare-fun e!851837 () Bool)

(assert (=> b!1528352 (= e!851839 e!851837)))

(declare-fun res!1046061 () Bool)

(assert (=> b!1528352 (=> res!1046061 e!851837)))

(declare-datatypes ((SeekEntryResult!13171 0))(
  ( (MissingZero!13171 (index!55079 (_ BitVec 32))) (Found!13171 (index!55080 (_ BitVec 32))) (Intermediate!13171 (undefined!13983 Bool) (index!55081 (_ BitVec 32)) (x!136770 (_ BitVec 32))) (Undefined!13171) (MissingVacant!13171 (index!55082 (_ BitVec 32))) )
))
(declare-fun lt!661916 () SeekEntryResult!13171)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528352 (= res!1046061 (not (= lt!661916 (Found!13171 j!70))))))

(declare-fun lt!661914 () SeekEntryResult!13171)

(declare-fun lt!661915 () SeekEntryResult!13171)

(assert (=> b!1528352 (= lt!661914 lt!661915)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101562 0))(
  ( (array!101563 (arr!49006 (Array (_ BitVec 32) (_ BitVec 64))) (size!49556 (_ BitVec 32))) )
))
(declare-fun lt!661918 () array!101562)

(declare-fun lt!661912 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101562 (_ BitVec 32)) SeekEntryResult!13171)

(assert (=> b!1528352 (= lt!661915 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661912 lt!661918 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101562 (_ BitVec 32)) SeekEntryResult!13171)

(assert (=> b!1528352 (= lt!661914 (seekEntryOrOpen!0 lt!661912 lt!661918 mask!2512))))

(declare-fun lt!661921 () SeekEntryResult!13171)

(assert (=> b!1528352 (= lt!661921 lt!661916)))

(declare-fun a!2804 () array!101562)

(assert (=> b!1528352 (= lt!661916 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49006 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528352 (= lt!661921 (seekEntryOrOpen!0 (select (arr!49006 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528353 () Bool)

(declare-fun e!851835 () Bool)

(declare-fun e!851833 () Bool)

(assert (=> b!1528353 (= e!851835 e!851833)))

(declare-fun res!1046063 () Bool)

(assert (=> b!1528353 (=> (not res!1046063) (not e!851833))))

(declare-fun lt!661913 () SeekEntryResult!13171)

(declare-fun lt!661920 () SeekEntryResult!13171)

(assert (=> b!1528353 (= res!1046063 (= lt!661913 lt!661920))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528353 (= lt!661920 (Intermediate!13171 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101562 (_ BitVec 32)) SeekEntryResult!13171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528353 (= lt!661913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49006 a!2804) j!70) mask!2512) (select (arr!49006 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528354 () Bool)

(declare-fun res!1046069 () Bool)

(assert (=> b!1528354 (=> (not res!1046069) (not e!851835))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528354 (= res!1046069 (validKeyInArray!0 (select (arr!49006 a!2804) i!961)))))

(declare-fun b!1528355 () Bool)

(declare-fun e!851836 () Bool)

(assert (=> b!1528355 (= e!851836 (not e!851839))))

(declare-fun res!1046068 () Bool)

(assert (=> b!1528355 (=> res!1046068 e!851839)))

(assert (=> b!1528355 (= res!1046068 (or (not (= (select (arr!49006 a!2804) j!70) lt!661912)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49006 a!2804) index!487) (select (arr!49006 a!2804) j!70)) (not (= (select (arr!49006 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851838 () Bool)

(assert (=> b!1528355 e!851838))

(declare-fun res!1046066 () Bool)

(assert (=> b!1528355 (=> (not res!1046066) (not e!851838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101562 (_ BitVec 32)) Bool)

(assert (=> b!1528355 (= res!1046066 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51126 0))(
  ( (Unit!51127) )
))
(declare-fun lt!661919 () Unit!51126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51126)

(assert (=> b!1528355 (= lt!661919 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528356 () Bool)

(declare-fun res!1046062 () Bool)

(assert (=> b!1528356 (=> (not res!1046062) (not e!851835))))

(declare-datatypes ((List!35489 0))(
  ( (Nil!35486) (Cons!35485 (h!36921 (_ BitVec 64)) (t!50183 List!35489)) )
))
(declare-fun arrayNoDuplicates!0 (array!101562 (_ BitVec 32) List!35489) Bool)

(assert (=> b!1528356 (= res!1046062 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35486))))

(declare-fun b!1528357 () Bool)

(assert (=> b!1528357 (= e!851833 e!851836)))

(declare-fun res!1046064 () Bool)

(assert (=> b!1528357 (=> (not res!1046064) (not e!851836))))

(assert (=> b!1528357 (= res!1046064 (= lt!661913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661912 mask!2512) lt!661912 lt!661918 mask!2512)))))

(assert (=> b!1528357 (= lt!661912 (select (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528357 (= lt!661918 (array!101563 (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49556 a!2804)))))

(declare-fun b!1528358 () Bool)

(declare-fun res!1046059 () Bool)

(assert (=> b!1528358 (=> (not res!1046059) (not e!851835))))

(assert (=> b!1528358 (= res!1046059 (validKeyInArray!0 (select (arr!49006 a!2804) j!70)))))

(declare-fun b!1528359 () Bool)

(declare-fun res!1046067 () Bool)

(assert (=> b!1528359 (=> (not res!1046067) (not e!851835))))

(assert (=> b!1528359 (= res!1046067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528360 () Bool)

(declare-fun res!1046070 () Bool)

(assert (=> b!1528360 (=> (not res!1046070) (not e!851833))))

(assert (=> b!1528360 (= res!1046070 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) lt!661920))))

(declare-fun b!1528361 () Bool)

(declare-fun res!1046065 () Bool)

(assert (=> b!1528361 (=> (not res!1046065) (not e!851835))))

(assert (=> b!1528361 (= res!1046065 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49556 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49556 a!2804))))))

(declare-fun res!1046060 () Bool)

(assert (=> start!130212 (=> (not res!1046060) (not e!851835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130212 (= res!1046060 (validMask!0 mask!2512))))

(assert (=> start!130212 e!851835))

(assert (=> start!130212 true))

(declare-fun array_inv!38034 (array!101562) Bool)

(assert (=> start!130212 (array_inv!38034 a!2804)))

(declare-fun b!1528362 () Bool)

(assert (=> b!1528362 (= e!851837 true)))

(assert (=> b!1528362 (= lt!661915 lt!661916)))

(declare-fun lt!661917 () Unit!51126)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51126)

(assert (=> b!1528362 (= lt!661917 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528363 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101562 (_ BitVec 32)) SeekEntryResult!13171)

(assert (=> b!1528363 (= e!851838 (= (seekEntry!0 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) (Found!13171 j!70)))))

(declare-fun b!1528364 () Bool)

(declare-fun res!1046071 () Bool)

(assert (=> b!1528364 (=> (not res!1046071) (not e!851835))))

(assert (=> b!1528364 (= res!1046071 (and (= (size!49556 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49556 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49556 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130212 res!1046060) b!1528364))

(assert (= (and b!1528364 res!1046071) b!1528354))

(assert (= (and b!1528354 res!1046069) b!1528358))

(assert (= (and b!1528358 res!1046059) b!1528359))

(assert (= (and b!1528359 res!1046067) b!1528356))

(assert (= (and b!1528356 res!1046062) b!1528361))

(assert (= (and b!1528361 res!1046065) b!1528353))

(assert (= (and b!1528353 res!1046063) b!1528360))

(assert (= (and b!1528360 res!1046070) b!1528357))

(assert (= (and b!1528357 res!1046064) b!1528355))

(assert (= (and b!1528355 res!1046066) b!1528363))

(assert (= (and b!1528355 (not res!1046068)) b!1528352))

(assert (= (and b!1528352 (not res!1046061)) b!1528362))

(declare-fun m!1411167 () Bool)

(assert (=> b!1528353 m!1411167))

(assert (=> b!1528353 m!1411167))

(declare-fun m!1411169 () Bool)

(assert (=> b!1528353 m!1411169))

(assert (=> b!1528353 m!1411169))

(assert (=> b!1528353 m!1411167))

(declare-fun m!1411171 () Bool)

(assert (=> b!1528353 m!1411171))

(declare-fun m!1411173 () Bool)

(assert (=> b!1528356 m!1411173))

(declare-fun m!1411175 () Bool)

(assert (=> b!1528357 m!1411175))

(assert (=> b!1528357 m!1411175))

(declare-fun m!1411177 () Bool)

(assert (=> b!1528357 m!1411177))

(declare-fun m!1411179 () Bool)

(assert (=> b!1528357 m!1411179))

(declare-fun m!1411181 () Bool)

(assert (=> b!1528357 m!1411181))

(assert (=> b!1528360 m!1411167))

(assert (=> b!1528360 m!1411167))

(declare-fun m!1411183 () Bool)

(assert (=> b!1528360 m!1411183))

(declare-fun m!1411185 () Bool)

(assert (=> b!1528362 m!1411185))

(assert (=> b!1528358 m!1411167))

(assert (=> b!1528358 m!1411167))

(declare-fun m!1411187 () Bool)

(assert (=> b!1528358 m!1411187))

(declare-fun m!1411189 () Bool)

(assert (=> start!130212 m!1411189))

(declare-fun m!1411191 () Bool)

(assert (=> start!130212 m!1411191))

(declare-fun m!1411193 () Bool)

(assert (=> b!1528359 m!1411193))

(assert (=> b!1528363 m!1411167))

(assert (=> b!1528363 m!1411167))

(declare-fun m!1411195 () Bool)

(assert (=> b!1528363 m!1411195))

(assert (=> b!1528355 m!1411167))

(declare-fun m!1411197 () Bool)

(assert (=> b!1528355 m!1411197))

(declare-fun m!1411199 () Bool)

(assert (=> b!1528355 m!1411199))

(declare-fun m!1411201 () Bool)

(assert (=> b!1528355 m!1411201))

(assert (=> b!1528352 m!1411167))

(declare-fun m!1411203 () Bool)

(assert (=> b!1528352 m!1411203))

(assert (=> b!1528352 m!1411167))

(declare-fun m!1411205 () Bool)

(assert (=> b!1528352 m!1411205))

(declare-fun m!1411207 () Bool)

(assert (=> b!1528352 m!1411207))

(assert (=> b!1528352 m!1411167))

(declare-fun m!1411209 () Bool)

(assert (=> b!1528352 m!1411209))

(declare-fun m!1411211 () Bool)

(assert (=> b!1528354 m!1411211))

(assert (=> b!1528354 m!1411211))

(declare-fun m!1411213 () Bool)

(assert (=> b!1528354 m!1411213))

(push 1)

