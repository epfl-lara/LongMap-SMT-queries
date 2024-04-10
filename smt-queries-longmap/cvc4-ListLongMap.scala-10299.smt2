; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121120 () Bool)

(assert start!121120)

(declare-fun b!1408276 () Bool)

(declare-fun e!797021 () Bool)

(declare-fun e!797018 () Bool)

(assert (=> b!1408276 (= e!797021 e!797018)))

(declare-fun res!946003 () Bool)

(assert (=> b!1408276 (=> res!946003 e!797018)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10791 0))(
  ( (MissingZero!10791 (index!45541 (_ BitVec 32))) (Found!10791 (index!45542 (_ BitVec 32))) (Intermediate!10791 (undefined!11603 Bool) (index!45543 (_ BitVec 32)) (x!127144 (_ BitVec 32))) (Undefined!10791) (MissingVacant!10791 (index!45544 (_ BitVec 32))) )
))
(declare-fun lt!620255 () SeekEntryResult!10791)

(declare-datatypes ((array!96274 0))(
  ( (array!96275 (arr!46480 (Array (_ BitVec 32) (_ BitVec 64))) (size!47030 (_ BitVec 32))) )
))
(declare-fun lt!620256 () array!96274)

(declare-fun lt!620252 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96274 (_ BitVec 32)) SeekEntryResult!10791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408276 (= res!946003 (not (= lt!620255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620252 mask!2840) lt!620252 lt!620256 mask!2840))))))

(declare-fun a!2901 () array!96274)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408276 (= lt!620252 (select (store (arr!46480 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408276 (= lt!620256 (array!96275 (store (arr!46480 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47030 a!2901)))))

(declare-fun b!1408277 () Bool)

(declare-fun res!946000 () Bool)

(declare-fun e!797020 () Bool)

(assert (=> b!1408277 (=> (not res!946000) (not e!797020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408277 (= res!946000 (validKeyInArray!0 (select (arr!46480 a!2901) i!1037)))))

(declare-fun b!1408279 () Bool)

(declare-fun res!946001 () Bool)

(assert (=> b!1408279 (=> (not res!946001) (not e!797020))))

(assert (=> b!1408279 (= res!946001 (and (= (size!47030 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47030 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47030 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408280 () Bool)

(declare-fun res!945998 () Bool)

(assert (=> b!1408280 (=> (not res!945998) (not e!797020))))

(declare-datatypes ((List!32999 0))(
  ( (Nil!32996) (Cons!32995 (h!34258 (_ BitVec 64)) (t!47693 List!32999)) )
))
(declare-fun arrayNoDuplicates!0 (array!96274 (_ BitVec 32) List!32999) Bool)

(assert (=> b!1408280 (= res!945998 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32996))))

(declare-fun b!1408281 () Bool)

(declare-fun res!946005 () Bool)

(assert (=> b!1408281 (=> res!946005 e!797018)))

(declare-fun lt!620251 () (_ BitVec 32))

(assert (=> b!1408281 (= res!946005 (or (bvslt (x!127144 lt!620255) #b00000000000000000000000000000000) (bvsgt (x!127144 lt!620255) #b01111111111111111111111111111110) (bvslt lt!620251 #b00000000000000000000000000000000) (bvsge lt!620251 (size!47030 a!2901)) (bvslt (index!45543 lt!620255) #b00000000000000000000000000000000) (bvsge (index!45543 lt!620255) (size!47030 a!2901)) (not (= lt!620255 (Intermediate!10791 false (index!45543 lt!620255) (x!127144 lt!620255))))))))

(declare-fun b!1408282 () Bool)

(declare-fun res!946004 () Bool)

(assert (=> b!1408282 (=> (not res!946004) (not e!797020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96274 (_ BitVec 32)) Bool)

(assert (=> b!1408282 (= res!946004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408278 () Bool)

(declare-fun res!945999 () Bool)

(assert (=> b!1408278 (=> (not res!945999) (not e!797020))))

(assert (=> b!1408278 (= res!945999 (validKeyInArray!0 (select (arr!46480 a!2901) j!112)))))

(declare-fun res!946006 () Bool)

(assert (=> start!121120 (=> (not res!946006) (not e!797020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121120 (= res!946006 (validMask!0 mask!2840))))

(assert (=> start!121120 e!797020))

(assert (=> start!121120 true))

(declare-fun array_inv!35508 (array!96274) Bool)

(assert (=> start!121120 (array_inv!35508 a!2901)))

(declare-fun b!1408283 () Bool)

(assert (=> b!1408283 (= e!797020 (not e!797021))))

(declare-fun res!946002 () Bool)

(assert (=> b!1408283 (=> res!946002 e!797021)))

(assert (=> b!1408283 (= res!946002 (or (not (is-Intermediate!10791 lt!620255)) (undefined!11603 lt!620255)))))

(declare-fun lt!620250 () SeekEntryResult!10791)

(assert (=> b!1408283 (= lt!620250 (Found!10791 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96274 (_ BitVec 32)) SeekEntryResult!10791)

(assert (=> b!1408283 (= lt!620250 (seekEntryOrOpen!0 (select (arr!46480 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408283 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47556 0))(
  ( (Unit!47557) )
))
(declare-fun lt!620254 () Unit!47556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47556)

(assert (=> b!1408283 (= lt!620254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408283 (= lt!620255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620251 (select (arr!46480 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408283 (= lt!620251 (toIndex!0 (select (arr!46480 a!2901) j!112) mask!2840))))

(declare-fun b!1408284 () Bool)

(assert (=> b!1408284 (= e!797018 true)))

(assert (=> b!1408284 (= lt!620250 (seekEntryOrOpen!0 lt!620252 lt!620256 mask!2840))))

(declare-fun lt!620253 () Unit!47556)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47556)

(assert (=> b!1408284 (= lt!620253 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620251 (x!127144 lt!620255) (index!45543 lt!620255) mask!2840))))

(assert (= (and start!121120 res!946006) b!1408279))

(assert (= (and b!1408279 res!946001) b!1408277))

(assert (= (and b!1408277 res!946000) b!1408278))

(assert (= (and b!1408278 res!945999) b!1408282))

(assert (= (and b!1408282 res!946004) b!1408280))

(assert (= (and b!1408280 res!945998) b!1408283))

(assert (= (and b!1408283 (not res!946002)) b!1408276))

(assert (= (and b!1408276 (not res!946003)) b!1408281))

(assert (= (and b!1408281 (not res!946005)) b!1408284))

(declare-fun m!1297507 () Bool)

(assert (=> b!1408284 m!1297507))

(declare-fun m!1297509 () Bool)

(assert (=> b!1408284 m!1297509))

(declare-fun m!1297511 () Bool)

(assert (=> b!1408280 m!1297511))

(declare-fun m!1297513 () Bool)

(assert (=> b!1408278 m!1297513))

(assert (=> b!1408278 m!1297513))

(declare-fun m!1297515 () Bool)

(assert (=> b!1408278 m!1297515))

(declare-fun m!1297517 () Bool)

(assert (=> start!121120 m!1297517))

(declare-fun m!1297519 () Bool)

(assert (=> start!121120 m!1297519))

(assert (=> b!1408283 m!1297513))

(declare-fun m!1297521 () Bool)

(assert (=> b!1408283 m!1297521))

(assert (=> b!1408283 m!1297513))

(assert (=> b!1408283 m!1297513))

(declare-fun m!1297523 () Bool)

(assert (=> b!1408283 m!1297523))

(declare-fun m!1297525 () Bool)

(assert (=> b!1408283 m!1297525))

(assert (=> b!1408283 m!1297513))

(declare-fun m!1297527 () Bool)

(assert (=> b!1408283 m!1297527))

(declare-fun m!1297529 () Bool)

(assert (=> b!1408283 m!1297529))

(declare-fun m!1297531 () Bool)

(assert (=> b!1408282 m!1297531))

(declare-fun m!1297533 () Bool)

(assert (=> b!1408276 m!1297533))

(assert (=> b!1408276 m!1297533))

(declare-fun m!1297535 () Bool)

(assert (=> b!1408276 m!1297535))

(declare-fun m!1297537 () Bool)

(assert (=> b!1408276 m!1297537))

(declare-fun m!1297539 () Bool)

(assert (=> b!1408276 m!1297539))

(declare-fun m!1297541 () Bool)

(assert (=> b!1408277 m!1297541))

(assert (=> b!1408277 m!1297541))

(declare-fun m!1297543 () Bool)

(assert (=> b!1408277 m!1297543))

(push 1)

