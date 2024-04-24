; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121398 () Bool)

(assert start!121398)

(declare-fun b!1410506 () Bool)

(declare-fun res!947548 () Bool)

(declare-fun e!798299 () Bool)

(assert (=> b!1410506 (=> (not res!947548) (not e!798299))))

(declare-datatypes ((array!96474 0))(
  ( (array!96475 (arr!46578 (Array (_ BitVec 32) (_ BitVec 64))) (size!47129 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96474)

(declare-datatypes ((List!33084 0))(
  ( (Nil!33081) (Cons!33080 (h!34351 (_ BitVec 64)) (t!47770 List!33084)) )
))
(declare-fun arrayNoDuplicates!0 (array!96474 (_ BitVec 32) List!33084) Bool)

(assert (=> b!1410506 (= res!947548 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33081))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!798297 () Bool)

(declare-fun b!1410507 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10792 0))(
  ( (MissingZero!10792 (index!45545 (_ BitVec 32))) (Found!10792 (index!45546 (_ BitVec 32))) (Intermediate!10792 (undefined!11604 Bool) (index!45547 (_ BitVec 32)) (x!127284 (_ BitVec 32))) (Undefined!10792) (MissingVacant!10792 (index!45548 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96474 (_ BitVec 32)) SeekEntryResult!10792)

(assert (=> b!1410507 (= e!798297 (= (seekEntryOrOpen!0 (select (arr!46578 a!2901) j!112) a!2901 mask!2840) (Found!10792 j!112)))))

(declare-fun b!1410508 () Bool)

(declare-fun e!798296 () Bool)

(assert (=> b!1410508 (= e!798299 (not e!798296))))

(declare-fun res!947549 () Bool)

(assert (=> b!1410508 (=> res!947549 e!798296)))

(declare-fun lt!621095 () SeekEntryResult!10792)

(assert (=> b!1410508 (= res!947549 (or (not (is-Intermediate!10792 lt!621095)) (undefined!11604 lt!621095)))))

(assert (=> b!1410508 e!798297))

(declare-fun res!947551 () Bool)

(assert (=> b!1410508 (=> (not res!947551) (not e!798297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96474 (_ BitVec 32)) Bool)

(assert (=> b!1410508 (= res!947551 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47585 0))(
  ( (Unit!47586) )
))
(declare-fun lt!621094 () Unit!47585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47585)

(assert (=> b!1410508 (= lt!621094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96474 (_ BitVec 32)) SeekEntryResult!10792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410508 (= lt!621095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46578 a!2901) j!112) mask!2840) (select (arr!46578 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410509 () Bool)

(declare-fun res!947546 () Bool)

(assert (=> b!1410509 (=> (not res!947546) (not e!798299))))

(assert (=> b!1410509 (= res!947546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410510 () Bool)

(declare-fun res!947544 () Bool)

(assert (=> b!1410510 (=> (not res!947544) (not e!798299))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410510 (= res!947544 (and (= (size!47129 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47129 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47129 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410512 () Bool)

(declare-fun res!947545 () Bool)

(assert (=> b!1410512 (=> (not res!947545) (not e!798299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410512 (= res!947545 (validKeyInArray!0 (select (arr!46578 a!2901) j!112)))))

(declare-fun b!1410513 () Bool)

(declare-fun res!947547 () Bool)

(assert (=> b!1410513 (=> (not res!947547) (not e!798299))))

(assert (=> b!1410513 (= res!947547 (validKeyInArray!0 (select (arr!46578 a!2901) i!1037)))))

(declare-fun res!947550 () Bool)

(assert (=> start!121398 (=> (not res!947550) (not e!798299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121398 (= res!947550 (validMask!0 mask!2840))))

(assert (=> start!121398 e!798299))

(assert (=> start!121398 true))

(declare-fun array_inv!35859 (array!96474) Bool)

(assert (=> start!121398 (array_inv!35859 a!2901)))

(declare-fun b!1410511 () Bool)

(assert (=> b!1410511 (= e!798296 true)))

(declare-fun lt!621093 () SeekEntryResult!10792)

(assert (=> b!1410511 (= lt!621093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96475 (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47129 a!2901)) mask!2840))))

(assert (= (and start!121398 res!947550) b!1410510))

(assert (= (and b!1410510 res!947544) b!1410513))

(assert (= (and b!1410513 res!947547) b!1410512))

(assert (= (and b!1410512 res!947545) b!1410509))

(assert (= (and b!1410509 res!947546) b!1410506))

(assert (= (and b!1410506 res!947548) b!1410508))

(assert (= (and b!1410508 res!947551) b!1410507))

(assert (= (and b!1410508 (not res!947549)) b!1410511))

(declare-fun m!1300425 () Bool)

(assert (=> b!1410511 m!1300425))

(declare-fun m!1300427 () Bool)

(assert (=> b!1410511 m!1300427))

(assert (=> b!1410511 m!1300427))

(declare-fun m!1300429 () Bool)

(assert (=> b!1410511 m!1300429))

(assert (=> b!1410511 m!1300429))

(assert (=> b!1410511 m!1300427))

(declare-fun m!1300431 () Bool)

(assert (=> b!1410511 m!1300431))

(declare-fun m!1300433 () Bool)

(assert (=> b!1410508 m!1300433))

(declare-fun m!1300435 () Bool)

(assert (=> b!1410508 m!1300435))

(assert (=> b!1410508 m!1300433))

(declare-fun m!1300437 () Bool)

(assert (=> b!1410508 m!1300437))

(assert (=> b!1410508 m!1300435))

(assert (=> b!1410508 m!1300433))

(declare-fun m!1300439 () Bool)

(assert (=> b!1410508 m!1300439))

(declare-fun m!1300441 () Bool)

(assert (=> b!1410508 m!1300441))

(assert (=> b!1410512 m!1300433))

(assert (=> b!1410512 m!1300433))

(declare-fun m!1300443 () Bool)

(assert (=> b!1410512 m!1300443))

(declare-fun m!1300445 () Bool)

(assert (=> b!1410509 m!1300445))

(declare-fun m!1300447 () Bool)

(assert (=> b!1410513 m!1300447))

(assert (=> b!1410513 m!1300447))

(declare-fun m!1300449 () Bool)

(assert (=> b!1410513 m!1300449))

(declare-fun m!1300451 () Bool)

(assert (=> start!121398 m!1300451))

(declare-fun m!1300453 () Bool)

(assert (=> start!121398 m!1300453))

(assert (=> b!1410507 m!1300433))

(assert (=> b!1410507 m!1300433))

(declare-fun m!1300455 () Bool)

(assert (=> b!1410507 m!1300455))

(declare-fun m!1300457 () Bool)

(assert (=> b!1410506 m!1300457))

(push 1)

(assert (not b!1410507))

(assert (not b!1410509))

(assert (not b!1410511))

(assert (not start!121398))

(assert (not b!1410508))

(assert (not b!1410506))

(assert (not b!1410512))

(assert (not b!1410513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

