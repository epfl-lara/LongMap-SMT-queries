; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129786 () Bool)

(assert start!129786)

(declare-fun b!1523446 () Bool)

(declare-fun res!1042356 () Bool)

(declare-fun e!849340 () Bool)

(assert (=> b!1523446 (=> (not res!1042356) (not e!849340))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101382 0))(
  ( (array!101383 (arr!48922 (Array (_ BitVec 32) (_ BitVec 64))) (size!49472 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101382)

(declare-datatypes ((SeekEntryResult!13087 0))(
  ( (MissingZero!13087 (index!54743 (_ BitVec 32))) (Found!13087 (index!54744 (_ BitVec 32))) (Intermediate!13087 (undefined!13899 Bool) (index!54745 (_ BitVec 32)) (x!136429 (_ BitVec 32))) (Undefined!13087) (MissingVacant!13087 (index!54746 (_ BitVec 32))) )
))
(declare-fun lt!659954 () SeekEntryResult!13087)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101382 (_ BitVec 32)) SeekEntryResult!13087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523446 (= res!1042356 (= lt!659954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101383 (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49472 a!2804)) mask!2512)))))

(declare-fun res!1042360 () Bool)

(declare-fun e!849341 () Bool)

(assert (=> start!129786 (=> (not res!1042360) (not e!849341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129786 (= res!1042360 (validMask!0 mask!2512))))

(assert (=> start!129786 e!849341))

(assert (=> start!129786 true))

(declare-fun array_inv!37950 (array!101382) Bool)

(assert (=> start!129786 (array_inv!37950 a!2804)))

(declare-fun b!1523447 () Bool)

(declare-fun res!1042361 () Bool)

(assert (=> b!1523447 (=> (not res!1042361) (not e!849341))))

(assert (=> b!1523447 (= res!1042361 (and (= (size!49472 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49472 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49472 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523448 () Bool)

(declare-fun res!1042355 () Bool)

(assert (=> b!1523448 (=> (not res!1042355) (not e!849341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101382 (_ BitVec 32)) Bool)

(assert (=> b!1523448 (= res!1042355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523449 () Bool)

(declare-fun res!1042363 () Bool)

(assert (=> b!1523449 (=> (not res!1042363) (not e!849341))))

(declare-datatypes ((List!35405 0))(
  ( (Nil!35402) (Cons!35401 (h!36825 (_ BitVec 64)) (t!50099 List!35405)) )
))
(declare-fun arrayNoDuplicates!0 (array!101382 (_ BitVec 32) List!35405) Bool)

(assert (=> b!1523449 (= res!1042363 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35402))))

(declare-fun b!1523450 () Bool)

(declare-fun res!1042358 () Bool)

(assert (=> b!1523450 (=> (not res!1042358) (not e!849341))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523450 (= res!1042358 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49472 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49472 a!2804))))))

(declare-fun b!1523451 () Bool)

(declare-fun res!1042359 () Bool)

(assert (=> b!1523451 (=> (not res!1042359) (not e!849340))))

(declare-fun lt!659956 () SeekEntryResult!13087)

(assert (=> b!1523451 (= res!1042359 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48922 a!2804) j!70) a!2804 mask!2512) lt!659956))))

(declare-fun b!1523452 () Bool)

(declare-fun res!1042357 () Bool)

(assert (=> b!1523452 (=> (not res!1042357) (not e!849341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523452 (= res!1042357 (validKeyInArray!0 (select (arr!48922 a!2804) i!961)))))

(declare-fun e!849342 () Bool)

(declare-fun b!1523453 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101382 (_ BitVec 32)) SeekEntryResult!13087)

(assert (=> b!1523453 (= e!849342 (= (seekEntry!0 (select (arr!48922 a!2804) j!70) a!2804 mask!2512) (Found!13087 j!70)))))

(declare-fun b!1523454 () Bool)

(assert (=> b!1523454 (= e!849340 (not true))))

(assert (=> b!1523454 e!849342))

(declare-fun res!1042353 () Bool)

(assert (=> b!1523454 (=> (not res!1042353) (not e!849342))))

(assert (=> b!1523454 (= res!1042353 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50958 0))(
  ( (Unit!50959) )
))
(declare-fun lt!659955 () Unit!50958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50958)

(assert (=> b!1523454 (= lt!659955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523455 () Bool)

(declare-fun res!1042362 () Bool)

(assert (=> b!1523455 (=> (not res!1042362) (not e!849341))))

(assert (=> b!1523455 (= res!1042362 (validKeyInArray!0 (select (arr!48922 a!2804) j!70)))))

(declare-fun b!1523456 () Bool)

(assert (=> b!1523456 (= e!849341 e!849340)))

(declare-fun res!1042354 () Bool)

(assert (=> b!1523456 (=> (not res!1042354) (not e!849340))))

(assert (=> b!1523456 (= res!1042354 (= lt!659954 lt!659956))))

(assert (=> b!1523456 (= lt!659956 (Intermediate!13087 false resIndex!21 resX!21))))

(assert (=> b!1523456 (= lt!659954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48922 a!2804) j!70) mask!2512) (select (arr!48922 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129786 res!1042360) b!1523447))

(assert (= (and b!1523447 res!1042361) b!1523452))

(assert (= (and b!1523452 res!1042357) b!1523455))

(assert (= (and b!1523455 res!1042362) b!1523448))

(assert (= (and b!1523448 res!1042355) b!1523449))

(assert (= (and b!1523449 res!1042363) b!1523450))

(assert (= (and b!1523450 res!1042358) b!1523456))

(assert (= (and b!1523456 res!1042354) b!1523451))

(assert (= (and b!1523451 res!1042359) b!1523446))

(assert (= (and b!1523446 res!1042356) b!1523454))

(assert (= (and b!1523454 res!1042353) b!1523453))

(declare-fun m!1406565 () Bool)

(assert (=> b!1523451 m!1406565))

(assert (=> b!1523451 m!1406565))

(declare-fun m!1406567 () Bool)

(assert (=> b!1523451 m!1406567))

(assert (=> b!1523456 m!1406565))

(assert (=> b!1523456 m!1406565))

(declare-fun m!1406569 () Bool)

(assert (=> b!1523456 m!1406569))

(assert (=> b!1523456 m!1406569))

(assert (=> b!1523456 m!1406565))

(declare-fun m!1406571 () Bool)

(assert (=> b!1523456 m!1406571))

(declare-fun m!1406573 () Bool)

(assert (=> b!1523446 m!1406573))

(declare-fun m!1406575 () Bool)

(assert (=> b!1523446 m!1406575))

(assert (=> b!1523446 m!1406575))

(declare-fun m!1406577 () Bool)

(assert (=> b!1523446 m!1406577))

(assert (=> b!1523446 m!1406577))

(assert (=> b!1523446 m!1406575))

(declare-fun m!1406579 () Bool)

(assert (=> b!1523446 m!1406579))

(declare-fun m!1406581 () Bool)

(assert (=> b!1523448 m!1406581))

(declare-fun m!1406583 () Bool)

(assert (=> start!129786 m!1406583))

(declare-fun m!1406585 () Bool)

(assert (=> start!129786 m!1406585))

(declare-fun m!1406587 () Bool)

(assert (=> b!1523449 m!1406587))

(declare-fun m!1406589 () Bool)

(assert (=> b!1523452 m!1406589))

(assert (=> b!1523452 m!1406589))

(declare-fun m!1406591 () Bool)

(assert (=> b!1523452 m!1406591))

(assert (=> b!1523453 m!1406565))

(assert (=> b!1523453 m!1406565))

(declare-fun m!1406593 () Bool)

(assert (=> b!1523453 m!1406593))

(declare-fun m!1406595 () Bool)

(assert (=> b!1523454 m!1406595))

(declare-fun m!1406597 () Bool)

(assert (=> b!1523454 m!1406597))

(assert (=> b!1523455 m!1406565))

(assert (=> b!1523455 m!1406565))

(declare-fun m!1406599 () Bool)

(assert (=> b!1523455 m!1406599))

(push 1)

(assert (not b!1523449))

(assert (not start!129786))

(assert (not b!1523456))

