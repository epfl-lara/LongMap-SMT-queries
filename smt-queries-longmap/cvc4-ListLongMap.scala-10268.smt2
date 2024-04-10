; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120772 () Bool)

(assert start!120772)

(declare-fun b!1405263 () Bool)

(declare-fun res!943481 () Bool)

(declare-fun e!795481 () Bool)

(assert (=> b!1405263 (=> (not res!943481) (not e!795481))))

(declare-datatypes ((array!96079 0))(
  ( (array!96080 (arr!46387 (Array (_ BitVec 32) (_ BitVec 64))) (size!46937 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96079)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405263 (= res!943481 (and (= (size!46937 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46937 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46937 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405264 () Bool)

(declare-fun res!943486 () Bool)

(assert (=> b!1405264 (=> (not res!943486) (not e!795481))))

(declare-datatypes ((List!32906 0))(
  ( (Nil!32903) (Cons!32902 (h!34156 (_ BitVec 64)) (t!47600 List!32906)) )
))
(declare-fun arrayNoDuplicates!0 (array!96079 (_ BitVec 32) List!32906) Bool)

(assert (=> b!1405264 (= res!943486 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32903))))

(declare-fun b!1405266 () Bool)

(declare-fun res!943480 () Bool)

(assert (=> b!1405266 (=> (not res!943480) (not e!795481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96079 (_ BitVec 32)) Bool)

(assert (=> b!1405266 (= res!943480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405267 () Bool)

(declare-fun res!943483 () Bool)

(assert (=> b!1405267 (=> (not res!943483) (not e!795481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405267 (= res!943483 (validKeyInArray!0 (select (arr!46387 a!2901) j!112)))))

(declare-fun b!1405268 () Bool)

(declare-fun res!943484 () Bool)

(assert (=> b!1405268 (=> (not res!943484) (not e!795481))))

(assert (=> b!1405268 (= res!943484 (validKeyInArray!0 (select (arr!46387 a!2901) i!1037)))))

(declare-fun b!1405269 () Bool)

(declare-fun e!795480 () Bool)

(declare-datatypes ((SeekEntryResult!10698 0))(
  ( (MissingZero!10698 (index!45169 (_ BitVec 32))) (Found!10698 (index!45170 (_ BitVec 32))) (Intermediate!10698 (undefined!11510 Bool) (index!45171 (_ BitVec 32)) (x!126785 (_ BitVec 32))) (Undefined!10698) (MissingVacant!10698 (index!45172 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96079 (_ BitVec 32)) SeekEntryResult!10698)

(assert (=> b!1405269 (= e!795480 (= (seekEntryOrOpen!0 (select (arr!46387 a!2901) j!112) a!2901 mask!2840) (Found!10698 j!112)))))

(declare-fun res!943485 () Bool)

(assert (=> start!120772 (=> (not res!943485) (not e!795481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120772 (= res!943485 (validMask!0 mask!2840))))

(assert (=> start!120772 e!795481))

(assert (=> start!120772 true))

(declare-fun array_inv!35415 (array!96079) Bool)

(assert (=> start!120772 (array_inv!35415 a!2901)))

(declare-fun b!1405265 () Bool)

(assert (=> b!1405265 (= e!795481 (not true))))

(assert (=> b!1405265 e!795480))

(declare-fun res!943482 () Bool)

(assert (=> b!1405265 (=> (not res!943482) (not e!795480))))

(assert (=> b!1405265 (= res!943482 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47370 0))(
  ( (Unit!47371) )
))
(declare-fun lt!618978 () Unit!47370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47370)

(assert (=> b!1405265 (= lt!618978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618977 () SeekEntryResult!10698)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96079 (_ BitVec 32)) SeekEntryResult!10698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405265 (= lt!618977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46387 a!2901) j!112) mask!2840) (select (arr!46387 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120772 res!943485) b!1405263))

(assert (= (and b!1405263 res!943481) b!1405268))

(assert (= (and b!1405268 res!943484) b!1405267))

(assert (= (and b!1405267 res!943483) b!1405266))

(assert (= (and b!1405266 res!943480) b!1405264))

(assert (= (and b!1405264 res!943486) b!1405265))

(assert (= (and b!1405265 res!943482) b!1405269))

(declare-fun m!1294003 () Bool)

(assert (=> b!1405268 m!1294003))

(assert (=> b!1405268 m!1294003))

(declare-fun m!1294005 () Bool)

(assert (=> b!1405268 m!1294005))

(declare-fun m!1294007 () Bool)

(assert (=> b!1405266 m!1294007))

(declare-fun m!1294009 () Bool)

(assert (=> start!120772 m!1294009))

(declare-fun m!1294011 () Bool)

(assert (=> start!120772 m!1294011))

(declare-fun m!1294013 () Bool)

(assert (=> b!1405264 m!1294013))

(declare-fun m!1294015 () Bool)

(assert (=> b!1405267 m!1294015))

(assert (=> b!1405267 m!1294015))

(declare-fun m!1294017 () Bool)

(assert (=> b!1405267 m!1294017))

(assert (=> b!1405265 m!1294015))

(declare-fun m!1294019 () Bool)

(assert (=> b!1405265 m!1294019))

(assert (=> b!1405265 m!1294015))

(declare-fun m!1294021 () Bool)

(assert (=> b!1405265 m!1294021))

(assert (=> b!1405265 m!1294019))

(assert (=> b!1405265 m!1294015))

(declare-fun m!1294023 () Bool)

(assert (=> b!1405265 m!1294023))

(declare-fun m!1294025 () Bool)

(assert (=> b!1405265 m!1294025))

(assert (=> b!1405269 m!1294015))

(assert (=> b!1405269 m!1294015))

(declare-fun m!1294027 () Bool)

(assert (=> b!1405269 m!1294027))

(push 1)

(assert (not b!1405266))

(assert (not start!120772))

(assert (not b!1405267))

(assert (not b!1405265))

(assert (not b!1405264))

(assert (not b!1405269))

(assert (not b!1405268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

