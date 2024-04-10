; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128880 () Bool)

(assert start!128880)

(declare-fun b!1510510 () Bool)

(declare-fun res!1030418 () Bool)

(declare-fun e!843485 () Bool)

(assert (=> b!1510510 (=> (not res!1030418) (not e!843485))))

(declare-datatypes ((array!100736 0))(
  ( (array!100737 (arr!48605 (Array (_ BitVec 32) (_ BitVec 64))) (size!49155 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100736)

(declare-datatypes ((List!35088 0))(
  ( (Nil!35085) (Cons!35084 (h!36496 (_ BitVec 64)) (t!49782 List!35088)) )
))
(declare-fun arrayNoDuplicates!0 (array!100736 (_ BitVec 32) List!35088) Bool)

(assert (=> b!1510510 (= res!1030418 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35085))))

(declare-fun res!1030421 () Bool)

(assert (=> start!128880 (=> (not res!1030421) (not e!843485))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128880 (= res!1030421 (validMask!0 mask!2512))))

(assert (=> start!128880 e!843485))

(assert (=> start!128880 true))

(declare-fun array_inv!37633 (array!100736) Bool)

(assert (=> start!128880 (array_inv!37633 a!2804)))

(declare-fun b!1510511 () Bool)

(declare-fun res!1030413 () Bool)

(assert (=> b!1510511 (=> (not res!1030413) (not e!843485))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510511 (= res!1030413 (validKeyInArray!0 (select (arr!48605 a!2804) i!961)))))

(declare-fun b!1510512 () Bool)

(declare-fun e!843484 () Bool)

(assert (=> b!1510512 (= e!843485 e!843484)))

(declare-fun res!1030414 () Bool)

(assert (=> b!1510512 (=> (not res!1030414) (not e!843484))))

(declare-datatypes ((SeekEntryResult!12776 0))(
  ( (MissingZero!12776 (index!53499 (_ BitVec 32))) (Found!12776 (index!53500 (_ BitVec 32))) (Intermediate!12776 (undefined!13588 Bool) (index!53501 (_ BitVec 32)) (x!135246 (_ BitVec 32))) (Undefined!12776) (MissingVacant!12776 (index!53502 (_ BitVec 32))) )
))
(declare-fun lt!655188 () SeekEntryResult!12776)

(declare-fun lt!655189 () SeekEntryResult!12776)

(assert (=> b!1510512 (= res!1030414 (= lt!655188 lt!655189))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510512 (= lt!655189 (Intermediate!12776 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100736 (_ BitVec 32)) SeekEntryResult!12776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510512 (= lt!655188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48605 a!2804) j!70) mask!2512) (select (arr!48605 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510513 () Bool)

(declare-fun res!1030416 () Bool)

(assert (=> b!1510513 (=> (not res!1030416) (not e!843485))))

(assert (=> b!1510513 (= res!1030416 (validKeyInArray!0 (select (arr!48605 a!2804) j!70)))))

(declare-fun b!1510514 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510514 (= e!843484 (not (or (not (= (select (arr!48605 a!2804) j!70) (select (store (arr!48605 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48605 a!2804) index!487) (select (arr!48605 a!2804) j!70)) (not (= (select (arr!48605 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843486 () Bool)

(assert (=> b!1510514 e!843486))

(declare-fun res!1030423 () Bool)

(assert (=> b!1510514 (=> (not res!1030423) (not e!843486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100736 (_ BitVec 32)) Bool)

(assert (=> b!1510514 (= res!1030423 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50420 0))(
  ( (Unit!50421) )
))
(declare-fun lt!655187 () Unit!50420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50420)

(assert (=> b!1510514 (= lt!655187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510515 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100736 (_ BitVec 32)) SeekEntryResult!12776)

(assert (=> b!1510515 (= e!843486 (= (seekEntry!0 (select (arr!48605 a!2804) j!70) a!2804 mask!2512) (Found!12776 j!70)))))

(declare-fun b!1510516 () Bool)

(declare-fun res!1030417 () Bool)

(assert (=> b!1510516 (=> (not res!1030417) (not e!843485))))

(assert (=> b!1510516 (= res!1030417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510517 () Bool)

(declare-fun res!1030420 () Bool)

(assert (=> b!1510517 (=> (not res!1030420) (not e!843484))))

(assert (=> b!1510517 (= res!1030420 (= lt!655188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48605 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48605 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100737 (store (arr!48605 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49155 a!2804)) mask!2512)))))

(declare-fun b!1510518 () Bool)

(declare-fun res!1030415 () Bool)

(assert (=> b!1510518 (=> (not res!1030415) (not e!843484))))

(assert (=> b!1510518 (= res!1030415 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48605 a!2804) j!70) a!2804 mask!2512) lt!655189))))

(declare-fun b!1510519 () Bool)

(declare-fun res!1030419 () Bool)

(assert (=> b!1510519 (=> (not res!1030419) (not e!843485))))

(assert (=> b!1510519 (= res!1030419 (and (= (size!49155 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49155 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49155 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510520 () Bool)

(declare-fun res!1030422 () Bool)

(assert (=> b!1510520 (=> (not res!1030422) (not e!843485))))

(assert (=> b!1510520 (= res!1030422 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49155 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49155 a!2804))))))

(assert (= (and start!128880 res!1030421) b!1510519))

(assert (= (and b!1510519 res!1030419) b!1510511))

(assert (= (and b!1510511 res!1030413) b!1510513))

(assert (= (and b!1510513 res!1030416) b!1510516))

(assert (= (and b!1510516 res!1030417) b!1510510))

(assert (= (and b!1510510 res!1030418) b!1510520))

(assert (= (and b!1510520 res!1030422) b!1510512))

(assert (= (and b!1510512 res!1030414) b!1510518))

(assert (= (and b!1510518 res!1030415) b!1510517))

(assert (= (and b!1510517 res!1030420) b!1510514))

(assert (= (and b!1510514 res!1030423) b!1510515))

(declare-fun m!1393105 () Bool)

(assert (=> b!1510516 m!1393105))

(declare-fun m!1393107 () Bool)

(assert (=> start!128880 m!1393107))

(declare-fun m!1393109 () Bool)

(assert (=> start!128880 m!1393109))

(declare-fun m!1393111 () Bool)

(assert (=> b!1510511 m!1393111))

(assert (=> b!1510511 m!1393111))

(declare-fun m!1393113 () Bool)

(assert (=> b!1510511 m!1393113))

(declare-fun m!1393115 () Bool)

(assert (=> b!1510513 m!1393115))

(assert (=> b!1510513 m!1393115))

(declare-fun m!1393117 () Bool)

(assert (=> b!1510513 m!1393117))

(declare-fun m!1393119 () Bool)

(assert (=> b!1510517 m!1393119))

(declare-fun m!1393121 () Bool)

(assert (=> b!1510517 m!1393121))

(assert (=> b!1510517 m!1393121))

(declare-fun m!1393123 () Bool)

(assert (=> b!1510517 m!1393123))

(assert (=> b!1510517 m!1393123))

(assert (=> b!1510517 m!1393121))

(declare-fun m!1393125 () Bool)

(assert (=> b!1510517 m!1393125))

(assert (=> b!1510514 m!1393115))

(declare-fun m!1393127 () Bool)

(assert (=> b!1510514 m!1393127))

(assert (=> b!1510514 m!1393119))

(declare-fun m!1393129 () Bool)

(assert (=> b!1510514 m!1393129))

(assert (=> b!1510514 m!1393121))

(declare-fun m!1393131 () Bool)

(assert (=> b!1510514 m!1393131))

(assert (=> b!1510512 m!1393115))

(assert (=> b!1510512 m!1393115))

(declare-fun m!1393133 () Bool)

(assert (=> b!1510512 m!1393133))

(assert (=> b!1510512 m!1393133))

(assert (=> b!1510512 m!1393115))

(declare-fun m!1393135 () Bool)

(assert (=> b!1510512 m!1393135))

(assert (=> b!1510515 m!1393115))

(assert (=> b!1510515 m!1393115))

(declare-fun m!1393137 () Bool)

(assert (=> b!1510515 m!1393137))

(assert (=> b!1510518 m!1393115))

(assert (=> b!1510518 m!1393115))

(declare-fun m!1393139 () Bool)

(assert (=> b!1510518 m!1393139))

(declare-fun m!1393141 () Bool)

(assert (=> b!1510510 m!1393141))

(push 1)

