; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129094 () Bool)

(assert start!129094)

(declare-fun b!1514623 () Bool)

(declare-fun res!1034528 () Bool)

(declare-fun e!845260 () Bool)

(assert (=> b!1514623 (=> (not res!1034528) (not e!845260))))

(declare-datatypes ((SeekEntryResult!12883 0))(
  ( (MissingZero!12883 (index!53927 (_ BitVec 32))) (Found!12883 (index!53928 (_ BitVec 32))) (Intermediate!12883 (undefined!13695 Bool) (index!53929 (_ BitVec 32)) (x!135633 (_ BitVec 32))) (Undefined!12883) (MissingVacant!12883 (index!53930 (_ BitVec 32))) )
))
(declare-fun lt!656402 () SeekEntryResult!12883)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100950 0))(
  ( (array!100951 (arr!48712 (Array (_ BitVec 32) (_ BitVec 64))) (size!49262 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100950)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100950 (_ BitVec 32)) SeekEntryResult!12883)

(assert (=> b!1514623 (= res!1034528 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) lt!656402))))

(declare-fun b!1514625 () Bool)

(declare-fun res!1034527 () Bool)

(declare-fun e!845263 () Bool)

(assert (=> b!1514625 (=> (not res!1034527) (not e!845263))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514625 (= res!1034527 (validKeyInArray!0 (select (arr!48712 a!2804) i!961)))))

(declare-fun b!1514626 () Bool)

(declare-fun res!1034537 () Bool)

(assert (=> b!1514626 (=> (not res!1034537) (not e!845263))))

(declare-datatypes ((List!35195 0))(
  ( (Nil!35192) (Cons!35191 (h!36603 (_ BitVec 64)) (t!49889 List!35195)) )
))
(declare-fun arrayNoDuplicates!0 (array!100950 (_ BitVec 32) List!35195) Bool)

(assert (=> b!1514626 (= res!1034537 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35192))))

(declare-fun b!1514627 () Bool)

(declare-fun e!845264 () Bool)

(assert (=> b!1514627 (= e!845264 (not true))))

(declare-fun e!845266 () Bool)

(assert (=> b!1514627 e!845266))

(declare-fun res!1034530 () Bool)

(assert (=> b!1514627 (=> (not res!1034530) (not e!845266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100950 (_ BitVec 32)) Bool)

(assert (=> b!1514627 (= res!1034530 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50634 0))(
  ( (Unit!50635) )
))
(declare-fun lt!656400 () Unit!50634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50634)

(assert (=> b!1514627 (= lt!656400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514628 () Bool)

(declare-fun res!1034531 () Bool)

(assert (=> b!1514628 (=> (not res!1034531) (not e!845263))))

(assert (=> b!1514628 (= res!1034531 (and (= (size!49262 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49262 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49262 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514629 () Bool)

(declare-fun res!1034536 () Bool)

(assert (=> b!1514629 (=> (not res!1034536) (not e!845263))))

(assert (=> b!1514629 (= res!1034536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514630 () Bool)

(declare-fun e!845261 () Bool)

(assert (=> b!1514630 (= e!845266 e!845261)))

(declare-fun res!1034535 () Bool)

(assert (=> b!1514630 (=> res!1034535 e!845261)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!656404 () (_ BitVec 64))

(assert (=> b!1514630 (= res!1034535 (or (not (= (select (arr!48712 a!2804) j!70) lt!656404)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48712 a!2804) index!487) (select (arr!48712 a!2804) j!70)) (not (= (select (arr!48712 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514631 () Bool)

(assert (=> b!1514631 (= e!845260 e!845264)))

(declare-fun res!1034526 () Bool)

(assert (=> b!1514631 (=> (not res!1034526) (not e!845264))))

(declare-fun lt!656401 () SeekEntryResult!12883)

(declare-fun lt!656403 () array!100950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514631 (= res!1034526 (= lt!656401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656404 mask!2512) lt!656404 lt!656403 mask!2512)))))

(assert (=> b!1514631 (= lt!656404 (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514631 (= lt!656403 (array!100951 (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49262 a!2804)))))

(declare-fun b!1514632 () Bool)

(declare-fun res!1034532 () Bool)

(assert (=> b!1514632 (=> (not res!1034532) (not e!845266))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100950 (_ BitVec 32)) SeekEntryResult!12883)

(assert (=> b!1514632 (= res!1034532 (= (seekEntry!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) (Found!12883 j!70)))))

(declare-fun b!1514633 () Bool)

(assert (=> b!1514633 (= e!845263 e!845260)))

(declare-fun res!1034533 () Bool)

(assert (=> b!1514633 (=> (not res!1034533) (not e!845260))))

(assert (=> b!1514633 (= res!1034533 (= lt!656401 lt!656402))))

(assert (=> b!1514633 (= lt!656402 (Intermediate!12883 false resIndex!21 resX!21))))

(assert (=> b!1514633 (= lt!656401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48712 a!2804) j!70) mask!2512) (select (arr!48712 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!845265 () Bool)

(declare-fun b!1514634 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100950 (_ BitVec 32)) SeekEntryResult!12883)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100950 (_ BitVec 32)) SeekEntryResult!12883)

(assert (=> b!1514634 (= e!845265 (= (seekEntryOrOpen!0 lt!656404 lt!656403 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656404 lt!656403 mask!2512)))))

(declare-fun b!1514635 () Bool)

(declare-fun res!1034539 () Bool)

(assert (=> b!1514635 (=> (not res!1034539) (not e!845263))))

(assert (=> b!1514635 (= res!1034539 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49262 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49262 a!2804))))))

(declare-fun b!1514636 () Bool)

(assert (=> b!1514636 (= e!845261 e!845265)))

(declare-fun res!1034538 () Bool)

(assert (=> b!1514636 (=> (not res!1034538) (not e!845265))))

(assert (=> b!1514636 (= res!1034538 (= (seekEntryOrOpen!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1034534 () Bool)

(assert (=> start!129094 (=> (not res!1034534) (not e!845263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129094 (= res!1034534 (validMask!0 mask!2512))))

(assert (=> start!129094 e!845263))

(assert (=> start!129094 true))

(declare-fun array_inv!37740 (array!100950) Bool)

(assert (=> start!129094 (array_inv!37740 a!2804)))

(declare-fun b!1514624 () Bool)

(declare-fun res!1034529 () Bool)

(assert (=> b!1514624 (=> (not res!1034529) (not e!845263))))

(assert (=> b!1514624 (= res!1034529 (validKeyInArray!0 (select (arr!48712 a!2804) j!70)))))

(assert (= (and start!129094 res!1034534) b!1514628))

(assert (= (and b!1514628 res!1034531) b!1514625))

(assert (= (and b!1514625 res!1034527) b!1514624))

(assert (= (and b!1514624 res!1034529) b!1514629))

(assert (= (and b!1514629 res!1034536) b!1514626))

(assert (= (and b!1514626 res!1034537) b!1514635))

(assert (= (and b!1514635 res!1034539) b!1514633))

(assert (= (and b!1514633 res!1034533) b!1514623))

(assert (= (and b!1514623 res!1034528) b!1514631))

(assert (= (and b!1514631 res!1034526) b!1514627))

(assert (= (and b!1514627 res!1034530) b!1514632))

(assert (= (and b!1514632 res!1034532) b!1514630))

(assert (= (and b!1514630 (not res!1034535)) b!1514636))

(assert (= (and b!1514636 res!1034538) b!1514634))

(declare-fun m!1397595 () Bool)

(assert (=> b!1514625 m!1397595))

(assert (=> b!1514625 m!1397595))

(declare-fun m!1397597 () Bool)

(assert (=> b!1514625 m!1397597))

(declare-fun m!1397599 () Bool)

(assert (=> b!1514636 m!1397599))

(assert (=> b!1514636 m!1397599))

(declare-fun m!1397601 () Bool)

(assert (=> b!1514636 m!1397601))

(assert (=> b!1514636 m!1397599))

(declare-fun m!1397603 () Bool)

(assert (=> b!1514636 m!1397603))

(declare-fun m!1397605 () Bool)

(assert (=> b!1514631 m!1397605))

(assert (=> b!1514631 m!1397605))

(declare-fun m!1397607 () Bool)

(assert (=> b!1514631 m!1397607))

(declare-fun m!1397609 () Bool)

(assert (=> b!1514631 m!1397609))

(declare-fun m!1397611 () Bool)

(assert (=> b!1514631 m!1397611))

(assert (=> b!1514632 m!1397599))

(assert (=> b!1514632 m!1397599))

(declare-fun m!1397613 () Bool)

(assert (=> b!1514632 m!1397613))

(declare-fun m!1397615 () Bool)

(assert (=> b!1514634 m!1397615))

(declare-fun m!1397617 () Bool)

(assert (=> b!1514634 m!1397617))

(declare-fun m!1397619 () Bool)

(assert (=> b!1514627 m!1397619))

(declare-fun m!1397621 () Bool)

(assert (=> b!1514627 m!1397621))

(assert (=> b!1514624 m!1397599))

(assert (=> b!1514624 m!1397599))

(declare-fun m!1397623 () Bool)

(assert (=> b!1514624 m!1397623))

(declare-fun m!1397625 () Bool)

(assert (=> b!1514629 m!1397625))

(declare-fun m!1397627 () Bool)

(assert (=> start!129094 m!1397627))

(declare-fun m!1397629 () Bool)

(assert (=> start!129094 m!1397629))

(declare-fun m!1397631 () Bool)

(assert (=> b!1514626 m!1397631))

(assert (=> b!1514623 m!1397599))

(assert (=> b!1514623 m!1397599))

(declare-fun m!1397633 () Bool)

(assert (=> b!1514623 m!1397633))

(assert (=> b!1514633 m!1397599))

(assert (=> b!1514633 m!1397599))

(declare-fun m!1397635 () Bool)

(assert (=> b!1514633 m!1397635))

(assert (=> b!1514633 m!1397635))

(assert (=> b!1514633 m!1397599))

(declare-fun m!1397637 () Bool)

(assert (=> b!1514633 m!1397637))

(assert (=> b!1514630 m!1397599))

(declare-fun m!1397639 () Bool)

(assert (=> b!1514630 m!1397639))

(push 1)

