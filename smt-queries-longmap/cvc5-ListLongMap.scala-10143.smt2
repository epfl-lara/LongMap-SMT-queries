; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119622 () Bool)

(assert start!119622)

(declare-fun b!1393403 () Bool)

(declare-fun res!932816 () Bool)

(declare-fun e!789000 () Bool)

(assert (=> b!1393403 (=> (not res!932816) (not e!789000))))

(declare-datatypes ((array!95304 0))(
  ( (array!95305 (arr!46010 (Array (_ BitVec 32) (_ BitVec 64))) (size!46560 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95304)

(declare-datatypes ((List!32529 0))(
  ( (Nil!32526) (Cons!32525 (h!33758 (_ BitVec 64)) (t!47223 List!32529)) )
))
(declare-fun arrayNoDuplicates!0 (array!95304 (_ BitVec 32) List!32529) Bool)

(assert (=> b!1393403 (= res!932816 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32526))))

(declare-fun b!1393404 () Bool)

(declare-fun res!932811 () Bool)

(assert (=> b!1393404 (=> (not res!932811) (not e!789000))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393404 (= res!932811 (validKeyInArray!0 (select (arr!46010 a!2901) j!112)))))

(declare-fun b!1393405 () Bool)

(declare-fun res!932812 () Bool)

(assert (=> b!1393405 (=> (not res!932812) (not e!789000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95304 (_ BitVec 32)) Bool)

(assert (=> b!1393405 (= res!932812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393406 () Bool)

(declare-fun e!789001 () Bool)

(assert (=> b!1393406 (= e!789001 true)))

(declare-datatypes ((SeekEntryResult!10327 0))(
  ( (MissingZero!10327 (index!43679 (_ BitVec 32))) (Found!10327 (index!43680 (_ BitVec 32))) (Intermediate!10327 (undefined!11139 Bool) (index!43681 (_ BitVec 32)) (x!125363 (_ BitVec 32))) (Undefined!10327) (MissingVacant!10327 (index!43682 (_ BitVec 32))) )
))
(declare-fun lt!611979 () SeekEntryResult!10327)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95304 (_ BitVec 32)) SeekEntryResult!10327)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393406 (= lt!611979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46010 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46010 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95305 (store (arr!46010 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46560 a!2901)) mask!2840))))

(declare-fun b!1393407 () Bool)

(declare-fun res!932818 () Bool)

(assert (=> b!1393407 (=> (not res!932818) (not e!789000))))

(assert (=> b!1393407 (= res!932818 (validKeyInArray!0 (select (arr!46010 a!2901) i!1037)))))

(declare-fun e!789002 () Bool)

(declare-fun b!1393408 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95304 (_ BitVec 32)) SeekEntryResult!10327)

(assert (=> b!1393408 (= e!789002 (= (seekEntryOrOpen!0 (select (arr!46010 a!2901) j!112) a!2901 mask!2840) (Found!10327 j!112)))))

(declare-fun b!1393409 () Bool)

(assert (=> b!1393409 (= e!789000 (not e!789001))))

(declare-fun res!932813 () Bool)

(assert (=> b!1393409 (=> res!932813 e!789001)))

(declare-fun lt!611978 () SeekEntryResult!10327)

(assert (=> b!1393409 (= res!932813 (or (not (is-Intermediate!10327 lt!611978)) (undefined!11139 lt!611978)))))

(assert (=> b!1393409 e!789002))

(declare-fun res!932815 () Bool)

(assert (=> b!1393409 (=> (not res!932815) (not e!789002))))

(assert (=> b!1393409 (= res!932815 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46658 0))(
  ( (Unit!46659) )
))
(declare-fun lt!611977 () Unit!46658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46658)

(assert (=> b!1393409 (= lt!611977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393409 (= lt!611978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46010 a!2901) j!112) mask!2840) (select (arr!46010 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932817 () Bool)

(assert (=> start!119622 (=> (not res!932817) (not e!789000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119622 (= res!932817 (validMask!0 mask!2840))))

(assert (=> start!119622 e!789000))

(assert (=> start!119622 true))

(declare-fun array_inv!35038 (array!95304) Bool)

(assert (=> start!119622 (array_inv!35038 a!2901)))

(declare-fun b!1393410 () Bool)

(declare-fun res!932814 () Bool)

(assert (=> b!1393410 (=> (not res!932814) (not e!789000))))

(assert (=> b!1393410 (= res!932814 (and (= (size!46560 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46560 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46560 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119622 res!932817) b!1393410))

(assert (= (and b!1393410 res!932814) b!1393407))

(assert (= (and b!1393407 res!932818) b!1393404))

(assert (= (and b!1393404 res!932811) b!1393405))

(assert (= (and b!1393405 res!932812) b!1393403))

(assert (= (and b!1393403 res!932816) b!1393409))

(assert (= (and b!1393409 res!932815) b!1393408))

(assert (= (and b!1393409 (not res!932813)) b!1393406))

(declare-fun m!1279299 () Bool)

(assert (=> b!1393408 m!1279299))

(assert (=> b!1393408 m!1279299))

(declare-fun m!1279301 () Bool)

(assert (=> b!1393408 m!1279301))

(declare-fun m!1279303 () Bool)

(assert (=> start!119622 m!1279303))

(declare-fun m!1279305 () Bool)

(assert (=> start!119622 m!1279305))

(declare-fun m!1279307 () Bool)

(assert (=> b!1393406 m!1279307))

(declare-fun m!1279309 () Bool)

(assert (=> b!1393406 m!1279309))

(assert (=> b!1393406 m!1279309))

(declare-fun m!1279311 () Bool)

(assert (=> b!1393406 m!1279311))

(assert (=> b!1393406 m!1279311))

(assert (=> b!1393406 m!1279309))

(declare-fun m!1279313 () Bool)

(assert (=> b!1393406 m!1279313))

(declare-fun m!1279315 () Bool)

(assert (=> b!1393405 m!1279315))

(declare-fun m!1279317 () Bool)

(assert (=> b!1393403 m!1279317))

(assert (=> b!1393409 m!1279299))

(declare-fun m!1279319 () Bool)

(assert (=> b!1393409 m!1279319))

(assert (=> b!1393409 m!1279299))

(declare-fun m!1279321 () Bool)

(assert (=> b!1393409 m!1279321))

(assert (=> b!1393409 m!1279319))

(assert (=> b!1393409 m!1279299))

(declare-fun m!1279323 () Bool)

(assert (=> b!1393409 m!1279323))

(declare-fun m!1279325 () Bool)

(assert (=> b!1393409 m!1279325))

(assert (=> b!1393404 m!1279299))

(assert (=> b!1393404 m!1279299))

(declare-fun m!1279327 () Bool)

(assert (=> b!1393404 m!1279327))

(declare-fun m!1279329 () Bool)

(assert (=> b!1393407 m!1279329))

(assert (=> b!1393407 m!1279329))

(declare-fun m!1279331 () Bool)

(assert (=> b!1393407 m!1279331))

(push 1)

(assert (not b!1393406))

(assert (not b!1393408))

(assert (not b!1393407))

(assert (not b!1393409))

(assert (not b!1393405))

(assert (not start!119622))

(assert (not b!1393403))

(assert (not b!1393404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

