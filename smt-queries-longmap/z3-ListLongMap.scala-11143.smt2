; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130222 () Bool)

(assert start!130222)

(declare-fun b!1528547 () Bool)

(declare-fun e!851943 () Bool)

(declare-fun e!851942 () Bool)

(assert (=> b!1528547 (= e!851943 (not e!851942))))

(declare-fun res!1046266 () Bool)

(assert (=> b!1528547 (=> res!1046266 e!851942)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!662070 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101572 0))(
  ( (array!101573 (arr!49011 (Array (_ BitVec 32) (_ BitVec 64))) (size!49561 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101572)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528547 (= res!1046266 (or (not (= (select (arr!49011 a!2804) j!70) lt!662070)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49011 a!2804) index!487) (select (arr!49011 a!2804) j!70)) (not (= (select (arr!49011 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851944 () Bool)

(assert (=> b!1528547 e!851944))

(declare-fun res!1046262 () Bool)

(assert (=> b!1528547 (=> (not res!1046262) (not e!851944))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101572 (_ BitVec 32)) Bool)

(assert (=> b!1528547 (= res!1046262 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51136 0))(
  ( (Unit!51137) )
))
(declare-fun lt!662067 () Unit!51136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51136)

(assert (=> b!1528547 (= lt!662067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528548 () Bool)

(declare-fun res!1046261 () Bool)

(declare-fun e!851939 () Bool)

(assert (=> b!1528548 (=> (not res!1046261) (not e!851939))))

(declare-datatypes ((List!35494 0))(
  ( (Nil!35491) (Cons!35490 (h!36926 (_ BitVec 64)) (t!50188 List!35494)) )
))
(declare-fun arrayNoDuplicates!0 (array!101572 (_ BitVec 32) List!35494) Bool)

(assert (=> b!1528548 (= res!1046261 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35491))))

(declare-fun b!1528549 () Bool)

(declare-fun e!851938 () Bool)

(assert (=> b!1528549 (= e!851938 e!851943)))

(declare-fun res!1046255 () Bool)

(assert (=> b!1528549 (=> (not res!1046255) (not e!851943))))

(declare-datatypes ((SeekEntryResult!13176 0))(
  ( (MissingZero!13176 (index!55099 (_ BitVec 32))) (Found!13176 (index!55100 (_ BitVec 32))) (Intermediate!13176 (undefined!13988 Bool) (index!55101 (_ BitVec 32)) (x!136791 (_ BitVec 32))) (Undefined!13176) (MissingVacant!13176 (index!55102 (_ BitVec 32))) )
))
(declare-fun lt!662065 () SeekEntryResult!13176)

(declare-fun lt!662063 () array!101572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528549 (= res!1046255 (= lt!662065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662070 mask!2512) lt!662070 lt!662063 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528549 (= lt!662070 (select (store (arr!49011 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528549 (= lt!662063 (array!101573 (store (arr!49011 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49561 a!2804)))))

(declare-fun b!1528550 () Bool)

(declare-fun e!851941 () Bool)

(assert (=> b!1528550 (= e!851942 e!851941)))

(declare-fun res!1046259 () Bool)

(assert (=> b!1528550 (=> res!1046259 e!851941)))

(declare-fun lt!662071 () SeekEntryResult!13176)

(assert (=> b!1528550 (= res!1046259 (not (= lt!662071 (Found!13176 j!70))))))

(declare-fun lt!662069 () SeekEntryResult!13176)

(declare-fun lt!662062 () SeekEntryResult!13176)

(assert (=> b!1528550 (= lt!662069 lt!662062)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528550 (= lt!662062 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662070 lt!662063 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528550 (= lt!662069 (seekEntryOrOpen!0 lt!662070 lt!662063 mask!2512))))

(declare-fun lt!662066 () SeekEntryResult!13176)

(assert (=> b!1528550 (= lt!662066 lt!662071)))

(assert (=> b!1528550 (= lt!662071 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49011 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528550 (= lt!662066 (seekEntryOrOpen!0 (select (arr!49011 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528551 () Bool)

(declare-fun res!1046264 () Bool)

(assert (=> b!1528551 (=> (not res!1046264) (not e!851938))))

(declare-fun lt!662064 () SeekEntryResult!13176)

(assert (=> b!1528551 (= res!1046264 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49011 a!2804) j!70) a!2804 mask!2512) lt!662064))))

(declare-fun b!1528552 () Bool)

(assert (=> b!1528552 (= e!851941 true)))

(assert (=> b!1528552 (= lt!662062 lt!662071)))

(declare-fun lt!662068 () Unit!51136)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51136)

(assert (=> b!1528552 (= lt!662068 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528553 () Bool)

(declare-fun res!1046258 () Bool)

(assert (=> b!1528553 (=> (not res!1046258) (not e!851939))))

(assert (=> b!1528553 (= res!1046258 (and (= (size!49561 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49561 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49561 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528554 () Bool)

(declare-fun res!1046257 () Bool)

(assert (=> b!1528554 (=> (not res!1046257) (not e!851939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528554 (= res!1046257 (validKeyInArray!0 (select (arr!49011 a!2804) j!70)))))

(declare-fun b!1528555 () Bool)

(assert (=> b!1528555 (= e!851939 e!851938)))

(declare-fun res!1046260 () Bool)

(assert (=> b!1528555 (=> (not res!1046260) (not e!851938))))

(assert (=> b!1528555 (= res!1046260 (= lt!662065 lt!662064))))

(assert (=> b!1528555 (= lt!662064 (Intermediate!13176 false resIndex!21 resX!21))))

(assert (=> b!1528555 (= lt!662065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49011 a!2804) j!70) mask!2512) (select (arr!49011 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528556 () Bool)

(declare-fun res!1046254 () Bool)

(assert (=> b!1528556 (=> (not res!1046254) (not e!851939))))

(assert (=> b!1528556 (= res!1046254 (validKeyInArray!0 (select (arr!49011 a!2804) i!961)))))

(declare-fun b!1528557 () Bool)

(declare-fun res!1046263 () Bool)

(assert (=> b!1528557 (=> (not res!1046263) (not e!851939))))

(assert (=> b!1528557 (= res!1046263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1046256 () Bool)

(assert (=> start!130222 (=> (not res!1046256) (not e!851939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130222 (= res!1046256 (validMask!0 mask!2512))))

(assert (=> start!130222 e!851939))

(assert (=> start!130222 true))

(declare-fun array_inv!38039 (array!101572) Bool)

(assert (=> start!130222 (array_inv!38039 a!2804)))

(declare-fun b!1528558 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528558 (= e!851944 (= (seekEntry!0 (select (arr!49011 a!2804) j!70) a!2804 mask!2512) (Found!13176 j!70)))))

(declare-fun b!1528559 () Bool)

(declare-fun res!1046265 () Bool)

(assert (=> b!1528559 (=> (not res!1046265) (not e!851939))))

(assert (=> b!1528559 (= res!1046265 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49561 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49561 a!2804))))))

(assert (= (and start!130222 res!1046256) b!1528553))

(assert (= (and b!1528553 res!1046258) b!1528556))

(assert (= (and b!1528556 res!1046254) b!1528554))

(assert (= (and b!1528554 res!1046257) b!1528557))

(assert (= (and b!1528557 res!1046263) b!1528548))

(assert (= (and b!1528548 res!1046261) b!1528559))

(assert (= (and b!1528559 res!1046265) b!1528555))

(assert (= (and b!1528555 res!1046260) b!1528551))

(assert (= (and b!1528551 res!1046264) b!1528549))

(assert (= (and b!1528549 res!1046255) b!1528547))

(assert (= (and b!1528547 res!1046262) b!1528558))

(assert (= (and b!1528547 (not res!1046266)) b!1528550))

(assert (= (and b!1528550 (not res!1046259)) b!1528552))

(declare-fun m!1411407 () Bool)

(assert (=> b!1528557 m!1411407))

(declare-fun m!1411409 () Bool)

(assert (=> b!1528554 m!1411409))

(assert (=> b!1528554 m!1411409))

(declare-fun m!1411411 () Bool)

(assert (=> b!1528554 m!1411411))

(declare-fun m!1411413 () Bool)

(assert (=> b!1528548 m!1411413))

(declare-fun m!1411415 () Bool)

(assert (=> start!130222 m!1411415))

(declare-fun m!1411417 () Bool)

(assert (=> start!130222 m!1411417))

(assert (=> b!1528547 m!1411409))

(declare-fun m!1411419 () Bool)

(assert (=> b!1528547 m!1411419))

(declare-fun m!1411421 () Bool)

(assert (=> b!1528547 m!1411421))

(declare-fun m!1411423 () Bool)

(assert (=> b!1528547 m!1411423))

(assert (=> b!1528555 m!1411409))

(assert (=> b!1528555 m!1411409))

(declare-fun m!1411425 () Bool)

(assert (=> b!1528555 m!1411425))

(assert (=> b!1528555 m!1411425))

(assert (=> b!1528555 m!1411409))

(declare-fun m!1411427 () Bool)

(assert (=> b!1528555 m!1411427))

(declare-fun m!1411429 () Bool)

(assert (=> b!1528556 m!1411429))

(assert (=> b!1528556 m!1411429))

(declare-fun m!1411431 () Bool)

(assert (=> b!1528556 m!1411431))

(declare-fun m!1411433 () Bool)

(assert (=> b!1528549 m!1411433))

(assert (=> b!1528549 m!1411433))

(declare-fun m!1411435 () Bool)

(assert (=> b!1528549 m!1411435))

(declare-fun m!1411437 () Bool)

(assert (=> b!1528549 m!1411437))

(declare-fun m!1411439 () Bool)

(assert (=> b!1528549 m!1411439))

(declare-fun m!1411441 () Bool)

(assert (=> b!1528552 m!1411441))

(assert (=> b!1528550 m!1411409))

(declare-fun m!1411443 () Bool)

(assert (=> b!1528550 m!1411443))

(assert (=> b!1528550 m!1411409))

(declare-fun m!1411445 () Bool)

(assert (=> b!1528550 m!1411445))

(declare-fun m!1411447 () Bool)

(assert (=> b!1528550 m!1411447))

(assert (=> b!1528550 m!1411409))

(declare-fun m!1411449 () Bool)

(assert (=> b!1528550 m!1411449))

(assert (=> b!1528551 m!1411409))

(assert (=> b!1528551 m!1411409))

(declare-fun m!1411451 () Bool)

(assert (=> b!1528551 m!1411451))

(assert (=> b!1528558 m!1411409))

(assert (=> b!1528558 m!1411409))

(declare-fun m!1411453 () Bool)

(assert (=> b!1528558 m!1411453))

(check-sat (not b!1528556) (not b!1528550) (not b!1528557) (not b!1528554) (not b!1528549) (not b!1528552) (not b!1528555) (not b!1528551) (not b!1528547) (not start!130222) (not b!1528558) (not b!1528548))
(check-sat)
