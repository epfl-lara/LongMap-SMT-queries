; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130128 () Bool)

(assert start!130128)

(declare-fun b!1527574 () Bool)

(declare-fun res!1045615 () Bool)

(declare-fun e!851399 () Bool)

(assert (=> b!1527574 (=> (not res!1045615) (not e!851399))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101541 0))(
  ( (array!101542 (arr!48997 (Array (_ BitVec 32) (_ BitVec 64))) (size!49547 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101541)

(declare-datatypes ((SeekEntryResult!13162 0))(
  ( (MissingZero!13162 (index!55043 (_ BitVec 32))) (Found!13162 (index!55044 (_ BitVec 32))) (Intermediate!13162 (undefined!13974 Bool) (index!55045 (_ BitVec 32)) (x!136728 (_ BitVec 32))) (Undefined!13162) (MissingVacant!13162 (index!55046 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101541 (_ BitVec 32)) SeekEntryResult!13162)

(assert (=> b!1527574 (= res!1045615 (= (seekEntry!0 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) (Found!13162 j!70)))))

(declare-fun b!1527575 () Bool)

(declare-fun e!851403 () Bool)

(declare-fun e!851398 () Bool)

(assert (=> b!1527575 (= e!851403 e!851398)))

(declare-fun res!1045613 () Bool)

(assert (=> b!1527575 (=> (not res!1045613) (not e!851398))))

(declare-fun lt!661480 () SeekEntryResult!13162)

(declare-fun lt!661482 () SeekEntryResult!13162)

(assert (=> b!1527575 (= res!1045613 (= lt!661480 lt!661482))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527575 (= lt!661482 (Intermediate!13162 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101541 (_ BitVec 32)) SeekEntryResult!13162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527575 (= lt!661480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48997 a!2804) j!70) mask!2512) (select (arr!48997 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527576 () Bool)

(declare-fun res!1045620 () Bool)

(assert (=> b!1527576 (=> (not res!1045620) (not e!851403))))

(declare-datatypes ((List!35480 0))(
  ( (Nil!35477) (Cons!35476 (h!36909 (_ BitVec 64)) (t!50174 List!35480)) )
))
(declare-fun arrayNoDuplicates!0 (array!101541 (_ BitVec 32) List!35480) Bool)

(assert (=> b!1527576 (= res!1045620 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35477))))

(declare-fun b!1527577 () Bool)

(declare-fun res!1045611 () Bool)

(assert (=> b!1527577 (=> (not res!1045611) (not e!851403))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1527577 (= res!1045611 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49547 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49547 a!2804))))))

(declare-fun b!1527579 () Bool)

(declare-fun e!851400 () Bool)

(assert (=> b!1527579 (= e!851398 e!851400)))

(declare-fun res!1045618 () Bool)

(assert (=> b!1527579 (=> (not res!1045618) (not e!851400))))

(declare-fun lt!661481 () array!101541)

(declare-fun lt!661479 () (_ BitVec 64))

(assert (=> b!1527579 (= res!1045618 (= lt!661480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661479 mask!2512) lt!661479 lt!661481 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527579 (= lt!661479 (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527579 (= lt!661481 (array!101542 (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49547 a!2804)))))

(declare-fun b!1527580 () Bool)

(declare-fun e!851404 () Bool)

(declare-fun e!851401 () Bool)

(assert (=> b!1527580 (= e!851404 e!851401)))

(declare-fun res!1045619 () Bool)

(assert (=> b!1527580 (=> (not res!1045619) (not e!851401))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101541 (_ BitVec 32)) SeekEntryResult!13162)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101541 (_ BitVec 32)) SeekEntryResult!13162)

(assert (=> b!1527580 (= res!1045619 (= (seekEntryOrOpen!0 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48997 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527581 () Bool)

(declare-fun res!1045614 () Bool)

(assert (=> b!1527581 (=> (not res!1045614) (not e!851403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527581 (= res!1045614 (validKeyInArray!0 (select (arr!48997 a!2804) j!70)))))

(declare-fun res!1045609 () Bool)

(assert (=> start!130128 (=> (not res!1045609) (not e!851403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130128 (= res!1045609 (validMask!0 mask!2512))))

(assert (=> start!130128 e!851403))

(assert (=> start!130128 true))

(declare-fun array_inv!38025 (array!101541) Bool)

(assert (=> start!130128 (array_inv!38025 a!2804)))

(declare-fun b!1527578 () Bool)

(assert (=> b!1527578 (= e!851399 e!851404)))

(declare-fun res!1045617 () Bool)

(assert (=> b!1527578 (=> res!1045617 e!851404)))

(assert (=> b!1527578 (= res!1045617 (or (not (= (select (arr!48997 a!2804) j!70) lt!661479)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48997 a!2804) index!487) (select (arr!48997 a!2804) j!70)) (not (= (select (arr!48997 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527582 () Bool)

(assert (=> b!1527582 (= e!851401 (= (seekEntryOrOpen!0 lt!661479 lt!661481 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661479 lt!661481 mask!2512)))))

(declare-fun b!1527583 () Bool)

(assert (=> b!1527583 (= e!851400 (not true))))

(assert (=> b!1527583 e!851399))

(declare-fun res!1045612 () Bool)

(assert (=> b!1527583 (=> (not res!1045612) (not e!851399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101541 (_ BitVec 32)) Bool)

(assert (=> b!1527583 (= res!1045612 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51108 0))(
  ( (Unit!51109) )
))
(declare-fun lt!661483 () Unit!51108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51108)

(assert (=> b!1527583 (= lt!661483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527584 () Bool)

(declare-fun res!1045621 () Bool)

(assert (=> b!1527584 (=> (not res!1045621) (not e!851403))))

(assert (=> b!1527584 (= res!1045621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527585 () Bool)

(declare-fun res!1045616 () Bool)

(assert (=> b!1527585 (=> (not res!1045616) (not e!851398))))

(assert (=> b!1527585 (= res!1045616 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) lt!661482))))

(declare-fun b!1527586 () Bool)

(declare-fun res!1045610 () Bool)

(assert (=> b!1527586 (=> (not res!1045610) (not e!851403))))

(assert (=> b!1527586 (= res!1045610 (and (= (size!49547 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49547 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49547 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527587 () Bool)

(declare-fun res!1045608 () Bool)

(assert (=> b!1527587 (=> (not res!1045608) (not e!851403))))

(assert (=> b!1527587 (= res!1045608 (validKeyInArray!0 (select (arr!48997 a!2804) i!961)))))

(assert (= (and start!130128 res!1045609) b!1527586))

(assert (= (and b!1527586 res!1045610) b!1527587))

(assert (= (and b!1527587 res!1045608) b!1527581))

(assert (= (and b!1527581 res!1045614) b!1527584))

(assert (= (and b!1527584 res!1045621) b!1527576))

(assert (= (and b!1527576 res!1045620) b!1527577))

(assert (= (and b!1527577 res!1045611) b!1527575))

(assert (= (and b!1527575 res!1045613) b!1527585))

(assert (= (and b!1527585 res!1045616) b!1527579))

(assert (= (and b!1527579 res!1045618) b!1527583))

(assert (= (and b!1527583 res!1045612) b!1527574))

(assert (= (and b!1527574 res!1045615) b!1527578))

(assert (= (and b!1527578 (not res!1045617)) b!1527580))

(assert (= (and b!1527580 res!1045619) b!1527582))

(declare-fun m!1410485 () Bool)

(assert (=> b!1527582 m!1410485))

(declare-fun m!1410487 () Bool)

(assert (=> b!1527582 m!1410487))

(declare-fun m!1410489 () Bool)

(assert (=> b!1527584 m!1410489))

(declare-fun m!1410491 () Bool)

(assert (=> b!1527576 m!1410491))

(declare-fun m!1410493 () Bool)

(assert (=> b!1527578 m!1410493))

(declare-fun m!1410495 () Bool)

(assert (=> b!1527578 m!1410495))

(assert (=> b!1527585 m!1410493))

(assert (=> b!1527585 m!1410493))

(declare-fun m!1410497 () Bool)

(assert (=> b!1527585 m!1410497))

(assert (=> b!1527574 m!1410493))

(assert (=> b!1527574 m!1410493))

(declare-fun m!1410499 () Bool)

(assert (=> b!1527574 m!1410499))

(assert (=> b!1527581 m!1410493))

(assert (=> b!1527581 m!1410493))

(declare-fun m!1410501 () Bool)

(assert (=> b!1527581 m!1410501))

(assert (=> b!1527575 m!1410493))

(assert (=> b!1527575 m!1410493))

(declare-fun m!1410503 () Bool)

(assert (=> b!1527575 m!1410503))

(assert (=> b!1527575 m!1410503))

(assert (=> b!1527575 m!1410493))

(declare-fun m!1410505 () Bool)

(assert (=> b!1527575 m!1410505))

(declare-fun m!1410507 () Bool)

(assert (=> start!130128 m!1410507))

(declare-fun m!1410509 () Bool)

(assert (=> start!130128 m!1410509))

(declare-fun m!1410511 () Bool)

(assert (=> b!1527587 m!1410511))

(assert (=> b!1527587 m!1410511))

(declare-fun m!1410513 () Bool)

(assert (=> b!1527587 m!1410513))

(assert (=> b!1527580 m!1410493))

(assert (=> b!1527580 m!1410493))

(declare-fun m!1410515 () Bool)

(assert (=> b!1527580 m!1410515))

(assert (=> b!1527580 m!1410493))

(declare-fun m!1410517 () Bool)

(assert (=> b!1527580 m!1410517))

(declare-fun m!1410519 () Bool)

(assert (=> b!1527583 m!1410519))

(declare-fun m!1410521 () Bool)

(assert (=> b!1527583 m!1410521))

(declare-fun m!1410523 () Bool)

(assert (=> b!1527579 m!1410523))

(assert (=> b!1527579 m!1410523))

(declare-fun m!1410525 () Bool)

(assert (=> b!1527579 m!1410525))

(declare-fun m!1410527 () Bool)

(assert (=> b!1527579 m!1410527))

(declare-fun m!1410529 () Bool)

(assert (=> b!1527579 m!1410529))

(push 1)

