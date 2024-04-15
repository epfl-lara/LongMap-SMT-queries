; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121146 () Bool)

(assert start!121146)

(declare-fun b!1408565 () Bool)

(declare-fun e!797160 () Bool)

(assert (=> b!1408565 (= e!797160 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96253 0))(
  ( (array!96254 (arr!46470 (Array (_ BitVec 32) (_ BitVec 64))) (size!47022 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96253)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10807 0))(
  ( (MissingZero!10807 (index!45605 (_ BitVec 32))) (Found!10807 (index!45606 (_ BitVec 32))) (Intermediate!10807 (undefined!11619 Bool) (index!45607 (_ BitVec 32)) (x!127197 (_ BitVec 32))) (Undefined!10807) (MissingVacant!10807 (index!45608 (_ BitVec 32))) )
))
(declare-fun lt!620237 () SeekEntryResult!10807)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96253 (_ BitVec 32)) SeekEntryResult!10807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408565 (= lt!620237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96254 (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47022 a!2901)) mask!2840))))

(declare-fun e!797159 () Bool)

(declare-fun b!1408566 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96253 (_ BitVec 32)) SeekEntryResult!10807)

(assert (=> b!1408566 (= e!797159 (= (seekEntryOrOpen!0 (select (arr!46470 a!2901) j!112) a!2901 mask!2840) (Found!10807 j!112)))))

(declare-fun b!1408567 () Bool)

(declare-fun e!797162 () Bool)

(assert (=> b!1408567 (= e!797162 (not e!797160))))

(declare-fun res!946338 () Bool)

(assert (=> b!1408567 (=> res!946338 e!797160)))

(declare-fun lt!620235 () SeekEntryResult!10807)

(assert (=> b!1408567 (= res!946338 (or (not (is-Intermediate!10807 lt!620235)) (undefined!11619 lt!620235)))))

(assert (=> b!1408567 e!797159))

(declare-fun res!946341 () Bool)

(assert (=> b!1408567 (=> (not res!946341) (not e!797159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96253 (_ BitVec 32)) Bool)

(assert (=> b!1408567 (= res!946341 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47431 0))(
  ( (Unit!47432) )
))
(declare-fun lt!620236 () Unit!47431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47431)

(assert (=> b!1408567 (= lt!620236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408567 (= lt!620235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46470 a!2901) j!112) mask!2840) (select (arr!46470 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408568 () Bool)

(declare-fun res!946345 () Bool)

(assert (=> b!1408568 (=> (not res!946345) (not e!797162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408568 (= res!946345 (validKeyInArray!0 (select (arr!46470 a!2901) i!1037)))))

(declare-fun b!1408569 () Bool)

(declare-fun res!946344 () Bool)

(assert (=> b!1408569 (=> (not res!946344) (not e!797162))))

(declare-datatypes ((List!33067 0))(
  ( (Nil!33064) (Cons!33063 (h!34326 (_ BitVec 64)) (t!47753 List!33067)) )
))
(declare-fun arrayNoDuplicates!0 (array!96253 (_ BitVec 32) List!33067) Bool)

(assert (=> b!1408569 (= res!946344 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33064))))

(declare-fun b!1408570 () Bool)

(declare-fun res!946342 () Bool)

(assert (=> b!1408570 (=> (not res!946342) (not e!797162))))

(assert (=> b!1408570 (= res!946342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408571 () Bool)

(declare-fun res!946340 () Bool)

(assert (=> b!1408571 (=> (not res!946340) (not e!797162))))

(assert (=> b!1408571 (= res!946340 (validKeyInArray!0 (select (arr!46470 a!2901) j!112)))))

(declare-fun b!1408572 () Bool)

(declare-fun res!946343 () Bool)

(assert (=> b!1408572 (=> (not res!946343) (not e!797162))))

(assert (=> b!1408572 (= res!946343 (and (= (size!47022 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47022 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47022 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946339 () Bool)

(assert (=> start!121146 (=> (not res!946339) (not e!797162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121146 (= res!946339 (validMask!0 mask!2840))))

(assert (=> start!121146 e!797162))

(assert (=> start!121146 true))

(declare-fun array_inv!35703 (array!96253) Bool)

(assert (=> start!121146 (array_inv!35703 a!2901)))

(assert (= (and start!121146 res!946339) b!1408572))

(assert (= (and b!1408572 res!946343) b!1408568))

(assert (= (and b!1408568 res!946345) b!1408571))

(assert (= (and b!1408571 res!946340) b!1408570))

(assert (= (and b!1408570 res!946342) b!1408569))

(assert (= (and b!1408569 res!946344) b!1408567))

(assert (= (and b!1408567 res!946341) b!1408566))

(assert (= (and b!1408567 (not res!946338)) b!1408565))

(declare-fun m!1297497 () Bool)

(assert (=> start!121146 m!1297497))

(declare-fun m!1297499 () Bool)

(assert (=> start!121146 m!1297499))

(declare-fun m!1297501 () Bool)

(assert (=> b!1408566 m!1297501))

(assert (=> b!1408566 m!1297501))

(declare-fun m!1297503 () Bool)

(assert (=> b!1408566 m!1297503))

(declare-fun m!1297505 () Bool)

(assert (=> b!1408569 m!1297505))

(declare-fun m!1297507 () Bool)

(assert (=> b!1408570 m!1297507))

(assert (=> b!1408571 m!1297501))

(assert (=> b!1408571 m!1297501))

(declare-fun m!1297509 () Bool)

(assert (=> b!1408571 m!1297509))

(assert (=> b!1408567 m!1297501))

(declare-fun m!1297511 () Bool)

(assert (=> b!1408567 m!1297511))

(assert (=> b!1408567 m!1297501))

(declare-fun m!1297513 () Bool)

(assert (=> b!1408567 m!1297513))

(assert (=> b!1408567 m!1297511))

(assert (=> b!1408567 m!1297501))

(declare-fun m!1297515 () Bool)

(assert (=> b!1408567 m!1297515))

(declare-fun m!1297517 () Bool)

(assert (=> b!1408567 m!1297517))

(declare-fun m!1297519 () Bool)

(assert (=> b!1408565 m!1297519))

(declare-fun m!1297521 () Bool)

(assert (=> b!1408565 m!1297521))

(assert (=> b!1408565 m!1297521))

(declare-fun m!1297523 () Bool)

(assert (=> b!1408565 m!1297523))

(assert (=> b!1408565 m!1297523))

(assert (=> b!1408565 m!1297521))

(declare-fun m!1297525 () Bool)

(assert (=> b!1408565 m!1297525))

(declare-fun m!1297527 () Bool)

(assert (=> b!1408568 m!1297527))

(assert (=> b!1408568 m!1297527))

(declare-fun m!1297529 () Bool)

(assert (=> b!1408568 m!1297529))

(push 1)

(assert (not b!1408571))

(assert (not b!1408570))

(assert (not b!1408568))

(assert (not start!121146))

(assert (not b!1408569))

(assert (not b!1408567))

(assert (not b!1408566))

(assert (not b!1408565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

