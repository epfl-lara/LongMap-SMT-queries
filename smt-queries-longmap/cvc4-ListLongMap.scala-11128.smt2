; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130068 () Bool)

(assert start!130068)

(declare-fun e!850770 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101481 0))(
  ( (array!101482 (arr!48967 (Array (_ BitVec 32) (_ BitVec 64))) (size!49517 (_ BitVec 32))) )
))
(declare-fun lt!661031 () array!101481)

(declare-fun lt!661029 () (_ BitVec 64))

(declare-fun b!1526314 () Bool)

(declare-datatypes ((SeekEntryResult!13132 0))(
  ( (MissingZero!13132 (index!54923 (_ BitVec 32))) (Found!13132 (index!54924 (_ BitVec 32))) (Intermediate!13132 (undefined!13944 Bool) (index!54925 (_ BitVec 32)) (x!136618 (_ BitVec 32))) (Undefined!13132) (MissingVacant!13132 (index!54926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101481 (_ BitVec 32)) SeekEntryResult!13132)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101481 (_ BitVec 32)) SeekEntryResult!13132)

(assert (=> b!1526314 (= e!850770 (= (seekEntryOrOpen!0 lt!661029 lt!661031 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661029 lt!661031 mask!2512)))))

(declare-fun b!1526315 () Bool)

(declare-fun res!1044352 () Bool)

(declare-fun e!850773 () Bool)

(assert (=> b!1526315 (=> (not res!1044352) (not e!850773))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101481)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101481 (_ BitVec 32)) SeekEntryResult!13132)

(assert (=> b!1526315 (= res!1044352 (= (seekEntry!0 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) (Found!13132 j!70)))))

(declare-fun res!1044358 () Bool)

(declare-fun e!850769 () Bool)

(assert (=> start!130068 (=> (not res!1044358) (not e!850769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130068 (= res!1044358 (validMask!0 mask!2512))))

(assert (=> start!130068 e!850769))

(assert (=> start!130068 true))

(declare-fun array_inv!37995 (array!101481) Bool)

(assert (=> start!130068 (array_inv!37995 a!2804)))

(declare-fun b!1526316 () Bool)

(declare-fun e!850774 () Bool)

(assert (=> b!1526316 (= e!850769 e!850774)))

(declare-fun res!1044353 () Bool)

(assert (=> b!1526316 (=> (not res!1044353) (not e!850774))))

(declare-fun lt!661033 () SeekEntryResult!13132)

(declare-fun lt!661030 () SeekEntryResult!13132)

(assert (=> b!1526316 (= res!1044353 (= lt!661033 lt!661030))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526316 (= lt!661030 (Intermediate!13132 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101481 (_ BitVec 32)) SeekEntryResult!13132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526316 (= lt!661033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48967 a!2804) j!70) mask!2512) (select (arr!48967 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526317 () Bool)

(declare-fun e!850772 () Bool)

(assert (=> b!1526317 (= e!850773 e!850772)))

(declare-fun res!1044361 () Bool)

(assert (=> b!1526317 (=> res!1044361 e!850772)))

(assert (=> b!1526317 (= res!1044361 (or (not (= (select (arr!48967 a!2804) j!70) lt!661029)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48967 a!2804) index!487) (select (arr!48967 a!2804) j!70)) (not (= (select (arr!48967 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526318 () Bool)

(assert (=> b!1526318 (= e!850772 e!850770)))

(declare-fun res!1044355 () Bool)

(assert (=> b!1526318 (=> (not res!1044355) (not e!850770))))

(assert (=> b!1526318 (= res!1044355 (= (seekEntryOrOpen!0 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48967 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526319 () Bool)

(declare-fun e!850771 () Bool)

(assert (=> b!1526319 (= e!850774 e!850771)))

(declare-fun res!1044360 () Bool)

(assert (=> b!1526319 (=> (not res!1044360) (not e!850771))))

(assert (=> b!1526319 (= res!1044360 (= lt!661033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661029 mask!2512) lt!661029 lt!661031 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526319 (= lt!661029 (select (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526319 (= lt!661031 (array!101482 (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49517 a!2804)))))

(declare-fun b!1526320 () Bool)

(declare-fun res!1044356 () Bool)

(assert (=> b!1526320 (=> (not res!1044356) (not e!850769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101481 (_ BitVec 32)) Bool)

(assert (=> b!1526320 (= res!1044356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526321 () Bool)

(declare-fun res!1044348 () Bool)

(assert (=> b!1526321 (=> (not res!1044348) (not e!850769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526321 (= res!1044348 (validKeyInArray!0 (select (arr!48967 a!2804) i!961)))))

(declare-fun b!1526322 () Bool)

(declare-fun res!1044357 () Bool)

(assert (=> b!1526322 (=> (not res!1044357) (not e!850769))))

(assert (=> b!1526322 (= res!1044357 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49517 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49517 a!2804))))))

(declare-fun b!1526323 () Bool)

(declare-fun res!1044350 () Bool)

(assert (=> b!1526323 (=> (not res!1044350) (not e!850769))))

(declare-datatypes ((List!35450 0))(
  ( (Nil!35447) (Cons!35446 (h!36879 (_ BitVec 64)) (t!50144 List!35450)) )
))
(declare-fun arrayNoDuplicates!0 (array!101481 (_ BitVec 32) List!35450) Bool)

(assert (=> b!1526323 (= res!1044350 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35447))))

(declare-fun b!1526324 () Bool)

(declare-fun res!1044351 () Bool)

(assert (=> b!1526324 (=> (not res!1044351) (not e!850769))))

(assert (=> b!1526324 (= res!1044351 (and (= (size!49517 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49517 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49517 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526325 () Bool)

(declare-fun res!1044359 () Bool)

(assert (=> b!1526325 (=> (not res!1044359) (not e!850769))))

(assert (=> b!1526325 (= res!1044359 (validKeyInArray!0 (select (arr!48967 a!2804) j!70)))))

(declare-fun b!1526326 () Bool)

(assert (=> b!1526326 (= e!850771 (not true))))

(assert (=> b!1526326 e!850773))

(declare-fun res!1044349 () Bool)

(assert (=> b!1526326 (=> (not res!1044349) (not e!850773))))

(assert (=> b!1526326 (= res!1044349 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51048 0))(
  ( (Unit!51049) )
))
(declare-fun lt!661032 () Unit!51048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51048)

(assert (=> b!1526326 (= lt!661032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526327 () Bool)

(declare-fun res!1044354 () Bool)

(assert (=> b!1526327 (=> (not res!1044354) (not e!850774))))

(assert (=> b!1526327 (= res!1044354 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) lt!661030))))

(assert (= (and start!130068 res!1044358) b!1526324))

(assert (= (and b!1526324 res!1044351) b!1526321))

(assert (= (and b!1526321 res!1044348) b!1526325))

(assert (= (and b!1526325 res!1044359) b!1526320))

(assert (= (and b!1526320 res!1044356) b!1526323))

(assert (= (and b!1526323 res!1044350) b!1526322))

(assert (= (and b!1526322 res!1044357) b!1526316))

(assert (= (and b!1526316 res!1044353) b!1526327))

(assert (= (and b!1526327 res!1044354) b!1526319))

(assert (= (and b!1526319 res!1044360) b!1526326))

(assert (= (and b!1526326 res!1044349) b!1526315))

(assert (= (and b!1526315 res!1044352) b!1526317))

(assert (= (and b!1526317 (not res!1044361)) b!1526318))

(assert (= (and b!1526318 res!1044355) b!1526314))

(declare-fun m!1409105 () Bool)

(assert (=> b!1526323 m!1409105))

(declare-fun m!1409107 () Bool)

(assert (=> b!1526317 m!1409107))

(declare-fun m!1409109 () Bool)

(assert (=> b!1526317 m!1409109))

(declare-fun m!1409111 () Bool)

(assert (=> start!130068 m!1409111))

(declare-fun m!1409113 () Bool)

(assert (=> start!130068 m!1409113))

(assert (=> b!1526325 m!1409107))

(assert (=> b!1526325 m!1409107))

(declare-fun m!1409115 () Bool)

(assert (=> b!1526325 m!1409115))

(declare-fun m!1409117 () Bool)

(assert (=> b!1526314 m!1409117))

(declare-fun m!1409119 () Bool)

(assert (=> b!1526314 m!1409119))

(assert (=> b!1526327 m!1409107))

(assert (=> b!1526327 m!1409107))

(declare-fun m!1409121 () Bool)

(assert (=> b!1526327 m!1409121))

(assert (=> b!1526315 m!1409107))

(assert (=> b!1526315 m!1409107))

(declare-fun m!1409123 () Bool)

(assert (=> b!1526315 m!1409123))

(assert (=> b!1526316 m!1409107))

(assert (=> b!1526316 m!1409107))

(declare-fun m!1409125 () Bool)

(assert (=> b!1526316 m!1409125))

(assert (=> b!1526316 m!1409125))

(assert (=> b!1526316 m!1409107))

(declare-fun m!1409127 () Bool)

(assert (=> b!1526316 m!1409127))

(declare-fun m!1409129 () Bool)

(assert (=> b!1526319 m!1409129))

(assert (=> b!1526319 m!1409129))

(declare-fun m!1409131 () Bool)

(assert (=> b!1526319 m!1409131))

(declare-fun m!1409133 () Bool)

(assert (=> b!1526319 m!1409133))

(declare-fun m!1409135 () Bool)

(assert (=> b!1526319 m!1409135))

(declare-fun m!1409137 () Bool)

(assert (=> b!1526326 m!1409137))

(declare-fun m!1409139 () Bool)

(assert (=> b!1526326 m!1409139))

(declare-fun m!1409141 () Bool)

(assert (=> b!1526321 m!1409141))

(assert (=> b!1526321 m!1409141))

(declare-fun m!1409143 () Bool)

(assert (=> b!1526321 m!1409143))

(declare-fun m!1409145 () Bool)

(assert (=> b!1526320 m!1409145))

(assert (=> b!1526318 m!1409107))

(assert (=> b!1526318 m!1409107))

(declare-fun m!1409147 () Bool)

(assert (=> b!1526318 m!1409147))

(assert (=> b!1526318 m!1409107))

(declare-fun m!1409149 () Bool)

(assert (=> b!1526318 m!1409149))

(push 1)

