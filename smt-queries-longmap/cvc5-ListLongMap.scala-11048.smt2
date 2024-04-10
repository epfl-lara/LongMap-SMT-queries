; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129120 () Bool)

(assert start!129120)

(declare-fun b!1515158 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100976 0))(
  ( (array!100977 (arr!48725 (Array (_ BitVec 32) (_ BitVec 64))) (size!49275 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100976)

(declare-fun e!845539 () Bool)

(declare-datatypes ((SeekEntryResult!12896 0))(
  ( (MissingZero!12896 (index!53979 (_ BitVec 32))) (Found!12896 (index!53980 (_ BitVec 32))) (Intermediate!12896 (undefined!13708 Bool) (index!53981 (_ BitVec 32)) (x!135686 (_ BitVec 32))) (Undefined!12896) (MissingVacant!12896 (index!53982 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100976 (_ BitVec 32)) SeekEntryResult!12896)

(assert (=> b!1515158 (= e!845539 (= (seekEntry!0 (select (arr!48725 a!2804) j!70) a!2804 mask!2512) (Found!12896 j!70)))))

(declare-fun b!1515159 () Bool)

(declare-fun e!845537 () Bool)

(declare-fun e!845533 () Bool)

(assert (=> b!1515159 (= e!845537 e!845533)))

(declare-fun res!1035072 () Bool)

(assert (=> b!1515159 (=> (not res!1035072) (not e!845533))))

(declare-fun lt!656653 () SeekEntryResult!12896)

(declare-fun lt!656651 () SeekEntryResult!12896)

(assert (=> b!1515159 (= res!1035072 (= lt!656653 lt!656651))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515159 (= lt!656651 (Intermediate!12896 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100976 (_ BitVec 32)) SeekEntryResult!12896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515159 (= lt!656653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48725 a!2804) j!70) mask!2512) (select (arr!48725 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035070 () Bool)

(assert (=> start!129120 (=> (not res!1035070) (not e!845537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129120 (= res!1035070 (validMask!0 mask!2512))))

(assert (=> start!129120 e!845537))

(assert (=> start!129120 true))

(declare-fun array_inv!37753 (array!100976) Bool)

(assert (=> start!129120 (array_inv!37753 a!2804)))

(declare-fun b!1515160 () Bool)

(declare-fun res!1035063 () Bool)

(assert (=> b!1515160 (=> (not res!1035063) (not e!845533))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515160 (= res!1035063 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48725 a!2804) j!70) a!2804 mask!2512) lt!656651))))

(declare-fun b!1515161 () Bool)

(declare-fun e!845534 () Bool)

(declare-fun e!845538 () Bool)

(assert (=> b!1515161 (= e!845534 e!845538)))

(declare-fun res!1035065 () Bool)

(assert (=> b!1515161 (=> res!1035065 e!845538)))

(declare-fun lt!656657 () SeekEntryResult!12896)

(assert (=> b!1515161 (= res!1035065 (not (= lt!656657 (Found!12896 j!70))))))

(declare-fun lt!656656 () SeekEntryResult!12896)

(declare-fun lt!656655 () SeekEntryResult!12896)

(assert (=> b!1515161 (= lt!656656 lt!656655)))

(declare-fun lt!656658 () (_ BitVec 64))

(declare-fun lt!656659 () array!100976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100976 (_ BitVec 32)) SeekEntryResult!12896)

(assert (=> b!1515161 (= lt!656655 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656658 lt!656659 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100976 (_ BitVec 32)) SeekEntryResult!12896)

(assert (=> b!1515161 (= lt!656656 (seekEntryOrOpen!0 lt!656658 lt!656659 mask!2512))))

(declare-fun lt!656654 () SeekEntryResult!12896)

(assert (=> b!1515161 (= lt!656654 lt!656657)))

(assert (=> b!1515161 (= lt!656657 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48725 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515161 (= lt!656654 (seekEntryOrOpen!0 (select (arr!48725 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515162 () Bool)

(declare-fun e!845536 () Bool)

(assert (=> b!1515162 (= e!845533 e!845536)))

(declare-fun res!1035064 () Bool)

(assert (=> b!1515162 (=> (not res!1035064) (not e!845536))))

(assert (=> b!1515162 (= res!1035064 (= lt!656653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656658 mask!2512) lt!656658 lt!656659 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515162 (= lt!656658 (select (store (arr!48725 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515162 (= lt!656659 (array!100977 (store (arr!48725 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49275 a!2804)))))

(declare-fun b!1515163 () Bool)

(declare-fun res!1035073 () Bool)

(assert (=> b!1515163 (=> (not res!1035073) (not e!845537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100976 (_ BitVec 32)) Bool)

(assert (=> b!1515163 (= res!1035073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515164 () Bool)

(declare-fun res!1035071 () Bool)

(assert (=> b!1515164 (=> (not res!1035071) (not e!845537))))

(assert (=> b!1515164 (= res!1035071 (and (= (size!49275 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49275 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49275 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515165 () Bool)

(declare-fun res!1035068 () Bool)

(assert (=> b!1515165 (=> (not res!1035068) (not e!845537))))

(assert (=> b!1515165 (= res!1035068 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49275 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49275 a!2804))))))

(declare-fun b!1515166 () Bool)

(declare-fun res!1035061 () Bool)

(assert (=> b!1515166 (=> (not res!1035061) (not e!845537))))

(declare-datatypes ((List!35208 0))(
  ( (Nil!35205) (Cons!35204 (h!36616 (_ BitVec 64)) (t!49902 List!35208)) )
))
(declare-fun arrayNoDuplicates!0 (array!100976 (_ BitVec 32) List!35208) Bool)

(assert (=> b!1515166 (= res!1035061 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35205))))

(declare-fun b!1515167 () Bool)

(declare-fun res!1035067 () Bool)

(assert (=> b!1515167 (=> (not res!1035067) (not e!845537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515167 (= res!1035067 (validKeyInArray!0 (select (arr!48725 a!2804) j!70)))))

(declare-fun b!1515168 () Bool)

(assert (=> b!1515168 (= e!845536 (not e!845534))))

(declare-fun res!1035069 () Bool)

(assert (=> b!1515168 (=> res!1035069 e!845534)))

(assert (=> b!1515168 (= res!1035069 (or (not (= (select (arr!48725 a!2804) j!70) lt!656658)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48725 a!2804) index!487) (select (arr!48725 a!2804) j!70)) (not (= (select (arr!48725 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515168 e!845539))

(declare-fun res!1035066 () Bool)

(assert (=> b!1515168 (=> (not res!1035066) (not e!845539))))

(assert (=> b!1515168 (= res!1035066 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50660 0))(
  ( (Unit!50661) )
))
(declare-fun lt!656650 () Unit!50660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50660)

(assert (=> b!1515168 (= lt!656650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515169 () Bool)

(assert (=> b!1515169 (= e!845538 (bvsge mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515169 (= lt!656655 lt!656657)))

(declare-fun lt!656652 () Unit!50660)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50660)

(assert (=> b!1515169 (= lt!656652 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515170 () Bool)

(declare-fun res!1035062 () Bool)

(assert (=> b!1515170 (=> (not res!1035062) (not e!845537))))

(assert (=> b!1515170 (= res!1035062 (validKeyInArray!0 (select (arr!48725 a!2804) i!961)))))

(assert (= (and start!129120 res!1035070) b!1515164))

(assert (= (and b!1515164 res!1035071) b!1515170))

(assert (= (and b!1515170 res!1035062) b!1515167))

(assert (= (and b!1515167 res!1035067) b!1515163))

(assert (= (and b!1515163 res!1035073) b!1515166))

(assert (= (and b!1515166 res!1035061) b!1515165))

(assert (= (and b!1515165 res!1035068) b!1515159))

(assert (= (and b!1515159 res!1035072) b!1515160))

(assert (= (and b!1515160 res!1035063) b!1515162))

(assert (= (and b!1515162 res!1035064) b!1515168))

(assert (= (and b!1515168 res!1035066) b!1515158))

(assert (= (and b!1515168 (not res!1035069)) b!1515161))

(assert (= (and b!1515161 (not res!1035065)) b!1515169))

(declare-fun m!1398199 () Bool)

(assert (=> b!1515160 m!1398199))

(assert (=> b!1515160 m!1398199))

(declare-fun m!1398201 () Bool)

(assert (=> b!1515160 m!1398201))

(assert (=> b!1515167 m!1398199))

(assert (=> b!1515167 m!1398199))

(declare-fun m!1398203 () Bool)

(assert (=> b!1515167 m!1398203))

(declare-fun m!1398205 () Bool)

(assert (=> b!1515163 m!1398205))

(assert (=> b!1515168 m!1398199))

(declare-fun m!1398207 () Bool)

(assert (=> b!1515168 m!1398207))

(declare-fun m!1398209 () Bool)

(assert (=> b!1515168 m!1398209))

(declare-fun m!1398211 () Bool)

(assert (=> b!1515168 m!1398211))

(declare-fun m!1398213 () Bool)

(assert (=> b!1515169 m!1398213))

(declare-fun m!1398215 () Bool)

(assert (=> b!1515166 m!1398215))

(declare-fun m!1398217 () Bool)

(assert (=> start!129120 m!1398217))

(declare-fun m!1398219 () Bool)

(assert (=> start!129120 m!1398219))

(assert (=> b!1515158 m!1398199))

(assert (=> b!1515158 m!1398199))

(declare-fun m!1398221 () Bool)

(assert (=> b!1515158 m!1398221))

(declare-fun m!1398223 () Bool)

(assert (=> b!1515170 m!1398223))

(assert (=> b!1515170 m!1398223))

(declare-fun m!1398225 () Bool)

(assert (=> b!1515170 m!1398225))

(assert (=> b!1515159 m!1398199))

(assert (=> b!1515159 m!1398199))

(declare-fun m!1398227 () Bool)

(assert (=> b!1515159 m!1398227))

(assert (=> b!1515159 m!1398227))

(assert (=> b!1515159 m!1398199))

(declare-fun m!1398229 () Bool)

(assert (=> b!1515159 m!1398229))

(assert (=> b!1515161 m!1398199))

(declare-fun m!1398231 () Bool)

(assert (=> b!1515161 m!1398231))

(assert (=> b!1515161 m!1398199))

(assert (=> b!1515161 m!1398199))

(declare-fun m!1398233 () Bool)

(assert (=> b!1515161 m!1398233))

(declare-fun m!1398235 () Bool)

(assert (=> b!1515161 m!1398235))

(declare-fun m!1398237 () Bool)

(assert (=> b!1515161 m!1398237))

(declare-fun m!1398239 () Bool)

(assert (=> b!1515162 m!1398239))

(assert (=> b!1515162 m!1398239))

(declare-fun m!1398241 () Bool)

(assert (=> b!1515162 m!1398241))

(declare-fun m!1398243 () Bool)

(assert (=> b!1515162 m!1398243))

(declare-fun m!1398245 () Bool)

(assert (=> b!1515162 m!1398245))

(push 1)

