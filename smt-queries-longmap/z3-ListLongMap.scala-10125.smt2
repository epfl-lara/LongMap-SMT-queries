; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119354 () Bool)

(assert start!119354)

(declare-fun b!1391415 () Bool)

(declare-fun e!787930 () Bool)

(assert (=> b!1391415 (= e!787930 (not true))))

(declare-fun e!787931 () Bool)

(assert (=> b!1391415 e!787931))

(declare-fun res!931285 () Bool)

(assert (=> b!1391415 (=> (not res!931285) (not e!787931))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95189 0))(
  ( (array!95190 (arr!45957 (Array (_ BitVec 32) (_ BitVec 64))) (size!46507 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95189)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95189 (_ BitVec 32)) Bool)

(assert (=> b!1391415 (= res!931285 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46552 0))(
  ( (Unit!46553) )
))
(declare-fun lt!611198 () Unit!46552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46552)

(assert (=> b!1391415 (= lt!611198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10274 0))(
  ( (MissingZero!10274 (index!43467 (_ BitVec 32))) (Found!10274 (index!43468 (_ BitVec 32))) (Intermediate!10274 (undefined!11086 Bool) (index!43469 (_ BitVec 32)) (x!125148 (_ BitVec 32))) (Undefined!10274) (MissingVacant!10274 (index!43470 (_ BitVec 32))) )
))
(declare-fun lt!611199 () SeekEntryResult!10274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95189 (_ BitVec 32)) SeekEntryResult!10274)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391415 (= lt!611199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45957 a!2901) j!112) mask!2840) (select (arr!45957 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391416 () Bool)

(declare-fun res!931288 () Bool)

(assert (=> b!1391416 (=> (not res!931288) (not e!787930))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391416 (= res!931288 (and (= (size!46507 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46507 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46507 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391417 () Bool)

(declare-fun res!931282 () Bool)

(assert (=> b!1391417 (=> (not res!931282) (not e!787930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391417 (= res!931282 (validKeyInArray!0 (select (arr!45957 a!2901) i!1037)))))

(declare-fun b!1391418 () Bool)

(declare-fun res!931287 () Bool)

(assert (=> b!1391418 (=> (not res!931287) (not e!787930))))

(assert (=> b!1391418 (= res!931287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931283 () Bool)

(assert (=> start!119354 (=> (not res!931283) (not e!787930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119354 (= res!931283 (validMask!0 mask!2840))))

(assert (=> start!119354 e!787930))

(assert (=> start!119354 true))

(declare-fun array_inv!34985 (array!95189) Bool)

(assert (=> start!119354 (array_inv!34985 a!2901)))

(declare-fun b!1391419 () Bool)

(declare-fun res!931286 () Bool)

(assert (=> b!1391419 (=> (not res!931286) (not e!787930))))

(declare-datatypes ((List!32476 0))(
  ( (Nil!32473) (Cons!32472 (h!33696 (_ BitVec 64)) (t!47170 List!32476)) )
))
(declare-fun arrayNoDuplicates!0 (array!95189 (_ BitVec 32) List!32476) Bool)

(assert (=> b!1391419 (= res!931286 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32473))))

(declare-fun b!1391420 () Bool)

(declare-fun res!931284 () Bool)

(assert (=> b!1391420 (=> (not res!931284) (not e!787930))))

(assert (=> b!1391420 (= res!931284 (validKeyInArray!0 (select (arr!45957 a!2901) j!112)))))

(declare-fun b!1391421 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95189 (_ BitVec 32)) SeekEntryResult!10274)

(assert (=> b!1391421 (= e!787931 (= (seekEntryOrOpen!0 (select (arr!45957 a!2901) j!112) a!2901 mask!2840) (Found!10274 j!112)))))

(assert (= (and start!119354 res!931283) b!1391416))

(assert (= (and b!1391416 res!931288) b!1391417))

(assert (= (and b!1391417 res!931282) b!1391420))

(assert (= (and b!1391420 res!931284) b!1391418))

(assert (= (and b!1391418 res!931287) b!1391419))

(assert (= (and b!1391419 res!931286) b!1391415))

(assert (= (and b!1391415 res!931285) b!1391421))

(declare-fun m!1277189 () Bool)

(assert (=> start!119354 m!1277189))

(declare-fun m!1277191 () Bool)

(assert (=> start!119354 m!1277191))

(declare-fun m!1277193 () Bool)

(assert (=> b!1391419 m!1277193))

(declare-fun m!1277195 () Bool)

(assert (=> b!1391418 m!1277195))

(declare-fun m!1277197 () Bool)

(assert (=> b!1391415 m!1277197))

(declare-fun m!1277199 () Bool)

(assert (=> b!1391415 m!1277199))

(assert (=> b!1391415 m!1277197))

(declare-fun m!1277201 () Bool)

(assert (=> b!1391415 m!1277201))

(assert (=> b!1391415 m!1277199))

(assert (=> b!1391415 m!1277197))

(declare-fun m!1277203 () Bool)

(assert (=> b!1391415 m!1277203))

(declare-fun m!1277205 () Bool)

(assert (=> b!1391415 m!1277205))

(assert (=> b!1391421 m!1277197))

(assert (=> b!1391421 m!1277197))

(declare-fun m!1277207 () Bool)

(assert (=> b!1391421 m!1277207))

(assert (=> b!1391420 m!1277197))

(assert (=> b!1391420 m!1277197))

(declare-fun m!1277209 () Bool)

(assert (=> b!1391420 m!1277209))

(declare-fun m!1277211 () Bool)

(assert (=> b!1391417 m!1277211))

(assert (=> b!1391417 m!1277211))

(declare-fun m!1277213 () Bool)

(assert (=> b!1391417 m!1277213))

(check-sat (not b!1391417) (not b!1391419) (not b!1391415) (not start!119354) (not b!1391421) (not b!1391420) (not b!1391418))
