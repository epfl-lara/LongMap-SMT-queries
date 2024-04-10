; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128994 () Bool)

(assert start!128994)

(declare-fun b!1512548 () Bool)

(declare-fun res!1032453 () Bool)

(declare-fun e!844255 () Bool)

(assert (=> b!1512548 (=> (not res!1032453) (not e!844255))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100850 0))(
  ( (array!100851 (arr!48662 (Array (_ BitVec 32) (_ BitVec 64))) (size!49212 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100850)

(declare-datatypes ((SeekEntryResult!12833 0))(
  ( (MissingZero!12833 (index!53727 (_ BitVec 32))) (Found!12833 (index!53728 (_ BitVec 32))) (Intermediate!12833 (undefined!13645 Bool) (index!53729 (_ BitVec 32)) (x!135455 (_ BitVec 32))) (Undefined!12833) (MissingVacant!12833 (index!53730 (_ BitVec 32))) )
))
(declare-fun lt!655700 () SeekEntryResult!12833)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100850 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1512548 (= res!1032453 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48662 a!2804) j!70) a!2804 mask!2512) lt!655700))))

(declare-fun b!1512549 () Bool)

(declare-fun res!1032463 () Bool)

(declare-fun e!844254 () Bool)

(assert (=> b!1512549 (=> (not res!1032463) (not e!844254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512549 (= res!1032463 (validKeyInArray!0 (select (arr!48662 a!2804) j!70)))))

(declare-fun b!1512550 () Bool)

(declare-fun res!1032462 () Bool)

(assert (=> b!1512550 (=> (not res!1032462) (not e!844254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100850 (_ BitVec 32)) Bool)

(assert (=> b!1512550 (= res!1032462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512551 () Bool)

(declare-fun res!1032461 () Bool)

(declare-fun e!844253 () Bool)

(assert (=> b!1512551 (=> (not res!1032461) (not e!844253))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100850 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1512551 (= res!1032461 (= (seekEntry!0 (select (arr!48662 a!2804) j!70) a!2804 mask!2512) (Found!12833 j!70)))))

(declare-fun b!1512552 () Bool)

(declare-fun res!1032456 () Bool)

(assert (=> b!1512552 (=> (not res!1032456) (not e!844254))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512552 (= res!1032456 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49212 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49212 a!2804))))))

(declare-fun b!1512553 () Bool)

(declare-fun res!1032452 () Bool)

(assert (=> b!1512553 (=> (not res!1032452) (not e!844255))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655702 () SeekEntryResult!12833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512553 (= res!1032452 (= lt!655702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48662 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48662 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100851 (store (arr!48662 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49212 a!2804)) mask!2512)))))

(declare-fun e!844251 () Bool)

(declare-fun b!1512554 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100850 (_ BitVec 32)) SeekEntryResult!12833)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100850 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1512554 (= e!844251 (= (seekEntryOrOpen!0 (select (arr!48662 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48662 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512555 () Bool)

(declare-fun res!1032454 () Bool)

(assert (=> b!1512555 (=> (not res!1032454) (not e!844254))))

(assert (=> b!1512555 (= res!1032454 (validKeyInArray!0 (select (arr!48662 a!2804) i!961)))))

(declare-fun b!1512557 () Bool)

(assert (=> b!1512557 (= e!844255 (not true))))

(assert (=> b!1512557 e!844253))

(declare-fun res!1032457 () Bool)

(assert (=> b!1512557 (=> (not res!1032457) (not e!844253))))

(assert (=> b!1512557 (= res!1032457 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50534 0))(
  ( (Unit!50535) )
))
(declare-fun lt!655701 () Unit!50534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50534)

(assert (=> b!1512557 (= lt!655701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512558 () Bool)

(declare-fun res!1032455 () Bool)

(assert (=> b!1512558 (=> (not res!1032455) (not e!844254))))

(declare-datatypes ((List!35145 0))(
  ( (Nil!35142) (Cons!35141 (h!36553 (_ BitVec 64)) (t!49839 List!35145)) )
))
(declare-fun arrayNoDuplicates!0 (array!100850 (_ BitVec 32) List!35145) Bool)

(assert (=> b!1512558 (= res!1032455 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35142))))

(declare-fun b!1512559 () Bool)

(assert (=> b!1512559 (= e!844253 e!844251)))

(declare-fun res!1032458 () Bool)

(assert (=> b!1512559 (=> res!1032458 e!844251)))

(assert (=> b!1512559 (= res!1032458 (or (not (= (select (arr!48662 a!2804) j!70) (select (store (arr!48662 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48662 a!2804) index!487) (select (arr!48662 a!2804) j!70)) (not (= (select (arr!48662 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512560 () Bool)

(assert (=> b!1512560 (= e!844254 e!844255)))

(declare-fun res!1032451 () Bool)

(assert (=> b!1512560 (=> (not res!1032451) (not e!844255))))

(assert (=> b!1512560 (= res!1032451 (= lt!655702 lt!655700))))

(assert (=> b!1512560 (= lt!655700 (Intermediate!12833 false resIndex!21 resX!21))))

(assert (=> b!1512560 (= lt!655702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48662 a!2804) j!70) mask!2512) (select (arr!48662 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1032460 () Bool)

(assert (=> start!128994 (=> (not res!1032460) (not e!844254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128994 (= res!1032460 (validMask!0 mask!2512))))

(assert (=> start!128994 e!844254))

(assert (=> start!128994 true))

(declare-fun array_inv!37690 (array!100850) Bool)

(assert (=> start!128994 (array_inv!37690 a!2804)))

(declare-fun b!1512556 () Bool)

(declare-fun res!1032459 () Bool)

(assert (=> b!1512556 (=> (not res!1032459) (not e!844254))))

(assert (=> b!1512556 (= res!1032459 (and (= (size!49212 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49212 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49212 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128994 res!1032460) b!1512556))

(assert (= (and b!1512556 res!1032459) b!1512555))

(assert (= (and b!1512555 res!1032454) b!1512549))

(assert (= (and b!1512549 res!1032463) b!1512550))

(assert (= (and b!1512550 res!1032462) b!1512558))

(assert (= (and b!1512558 res!1032455) b!1512552))

(assert (= (and b!1512552 res!1032456) b!1512560))

(assert (= (and b!1512560 res!1032451) b!1512548))

(assert (= (and b!1512548 res!1032453) b!1512553))

(assert (= (and b!1512553 res!1032452) b!1512557))

(assert (= (and b!1512557 res!1032457) b!1512551))

(assert (= (and b!1512551 res!1032461) b!1512559))

(assert (= (and b!1512559 (not res!1032458)) b!1512554))

(declare-fun m!1395325 () Bool)

(assert (=> b!1512551 m!1395325))

(assert (=> b!1512551 m!1395325))

(declare-fun m!1395327 () Bool)

(assert (=> b!1512551 m!1395327))

(assert (=> b!1512554 m!1395325))

(assert (=> b!1512554 m!1395325))

(declare-fun m!1395329 () Bool)

(assert (=> b!1512554 m!1395329))

(assert (=> b!1512554 m!1395325))

(declare-fun m!1395331 () Bool)

(assert (=> b!1512554 m!1395331))

(assert (=> b!1512560 m!1395325))

(assert (=> b!1512560 m!1395325))

(declare-fun m!1395333 () Bool)

(assert (=> b!1512560 m!1395333))

(assert (=> b!1512560 m!1395333))

(assert (=> b!1512560 m!1395325))

(declare-fun m!1395335 () Bool)

(assert (=> b!1512560 m!1395335))

(declare-fun m!1395337 () Bool)

(assert (=> start!128994 m!1395337))

(declare-fun m!1395339 () Bool)

(assert (=> start!128994 m!1395339))

(declare-fun m!1395341 () Bool)

(assert (=> b!1512557 m!1395341))

(declare-fun m!1395343 () Bool)

(assert (=> b!1512557 m!1395343))

(declare-fun m!1395345 () Bool)

(assert (=> b!1512550 m!1395345))

(assert (=> b!1512549 m!1395325))

(assert (=> b!1512549 m!1395325))

(declare-fun m!1395347 () Bool)

(assert (=> b!1512549 m!1395347))

(assert (=> b!1512548 m!1395325))

(assert (=> b!1512548 m!1395325))

(declare-fun m!1395349 () Bool)

(assert (=> b!1512548 m!1395349))

(assert (=> b!1512559 m!1395325))

(declare-fun m!1395351 () Bool)

(assert (=> b!1512559 m!1395351))

(declare-fun m!1395353 () Bool)

(assert (=> b!1512559 m!1395353))

(declare-fun m!1395355 () Bool)

(assert (=> b!1512559 m!1395355))

(assert (=> b!1512553 m!1395351))

(assert (=> b!1512553 m!1395353))

(assert (=> b!1512553 m!1395353))

(declare-fun m!1395357 () Bool)

(assert (=> b!1512553 m!1395357))

(assert (=> b!1512553 m!1395357))

(assert (=> b!1512553 m!1395353))

(declare-fun m!1395359 () Bool)

(assert (=> b!1512553 m!1395359))

(declare-fun m!1395361 () Bool)

(assert (=> b!1512555 m!1395361))

(assert (=> b!1512555 m!1395361))

(declare-fun m!1395363 () Bool)

(assert (=> b!1512555 m!1395363))

(declare-fun m!1395365 () Bool)

(assert (=> b!1512558 m!1395365))

(push 1)

