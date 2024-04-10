; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130064 () Bool)

(assert start!130064)

(declare-fun b!1526230 () Bool)

(declare-fun e!850729 () Bool)

(declare-fun e!850730 () Bool)

(assert (=> b!1526230 (= e!850729 e!850730)))

(declare-fun res!1044267 () Bool)

(assert (=> b!1526230 (=> (not res!1044267) (not e!850730))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101477 0))(
  ( (array!101478 (arr!48965 (Array (_ BitVec 32) (_ BitVec 64))) (size!49515 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101477)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13130 0))(
  ( (MissingZero!13130 (index!54915 (_ BitVec 32))) (Found!13130 (index!54916 (_ BitVec 32))) (Intermediate!13130 (undefined!13942 Bool) (index!54917 (_ BitVec 32)) (x!136616 (_ BitVec 32))) (Undefined!13130) (MissingVacant!13130 (index!54918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101477 (_ BitVec 32)) SeekEntryResult!13130)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101477 (_ BitVec 32)) SeekEntryResult!13130)

(assert (=> b!1526230 (= res!1044267 (= (seekEntryOrOpen!0 (select (arr!48965 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48965 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526231 () Bool)

(declare-fun res!1044264 () Bool)

(declare-fun e!850726 () Bool)

(assert (=> b!1526231 (=> (not res!1044264) (not e!850726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526231 (= res!1044264 (validKeyInArray!0 (select (arr!48965 a!2804) j!70)))))

(declare-fun b!1526232 () Bool)

(declare-fun res!1044271 () Bool)

(declare-fun e!850727 () Bool)

(assert (=> b!1526232 (=> (not res!1044271) (not e!850727))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101477 (_ BitVec 32)) SeekEntryResult!13130)

(assert (=> b!1526232 (= res!1044271 (= (seekEntry!0 (select (arr!48965 a!2804) j!70) a!2804 mask!2512) (Found!13130 j!70)))))

(declare-fun b!1526233 () Bool)

(declare-fun e!850731 () Bool)

(assert (=> b!1526233 (= e!850726 e!850731)))

(declare-fun res!1044276 () Bool)

(assert (=> b!1526233 (=> (not res!1044276) (not e!850731))))

(declare-fun lt!661003 () SeekEntryResult!13130)

(declare-fun lt!661002 () SeekEntryResult!13130)

(assert (=> b!1526233 (= res!1044276 (= lt!661003 lt!661002))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526233 (= lt!661002 (Intermediate!13130 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101477 (_ BitVec 32)) SeekEntryResult!13130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526233 (= lt!661003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48965 a!2804) j!70) mask!2512) (select (arr!48965 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526234 () Bool)

(declare-fun res!1044275 () Bool)

(assert (=> b!1526234 (=> (not res!1044275) (not e!850731))))

(assert (=> b!1526234 (= res!1044275 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48965 a!2804) j!70) a!2804 mask!2512) lt!661002))))

(declare-fun b!1526235 () Bool)

(assert (=> b!1526235 (= e!850727 e!850729)))

(declare-fun res!1044268 () Bool)

(assert (=> b!1526235 (=> res!1044268 e!850729)))

(declare-fun lt!660999 () (_ BitVec 64))

(assert (=> b!1526235 (= res!1044268 (or (not (= (select (arr!48965 a!2804) j!70) lt!660999)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48965 a!2804) index!487) (select (arr!48965 a!2804) j!70)) (not (= (select (arr!48965 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!661001 () array!101477)

(declare-fun b!1526236 () Bool)

(assert (=> b!1526236 (= e!850730 (= (seekEntryOrOpen!0 lt!660999 lt!661001 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660999 lt!661001 mask!2512)))))

(declare-fun b!1526237 () Bool)

(declare-fun e!850728 () Bool)

(assert (=> b!1526237 (= e!850731 e!850728)))

(declare-fun res!1044272 () Bool)

(assert (=> b!1526237 (=> (not res!1044272) (not e!850728))))

(assert (=> b!1526237 (= res!1044272 (= lt!661003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660999 mask!2512) lt!660999 lt!661001 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526237 (= lt!660999 (select (store (arr!48965 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526237 (= lt!661001 (array!101478 (store (arr!48965 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49515 a!2804)))))

(declare-fun b!1526238 () Bool)

(declare-fun res!1044266 () Bool)

(assert (=> b!1526238 (=> (not res!1044266) (not e!850726))))

(assert (=> b!1526238 (= res!1044266 (and (= (size!49515 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49515 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49515 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526239 () Bool)

(declare-fun res!1044270 () Bool)

(assert (=> b!1526239 (=> (not res!1044270) (not e!850726))))

(assert (=> b!1526239 (= res!1044270 (validKeyInArray!0 (select (arr!48965 a!2804) i!961)))))

(declare-fun b!1526240 () Bool)

(declare-fun res!1044269 () Bool)

(assert (=> b!1526240 (=> (not res!1044269) (not e!850726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101477 (_ BitVec 32)) Bool)

(assert (=> b!1526240 (= res!1044269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526242 () Bool)

(declare-fun res!1044277 () Bool)

(assert (=> b!1526242 (=> (not res!1044277) (not e!850726))))

(assert (=> b!1526242 (= res!1044277 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49515 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49515 a!2804))))))

(declare-fun b!1526243 () Bool)

(assert (=> b!1526243 (= e!850728 (not true))))

(assert (=> b!1526243 e!850727))

(declare-fun res!1044274 () Bool)

(assert (=> b!1526243 (=> (not res!1044274) (not e!850727))))

(assert (=> b!1526243 (= res!1044274 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51044 0))(
  ( (Unit!51045) )
))
(declare-fun lt!661000 () Unit!51044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51044)

(assert (=> b!1526243 (= lt!661000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1044265 () Bool)

(assert (=> start!130064 (=> (not res!1044265) (not e!850726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130064 (= res!1044265 (validMask!0 mask!2512))))

(assert (=> start!130064 e!850726))

(assert (=> start!130064 true))

(declare-fun array_inv!37993 (array!101477) Bool)

(assert (=> start!130064 (array_inv!37993 a!2804)))

(declare-fun b!1526241 () Bool)

(declare-fun res!1044273 () Bool)

(assert (=> b!1526241 (=> (not res!1044273) (not e!850726))))

(declare-datatypes ((List!35448 0))(
  ( (Nil!35445) (Cons!35444 (h!36877 (_ BitVec 64)) (t!50142 List!35448)) )
))
(declare-fun arrayNoDuplicates!0 (array!101477 (_ BitVec 32) List!35448) Bool)

(assert (=> b!1526241 (= res!1044273 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35445))))

(assert (= (and start!130064 res!1044265) b!1526238))

(assert (= (and b!1526238 res!1044266) b!1526239))

(assert (= (and b!1526239 res!1044270) b!1526231))

(assert (= (and b!1526231 res!1044264) b!1526240))

(assert (= (and b!1526240 res!1044269) b!1526241))

(assert (= (and b!1526241 res!1044273) b!1526242))

(assert (= (and b!1526242 res!1044277) b!1526233))

(assert (= (and b!1526233 res!1044276) b!1526234))

(assert (= (and b!1526234 res!1044275) b!1526237))

(assert (= (and b!1526237 res!1044272) b!1526243))

(assert (= (and b!1526243 res!1044274) b!1526232))

(assert (= (and b!1526232 res!1044271) b!1526235))

(assert (= (and b!1526235 (not res!1044268)) b!1526230))

(assert (= (and b!1526230 res!1044267) b!1526236))

(declare-fun m!1409013 () Bool)

(assert (=> b!1526237 m!1409013))

(assert (=> b!1526237 m!1409013))

(declare-fun m!1409015 () Bool)

(assert (=> b!1526237 m!1409015))

(declare-fun m!1409017 () Bool)

(assert (=> b!1526237 m!1409017))

(declare-fun m!1409019 () Bool)

(assert (=> b!1526237 m!1409019))

(declare-fun m!1409021 () Bool)

(assert (=> b!1526240 m!1409021))

(declare-fun m!1409023 () Bool)

(assert (=> b!1526236 m!1409023))

(declare-fun m!1409025 () Bool)

(assert (=> b!1526236 m!1409025))

(declare-fun m!1409027 () Bool)

(assert (=> start!130064 m!1409027))

(declare-fun m!1409029 () Bool)

(assert (=> start!130064 m!1409029))

(declare-fun m!1409031 () Bool)

(assert (=> b!1526232 m!1409031))

(assert (=> b!1526232 m!1409031))

(declare-fun m!1409033 () Bool)

(assert (=> b!1526232 m!1409033))

(declare-fun m!1409035 () Bool)

(assert (=> b!1526243 m!1409035))

(declare-fun m!1409037 () Bool)

(assert (=> b!1526243 m!1409037))

(assert (=> b!1526231 m!1409031))

(assert (=> b!1526231 m!1409031))

(declare-fun m!1409039 () Bool)

(assert (=> b!1526231 m!1409039))

(declare-fun m!1409041 () Bool)

(assert (=> b!1526241 m!1409041))

(assert (=> b!1526230 m!1409031))

(assert (=> b!1526230 m!1409031))

(declare-fun m!1409043 () Bool)

(assert (=> b!1526230 m!1409043))

(assert (=> b!1526230 m!1409031))

(declare-fun m!1409045 () Bool)

(assert (=> b!1526230 m!1409045))

(declare-fun m!1409047 () Bool)

(assert (=> b!1526239 m!1409047))

(assert (=> b!1526239 m!1409047))

(declare-fun m!1409049 () Bool)

(assert (=> b!1526239 m!1409049))

(assert (=> b!1526235 m!1409031))

(declare-fun m!1409051 () Bool)

(assert (=> b!1526235 m!1409051))

(assert (=> b!1526233 m!1409031))

(assert (=> b!1526233 m!1409031))

(declare-fun m!1409053 () Bool)

(assert (=> b!1526233 m!1409053))

(assert (=> b!1526233 m!1409053))

(assert (=> b!1526233 m!1409031))

(declare-fun m!1409055 () Bool)

(assert (=> b!1526233 m!1409055))

(assert (=> b!1526234 m!1409031))

(assert (=> b!1526234 m!1409031))

(declare-fun m!1409057 () Bool)

(assert (=> b!1526234 m!1409057))

(push 1)

