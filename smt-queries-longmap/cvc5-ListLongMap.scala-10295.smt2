; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121284 () Bool)

(assert start!121284)

(declare-fun b!1409093 () Bool)

(declare-fun res!946135 () Bool)

(declare-fun e!797613 () Bool)

(assert (=> b!1409093 (=> (not res!946135) (not e!797613))))

(declare-datatypes ((array!96360 0))(
  ( (array!96361 (arr!46521 (Array (_ BitVec 32) (_ BitVec 64))) (size!47072 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96360)

(declare-datatypes ((List!33027 0))(
  ( (Nil!33024) (Cons!33023 (h!34294 (_ BitVec 64)) (t!47713 List!33027)) )
))
(declare-fun arrayNoDuplicates!0 (array!96360 (_ BitVec 32) List!33027) Bool)

(assert (=> b!1409093 (= res!946135 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33024))))

(declare-fun b!1409094 () Bool)

(declare-fun res!946136 () Bool)

(assert (=> b!1409094 (=> (not res!946136) (not e!797613))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409094 (= res!946136 (validKeyInArray!0 (select (arr!46521 a!2901) i!1037)))))

(declare-fun b!1409095 () Bool)

(declare-fun e!797612 () Bool)

(assert (=> b!1409095 (= e!797613 (not e!797612))))

(declare-fun res!946134 () Bool)

(assert (=> b!1409095 (=> res!946134 e!797612)))

(declare-datatypes ((SeekEntryResult!10735 0))(
  ( (MissingZero!10735 (index!45317 (_ BitVec 32))) (Found!10735 (index!45318 (_ BitVec 32))) (Intermediate!10735 (undefined!11547 Bool) (index!45319 (_ BitVec 32)) (x!127075 (_ BitVec 32))) (Undefined!10735) (MissingVacant!10735 (index!45320 (_ BitVec 32))) )
))
(declare-fun lt!620402 () SeekEntryResult!10735)

(assert (=> b!1409095 (= res!946134 (or (not (is-Intermediate!10735 lt!620402)) (undefined!11547 lt!620402)))))

(declare-fun e!797614 () Bool)

(assert (=> b!1409095 e!797614))

(declare-fun res!946133 () Bool)

(assert (=> b!1409095 (=> (not res!946133) (not e!797614))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96360 (_ BitVec 32)) Bool)

(assert (=> b!1409095 (= res!946133 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47471 0))(
  ( (Unit!47472) )
))
(declare-fun lt!620400 () Unit!47471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47471)

(assert (=> b!1409095 (= lt!620400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96360 (_ BitVec 32)) SeekEntryResult!10735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409095 (= lt!620402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46521 a!2901) j!112) mask!2840) (select (arr!46521 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409096 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96360 (_ BitVec 32)) SeekEntryResult!10735)

(assert (=> b!1409096 (= e!797614 (= (seekEntryOrOpen!0 (select (arr!46521 a!2901) j!112) a!2901 mask!2840) (Found!10735 j!112)))))

(declare-fun res!946132 () Bool)

(assert (=> start!121284 (=> (not res!946132) (not e!797613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121284 (= res!946132 (validMask!0 mask!2840))))

(assert (=> start!121284 e!797613))

(assert (=> start!121284 true))

(declare-fun array_inv!35802 (array!96360) Bool)

(assert (=> start!121284 (array_inv!35802 a!2901)))

(declare-fun b!1409097 () Bool)

(declare-fun res!946131 () Bool)

(assert (=> b!1409097 (=> (not res!946131) (not e!797613))))

(assert (=> b!1409097 (= res!946131 (and (= (size!47072 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47072 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47072 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409098 () Bool)

(assert (=> b!1409098 (= e!797612 true)))

(declare-fun lt!620401 () SeekEntryResult!10735)

(assert (=> b!1409098 (= lt!620401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96361 (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47072 a!2901)) mask!2840))))

(declare-fun b!1409099 () Bool)

(declare-fun res!946137 () Bool)

(assert (=> b!1409099 (=> (not res!946137) (not e!797613))))

(assert (=> b!1409099 (= res!946137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409100 () Bool)

(declare-fun res!946138 () Bool)

(assert (=> b!1409100 (=> (not res!946138) (not e!797613))))

(assert (=> b!1409100 (= res!946138 (validKeyInArray!0 (select (arr!46521 a!2901) j!112)))))

(assert (= (and start!121284 res!946132) b!1409097))

(assert (= (and b!1409097 res!946131) b!1409094))

(assert (= (and b!1409094 res!946136) b!1409100))

(assert (= (and b!1409100 res!946138) b!1409099))

(assert (= (and b!1409099 res!946137) b!1409093))

(assert (= (and b!1409093 res!946135) b!1409095))

(assert (= (and b!1409095 res!946133) b!1409096))

(assert (= (and b!1409095 (not res!946134)) b!1409098))

(declare-fun m!1298427 () Bool)

(assert (=> start!121284 m!1298427))

(declare-fun m!1298429 () Bool)

(assert (=> start!121284 m!1298429))

(declare-fun m!1298431 () Bool)

(assert (=> b!1409093 m!1298431))

(declare-fun m!1298433 () Bool)

(assert (=> b!1409094 m!1298433))

(assert (=> b!1409094 m!1298433))

(declare-fun m!1298435 () Bool)

(assert (=> b!1409094 m!1298435))

(declare-fun m!1298437 () Bool)

(assert (=> b!1409100 m!1298437))

(assert (=> b!1409100 m!1298437))

(declare-fun m!1298439 () Bool)

(assert (=> b!1409100 m!1298439))

(declare-fun m!1298441 () Bool)

(assert (=> b!1409098 m!1298441))

(declare-fun m!1298443 () Bool)

(assert (=> b!1409098 m!1298443))

(assert (=> b!1409098 m!1298443))

(declare-fun m!1298445 () Bool)

(assert (=> b!1409098 m!1298445))

(assert (=> b!1409098 m!1298445))

(assert (=> b!1409098 m!1298443))

(declare-fun m!1298447 () Bool)

(assert (=> b!1409098 m!1298447))

(assert (=> b!1409095 m!1298437))

(declare-fun m!1298449 () Bool)

(assert (=> b!1409095 m!1298449))

(assert (=> b!1409095 m!1298437))

(declare-fun m!1298451 () Bool)

(assert (=> b!1409095 m!1298451))

(assert (=> b!1409095 m!1298449))

(assert (=> b!1409095 m!1298437))

(declare-fun m!1298453 () Bool)

(assert (=> b!1409095 m!1298453))

(declare-fun m!1298455 () Bool)

(assert (=> b!1409095 m!1298455))

(assert (=> b!1409096 m!1298437))

(assert (=> b!1409096 m!1298437))

(declare-fun m!1298457 () Bool)

(assert (=> b!1409096 m!1298457))

(declare-fun m!1298459 () Bool)

(assert (=> b!1409099 m!1298459))

(push 1)

(assert (not b!1409099))

(assert (not b!1409095))

(assert (not b!1409093))

(assert (not b!1409094))

(assert (not b!1409098))

(assert (not start!121284))

(assert (not b!1409100))

(assert (not b!1409096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

