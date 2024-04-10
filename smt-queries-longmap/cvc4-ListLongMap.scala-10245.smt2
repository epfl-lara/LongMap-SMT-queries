; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120526 () Bool)

(assert start!120526)

(declare-fun b!1403438 () Bool)

(declare-fun e!794643 () Bool)

(assert (=> b!1403438 (= e!794643 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95935 0))(
  ( (array!95936 (arr!46318 (Array (_ BitVec 32) (_ BitVec 64))) (size!46868 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95935)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10635 0))(
  ( (MissingZero!10635 (index!44917 (_ BitVec 32))) (Found!10635 (index!44918 (_ BitVec 32))) (Intermediate!10635 (undefined!11447 Bool) (index!44919 (_ BitVec 32)) (x!126526 (_ BitVec 32))) (Undefined!10635) (MissingVacant!10635 (index!44920 (_ BitVec 32))) )
))
(declare-fun lt!618401 () SeekEntryResult!10635)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95935 (_ BitVec 32)) SeekEntryResult!10635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403438 (= lt!618401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95936 (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46868 a!2901)) mask!2840))))

(declare-fun b!1403439 () Bool)

(declare-fun res!941954 () Bool)

(declare-fun e!794642 () Bool)

(assert (=> b!1403439 (=> (not res!941954) (not e!794642))))

(assert (=> b!1403439 (= res!941954 (and (= (size!46868 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46868 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46868 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403440 () Bool)

(declare-fun res!941950 () Bool)

(assert (=> b!1403440 (=> (not res!941950) (not e!794642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403440 (= res!941950 (validKeyInArray!0 (select (arr!46318 a!2901) i!1037)))))

(declare-fun res!941953 () Bool)

(assert (=> start!120526 (=> (not res!941953) (not e!794642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120526 (= res!941953 (validMask!0 mask!2840))))

(assert (=> start!120526 e!794642))

(assert (=> start!120526 true))

(declare-fun array_inv!35346 (array!95935) Bool)

(assert (=> start!120526 (array_inv!35346 a!2901)))

(declare-fun e!794645 () Bool)

(declare-fun b!1403441 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95935 (_ BitVec 32)) SeekEntryResult!10635)

(assert (=> b!1403441 (= e!794645 (= (seekEntryOrOpen!0 (select (arr!46318 a!2901) j!112) a!2901 mask!2840) (Found!10635 j!112)))))

(declare-fun b!1403442 () Bool)

(declare-fun res!941955 () Bool)

(assert (=> b!1403442 (=> (not res!941955) (not e!794642))))

(declare-datatypes ((List!32837 0))(
  ( (Nil!32834) (Cons!32833 (h!34081 (_ BitVec 64)) (t!47531 List!32837)) )
))
(declare-fun arrayNoDuplicates!0 (array!95935 (_ BitVec 32) List!32837) Bool)

(assert (=> b!1403442 (= res!941955 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32834))))

(declare-fun b!1403443 () Bool)

(declare-fun res!941952 () Bool)

(assert (=> b!1403443 (=> (not res!941952) (not e!794642))))

(assert (=> b!1403443 (= res!941952 (validKeyInArray!0 (select (arr!46318 a!2901) j!112)))))

(declare-fun b!1403444 () Bool)

(assert (=> b!1403444 (= e!794642 (not e!794643))))

(declare-fun res!941956 () Bool)

(assert (=> b!1403444 (=> res!941956 e!794643)))

(declare-fun lt!618400 () SeekEntryResult!10635)

(assert (=> b!1403444 (= res!941956 (or (not (is-Intermediate!10635 lt!618400)) (undefined!11447 lt!618400)))))

(assert (=> b!1403444 e!794645))

(declare-fun res!941949 () Bool)

(assert (=> b!1403444 (=> (not res!941949) (not e!794645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95935 (_ BitVec 32)) Bool)

(assert (=> b!1403444 (= res!941949 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47274 0))(
  ( (Unit!47275) )
))
(declare-fun lt!618402 () Unit!47274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47274)

(assert (=> b!1403444 (= lt!618402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403444 (= lt!618400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46318 a!2901) j!112) mask!2840) (select (arr!46318 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403445 () Bool)

(declare-fun res!941951 () Bool)

(assert (=> b!1403445 (=> (not res!941951) (not e!794642))))

(assert (=> b!1403445 (= res!941951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120526 res!941953) b!1403439))

(assert (= (and b!1403439 res!941954) b!1403440))

(assert (= (and b!1403440 res!941950) b!1403443))

(assert (= (and b!1403443 res!941952) b!1403445))

(assert (= (and b!1403445 res!941951) b!1403442))

(assert (= (and b!1403442 res!941955) b!1403444))

(assert (= (and b!1403444 res!941949) b!1403441))

(assert (= (and b!1403444 (not res!941956)) b!1403438))

(declare-fun m!1292075 () Bool)

(assert (=> b!1403438 m!1292075))

(declare-fun m!1292077 () Bool)

(assert (=> b!1403438 m!1292077))

(assert (=> b!1403438 m!1292077))

(declare-fun m!1292079 () Bool)

(assert (=> b!1403438 m!1292079))

(assert (=> b!1403438 m!1292079))

(assert (=> b!1403438 m!1292077))

(declare-fun m!1292081 () Bool)

(assert (=> b!1403438 m!1292081))

(declare-fun m!1292083 () Bool)

(assert (=> b!1403442 m!1292083))

(declare-fun m!1292085 () Bool)

(assert (=> b!1403444 m!1292085))

(declare-fun m!1292087 () Bool)

(assert (=> b!1403444 m!1292087))

(assert (=> b!1403444 m!1292085))

(declare-fun m!1292089 () Bool)

(assert (=> b!1403444 m!1292089))

(assert (=> b!1403444 m!1292087))

(assert (=> b!1403444 m!1292085))

(declare-fun m!1292091 () Bool)

(assert (=> b!1403444 m!1292091))

(declare-fun m!1292093 () Bool)

(assert (=> b!1403444 m!1292093))

(declare-fun m!1292095 () Bool)

(assert (=> start!120526 m!1292095))

(declare-fun m!1292097 () Bool)

(assert (=> start!120526 m!1292097))

(declare-fun m!1292099 () Bool)

(assert (=> b!1403445 m!1292099))

(declare-fun m!1292101 () Bool)

(assert (=> b!1403440 m!1292101))

(assert (=> b!1403440 m!1292101))

(declare-fun m!1292103 () Bool)

(assert (=> b!1403440 m!1292103))

(assert (=> b!1403441 m!1292085))

(assert (=> b!1403441 m!1292085))

(declare-fun m!1292105 () Bool)

(assert (=> b!1403441 m!1292105))

(assert (=> b!1403443 m!1292085))

(assert (=> b!1403443 m!1292085))

(declare-fun m!1292107 () Bool)

(assert (=> b!1403443 m!1292107))

(push 1)

(assert (not b!1403444))

(assert (not b!1403443))

(assert (not b!1403440))

(assert (not b!1403445))

(assert (not start!120526))

(assert (not b!1403441))

(assert (not b!1403442))

(assert (not b!1403438))

(check-sat)

