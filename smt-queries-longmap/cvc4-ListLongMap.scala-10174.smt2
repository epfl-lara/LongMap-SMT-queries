; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119974 () Bool)

(assert start!119974)

(declare-fun b!1396610 () Bool)

(declare-fun res!935526 () Bool)

(declare-fun e!790672 () Bool)

(assert (=> b!1396610 (=> (not res!935526) (not e!790672))))

(declare-datatypes ((array!95503 0))(
  ( (array!95504 (arr!46105 (Array (_ BitVec 32) (_ BitVec 64))) (size!46655 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95503)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95503 (_ BitVec 32)) Bool)

(assert (=> b!1396610 (= res!935526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396611 () Bool)

(declare-fun e!790670 () Bool)

(assert (=> b!1396611 (= e!790670 true)))

(declare-fun lt!613562 () (_ BitVec 64))

(declare-fun lt!613558 () array!95503)

(declare-datatypes ((SeekEntryResult!10422 0))(
  ( (MissingZero!10422 (index!44059 (_ BitVec 32))) (Found!10422 (index!44060 (_ BitVec 32))) (Intermediate!10422 (undefined!11234 Bool) (index!44061 (_ BitVec 32)) (x!125724 (_ BitVec 32))) (Undefined!10422) (MissingVacant!10422 (index!44062 (_ BitVec 32))) )
))
(declare-fun lt!613561 () SeekEntryResult!10422)

(declare-fun lt!613557 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95503 (_ BitVec 32)) SeekEntryResult!10422)

(assert (=> b!1396611 (= lt!613561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613557 lt!613562 lt!613558 mask!2840))))

(declare-fun b!1396612 () Bool)

(declare-fun res!935528 () Bool)

(assert (=> b!1396612 (=> (not res!935528) (not e!790672))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396612 (= res!935528 (validKeyInArray!0 (select (arr!46105 a!2901) i!1037)))))

(declare-fun b!1396613 () Bool)

(declare-fun res!935523 () Bool)

(assert (=> b!1396613 (=> (not res!935523) (not e!790672))))

(declare-datatypes ((List!32624 0))(
  ( (Nil!32621) (Cons!32620 (h!33862 (_ BitVec 64)) (t!47318 List!32624)) )
))
(declare-fun arrayNoDuplicates!0 (array!95503 (_ BitVec 32) List!32624) Bool)

(assert (=> b!1396613 (= res!935523 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32621))))

(declare-fun b!1396614 () Bool)

(declare-fun e!790671 () Bool)

(assert (=> b!1396614 (= e!790672 (not e!790671))))

(declare-fun res!935522 () Bool)

(assert (=> b!1396614 (=> res!935522 e!790671)))

(declare-fun lt!613560 () SeekEntryResult!10422)

(assert (=> b!1396614 (= res!935522 (or (not (is-Intermediate!10422 lt!613560)) (undefined!11234 lt!613560)))))

(declare-fun e!790669 () Bool)

(assert (=> b!1396614 e!790669))

(declare-fun res!935525 () Bool)

(assert (=> b!1396614 (=> (not res!935525) (not e!790669))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396614 (= res!935525 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46848 0))(
  ( (Unit!46849) )
))
(declare-fun lt!613563 () Unit!46848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46848)

(assert (=> b!1396614 (= lt!613563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396614 (= lt!613560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613557 (select (arr!46105 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396614 (= lt!613557 (toIndex!0 (select (arr!46105 a!2901) j!112) mask!2840))))

(declare-fun b!1396615 () Bool)

(declare-fun res!935529 () Bool)

(assert (=> b!1396615 (=> (not res!935529) (not e!790672))))

(assert (=> b!1396615 (= res!935529 (validKeyInArray!0 (select (arr!46105 a!2901) j!112)))))

(declare-fun b!1396609 () Bool)

(assert (=> b!1396609 (= e!790671 e!790670)))

(declare-fun res!935524 () Bool)

(assert (=> b!1396609 (=> res!935524 e!790670)))

(declare-fun lt!613559 () SeekEntryResult!10422)

(assert (=> b!1396609 (= res!935524 (or (= lt!613560 lt!613559) (not (is-Intermediate!10422 lt!613559)) (bvslt (x!125724 lt!613560) #b00000000000000000000000000000000) (bvsgt (x!125724 lt!613560) #b01111111111111111111111111111110) (bvslt lt!613557 #b00000000000000000000000000000000) (bvsge lt!613557 (size!46655 a!2901)) (bvslt (index!44061 lt!613560) #b00000000000000000000000000000000) (bvsge (index!44061 lt!613560) (size!46655 a!2901)) (not (= lt!613560 (Intermediate!10422 false (index!44061 lt!613560) (x!125724 lt!613560)))) (not (= lt!613559 (Intermediate!10422 (undefined!11234 lt!613559) (index!44061 lt!613559) (x!125724 lt!613559))))))))

(assert (=> b!1396609 (= lt!613559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613562 mask!2840) lt!613562 lt!613558 mask!2840))))

(assert (=> b!1396609 (= lt!613562 (select (store (arr!46105 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396609 (= lt!613558 (array!95504 (store (arr!46105 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46655 a!2901)))))

(declare-fun res!935527 () Bool)

(assert (=> start!119974 (=> (not res!935527) (not e!790672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119974 (= res!935527 (validMask!0 mask!2840))))

(assert (=> start!119974 e!790672))

(assert (=> start!119974 true))

(declare-fun array_inv!35133 (array!95503) Bool)

(assert (=> start!119974 (array_inv!35133 a!2901)))

(declare-fun b!1396616 () Bool)

(declare-fun res!935530 () Bool)

(assert (=> b!1396616 (=> (not res!935530) (not e!790672))))

(assert (=> b!1396616 (= res!935530 (and (= (size!46655 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46655 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46655 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95503 (_ BitVec 32)) SeekEntryResult!10422)

(assert (=> b!1396617 (= e!790669 (= (seekEntryOrOpen!0 (select (arr!46105 a!2901) j!112) a!2901 mask!2840) (Found!10422 j!112)))))

(assert (= (and start!119974 res!935527) b!1396616))

(assert (= (and b!1396616 res!935530) b!1396612))

(assert (= (and b!1396612 res!935528) b!1396615))

(assert (= (and b!1396615 res!935529) b!1396610))

(assert (= (and b!1396610 res!935526) b!1396613))

(assert (= (and b!1396613 res!935523) b!1396614))

(assert (= (and b!1396614 res!935525) b!1396617))

(assert (= (and b!1396614 (not res!935522)) b!1396609))

(assert (= (and b!1396609 (not res!935524)) b!1396611))

(declare-fun m!1283103 () Bool)

(assert (=> b!1396609 m!1283103))

(assert (=> b!1396609 m!1283103))

(declare-fun m!1283105 () Bool)

(assert (=> b!1396609 m!1283105))

(declare-fun m!1283107 () Bool)

(assert (=> b!1396609 m!1283107))

(declare-fun m!1283109 () Bool)

(assert (=> b!1396609 m!1283109))

(declare-fun m!1283111 () Bool)

(assert (=> b!1396611 m!1283111))

(declare-fun m!1283113 () Bool)

(assert (=> b!1396615 m!1283113))

(assert (=> b!1396615 m!1283113))

(declare-fun m!1283115 () Bool)

(assert (=> b!1396615 m!1283115))

(assert (=> b!1396617 m!1283113))

(assert (=> b!1396617 m!1283113))

(declare-fun m!1283117 () Bool)

(assert (=> b!1396617 m!1283117))

(declare-fun m!1283119 () Bool)

(assert (=> b!1396613 m!1283119))

(declare-fun m!1283121 () Bool)

(assert (=> start!119974 m!1283121))

(declare-fun m!1283123 () Bool)

(assert (=> start!119974 m!1283123))

(declare-fun m!1283125 () Bool)

(assert (=> b!1396610 m!1283125))

(declare-fun m!1283127 () Bool)

(assert (=> b!1396612 m!1283127))

(assert (=> b!1396612 m!1283127))

(declare-fun m!1283129 () Bool)

(assert (=> b!1396612 m!1283129))

(assert (=> b!1396614 m!1283113))

(declare-fun m!1283131 () Bool)

(assert (=> b!1396614 m!1283131))

(assert (=> b!1396614 m!1283113))

(declare-fun m!1283133 () Bool)

(assert (=> b!1396614 m!1283133))

(assert (=> b!1396614 m!1283113))

(declare-fun m!1283135 () Bool)

(assert (=> b!1396614 m!1283135))

(declare-fun m!1283137 () Bool)

(assert (=> b!1396614 m!1283137))

(push 1)

