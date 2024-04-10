; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119202 () Bool)

(assert start!119202)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95139 0))(
  ( (array!95140 (arr!45935 (Array (_ BitVec 32) (_ BitVec 64))) (size!46485 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95139)

(declare-fun b!1390497 () Bool)

(declare-fun e!787444 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10252 0))(
  ( (MissingZero!10252 (index!43379 (_ BitVec 32))) (Found!10252 (index!43380 (_ BitVec 32))) (Intermediate!10252 (undefined!11064 Bool) (index!43381 (_ BitVec 32)) (x!125058 (_ BitVec 32))) (Undefined!10252) (MissingVacant!10252 (index!43382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95139 (_ BitVec 32)) SeekEntryResult!10252)

(assert (=> b!1390497 (= e!787444 (= (seekEntryOrOpen!0 (select (arr!45935 a!2901) j!112) a!2901 mask!2840) (Found!10252 j!112)))))

(declare-fun b!1390498 () Bool)

(declare-fun res!930661 () Bool)

(declare-fun e!787443 () Bool)

(assert (=> b!1390498 (=> (not res!930661) (not e!787443))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390498 (= res!930661 (validKeyInArray!0 (select (arr!45935 a!2901) i!1037)))))

(declare-fun b!1390500 () Bool)

(declare-fun res!930662 () Bool)

(assert (=> b!1390500 (=> (not res!930662) (not e!787443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95139 (_ BitVec 32)) Bool)

(assert (=> b!1390500 (= res!930662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390501 () Bool)

(declare-fun res!930659 () Bool)

(assert (=> b!1390501 (=> (not res!930659) (not e!787443))))

(declare-datatypes ((List!32454 0))(
  ( (Nil!32451) (Cons!32450 (h!33668 (_ BitVec 64)) (t!47148 List!32454)) )
))
(declare-fun arrayNoDuplicates!0 (array!95139 (_ BitVec 32) List!32454) Bool)

(assert (=> b!1390501 (= res!930659 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32451))))

(declare-fun b!1390502 () Bool)

(declare-fun res!930663 () Bool)

(assert (=> b!1390502 (=> (not res!930663) (not e!787443))))

(assert (=> b!1390502 (= res!930663 (and (= (size!46485 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46485 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46485 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390503 () Bool)

(declare-fun res!930658 () Bool)

(assert (=> b!1390503 (=> (not res!930658) (not e!787443))))

(assert (=> b!1390503 (= res!930658 (validKeyInArray!0 (select (arr!45935 a!2901) j!112)))))

(declare-fun b!1390499 () Bool)

(declare-fun lt!610841 () SeekEntryResult!10252)

(assert (=> b!1390499 (= e!787443 (not (or (not (is-Intermediate!10252 lt!610841)) (undefined!11064 lt!610841) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1390499 e!787444))

(declare-fun res!930660 () Bool)

(assert (=> b!1390499 (=> (not res!930660) (not e!787444))))

(assert (=> b!1390499 (= res!930660 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46508 0))(
  ( (Unit!46509) )
))
(declare-fun lt!610842 () Unit!46508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46508)

(assert (=> b!1390499 (= lt!610842 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95139 (_ BitVec 32)) SeekEntryResult!10252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390499 (= lt!610841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45935 a!2901) j!112) mask!2840) (select (arr!45935 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930664 () Bool)

(assert (=> start!119202 (=> (not res!930664) (not e!787443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119202 (= res!930664 (validMask!0 mask!2840))))

(assert (=> start!119202 e!787443))

(assert (=> start!119202 true))

(declare-fun array_inv!34963 (array!95139) Bool)

(assert (=> start!119202 (array_inv!34963 a!2901)))

(assert (= (and start!119202 res!930664) b!1390502))

(assert (= (and b!1390502 res!930663) b!1390498))

(assert (= (and b!1390498 res!930661) b!1390503))

(assert (= (and b!1390503 res!930658) b!1390500))

(assert (= (and b!1390500 res!930662) b!1390501))

(assert (= (and b!1390501 res!930659) b!1390499))

(assert (= (and b!1390499 res!930660) b!1390497))

(declare-fun m!1276359 () Bool)

(assert (=> b!1390498 m!1276359))

(assert (=> b!1390498 m!1276359))

(declare-fun m!1276361 () Bool)

(assert (=> b!1390498 m!1276361))

(declare-fun m!1276363 () Bool)

(assert (=> b!1390501 m!1276363))

(declare-fun m!1276365 () Bool)

(assert (=> b!1390503 m!1276365))

(assert (=> b!1390503 m!1276365))

(declare-fun m!1276367 () Bool)

(assert (=> b!1390503 m!1276367))

(declare-fun m!1276369 () Bool)

(assert (=> start!119202 m!1276369))

(declare-fun m!1276371 () Bool)

(assert (=> start!119202 m!1276371))

(assert (=> b!1390499 m!1276365))

(declare-fun m!1276373 () Bool)

(assert (=> b!1390499 m!1276373))

(assert (=> b!1390499 m!1276365))

(declare-fun m!1276375 () Bool)

(assert (=> b!1390499 m!1276375))

(assert (=> b!1390499 m!1276373))

(assert (=> b!1390499 m!1276365))

(declare-fun m!1276377 () Bool)

(assert (=> b!1390499 m!1276377))

(declare-fun m!1276379 () Bool)

(assert (=> b!1390499 m!1276379))

(declare-fun m!1276381 () Bool)

(assert (=> b!1390500 m!1276381))

(assert (=> b!1390497 m!1276365))

(assert (=> b!1390497 m!1276365))

(declare-fun m!1276383 () Bool)

(assert (=> b!1390497 m!1276383))

(push 1)

