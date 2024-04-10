; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129130 () Bool)

(assert start!129130)

(declare-fun res!1035265 () Bool)

(declare-fun e!845638 () Bool)

(assert (=> start!129130 (=> (not res!1035265) (not e!845638))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129130 (= res!1035265 (validMask!0 mask!2512))))

(assert (=> start!129130 e!845638))

(assert (=> start!129130 true))

(declare-datatypes ((array!100986 0))(
  ( (array!100987 (arr!48730 (Array (_ BitVec 32) (_ BitVec 64))) (size!49280 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100986)

(declare-fun array_inv!37758 (array!100986) Bool)

(assert (=> start!129130 (array_inv!37758 a!2804)))

(declare-fun b!1515353 () Bool)

(declare-fun e!845640 () Bool)

(assert (=> b!1515353 (= e!845638 e!845640)))

(declare-fun res!1035261 () Bool)

(assert (=> b!1515353 (=> (not res!1035261) (not e!845640))))

(declare-datatypes ((SeekEntryResult!12901 0))(
  ( (MissingZero!12901 (index!53999 (_ BitVec 32))) (Found!12901 (index!54000 (_ BitVec 32))) (Intermediate!12901 (undefined!13713 Bool) (index!54001 (_ BitVec 32)) (x!135699 (_ BitVec 32))) (Undefined!12901) (MissingVacant!12901 (index!54002 (_ BitVec 32))) )
))
(declare-fun lt!656806 () SeekEntryResult!12901)

(declare-fun lt!656801 () SeekEntryResult!12901)

(assert (=> b!1515353 (= res!1035261 (= lt!656806 lt!656801))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515353 (= lt!656801 (Intermediate!12901 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100986 (_ BitVec 32)) SeekEntryResult!12901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515353 (= lt!656806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48730 a!2804) j!70) mask!2512) (select (arr!48730 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515354 () Bool)

(declare-fun e!845642 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100986 (_ BitVec 32)) SeekEntryResult!12901)

(assert (=> b!1515354 (= e!845642 (= (seekEntry!0 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) (Found!12901 j!70)))))

(declare-fun b!1515355 () Bool)

(declare-fun e!845641 () Bool)

(assert (=> b!1515355 (= e!845640 e!845641)))

(declare-fun res!1035267 () Bool)

(assert (=> b!1515355 (=> (not res!1035267) (not e!845641))))

(declare-fun lt!656803 () (_ BitVec 64))

(declare-fun lt!656804 () array!100986)

(assert (=> b!1515355 (= res!1035267 (= lt!656806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656803 mask!2512) lt!656803 lt!656804 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515355 (= lt!656803 (select (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515355 (= lt!656804 (array!100987 (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49280 a!2804)))))

(declare-fun b!1515356 () Bool)

(declare-fun res!1035264 () Bool)

(assert (=> b!1515356 (=> (not res!1035264) (not e!845638))))

(declare-datatypes ((List!35213 0))(
  ( (Nil!35210) (Cons!35209 (h!36621 (_ BitVec 64)) (t!49907 List!35213)) )
))
(declare-fun arrayNoDuplicates!0 (array!100986 (_ BitVec 32) List!35213) Bool)

(assert (=> b!1515356 (= res!1035264 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35210))))

(declare-fun b!1515357 () Bool)

(declare-fun res!1035263 () Bool)

(assert (=> b!1515357 (=> (not res!1035263) (not e!845638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515357 (= res!1035263 (validKeyInArray!0 (select (arr!48730 a!2804) i!961)))))

(declare-fun b!1515358 () Bool)

(declare-fun e!845639 () Bool)

(declare-fun e!845643 () Bool)

(assert (=> b!1515358 (= e!845639 e!845643)))

(declare-fun res!1035260 () Bool)

(assert (=> b!1515358 (=> res!1035260 e!845643)))

(declare-fun lt!656802 () SeekEntryResult!12901)

(assert (=> b!1515358 (= res!1035260 (not (= lt!656802 (Found!12901 j!70))))))

(declare-fun lt!656809 () SeekEntryResult!12901)

(declare-fun lt!656805 () SeekEntryResult!12901)

(assert (=> b!1515358 (= lt!656809 lt!656805)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100986 (_ BitVec 32)) SeekEntryResult!12901)

(assert (=> b!1515358 (= lt!656805 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656803 lt!656804 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100986 (_ BitVec 32)) SeekEntryResult!12901)

(assert (=> b!1515358 (= lt!656809 (seekEntryOrOpen!0 lt!656803 lt!656804 mask!2512))))

(declare-fun lt!656808 () SeekEntryResult!12901)

(assert (=> b!1515358 (= lt!656808 lt!656802)))

(assert (=> b!1515358 (= lt!656802 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48730 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515358 (= lt!656808 (seekEntryOrOpen!0 (select (arr!48730 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515359 () Bool)

(declare-fun res!1035256 () Bool)

(assert (=> b!1515359 (=> (not res!1035256) (not e!845638))))

(assert (=> b!1515359 (= res!1035256 (and (= (size!49280 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49280 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49280 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515360 () Bool)

(declare-fun res!1035268 () Bool)

(assert (=> b!1515360 (=> (not res!1035268) (not e!845638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100986 (_ BitVec 32)) Bool)

(assert (=> b!1515360 (= res!1035268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515361 () Bool)

(declare-fun res!1035258 () Bool)

(assert (=> b!1515361 (=> (not res!1035258) (not e!845638))))

(assert (=> b!1515361 (= res!1035258 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49280 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49280 a!2804))))))

(declare-fun b!1515362 () Bool)

(declare-fun res!1035257 () Bool)

(assert (=> b!1515362 (=> (not res!1035257) (not e!845638))))

(assert (=> b!1515362 (= res!1035257 (validKeyInArray!0 (select (arr!48730 a!2804) j!70)))))

(declare-fun b!1515363 () Bool)

(assert (=> b!1515363 (= e!845643 true)))

(assert (=> b!1515363 (= lt!656805 lt!656802)))

(declare-datatypes ((Unit!50670 0))(
  ( (Unit!50671) )
))
(declare-fun lt!656800 () Unit!50670)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50670)

(assert (=> b!1515363 (= lt!656800 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515364 () Bool)

(assert (=> b!1515364 (= e!845641 (not e!845639))))

(declare-fun res!1035259 () Bool)

(assert (=> b!1515364 (=> res!1035259 e!845639)))

(assert (=> b!1515364 (= res!1035259 (or (not (= (select (arr!48730 a!2804) j!70) lt!656803)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48730 a!2804) index!487) (select (arr!48730 a!2804) j!70)) (not (= (select (arr!48730 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515364 e!845642))

(declare-fun res!1035262 () Bool)

(assert (=> b!1515364 (=> (not res!1035262) (not e!845642))))

(assert (=> b!1515364 (= res!1035262 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656807 () Unit!50670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50670)

(assert (=> b!1515364 (= lt!656807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515365 () Bool)

(declare-fun res!1035266 () Bool)

(assert (=> b!1515365 (=> (not res!1035266) (not e!845640))))

(assert (=> b!1515365 (= res!1035266 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) lt!656801))))

(assert (= (and start!129130 res!1035265) b!1515359))

(assert (= (and b!1515359 res!1035256) b!1515357))

(assert (= (and b!1515357 res!1035263) b!1515362))

(assert (= (and b!1515362 res!1035257) b!1515360))

(assert (= (and b!1515360 res!1035268) b!1515356))

(assert (= (and b!1515356 res!1035264) b!1515361))

(assert (= (and b!1515361 res!1035258) b!1515353))

(assert (= (and b!1515353 res!1035261) b!1515365))

(assert (= (and b!1515365 res!1035266) b!1515355))

(assert (= (and b!1515355 res!1035267) b!1515364))

(assert (= (and b!1515364 res!1035262) b!1515354))

(assert (= (and b!1515364 (not res!1035259)) b!1515358))

(assert (= (and b!1515358 (not res!1035260)) b!1515363))

(declare-fun m!1398439 () Bool)

(assert (=> b!1515360 m!1398439))

(declare-fun m!1398441 () Bool)

(assert (=> start!129130 m!1398441))

(declare-fun m!1398443 () Bool)

(assert (=> start!129130 m!1398443))

(declare-fun m!1398445 () Bool)

(assert (=> b!1515365 m!1398445))

(assert (=> b!1515365 m!1398445))

(declare-fun m!1398447 () Bool)

(assert (=> b!1515365 m!1398447))

(assert (=> b!1515354 m!1398445))

(assert (=> b!1515354 m!1398445))

(declare-fun m!1398449 () Bool)

(assert (=> b!1515354 m!1398449))

(declare-fun m!1398451 () Bool)

(assert (=> b!1515356 m!1398451))

(declare-fun m!1398453 () Bool)

(assert (=> b!1515355 m!1398453))

(assert (=> b!1515355 m!1398453))

(declare-fun m!1398455 () Bool)

(assert (=> b!1515355 m!1398455))

(declare-fun m!1398457 () Bool)

(assert (=> b!1515355 m!1398457))

(declare-fun m!1398459 () Bool)

(assert (=> b!1515355 m!1398459))

(assert (=> b!1515364 m!1398445))

(declare-fun m!1398461 () Bool)

(assert (=> b!1515364 m!1398461))

(declare-fun m!1398463 () Bool)

(assert (=> b!1515364 m!1398463))

(declare-fun m!1398465 () Bool)

(assert (=> b!1515364 m!1398465))

(assert (=> b!1515362 m!1398445))

(assert (=> b!1515362 m!1398445))

(declare-fun m!1398467 () Bool)

(assert (=> b!1515362 m!1398467))

(declare-fun m!1398469 () Bool)

(assert (=> b!1515358 m!1398469))

(assert (=> b!1515358 m!1398445))

(declare-fun m!1398471 () Bool)

(assert (=> b!1515358 m!1398471))

(assert (=> b!1515358 m!1398445))

(declare-fun m!1398473 () Bool)

(assert (=> b!1515358 m!1398473))

(assert (=> b!1515358 m!1398445))

(declare-fun m!1398475 () Bool)

(assert (=> b!1515358 m!1398475))

(declare-fun m!1398477 () Bool)

(assert (=> b!1515357 m!1398477))

(assert (=> b!1515357 m!1398477))

(declare-fun m!1398479 () Bool)

(assert (=> b!1515357 m!1398479))

(declare-fun m!1398481 () Bool)

(assert (=> b!1515363 m!1398481))

(assert (=> b!1515353 m!1398445))

(assert (=> b!1515353 m!1398445))

(declare-fun m!1398483 () Bool)

(assert (=> b!1515353 m!1398483))

(assert (=> b!1515353 m!1398483))

(assert (=> b!1515353 m!1398445))

(declare-fun m!1398485 () Bool)

(assert (=> b!1515353 m!1398485))

(push 1)

