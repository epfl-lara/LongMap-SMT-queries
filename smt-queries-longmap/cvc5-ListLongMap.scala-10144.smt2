; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119628 () Bool)

(assert start!119628)

(declare-fun b!1393475 () Bool)

(declare-fun res!932888 () Bool)

(declare-fun e!789035 () Bool)

(assert (=> b!1393475 (=> (not res!932888) (not e!789035))))

(declare-datatypes ((array!95310 0))(
  ( (array!95311 (arr!46013 (Array (_ BitVec 32) (_ BitVec 64))) (size!46563 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95310)

(declare-datatypes ((List!32532 0))(
  ( (Nil!32529) (Cons!32528 (h!33761 (_ BitVec 64)) (t!47226 List!32532)) )
))
(declare-fun arrayNoDuplicates!0 (array!95310 (_ BitVec 32) List!32532) Bool)

(assert (=> b!1393475 (= res!932888 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32529))))

(declare-fun b!1393476 () Bool)

(declare-fun e!789038 () Bool)

(assert (=> b!1393476 (= e!789035 (not e!789038))))

(declare-fun res!932884 () Bool)

(assert (=> b!1393476 (=> res!932884 e!789038)))

(declare-datatypes ((SeekEntryResult!10330 0))(
  ( (MissingZero!10330 (index!43691 (_ BitVec 32))) (Found!10330 (index!43692 (_ BitVec 32))) (Intermediate!10330 (undefined!11142 Bool) (index!43693 (_ BitVec 32)) (x!125374 (_ BitVec 32))) (Undefined!10330) (MissingVacant!10330 (index!43694 (_ BitVec 32))) )
))
(declare-fun lt!612006 () SeekEntryResult!10330)

(assert (=> b!1393476 (= res!932884 (or (not (is-Intermediate!10330 lt!612006)) (undefined!11142 lt!612006)))))

(declare-fun e!789037 () Bool)

(assert (=> b!1393476 e!789037))

(declare-fun res!932890 () Bool)

(assert (=> b!1393476 (=> (not res!932890) (not e!789037))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95310 (_ BitVec 32)) Bool)

(assert (=> b!1393476 (= res!932890 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46664 0))(
  ( (Unit!46665) )
))
(declare-fun lt!612004 () Unit!46664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46664)

(assert (=> b!1393476 (= lt!612004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95310 (_ BitVec 32)) SeekEntryResult!10330)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393476 (= lt!612006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46013 a!2901) j!112) mask!2840) (select (arr!46013 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393477 () Bool)

(declare-fun res!932887 () Bool)

(assert (=> b!1393477 (=> (not res!932887) (not e!789035))))

(assert (=> b!1393477 (= res!932887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393478 () Bool)

(declare-fun res!932883 () Bool)

(assert (=> b!1393478 (=> (not res!932883) (not e!789035))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393478 (= res!932883 (validKeyInArray!0 (select (arr!46013 a!2901) i!1037)))))

(declare-fun b!1393479 () Bool)

(declare-fun res!932886 () Bool)

(assert (=> b!1393479 (=> (not res!932886) (not e!789035))))

(assert (=> b!1393479 (= res!932886 (validKeyInArray!0 (select (arr!46013 a!2901) j!112)))))

(declare-fun b!1393480 () Bool)

(declare-fun res!932885 () Bool)

(assert (=> b!1393480 (=> (not res!932885) (not e!789035))))

(assert (=> b!1393480 (= res!932885 (and (= (size!46563 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46563 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46563 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393481 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95310 (_ BitVec 32)) SeekEntryResult!10330)

(assert (=> b!1393481 (= e!789037 (= (seekEntryOrOpen!0 (select (arr!46013 a!2901) j!112) a!2901 mask!2840) (Found!10330 j!112)))))

(declare-fun res!932889 () Bool)

(assert (=> start!119628 (=> (not res!932889) (not e!789035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119628 (= res!932889 (validMask!0 mask!2840))))

(assert (=> start!119628 e!789035))

(assert (=> start!119628 true))

(declare-fun array_inv!35041 (array!95310) Bool)

(assert (=> start!119628 (array_inv!35041 a!2901)))

(declare-fun b!1393482 () Bool)

(assert (=> b!1393482 (= e!789038 true)))

(declare-fun lt!612005 () SeekEntryResult!10330)

(assert (=> b!1393482 (= lt!612005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46013 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46013 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95311 (store (arr!46013 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46563 a!2901)) mask!2840))))

(assert (= (and start!119628 res!932889) b!1393480))

(assert (= (and b!1393480 res!932885) b!1393478))

(assert (= (and b!1393478 res!932883) b!1393479))

(assert (= (and b!1393479 res!932886) b!1393477))

(assert (= (and b!1393477 res!932887) b!1393475))

(assert (= (and b!1393475 res!932888) b!1393476))

(assert (= (and b!1393476 res!932890) b!1393481))

(assert (= (and b!1393476 (not res!932884)) b!1393482))

(declare-fun m!1279401 () Bool)

(assert (=> b!1393478 m!1279401))

(assert (=> b!1393478 m!1279401))

(declare-fun m!1279403 () Bool)

(assert (=> b!1393478 m!1279403))

(declare-fun m!1279405 () Bool)

(assert (=> start!119628 m!1279405))

(declare-fun m!1279407 () Bool)

(assert (=> start!119628 m!1279407))

(declare-fun m!1279409 () Bool)

(assert (=> b!1393479 m!1279409))

(assert (=> b!1393479 m!1279409))

(declare-fun m!1279411 () Bool)

(assert (=> b!1393479 m!1279411))

(declare-fun m!1279413 () Bool)

(assert (=> b!1393475 m!1279413))

(declare-fun m!1279415 () Bool)

(assert (=> b!1393477 m!1279415))

(assert (=> b!1393476 m!1279409))

(declare-fun m!1279417 () Bool)

(assert (=> b!1393476 m!1279417))

(assert (=> b!1393476 m!1279409))

(declare-fun m!1279419 () Bool)

(assert (=> b!1393476 m!1279419))

(assert (=> b!1393476 m!1279417))

(assert (=> b!1393476 m!1279409))

(declare-fun m!1279421 () Bool)

(assert (=> b!1393476 m!1279421))

(declare-fun m!1279423 () Bool)

(assert (=> b!1393476 m!1279423))

(declare-fun m!1279425 () Bool)

(assert (=> b!1393482 m!1279425))

(declare-fun m!1279427 () Bool)

(assert (=> b!1393482 m!1279427))

(assert (=> b!1393482 m!1279427))

(declare-fun m!1279429 () Bool)

(assert (=> b!1393482 m!1279429))

(assert (=> b!1393482 m!1279429))

(assert (=> b!1393482 m!1279427))

(declare-fun m!1279431 () Bool)

(assert (=> b!1393482 m!1279431))

(assert (=> b!1393481 m!1279409))

(assert (=> b!1393481 m!1279409))

(declare-fun m!1279433 () Bool)

(assert (=> b!1393481 m!1279433))

(push 1)

(assert (not b!1393481))

(assert (not start!119628))

(assert (not b!1393477))

(assert (not b!1393482))

(assert (not b!1393479))

(assert (not b!1393475))

(assert (not b!1393476))

(assert (not b!1393478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

