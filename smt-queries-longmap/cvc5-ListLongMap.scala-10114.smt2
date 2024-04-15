; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119178 () Bool)

(assert start!119178)

(declare-fun b!1390206 () Bool)

(declare-fun res!930420 () Bool)

(declare-fun e!787315 () Bool)

(assert (=> b!1390206 (=> (not res!930420) (not e!787315))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95068 0))(
  ( (array!95069 (arr!45900 (Array (_ BitVec 32) (_ BitVec 64))) (size!46452 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95068)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390206 (= res!930420 (and (= (size!46452 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46452 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46452 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390207 () Bool)

(assert (=> b!1390207 (= e!787315 (not true))))

(declare-fun e!787314 () Bool)

(assert (=> b!1390207 e!787314))

(declare-fun res!930418 () Bool)

(assert (=> b!1390207 (=> (not res!930418) (not e!787314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95068 (_ BitVec 32)) Bool)

(assert (=> b!1390207 (= res!930418 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46333 0))(
  ( (Unit!46334) )
))
(declare-fun lt!610592 () Unit!46333)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46333)

(assert (=> b!1390207 (= lt!610592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10243 0))(
  ( (MissingZero!10243 (index!43343 (_ BitVec 32))) (Found!10243 (index!43344 (_ BitVec 32))) (Intermediate!10243 (undefined!11055 Bool) (index!43345 (_ BitVec 32)) (x!125014 (_ BitVec 32))) (Undefined!10243) (MissingVacant!10243 (index!43346 (_ BitVec 32))) )
))
(declare-fun lt!610591 () SeekEntryResult!10243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95068 (_ BitVec 32)) SeekEntryResult!10243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390207 (= lt!610591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45900 a!2901) j!112) mask!2840) (select (arr!45900 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390208 () Bool)

(declare-fun res!930422 () Bool)

(assert (=> b!1390208 (=> (not res!930422) (not e!787315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390208 (= res!930422 (validKeyInArray!0 (select (arr!45900 a!2901) j!112)))))

(declare-fun res!930421 () Bool)

(assert (=> start!119178 (=> (not res!930421) (not e!787315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119178 (= res!930421 (validMask!0 mask!2840))))

(assert (=> start!119178 e!787315))

(assert (=> start!119178 true))

(declare-fun array_inv!35133 (array!95068) Bool)

(assert (=> start!119178 (array_inv!35133 a!2901)))

(declare-fun b!1390209 () Bool)

(declare-fun res!930423 () Bool)

(assert (=> b!1390209 (=> (not res!930423) (not e!787315))))

(declare-datatypes ((List!32497 0))(
  ( (Nil!32494) (Cons!32493 (h!33711 (_ BitVec 64)) (t!47183 List!32497)) )
))
(declare-fun arrayNoDuplicates!0 (array!95068 (_ BitVec 32) List!32497) Bool)

(assert (=> b!1390209 (= res!930423 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32494))))

(declare-fun b!1390210 () Bool)

(declare-fun res!930419 () Bool)

(assert (=> b!1390210 (=> (not res!930419) (not e!787315))))

(assert (=> b!1390210 (= res!930419 (validKeyInArray!0 (select (arr!45900 a!2901) i!1037)))))

(declare-fun b!1390211 () Bool)

(declare-fun res!930424 () Bool)

(assert (=> b!1390211 (=> (not res!930424) (not e!787315))))

(assert (=> b!1390211 (= res!930424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390212 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95068 (_ BitVec 32)) SeekEntryResult!10243)

(assert (=> b!1390212 (= e!787314 (= (seekEntryOrOpen!0 (select (arr!45900 a!2901) j!112) a!2901 mask!2840) (Found!10243 j!112)))))

(assert (= (and start!119178 res!930421) b!1390206))

(assert (= (and b!1390206 res!930420) b!1390210))

(assert (= (and b!1390210 res!930419) b!1390208))

(assert (= (and b!1390208 res!930422) b!1390211))

(assert (= (and b!1390211 res!930424) b!1390209))

(assert (= (and b!1390209 res!930423) b!1390207))

(assert (= (and b!1390207 res!930418) b!1390212))

(declare-fun m!1275563 () Bool)

(assert (=> b!1390209 m!1275563))

(declare-fun m!1275565 () Bool)

(assert (=> b!1390211 m!1275565))

(declare-fun m!1275567 () Bool)

(assert (=> b!1390207 m!1275567))

(declare-fun m!1275569 () Bool)

(assert (=> b!1390207 m!1275569))

(assert (=> b!1390207 m!1275567))

(declare-fun m!1275571 () Bool)

(assert (=> b!1390207 m!1275571))

(assert (=> b!1390207 m!1275569))

(assert (=> b!1390207 m!1275567))

(declare-fun m!1275573 () Bool)

(assert (=> b!1390207 m!1275573))

(declare-fun m!1275575 () Bool)

(assert (=> b!1390207 m!1275575))

(assert (=> b!1390212 m!1275567))

(assert (=> b!1390212 m!1275567))

(declare-fun m!1275577 () Bool)

(assert (=> b!1390212 m!1275577))

(declare-fun m!1275579 () Bool)

(assert (=> b!1390210 m!1275579))

(assert (=> b!1390210 m!1275579))

(declare-fun m!1275581 () Bool)

(assert (=> b!1390210 m!1275581))

(declare-fun m!1275583 () Bool)

(assert (=> start!119178 m!1275583))

(declare-fun m!1275585 () Bool)

(assert (=> start!119178 m!1275585))

(assert (=> b!1390208 m!1275567))

(assert (=> b!1390208 m!1275567))

(declare-fun m!1275587 () Bool)

(assert (=> b!1390208 m!1275587))

(push 1)

(assert (not b!1390210))

(assert (not start!119178))

(assert (not b!1390211))

(assert (not b!1390207))

(assert (not b!1390208))

(assert (not b!1390209))

(assert (not b!1390212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

