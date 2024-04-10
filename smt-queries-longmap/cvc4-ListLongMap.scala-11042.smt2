; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129088 () Bool)

(assert start!129088)

(declare-fun b!1514497 () Bool)

(declare-fun e!845200 () Bool)

(declare-fun e!845199 () Bool)

(assert (=> b!1514497 (= e!845200 e!845199)))

(declare-fun res!1034400 () Bool)

(assert (=> b!1514497 (=> (not res!1034400) (not e!845199))))

(declare-datatypes ((SeekEntryResult!12880 0))(
  ( (MissingZero!12880 (index!53915 (_ BitVec 32))) (Found!12880 (index!53916 (_ BitVec 32))) (Intermediate!12880 (undefined!13692 Bool) (index!53917 (_ BitVec 32)) (x!135622 (_ BitVec 32))) (Undefined!12880) (MissingVacant!12880 (index!53918 (_ BitVec 32))) )
))
(declare-fun lt!656357 () SeekEntryResult!12880)

(declare-fun lt!656358 () SeekEntryResult!12880)

(assert (=> b!1514497 (= res!1034400 (= lt!656357 lt!656358))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514497 (= lt!656358 (Intermediate!12880 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100944 0))(
  ( (array!100945 (arr!48709 (Array (_ BitVec 32) (_ BitVec 64))) (size!49259 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100944)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100944 (_ BitVec 32)) SeekEntryResult!12880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514497 (= lt!656357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48709 a!2804) j!70) mask!2512) (select (arr!48709 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514498 () Bool)

(declare-fun res!1034413 () Bool)

(declare-fun e!845197 () Bool)

(assert (=> b!1514498 (=> (not res!1034413) (not e!845197))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100944 (_ BitVec 32)) SeekEntryResult!12880)

(assert (=> b!1514498 (= res!1034413 (= (seekEntry!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) (Found!12880 j!70)))))

(declare-fun b!1514499 () Bool)

(declare-fun res!1034401 () Bool)

(assert (=> b!1514499 (=> (not res!1034401) (not e!845199))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1514499 (= res!1034401 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) lt!656358))))

(declare-fun b!1514500 () Bool)

(declare-fun res!1034408 () Bool)

(assert (=> b!1514500 (=> (not res!1034408) (not e!845200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100944 (_ BitVec 32)) Bool)

(assert (=> b!1514500 (= res!1034408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514501 () Bool)

(declare-fun res!1034407 () Bool)

(assert (=> b!1514501 (=> (not res!1034407) (not e!845200))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514501 (= res!1034407 (and (= (size!49259 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49259 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49259 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1034409 () Bool)

(assert (=> start!129088 (=> (not res!1034409) (not e!845200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129088 (= res!1034409 (validMask!0 mask!2512))))

(assert (=> start!129088 e!845200))

(assert (=> start!129088 true))

(declare-fun array_inv!37737 (array!100944) Bool)

(assert (=> start!129088 (array_inv!37737 a!2804)))

(declare-fun lt!656359 () array!100944)

(declare-fun b!1514502 () Bool)

(declare-fun e!845198 () Bool)

(declare-fun lt!656355 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100944 (_ BitVec 32)) SeekEntryResult!12880)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100944 (_ BitVec 32)) SeekEntryResult!12880)

(assert (=> b!1514502 (= e!845198 (= (seekEntryOrOpen!0 lt!656355 lt!656359 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656355 lt!656359 mask!2512)))))

(declare-fun b!1514503 () Bool)

(declare-fun res!1034403 () Bool)

(assert (=> b!1514503 (=> (not res!1034403) (not e!845200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514503 (= res!1034403 (validKeyInArray!0 (select (arr!48709 a!2804) j!70)))))

(declare-fun b!1514504 () Bool)

(declare-fun e!845203 () Bool)

(assert (=> b!1514504 (= e!845203 (not true))))

(assert (=> b!1514504 e!845197))

(declare-fun res!1034405 () Bool)

(assert (=> b!1514504 (=> (not res!1034405) (not e!845197))))

(assert (=> b!1514504 (= res!1034405 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50628 0))(
  ( (Unit!50629) )
))
(declare-fun lt!656356 () Unit!50628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50628)

(assert (=> b!1514504 (= lt!656356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514505 () Bool)

(declare-fun e!845202 () Bool)

(assert (=> b!1514505 (= e!845197 e!845202)))

(declare-fun res!1034410 () Bool)

(assert (=> b!1514505 (=> res!1034410 e!845202)))

(assert (=> b!1514505 (= res!1034410 (or (not (= (select (arr!48709 a!2804) j!70) lt!656355)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48709 a!2804) index!487) (select (arr!48709 a!2804) j!70)) (not (= (select (arr!48709 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514506 () Bool)

(declare-fun res!1034412 () Bool)

(assert (=> b!1514506 (=> (not res!1034412) (not e!845200))))

(assert (=> b!1514506 (= res!1034412 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49259 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49259 a!2804))))))

(declare-fun b!1514507 () Bool)

(assert (=> b!1514507 (= e!845202 e!845198)))

(declare-fun res!1034411 () Bool)

(assert (=> b!1514507 (=> (not res!1034411) (not e!845198))))

(assert (=> b!1514507 (= res!1034411 (= (seekEntryOrOpen!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514508 () Bool)

(assert (=> b!1514508 (= e!845199 e!845203)))

(declare-fun res!1034402 () Bool)

(assert (=> b!1514508 (=> (not res!1034402) (not e!845203))))

(assert (=> b!1514508 (= res!1034402 (= lt!656357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656355 mask!2512) lt!656355 lt!656359 mask!2512)))))

(assert (=> b!1514508 (= lt!656355 (select (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514508 (= lt!656359 (array!100945 (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49259 a!2804)))))

(declare-fun b!1514509 () Bool)

(declare-fun res!1034406 () Bool)

(assert (=> b!1514509 (=> (not res!1034406) (not e!845200))))

(assert (=> b!1514509 (= res!1034406 (validKeyInArray!0 (select (arr!48709 a!2804) i!961)))))

(declare-fun b!1514510 () Bool)

(declare-fun res!1034404 () Bool)

(assert (=> b!1514510 (=> (not res!1034404) (not e!845200))))

(declare-datatypes ((List!35192 0))(
  ( (Nil!35189) (Cons!35188 (h!36600 (_ BitVec 64)) (t!49886 List!35192)) )
))
(declare-fun arrayNoDuplicates!0 (array!100944 (_ BitVec 32) List!35192) Bool)

(assert (=> b!1514510 (= res!1034404 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35189))))

(assert (= (and start!129088 res!1034409) b!1514501))

(assert (= (and b!1514501 res!1034407) b!1514509))

(assert (= (and b!1514509 res!1034406) b!1514503))

(assert (= (and b!1514503 res!1034403) b!1514500))

(assert (= (and b!1514500 res!1034408) b!1514510))

(assert (= (and b!1514510 res!1034404) b!1514506))

(assert (= (and b!1514506 res!1034412) b!1514497))

(assert (= (and b!1514497 res!1034400) b!1514499))

(assert (= (and b!1514499 res!1034401) b!1514508))

(assert (= (and b!1514508 res!1034402) b!1514504))

(assert (= (and b!1514504 res!1034405) b!1514498))

(assert (= (and b!1514498 res!1034413) b!1514505))

(assert (= (and b!1514505 (not res!1034410)) b!1514507))

(assert (= (and b!1514507 res!1034411) b!1514502))

(declare-fun m!1397457 () Bool)

(assert (=> b!1514503 m!1397457))

(assert (=> b!1514503 m!1397457))

(declare-fun m!1397459 () Bool)

(assert (=> b!1514503 m!1397459))

(assert (=> b!1514507 m!1397457))

(assert (=> b!1514507 m!1397457))

(declare-fun m!1397461 () Bool)

(assert (=> b!1514507 m!1397461))

(assert (=> b!1514507 m!1397457))

(declare-fun m!1397463 () Bool)

(assert (=> b!1514507 m!1397463))

(assert (=> b!1514497 m!1397457))

(assert (=> b!1514497 m!1397457))

(declare-fun m!1397465 () Bool)

(assert (=> b!1514497 m!1397465))

(assert (=> b!1514497 m!1397465))

(assert (=> b!1514497 m!1397457))

(declare-fun m!1397467 () Bool)

(assert (=> b!1514497 m!1397467))

(declare-fun m!1397469 () Bool)

(assert (=> b!1514510 m!1397469))

(declare-fun m!1397471 () Bool)

(assert (=> b!1514502 m!1397471))

(declare-fun m!1397473 () Bool)

(assert (=> b!1514502 m!1397473))

(declare-fun m!1397475 () Bool)

(assert (=> b!1514509 m!1397475))

(assert (=> b!1514509 m!1397475))

(declare-fun m!1397477 () Bool)

(assert (=> b!1514509 m!1397477))

(declare-fun m!1397479 () Bool)

(assert (=> b!1514500 m!1397479))

(assert (=> b!1514498 m!1397457))

(assert (=> b!1514498 m!1397457))

(declare-fun m!1397481 () Bool)

(assert (=> b!1514498 m!1397481))

(declare-fun m!1397483 () Bool)

(assert (=> b!1514504 m!1397483))

(declare-fun m!1397485 () Bool)

(assert (=> b!1514504 m!1397485))

(assert (=> b!1514499 m!1397457))

(assert (=> b!1514499 m!1397457))

(declare-fun m!1397487 () Bool)

(assert (=> b!1514499 m!1397487))

(declare-fun m!1397489 () Bool)

(assert (=> start!129088 m!1397489))

(declare-fun m!1397491 () Bool)

(assert (=> start!129088 m!1397491))

(declare-fun m!1397493 () Bool)

(assert (=> b!1514508 m!1397493))

(assert (=> b!1514508 m!1397493))

(declare-fun m!1397495 () Bool)

(assert (=> b!1514508 m!1397495))

(declare-fun m!1397497 () Bool)

(assert (=> b!1514508 m!1397497))

(declare-fun m!1397499 () Bool)

(assert (=> b!1514508 m!1397499))

(assert (=> b!1514505 m!1397457))

(declare-fun m!1397501 () Bool)

(assert (=> b!1514505 m!1397501))

(push 1)

