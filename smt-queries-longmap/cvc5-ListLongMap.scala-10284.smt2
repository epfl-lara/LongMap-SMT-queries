; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120864 () Bool)

(assert start!120864)

(declare-fun b!1406312 () Bool)

(declare-fun res!944530 () Bool)

(declare-fun e!795978 () Bool)

(assert (=> b!1406312 (=> (not res!944530) (not e!795978))))

(declare-datatypes ((array!96171 0))(
  ( (array!96172 (arr!46433 (Array (_ BitVec 32) (_ BitVec 64))) (size!46983 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96171)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406312 (= res!944530 (validKeyInArray!0 (select (arr!46433 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795980 () Bool)

(declare-fun b!1406313 () Bool)

(declare-datatypes ((SeekEntryResult!10744 0))(
  ( (MissingZero!10744 (index!45353 (_ BitVec 32))) (Found!10744 (index!45354 (_ BitVec 32))) (Intermediate!10744 (undefined!11556 Bool) (index!45355 (_ BitVec 32)) (x!126959 (_ BitVec 32))) (Undefined!10744) (MissingVacant!10744 (index!45356 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96171 (_ BitVec 32)) SeekEntryResult!10744)

(assert (=> b!1406313 (= e!795980 (= (seekEntryOrOpen!0 (select (arr!46433 a!2901) j!112) a!2901 mask!2840) (Found!10744 j!112)))))

(declare-fun b!1406314 () Bool)

(declare-fun res!944534 () Bool)

(assert (=> b!1406314 (=> (not res!944534) (not e!795978))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406314 (= res!944534 (validKeyInArray!0 (select (arr!46433 a!2901) i!1037)))))

(declare-fun b!1406315 () Bool)

(declare-fun res!944531 () Bool)

(assert (=> b!1406315 (=> (not res!944531) (not e!795978))))

(declare-datatypes ((List!32952 0))(
  ( (Nil!32949) (Cons!32948 (h!34202 (_ BitVec 64)) (t!47646 List!32952)) )
))
(declare-fun arrayNoDuplicates!0 (array!96171 (_ BitVec 32) List!32952) Bool)

(assert (=> b!1406315 (= res!944531 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32949))))

(declare-fun b!1406317 () Bool)

(declare-fun res!944529 () Bool)

(assert (=> b!1406317 (=> (not res!944529) (not e!795978))))

(assert (=> b!1406317 (= res!944529 (and (= (size!46983 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46983 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46983 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944536 () Bool)

(assert (=> start!120864 (=> (not res!944536) (not e!795978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120864 (= res!944536 (validMask!0 mask!2840))))

(assert (=> start!120864 e!795978))

(assert (=> start!120864 true))

(declare-fun array_inv!35461 (array!96171) Bool)

(assert (=> start!120864 (array_inv!35461 a!2901)))

(declare-fun b!1406316 () Bool)

(declare-fun e!795979 () Bool)

(assert (=> b!1406316 (= e!795978 (not e!795979))))

(declare-fun res!944535 () Bool)

(assert (=> b!1406316 (=> res!944535 e!795979)))

(declare-fun lt!619338 () SeekEntryResult!10744)

(assert (=> b!1406316 (= res!944535 (or (not (is-Intermediate!10744 lt!619338)) (undefined!11556 lt!619338)))))

(assert (=> b!1406316 e!795980))

(declare-fun res!944532 () Bool)

(assert (=> b!1406316 (=> (not res!944532) (not e!795980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96171 (_ BitVec 32)) Bool)

(assert (=> b!1406316 (= res!944532 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47462 0))(
  ( (Unit!47463) )
))
(declare-fun lt!619336 () Unit!47462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47462)

(assert (=> b!1406316 (= lt!619336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96171 (_ BitVec 32)) SeekEntryResult!10744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406316 (= lt!619338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46433 a!2901) j!112) mask!2840) (select (arr!46433 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406318 () Bool)

(declare-fun res!944533 () Bool)

(assert (=> b!1406318 (=> (not res!944533) (not e!795978))))

(assert (=> b!1406318 (= res!944533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406319 () Bool)

(assert (=> b!1406319 (= e!795979 true)))

(declare-fun lt!619337 () SeekEntryResult!10744)

(assert (=> b!1406319 (= lt!619337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46433 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46433 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96172 (store (arr!46433 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46983 a!2901)) mask!2840))))

(assert (= (and start!120864 res!944536) b!1406317))

(assert (= (and b!1406317 res!944529) b!1406314))

(assert (= (and b!1406314 res!944534) b!1406312))

(assert (= (and b!1406312 res!944530) b!1406318))

(assert (= (and b!1406318 res!944533) b!1406315))

(assert (= (and b!1406315 res!944531) b!1406316))

(assert (= (and b!1406316 res!944532) b!1406313))

(assert (= (and b!1406316 (not res!944535)) b!1406319))

(declare-fun m!1295403 () Bool)

(assert (=> start!120864 m!1295403))

(declare-fun m!1295405 () Bool)

(assert (=> start!120864 m!1295405))

(declare-fun m!1295407 () Bool)

(assert (=> b!1406314 m!1295407))

(assert (=> b!1406314 m!1295407))

(declare-fun m!1295409 () Bool)

(assert (=> b!1406314 m!1295409))

(declare-fun m!1295411 () Bool)

(assert (=> b!1406318 m!1295411))

(declare-fun m!1295413 () Bool)

(assert (=> b!1406312 m!1295413))

(assert (=> b!1406312 m!1295413))

(declare-fun m!1295415 () Bool)

(assert (=> b!1406312 m!1295415))

(declare-fun m!1295417 () Bool)

(assert (=> b!1406319 m!1295417))

(declare-fun m!1295419 () Bool)

(assert (=> b!1406319 m!1295419))

(assert (=> b!1406319 m!1295419))

(declare-fun m!1295421 () Bool)

(assert (=> b!1406319 m!1295421))

(assert (=> b!1406319 m!1295421))

(assert (=> b!1406319 m!1295419))

(declare-fun m!1295423 () Bool)

(assert (=> b!1406319 m!1295423))

(declare-fun m!1295425 () Bool)

(assert (=> b!1406315 m!1295425))

(assert (=> b!1406316 m!1295413))

(declare-fun m!1295427 () Bool)

(assert (=> b!1406316 m!1295427))

(assert (=> b!1406316 m!1295413))

(declare-fun m!1295429 () Bool)

(assert (=> b!1406316 m!1295429))

(assert (=> b!1406316 m!1295427))

(assert (=> b!1406316 m!1295413))

(declare-fun m!1295431 () Bool)

(assert (=> b!1406316 m!1295431))

(declare-fun m!1295433 () Bool)

(assert (=> b!1406316 m!1295433))

(assert (=> b!1406313 m!1295413))

(assert (=> b!1406313 m!1295413))

(declare-fun m!1295435 () Bool)

(assert (=> b!1406313 m!1295435))

(push 1)

(assert (not b!1406312))

(assert (not b!1406314))

(assert (not b!1406313))

(assert (not start!120864))

(assert (not b!1406315))

(assert (not b!1406318))

(assert (not b!1406316))

(assert (not b!1406319))

(check-sat)

(pop 1)

