; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120574 () Bool)

(assert start!120574)

(declare-fun b!1403952 () Bool)

(declare-fun e!794868 () Bool)

(assert (=> b!1403952 (= e!794868 (not true))))

(declare-fun e!794870 () Bool)

(assert (=> b!1403952 e!794870))

(declare-fun res!942466 () Bool)

(assert (=> b!1403952 (=> (not res!942466) (not e!794870))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95983 0))(
  ( (array!95984 (arr!46342 (Array (_ BitVec 32) (_ BitVec 64))) (size!46892 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95983)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95983 (_ BitVec 32)) Bool)

(assert (=> b!1403952 (= res!942466 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47322 0))(
  ( (Unit!47323) )
))
(declare-fun lt!618554 () Unit!47322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47322)

(assert (=> b!1403952 (= lt!618554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10659 0))(
  ( (MissingZero!10659 (index!45013 (_ BitVec 32))) (Found!10659 (index!45014 (_ BitVec 32))) (Intermediate!10659 (undefined!11471 Bool) (index!45015 (_ BitVec 32)) (x!126614 (_ BitVec 32))) (Undefined!10659) (MissingVacant!10659 (index!45016 (_ BitVec 32))) )
))
(declare-fun lt!618555 () SeekEntryResult!10659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95983 (_ BitVec 32)) SeekEntryResult!10659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403952 (= lt!618555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46342 a!2901) j!112) mask!2840) (select (arr!46342 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95983 (_ BitVec 32)) SeekEntryResult!10659)

(assert (=> b!1403953 (= e!794870 (= (seekEntryOrOpen!0 (select (arr!46342 a!2901) j!112) a!2901 mask!2840) (Found!10659 j!112)))))

(declare-fun b!1403954 () Bool)

(declare-fun res!942465 () Bool)

(assert (=> b!1403954 (=> (not res!942465) (not e!794868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403954 (= res!942465 (validKeyInArray!0 (select (arr!46342 a!2901) j!112)))))

(declare-fun b!1403955 () Bool)

(declare-fun res!942467 () Bool)

(assert (=> b!1403955 (=> (not res!942467) (not e!794868))))

(assert (=> b!1403955 (= res!942467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403956 () Bool)

(declare-fun res!942469 () Bool)

(assert (=> b!1403956 (=> (not res!942469) (not e!794868))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403956 (= res!942469 (and (= (size!46892 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46892 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46892 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403957 () Bool)

(declare-fun res!942463 () Bool)

(assert (=> b!1403957 (=> (not res!942463) (not e!794868))))

(declare-datatypes ((List!32861 0))(
  ( (Nil!32858) (Cons!32857 (h!34105 (_ BitVec 64)) (t!47555 List!32861)) )
))
(declare-fun arrayNoDuplicates!0 (array!95983 (_ BitVec 32) List!32861) Bool)

(assert (=> b!1403957 (= res!942463 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32858))))

(declare-fun b!1403958 () Bool)

(declare-fun res!942468 () Bool)

(assert (=> b!1403958 (=> (not res!942468) (not e!794868))))

(assert (=> b!1403958 (= res!942468 (validKeyInArray!0 (select (arr!46342 a!2901) i!1037)))))

(declare-fun res!942464 () Bool)

(assert (=> start!120574 (=> (not res!942464) (not e!794868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120574 (= res!942464 (validMask!0 mask!2840))))

(assert (=> start!120574 e!794868))

(assert (=> start!120574 true))

(declare-fun array_inv!35370 (array!95983) Bool)

(assert (=> start!120574 (array_inv!35370 a!2901)))

(assert (= (and start!120574 res!942464) b!1403956))

(assert (= (and b!1403956 res!942469) b!1403958))

(assert (= (and b!1403958 res!942468) b!1403954))

(assert (= (and b!1403954 res!942465) b!1403955))

(assert (= (and b!1403955 res!942467) b!1403957))

(assert (= (and b!1403957 res!942463) b!1403952))

(assert (= (and b!1403952 res!942466) b!1403953))

(declare-fun m!1292731 () Bool)

(assert (=> b!1403955 m!1292731))

(declare-fun m!1292733 () Bool)

(assert (=> start!120574 m!1292733))

(declare-fun m!1292735 () Bool)

(assert (=> start!120574 m!1292735))

(declare-fun m!1292737 () Bool)

(assert (=> b!1403954 m!1292737))

(assert (=> b!1403954 m!1292737))

(declare-fun m!1292739 () Bool)

(assert (=> b!1403954 m!1292739))

(assert (=> b!1403952 m!1292737))

(declare-fun m!1292741 () Bool)

(assert (=> b!1403952 m!1292741))

(assert (=> b!1403952 m!1292737))

(declare-fun m!1292743 () Bool)

(assert (=> b!1403952 m!1292743))

(assert (=> b!1403952 m!1292741))

(assert (=> b!1403952 m!1292737))

(declare-fun m!1292745 () Bool)

(assert (=> b!1403952 m!1292745))

(declare-fun m!1292747 () Bool)

(assert (=> b!1403952 m!1292747))

(declare-fun m!1292749 () Bool)

(assert (=> b!1403957 m!1292749))

(declare-fun m!1292751 () Bool)

(assert (=> b!1403958 m!1292751))

(assert (=> b!1403958 m!1292751))

(declare-fun m!1292753 () Bool)

(assert (=> b!1403958 m!1292753))

(assert (=> b!1403953 m!1292737))

(assert (=> b!1403953 m!1292737))

(declare-fun m!1292755 () Bool)

(assert (=> b!1403953 m!1292755))

(push 1)

(assert (not b!1403955))

(assert (not start!120574))

(assert (not b!1403953))

(assert (not b!1403954))

(assert (not b!1403957))

(assert (not b!1403952))

(assert (not b!1403958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

