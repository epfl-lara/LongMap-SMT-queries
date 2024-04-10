; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120532 () Bool)

(assert start!120532)

(declare-fun b!1403510 () Bool)

(declare-fun res!942023 () Bool)

(declare-fun e!794680 () Bool)

(assert (=> b!1403510 (=> (not res!942023) (not e!794680))))

(declare-datatypes ((array!95941 0))(
  ( (array!95942 (arr!46321 (Array (_ BitVec 32) (_ BitVec 64))) (size!46871 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95941)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403510 (= res!942023 (validKeyInArray!0 (select (arr!46321 a!2901) i!1037)))))

(declare-fun b!1403511 () Bool)

(declare-fun res!942022 () Bool)

(assert (=> b!1403511 (=> (not res!942022) (not e!794680))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403511 (= res!942022 (validKeyInArray!0 (select (arr!46321 a!2901) j!112)))))

(declare-fun b!1403512 () Bool)

(declare-fun res!942024 () Bool)

(assert (=> b!1403512 (=> (not res!942024) (not e!794680))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1403512 (= res!942024 (and (= (size!46871 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46871 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46871 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403513 () Bool)

(declare-fun e!794678 () Bool)

(assert (=> b!1403513 (= e!794678 true)))

(declare-datatypes ((SeekEntryResult!10638 0))(
  ( (MissingZero!10638 (index!44929 (_ BitVec 32))) (Found!10638 (index!44930 (_ BitVec 32))) (Intermediate!10638 (undefined!11450 Bool) (index!44931 (_ BitVec 32)) (x!126537 (_ BitVec 32))) (Undefined!10638) (MissingVacant!10638 (index!44932 (_ BitVec 32))) )
))
(declare-fun lt!618429 () SeekEntryResult!10638)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95941 (_ BitVec 32)) SeekEntryResult!10638)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403513 (= lt!618429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95942 (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46871 a!2901)) mask!2840))))

(declare-fun b!1403514 () Bool)

(declare-fun res!942025 () Bool)

(assert (=> b!1403514 (=> (not res!942025) (not e!794680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95941 (_ BitVec 32)) Bool)

(assert (=> b!1403514 (= res!942025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403515 () Bool)

(assert (=> b!1403515 (= e!794680 (not e!794678))))

(declare-fun res!942028 () Bool)

(assert (=> b!1403515 (=> res!942028 e!794678)))

(declare-fun lt!618428 () SeekEntryResult!10638)

(assert (=> b!1403515 (= res!942028 (or (not (is-Intermediate!10638 lt!618428)) (undefined!11450 lt!618428)))))

(declare-fun e!794681 () Bool)

(assert (=> b!1403515 e!794681))

(declare-fun res!942026 () Bool)

(assert (=> b!1403515 (=> (not res!942026) (not e!794681))))

(assert (=> b!1403515 (= res!942026 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47280 0))(
  ( (Unit!47281) )
))
(declare-fun lt!618427 () Unit!47280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47280)

(assert (=> b!1403515 (= lt!618427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403515 (= lt!618428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46321 a!2901) j!112) mask!2840) (select (arr!46321 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95941 (_ BitVec 32)) SeekEntryResult!10638)

(assert (=> b!1403516 (= e!794681 (= (seekEntryOrOpen!0 (select (arr!46321 a!2901) j!112) a!2901 mask!2840) (Found!10638 j!112)))))

(declare-fun b!1403517 () Bool)

(declare-fun res!942021 () Bool)

(assert (=> b!1403517 (=> (not res!942021) (not e!794680))))

(declare-datatypes ((List!32840 0))(
  ( (Nil!32837) (Cons!32836 (h!34084 (_ BitVec 64)) (t!47534 List!32840)) )
))
(declare-fun arrayNoDuplicates!0 (array!95941 (_ BitVec 32) List!32840) Bool)

(assert (=> b!1403517 (= res!942021 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32837))))

(declare-fun res!942027 () Bool)

(assert (=> start!120532 (=> (not res!942027) (not e!794680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120532 (= res!942027 (validMask!0 mask!2840))))

(assert (=> start!120532 e!794680))

(assert (=> start!120532 true))

(declare-fun array_inv!35349 (array!95941) Bool)

(assert (=> start!120532 (array_inv!35349 a!2901)))

(assert (= (and start!120532 res!942027) b!1403512))

(assert (= (and b!1403512 res!942024) b!1403510))

(assert (= (and b!1403510 res!942023) b!1403511))

(assert (= (and b!1403511 res!942022) b!1403514))

(assert (= (and b!1403514 res!942025) b!1403517))

(assert (= (and b!1403517 res!942021) b!1403515))

(assert (= (and b!1403515 res!942026) b!1403516))

(assert (= (and b!1403515 (not res!942028)) b!1403513))

(declare-fun m!1292177 () Bool)

(assert (=> b!1403517 m!1292177))

(declare-fun m!1292179 () Bool)

(assert (=> b!1403510 m!1292179))

(assert (=> b!1403510 m!1292179))

(declare-fun m!1292181 () Bool)

(assert (=> b!1403510 m!1292181))

(declare-fun m!1292183 () Bool)

(assert (=> b!1403515 m!1292183))

(declare-fun m!1292185 () Bool)

(assert (=> b!1403515 m!1292185))

(assert (=> b!1403515 m!1292183))

(declare-fun m!1292187 () Bool)

(assert (=> b!1403515 m!1292187))

(assert (=> b!1403515 m!1292185))

(assert (=> b!1403515 m!1292183))

(declare-fun m!1292189 () Bool)

(assert (=> b!1403515 m!1292189))

(declare-fun m!1292191 () Bool)

(assert (=> b!1403515 m!1292191))

(assert (=> b!1403516 m!1292183))

(assert (=> b!1403516 m!1292183))

(declare-fun m!1292193 () Bool)

(assert (=> b!1403516 m!1292193))

(declare-fun m!1292195 () Bool)

(assert (=> start!120532 m!1292195))

(declare-fun m!1292197 () Bool)

(assert (=> start!120532 m!1292197))

(assert (=> b!1403511 m!1292183))

(assert (=> b!1403511 m!1292183))

(declare-fun m!1292199 () Bool)

(assert (=> b!1403511 m!1292199))

(declare-fun m!1292201 () Bool)

(assert (=> b!1403514 m!1292201))

(declare-fun m!1292203 () Bool)

(assert (=> b!1403513 m!1292203))

(declare-fun m!1292205 () Bool)

(assert (=> b!1403513 m!1292205))

(assert (=> b!1403513 m!1292205))

(declare-fun m!1292207 () Bool)

(assert (=> b!1403513 m!1292207))

(assert (=> b!1403513 m!1292207))

(assert (=> b!1403513 m!1292205))

(declare-fun m!1292209 () Bool)

(assert (=> b!1403513 m!1292209))

(push 1)

(assert (not b!1403513))

(assert (not b!1403517))

(assert (not b!1403514))

(assert (not start!120532))

(assert (not b!1403515))

(assert (not b!1403510))

(assert (not b!1403511))

(assert (not b!1403516))

(check-sat)

(pop 1)

