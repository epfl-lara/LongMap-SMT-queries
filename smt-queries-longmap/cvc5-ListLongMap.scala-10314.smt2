; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121206 () Bool)

(assert start!121206)

(declare-fun b!1409285 () Bool)

(declare-fun e!797520 () Bool)

(assert (=> b!1409285 (= e!797520 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96313 0))(
  ( (array!96314 (arr!46500 (Array (_ BitVec 32) (_ BitVec 64))) (size!47052 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96313)

(declare-datatypes ((SeekEntryResult!10837 0))(
  ( (MissingZero!10837 (index!45725 (_ BitVec 32))) (Found!10837 (index!45726 (_ BitVec 32))) (Intermediate!10837 (undefined!11649 Bool) (index!45727 (_ BitVec 32)) (x!127307 (_ BitVec 32))) (Undefined!10837) (MissingVacant!10837 (index!45728 (_ BitVec 32))) )
))
(declare-fun lt!620507 () SeekEntryResult!10837)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96313 (_ BitVec 32)) SeekEntryResult!10837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409285 (= lt!620507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96314 (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47052 a!2901)) mask!2840))))

(declare-fun b!1409287 () Bool)

(declare-fun res!947065 () Bool)

(declare-fun e!797522 () Bool)

(assert (=> b!1409287 (=> (not res!947065) (not e!797522))))

(assert (=> b!1409287 (= res!947065 (and (= (size!47052 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47052 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47052 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409288 () Bool)

(declare-fun res!947064 () Bool)

(assert (=> b!1409288 (=> (not res!947064) (not e!797522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96313 (_ BitVec 32)) Bool)

(assert (=> b!1409288 (= res!947064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409289 () Bool)

(assert (=> b!1409289 (= e!797522 (not e!797520))))

(declare-fun res!947061 () Bool)

(assert (=> b!1409289 (=> res!947061 e!797520)))

(declare-fun lt!620506 () SeekEntryResult!10837)

(assert (=> b!1409289 (= res!947061 (or (not (is-Intermediate!10837 lt!620506)) (undefined!11649 lt!620506)))))

(declare-fun e!797519 () Bool)

(assert (=> b!1409289 e!797519))

(declare-fun res!947063 () Bool)

(assert (=> b!1409289 (=> (not res!947063) (not e!797519))))

(assert (=> b!1409289 (= res!947063 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47491 0))(
  ( (Unit!47492) )
))
(declare-fun lt!620505 () Unit!47491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47491)

(assert (=> b!1409289 (= lt!620505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409289 (= lt!620506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46500 a!2901) j!112) mask!2840) (select (arr!46500 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409290 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96313 (_ BitVec 32)) SeekEntryResult!10837)

(assert (=> b!1409290 (= e!797519 (= (seekEntryOrOpen!0 (select (arr!46500 a!2901) j!112) a!2901 mask!2840) (Found!10837 j!112)))))

(declare-fun b!1409286 () Bool)

(declare-fun res!947062 () Bool)

(assert (=> b!1409286 (=> (not res!947062) (not e!797522))))

(declare-datatypes ((List!33097 0))(
  ( (Nil!33094) (Cons!33093 (h!34356 (_ BitVec 64)) (t!47783 List!33097)) )
))
(declare-fun arrayNoDuplicates!0 (array!96313 (_ BitVec 32) List!33097) Bool)

(assert (=> b!1409286 (= res!947062 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33094))))

(declare-fun res!947060 () Bool)

(assert (=> start!121206 (=> (not res!947060) (not e!797522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121206 (= res!947060 (validMask!0 mask!2840))))

(assert (=> start!121206 e!797522))

(assert (=> start!121206 true))

(declare-fun array_inv!35733 (array!96313) Bool)

(assert (=> start!121206 (array_inv!35733 a!2901)))

(declare-fun b!1409291 () Bool)

(declare-fun res!947058 () Bool)

(assert (=> b!1409291 (=> (not res!947058) (not e!797522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409291 (= res!947058 (validKeyInArray!0 (select (arr!46500 a!2901) i!1037)))))

(declare-fun b!1409292 () Bool)

(declare-fun res!947059 () Bool)

(assert (=> b!1409292 (=> (not res!947059) (not e!797522))))

(assert (=> b!1409292 (= res!947059 (validKeyInArray!0 (select (arr!46500 a!2901) j!112)))))

(assert (= (and start!121206 res!947060) b!1409287))

(assert (= (and b!1409287 res!947065) b!1409291))

(assert (= (and b!1409291 res!947058) b!1409292))

(assert (= (and b!1409292 res!947059) b!1409288))

(assert (= (and b!1409288 res!947064) b!1409286))

(assert (= (and b!1409286 res!947062) b!1409289))

(assert (= (and b!1409289 res!947063) b!1409290))

(assert (= (and b!1409289 (not res!947061)) b!1409285))

(declare-fun m!1298517 () Bool)

(assert (=> b!1409290 m!1298517))

(assert (=> b!1409290 m!1298517))

(declare-fun m!1298519 () Bool)

(assert (=> b!1409290 m!1298519))

(declare-fun m!1298521 () Bool)

(assert (=> b!1409288 m!1298521))

(assert (=> b!1409289 m!1298517))

(declare-fun m!1298523 () Bool)

(assert (=> b!1409289 m!1298523))

(assert (=> b!1409289 m!1298517))

(declare-fun m!1298525 () Bool)

(assert (=> b!1409289 m!1298525))

(assert (=> b!1409289 m!1298523))

(assert (=> b!1409289 m!1298517))

(declare-fun m!1298527 () Bool)

(assert (=> b!1409289 m!1298527))

(declare-fun m!1298529 () Bool)

(assert (=> b!1409289 m!1298529))

(declare-fun m!1298531 () Bool)

(assert (=> start!121206 m!1298531))

(declare-fun m!1298533 () Bool)

(assert (=> start!121206 m!1298533))

(declare-fun m!1298535 () Bool)

(assert (=> b!1409286 m!1298535))

(declare-fun m!1298537 () Bool)

(assert (=> b!1409285 m!1298537))

(declare-fun m!1298539 () Bool)

(assert (=> b!1409285 m!1298539))

(assert (=> b!1409285 m!1298539))

(declare-fun m!1298541 () Bool)

(assert (=> b!1409285 m!1298541))

(assert (=> b!1409285 m!1298541))

(assert (=> b!1409285 m!1298539))

(declare-fun m!1298543 () Bool)

(assert (=> b!1409285 m!1298543))

(assert (=> b!1409292 m!1298517))

(assert (=> b!1409292 m!1298517))

(declare-fun m!1298545 () Bool)

(assert (=> b!1409292 m!1298545))

(declare-fun m!1298547 () Bool)

(assert (=> b!1409291 m!1298547))

(assert (=> b!1409291 m!1298547))

(declare-fun m!1298549 () Bool)

(assert (=> b!1409291 m!1298549))

(push 1)

(assert (not b!1409289))

(assert (not b!1409292))

(assert (not b!1409291))

(assert (not start!121206))

(assert (not b!1409286))

(assert (not b!1409290))

(assert (not b!1409288))

(assert (not b!1409285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

