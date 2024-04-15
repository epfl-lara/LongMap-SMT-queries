; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119592 () Bool)

(assert start!119592)

(declare-fun b!1393010 () Bool)

(declare-fun res!932470 () Bool)

(declare-fun e!788806 () Bool)

(assert (=> b!1393010 (=> (not res!932470) (not e!788806))))

(declare-datatypes ((array!95227 0))(
  ( (array!95228 (arr!45972 (Array (_ BitVec 32) (_ BitVec 64))) (size!46524 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95227)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95227 (_ BitVec 32)) Bool)

(assert (=> b!1393010 (= res!932470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393011 () Bool)

(declare-fun e!788805 () Bool)

(assert (=> b!1393011 (= e!788806 (not e!788805))))

(declare-fun res!932472 () Bool)

(assert (=> b!1393011 (=> res!932472 e!788805)))

(declare-datatypes ((SeekEntryResult!10315 0))(
  ( (MissingZero!10315 (index!43631 (_ BitVec 32))) (Found!10315 (index!43632 (_ BitVec 32))) (Intermediate!10315 (undefined!11127 Bool) (index!43633 (_ BitVec 32)) (x!125308 (_ BitVec 32))) (Undefined!10315) (MissingVacant!10315 (index!43634 (_ BitVec 32))) )
))
(declare-fun lt!611670 () SeekEntryResult!10315)

(assert (=> b!1393011 (= res!932472 (or (not (is-Intermediate!10315 lt!611670)) (undefined!11127 lt!611670)))))

(declare-fun e!788804 () Bool)

(assert (=> b!1393011 e!788804))

(declare-fun res!932473 () Bool)

(assert (=> b!1393011 (=> (not res!932473) (not e!788804))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393011 (= res!932473 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46477 0))(
  ( (Unit!46478) )
))
(declare-fun lt!611671 () Unit!46477)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46477)

(assert (=> b!1393011 (= lt!611671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95227 (_ BitVec 32)) SeekEntryResult!10315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393011 (= lt!611670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45972 a!2901) j!112) mask!2840) (select (arr!45972 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932475 () Bool)

(assert (=> start!119592 (=> (not res!932475) (not e!788806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119592 (= res!932475 (validMask!0 mask!2840))))

(assert (=> start!119592 e!788806))

(assert (=> start!119592 true))

(declare-fun array_inv!35205 (array!95227) Bool)

(assert (=> start!119592 (array_inv!35205 a!2901)))

(declare-fun b!1393012 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95227 (_ BitVec 32)) SeekEntryResult!10315)

(assert (=> b!1393012 (= e!788804 (= (seekEntryOrOpen!0 (select (arr!45972 a!2901) j!112) a!2901 mask!2840) (Found!10315 j!112)))))

(declare-fun b!1393013 () Bool)

(declare-fun res!932469 () Bool)

(assert (=> b!1393013 (=> (not res!932469) (not e!788806))))

(declare-datatypes ((List!32569 0))(
  ( (Nil!32566) (Cons!32565 (h!33798 (_ BitVec 64)) (t!47255 List!32569)) )
))
(declare-fun arrayNoDuplicates!0 (array!95227 (_ BitVec 32) List!32569) Bool)

(assert (=> b!1393013 (= res!932469 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32566))))

(declare-fun b!1393014 () Bool)

(declare-fun res!932474 () Bool)

(assert (=> b!1393014 (=> (not res!932474) (not e!788806))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393014 (= res!932474 (validKeyInArray!0 (select (arr!45972 a!2901) i!1037)))))

(declare-fun b!1393015 () Bool)

(assert (=> b!1393015 (= e!788805 true)))

(declare-fun lt!611672 () SeekEntryResult!10315)

(assert (=> b!1393015 (= lt!611672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45972 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45972 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95228 (store (arr!45972 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46524 a!2901)) mask!2840))))

(declare-fun b!1393016 () Bool)

(declare-fun res!932471 () Bool)

(assert (=> b!1393016 (=> (not res!932471) (not e!788806))))

(assert (=> b!1393016 (= res!932471 (and (= (size!46524 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46524 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46524 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393017 () Bool)

(declare-fun res!932476 () Bool)

(assert (=> b!1393017 (=> (not res!932476) (not e!788806))))

(assert (=> b!1393017 (= res!932476 (validKeyInArray!0 (select (arr!45972 a!2901) j!112)))))

(assert (= (and start!119592 res!932475) b!1393016))

(assert (= (and b!1393016 res!932471) b!1393014))

(assert (= (and b!1393014 res!932474) b!1393017))

(assert (= (and b!1393017 res!932476) b!1393010))

(assert (= (and b!1393010 res!932470) b!1393013))

(assert (= (and b!1393013 res!932469) b!1393011))

(assert (= (and b!1393011 res!932473) b!1393012))

(assert (= (and b!1393011 (not res!932472)) b!1393015))

(declare-fun m!1278321 () Bool)

(assert (=> b!1393015 m!1278321))

(declare-fun m!1278323 () Bool)

(assert (=> b!1393015 m!1278323))

(assert (=> b!1393015 m!1278323))

(declare-fun m!1278325 () Bool)

(assert (=> b!1393015 m!1278325))

(assert (=> b!1393015 m!1278325))

(assert (=> b!1393015 m!1278323))

(declare-fun m!1278327 () Bool)

(assert (=> b!1393015 m!1278327))

(declare-fun m!1278329 () Bool)

(assert (=> start!119592 m!1278329))

(declare-fun m!1278331 () Bool)

(assert (=> start!119592 m!1278331))

(declare-fun m!1278333 () Bool)

(assert (=> b!1393011 m!1278333))

(declare-fun m!1278335 () Bool)

(assert (=> b!1393011 m!1278335))

(assert (=> b!1393011 m!1278333))

(declare-fun m!1278337 () Bool)

(assert (=> b!1393011 m!1278337))

(assert (=> b!1393011 m!1278335))

(assert (=> b!1393011 m!1278333))

(declare-fun m!1278339 () Bool)

(assert (=> b!1393011 m!1278339))

(declare-fun m!1278341 () Bool)

(assert (=> b!1393011 m!1278341))

(declare-fun m!1278343 () Bool)

(assert (=> b!1393014 m!1278343))

(assert (=> b!1393014 m!1278343))

(declare-fun m!1278345 () Bool)

(assert (=> b!1393014 m!1278345))

(assert (=> b!1393017 m!1278333))

(assert (=> b!1393017 m!1278333))

(declare-fun m!1278347 () Bool)

(assert (=> b!1393017 m!1278347))

(assert (=> b!1393012 m!1278333))

(assert (=> b!1393012 m!1278333))

(declare-fun m!1278349 () Bool)

(assert (=> b!1393012 m!1278349))

(declare-fun m!1278351 () Bool)

(assert (=> b!1393010 m!1278351))

(declare-fun m!1278353 () Bool)

(assert (=> b!1393013 m!1278353))

(push 1)

(assert (not b!1393011))

(assert (not b!1393013))

(assert (not b!1393017))

(assert (not b!1393014))

(assert (not b!1393012))

(assert (not start!119592))

(assert (not b!1393010))

(assert (not b!1393015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

