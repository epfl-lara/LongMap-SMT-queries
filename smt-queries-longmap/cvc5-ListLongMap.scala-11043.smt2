; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129090 () Bool)

(assert start!129090)

(declare-fun b!1514539 () Bool)

(declare-fun res!1034455 () Bool)

(declare-fun e!845220 () Bool)

(assert (=> b!1514539 (=> (not res!1034455) (not e!845220))))

(declare-datatypes ((array!100946 0))(
  ( (array!100947 (arr!48710 (Array (_ BitVec 32) (_ BitVec 64))) (size!49260 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100946)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514539 (= res!1034455 (validKeyInArray!0 (select (arr!48710 a!2804) j!70)))))

(declare-fun b!1514540 () Bool)

(declare-fun e!845222 () Bool)

(declare-fun e!845224 () Bool)

(assert (=> b!1514540 (= e!845222 e!845224)))

(declare-fun res!1034447 () Bool)

(assert (=> b!1514540 (=> (not res!1034447) (not e!845224))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12881 0))(
  ( (MissingZero!12881 (index!53919 (_ BitVec 32))) (Found!12881 (index!53920 (_ BitVec 32))) (Intermediate!12881 (undefined!13693 Bool) (index!53921 (_ BitVec 32)) (x!135631 (_ BitVec 32))) (Undefined!12881) (MissingVacant!12881 (index!53922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100946 (_ BitVec 32)) SeekEntryResult!12881)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100946 (_ BitVec 32)) SeekEntryResult!12881)

(assert (=> b!1514540 (= res!1034447 (= (seekEntryOrOpen!0 (select (arr!48710 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48710 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514541 () Bool)

(declare-fun lt!656372 () (_ BitVec 64))

(declare-fun lt!656374 () array!100946)

(assert (=> b!1514541 (= e!845224 (= (seekEntryOrOpen!0 lt!656372 lt!656374 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656372 lt!656374 mask!2512)))))

(declare-fun b!1514542 () Bool)

(declare-fun e!845219 () Bool)

(assert (=> b!1514542 (= e!845219 (not true))))

(declare-fun e!845218 () Bool)

(assert (=> b!1514542 e!845218))

(declare-fun res!1034446 () Bool)

(assert (=> b!1514542 (=> (not res!1034446) (not e!845218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100946 (_ BitVec 32)) Bool)

(assert (=> b!1514542 (= res!1034446 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50630 0))(
  ( (Unit!50631) )
))
(declare-fun lt!656371 () Unit!50630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50630)

(assert (=> b!1514542 (= lt!656371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514543 () Bool)

(declare-fun e!845223 () Bool)

(assert (=> b!1514543 (= e!845220 e!845223)))

(declare-fun res!1034451 () Bool)

(assert (=> b!1514543 (=> (not res!1034451) (not e!845223))))

(declare-fun lt!656370 () SeekEntryResult!12881)

(declare-fun lt!656373 () SeekEntryResult!12881)

(assert (=> b!1514543 (= res!1034451 (= lt!656370 lt!656373))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514543 (= lt!656373 (Intermediate!12881 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100946 (_ BitVec 32)) SeekEntryResult!12881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514543 (= lt!656370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48710 a!2804) j!70) mask!2512) (select (arr!48710 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514544 () Bool)

(declare-fun res!1034453 () Bool)

(assert (=> b!1514544 (=> (not res!1034453) (not e!845220))))

(declare-datatypes ((List!35193 0))(
  ( (Nil!35190) (Cons!35189 (h!36601 (_ BitVec 64)) (t!49887 List!35193)) )
))
(declare-fun arrayNoDuplicates!0 (array!100946 (_ BitVec 32) List!35193) Bool)

(assert (=> b!1514544 (= res!1034453 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35190))))

(declare-fun res!1034454 () Bool)

(assert (=> start!129090 (=> (not res!1034454) (not e!845220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129090 (= res!1034454 (validMask!0 mask!2512))))

(assert (=> start!129090 e!845220))

(assert (=> start!129090 true))

(declare-fun array_inv!37738 (array!100946) Bool)

(assert (=> start!129090 (array_inv!37738 a!2804)))

(declare-fun b!1514545 () Bool)

(declare-fun res!1034442 () Bool)

(assert (=> b!1514545 (=> (not res!1034442) (not e!845220))))

(assert (=> b!1514545 (= res!1034442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514546 () Bool)

(declare-fun res!1034443 () Bool)

(assert (=> b!1514546 (=> (not res!1034443) (not e!845220))))

(assert (=> b!1514546 (= res!1034443 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49260 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49260 a!2804))))))

(declare-fun b!1514547 () Bool)

(declare-fun res!1034449 () Bool)

(assert (=> b!1514547 (=> (not res!1034449) (not e!845223))))

(assert (=> b!1514547 (= res!1034449 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48710 a!2804) j!70) a!2804 mask!2512) lt!656373))))

(declare-fun b!1514548 () Bool)

(declare-fun res!1034452 () Bool)

(assert (=> b!1514548 (=> (not res!1034452) (not e!845220))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514548 (= res!1034452 (validKeyInArray!0 (select (arr!48710 a!2804) i!961)))))

(declare-fun b!1514549 () Bool)

(assert (=> b!1514549 (= e!845218 e!845222)))

(declare-fun res!1034450 () Bool)

(assert (=> b!1514549 (=> res!1034450 e!845222)))

(assert (=> b!1514549 (= res!1034450 (or (not (= (select (arr!48710 a!2804) j!70) lt!656372)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48710 a!2804) index!487) (select (arr!48710 a!2804) j!70)) (not (= (select (arr!48710 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514550 () Bool)

(declare-fun res!1034448 () Bool)

(assert (=> b!1514550 (=> (not res!1034448) (not e!845218))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100946 (_ BitVec 32)) SeekEntryResult!12881)

(assert (=> b!1514550 (= res!1034448 (= (seekEntry!0 (select (arr!48710 a!2804) j!70) a!2804 mask!2512) (Found!12881 j!70)))))

(declare-fun b!1514551 () Bool)

(declare-fun res!1034445 () Bool)

(assert (=> b!1514551 (=> (not res!1034445) (not e!845220))))

(assert (=> b!1514551 (= res!1034445 (and (= (size!49260 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49260 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49260 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514552 () Bool)

(assert (=> b!1514552 (= e!845223 e!845219)))

(declare-fun res!1034444 () Bool)

(assert (=> b!1514552 (=> (not res!1034444) (not e!845219))))

(assert (=> b!1514552 (= res!1034444 (= lt!656370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656372 mask!2512) lt!656372 lt!656374 mask!2512)))))

(assert (=> b!1514552 (= lt!656372 (select (store (arr!48710 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514552 (= lt!656374 (array!100947 (store (arr!48710 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49260 a!2804)))))

(assert (= (and start!129090 res!1034454) b!1514551))

(assert (= (and b!1514551 res!1034445) b!1514548))

(assert (= (and b!1514548 res!1034452) b!1514539))

(assert (= (and b!1514539 res!1034455) b!1514545))

(assert (= (and b!1514545 res!1034442) b!1514544))

(assert (= (and b!1514544 res!1034453) b!1514546))

(assert (= (and b!1514546 res!1034443) b!1514543))

(assert (= (and b!1514543 res!1034451) b!1514547))

(assert (= (and b!1514547 res!1034449) b!1514552))

(assert (= (and b!1514552 res!1034444) b!1514542))

(assert (= (and b!1514542 res!1034446) b!1514550))

(assert (= (and b!1514550 res!1034448) b!1514549))

(assert (= (and b!1514549 (not res!1034450)) b!1514540))

(assert (= (and b!1514540 res!1034447) b!1514541))

(declare-fun m!1397503 () Bool)

(assert (=> b!1514544 m!1397503))

(declare-fun m!1397505 () Bool)

(assert (=> b!1514539 m!1397505))

(assert (=> b!1514539 m!1397505))

(declare-fun m!1397507 () Bool)

(assert (=> b!1514539 m!1397507))

(declare-fun m!1397509 () Bool)

(assert (=> b!1514548 m!1397509))

(assert (=> b!1514548 m!1397509))

(declare-fun m!1397511 () Bool)

(assert (=> b!1514548 m!1397511))

(assert (=> b!1514540 m!1397505))

(assert (=> b!1514540 m!1397505))

(declare-fun m!1397513 () Bool)

(assert (=> b!1514540 m!1397513))

(assert (=> b!1514540 m!1397505))

(declare-fun m!1397515 () Bool)

(assert (=> b!1514540 m!1397515))

(assert (=> b!1514543 m!1397505))

(assert (=> b!1514543 m!1397505))

(declare-fun m!1397517 () Bool)

(assert (=> b!1514543 m!1397517))

(assert (=> b!1514543 m!1397517))

(assert (=> b!1514543 m!1397505))

(declare-fun m!1397519 () Bool)

(assert (=> b!1514543 m!1397519))

(declare-fun m!1397521 () Bool)

(assert (=> b!1514542 m!1397521))

(declare-fun m!1397523 () Bool)

(assert (=> b!1514542 m!1397523))

(declare-fun m!1397525 () Bool)

(assert (=> b!1514552 m!1397525))

(assert (=> b!1514552 m!1397525))

(declare-fun m!1397527 () Bool)

(assert (=> b!1514552 m!1397527))

(declare-fun m!1397529 () Bool)

(assert (=> b!1514552 m!1397529))

(declare-fun m!1397531 () Bool)

(assert (=> b!1514552 m!1397531))

(assert (=> b!1514547 m!1397505))

(assert (=> b!1514547 m!1397505))

(declare-fun m!1397533 () Bool)

(assert (=> b!1514547 m!1397533))

(assert (=> b!1514549 m!1397505))

(declare-fun m!1397535 () Bool)

(assert (=> b!1514549 m!1397535))

(declare-fun m!1397537 () Bool)

(assert (=> start!129090 m!1397537))

(declare-fun m!1397539 () Bool)

(assert (=> start!129090 m!1397539))

(assert (=> b!1514550 m!1397505))

(assert (=> b!1514550 m!1397505))

(declare-fun m!1397541 () Bool)

(assert (=> b!1514550 m!1397541))

(declare-fun m!1397543 () Bool)

(assert (=> b!1514545 m!1397543))

(declare-fun m!1397545 () Bool)

(assert (=> b!1514541 m!1397545))

(declare-fun m!1397547 () Bool)

(assert (=> b!1514541 m!1397547))

(push 1)

