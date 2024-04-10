; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120528 () Bool)

(assert start!120528)

(declare-fun b!1403462 () Bool)

(declare-fun res!941978 () Bool)

(declare-fun e!794656 () Bool)

(assert (=> b!1403462 (=> (not res!941978) (not e!794656))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95937 0))(
  ( (array!95938 (arr!46319 (Array (_ BitVec 32) (_ BitVec 64))) (size!46869 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95937)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403462 (= res!941978 (and (= (size!46869 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46869 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46869 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403463 () Bool)

(declare-fun res!941975 () Bool)

(assert (=> b!1403463 (=> (not res!941975) (not e!794656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403463 (= res!941975 (validKeyInArray!0 (select (arr!46319 a!2901) j!112)))))

(declare-fun e!794657 () Bool)

(declare-fun b!1403464 () Bool)

(declare-datatypes ((SeekEntryResult!10636 0))(
  ( (MissingZero!10636 (index!44921 (_ BitVec 32))) (Found!10636 (index!44922 (_ BitVec 32))) (Intermediate!10636 (undefined!11448 Bool) (index!44923 (_ BitVec 32)) (x!126535 (_ BitVec 32))) (Undefined!10636) (MissingVacant!10636 (index!44924 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95937 (_ BitVec 32)) SeekEntryResult!10636)

(assert (=> b!1403464 (= e!794657 (= (seekEntryOrOpen!0 (select (arr!46319 a!2901) j!112) a!2901 mask!2840) (Found!10636 j!112)))))

(declare-fun b!1403465 () Bool)

(declare-fun e!794655 () Bool)

(assert (=> b!1403465 (= e!794655 true)))

(declare-fun lt!618411 () SeekEntryResult!10636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95937 (_ BitVec 32)) SeekEntryResult!10636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403465 (= lt!618411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46319 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46319 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95938 (store (arr!46319 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46869 a!2901)) mask!2840))))

(declare-fun b!1403466 () Bool)

(declare-fun res!941974 () Bool)

(assert (=> b!1403466 (=> (not res!941974) (not e!794656))))

(assert (=> b!1403466 (= res!941974 (validKeyInArray!0 (select (arr!46319 a!2901) i!1037)))))

(declare-fun res!941973 () Bool)

(assert (=> start!120528 (=> (not res!941973) (not e!794656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120528 (= res!941973 (validMask!0 mask!2840))))

(assert (=> start!120528 e!794656))

(assert (=> start!120528 true))

(declare-fun array_inv!35347 (array!95937) Bool)

(assert (=> start!120528 (array_inv!35347 a!2901)))

(declare-fun b!1403467 () Bool)

(declare-fun res!941980 () Bool)

(assert (=> b!1403467 (=> (not res!941980) (not e!794656))))

(declare-datatypes ((List!32838 0))(
  ( (Nil!32835) (Cons!32834 (h!34082 (_ BitVec 64)) (t!47532 List!32838)) )
))
(declare-fun arrayNoDuplicates!0 (array!95937 (_ BitVec 32) List!32838) Bool)

(assert (=> b!1403467 (= res!941980 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32835))))

(declare-fun b!1403468 () Bool)

(assert (=> b!1403468 (= e!794656 (not e!794655))))

(declare-fun res!941976 () Bool)

(assert (=> b!1403468 (=> res!941976 e!794655)))

(declare-fun lt!618410 () SeekEntryResult!10636)

(assert (=> b!1403468 (= res!941976 (or (not (is-Intermediate!10636 lt!618410)) (undefined!11448 lt!618410)))))

(assert (=> b!1403468 e!794657))

(declare-fun res!941979 () Bool)

(assert (=> b!1403468 (=> (not res!941979) (not e!794657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95937 (_ BitVec 32)) Bool)

(assert (=> b!1403468 (= res!941979 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47276 0))(
  ( (Unit!47277) )
))
(declare-fun lt!618409 () Unit!47276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47276)

(assert (=> b!1403468 (= lt!618409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403468 (= lt!618410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46319 a!2901) j!112) mask!2840) (select (arr!46319 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403469 () Bool)

(declare-fun res!941977 () Bool)

(assert (=> b!1403469 (=> (not res!941977) (not e!794656))))

(assert (=> b!1403469 (= res!941977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120528 res!941973) b!1403462))

(assert (= (and b!1403462 res!941978) b!1403466))

(assert (= (and b!1403466 res!941974) b!1403463))

(assert (= (and b!1403463 res!941975) b!1403469))

(assert (= (and b!1403469 res!941977) b!1403467))

(assert (= (and b!1403467 res!941980) b!1403468))

(assert (= (and b!1403468 res!941979) b!1403464))

(assert (= (and b!1403468 (not res!941976)) b!1403465))

(declare-fun m!1292109 () Bool)

(assert (=> start!120528 m!1292109))

(declare-fun m!1292111 () Bool)

(assert (=> start!120528 m!1292111))

(declare-fun m!1292113 () Bool)

(assert (=> b!1403467 m!1292113))

(declare-fun m!1292115 () Bool)

(assert (=> b!1403469 m!1292115))

(declare-fun m!1292117 () Bool)

(assert (=> b!1403468 m!1292117))

(declare-fun m!1292119 () Bool)

(assert (=> b!1403468 m!1292119))

(assert (=> b!1403468 m!1292117))

(declare-fun m!1292121 () Bool)

(assert (=> b!1403468 m!1292121))

(assert (=> b!1403468 m!1292119))

(assert (=> b!1403468 m!1292117))

(declare-fun m!1292123 () Bool)

(assert (=> b!1403468 m!1292123))

(declare-fun m!1292125 () Bool)

(assert (=> b!1403468 m!1292125))

(assert (=> b!1403464 m!1292117))

(assert (=> b!1403464 m!1292117))

(declare-fun m!1292127 () Bool)

(assert (=> b!1403464 m!1292127))

(assert (=> b!1403463 m!1292117))

(assert (=> b!1403463 m!1292117))

(declare-fun m!1292129 () Bool)

(assert (=> b!1403463 m!1292129))

(declare-fun m!1292131 () Bool)

(assert (=> b!1403466 m!1292131))

(assert (=> b!1403466 m!1292131))

(declare-fun m!1292133 () Bool)

(assert (=> b!1403466 m!1292133))

(declare-fun m!1292135 () Bool)

(assert (=> b!1403465 m!1292135))

(declare-fun m!1292137 () Bool)

(assert (=> b!1403465 m!1292137))

(assert (=> b!1403465 m!1292137))

(declare-fun m!1292139 () Bool)

(assert (=> b!1403465 m!1292139))

(assert (=> b!1403465 m!1292139))

(assert (=> b!1403465 m!1292137))

(declare-fun m!1292141 () Bool)

(assert (=> b!1403465 m!1292141))

(push 1)

(assert (not b!1403464))

(assert (not b!1403469))

(assert (not b!1403463))

(assert (not b!1403465))

(assert (not b!1403466))

(assert (not b!1403467))

(assert (not b!1403468))

(assert (not start!120528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

