; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121224 () Bool)

(assert start!121224)

(declare-fun res!947256 () Bool)

(declare-fun e!797642 () Bool)

(assert (=> start!121224 (=> (not res!947256) (not e!797642))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121224 (= res!947256 (validMask!0 mask!2840))))

(assert (=> start!121224 e!797642))

(assert (=> start!121224 true))

(declare-datatypes ((array!96378 0))(
  ( (array!96379 (arr!46532 (Array (_ BitVec 32) (_ BitVec 64))) (size!47082 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96378)

(declare-fun array_inv!35560 (array!96378) Bool)

(assert (=> start!121224 (array_inv!35560 a!2901)))

(declare-fun b!1409534 () Bool)

(declare-fun res!947260 () Bool)

(assert (=> b!1409534 (=> (not res!947260) (not e!797642))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409534 (= res!947260 (and (= (size!47082 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47082 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47082 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409535 () Bool)

(declare-fun res!947257 () Bool)

(assert (=> b!1409535 (=> (not res!947257) (not e!797642))))

(declare-datatypes ((List!33051 0))(
  ( (Nil!33048) (Cons!33047 (h!34310 (_ BitVec 64)) (t!47745 List!33051)) )
))
(declare-fun arrayNoDuplicates!0 (array!96378 (_ BitVec 32) List!33051) Bool)

(assert (=> b!1409535 (= res!947257 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33048))))

(declare-fun b!1409536 () Bool)

(declare-fun e!797645 () Bool)

(assert (=> b!1409536 (= e!797645 true)))

(declare-datatypes ((SeekEntryResult!10843 0))(
  ( (MissingZero!10843 (index!45749 (_ BitVec 32))) (Found!10843 (index!45750 (_ BitVec 32))) (Intermediate!10843 (undefined!11655 Bool) (index!45751 (_ BitVec 32)) (x!127340 (_ BitVec 32))) (Undefined!10843) (MissingVacant!10843 (index!45752 (_ BitVec 32))) )
))
(declare-fun lt!620758 () SeekEntryResult!10843)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96378 (_ BitVec 32)) SeekEntryResult!10843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409536 (= lt!620758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46532 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46532 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96379 (store (arr!46532 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47082 a!2901)) mask!2840))))

(declare-fun b!1409537 () Bool)

(declare-fun res!947258 () Bool)

(assert (=> b!1409537 (=> (not res!947258) (not e!797642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96378 (_ BitVec 32)) Bool)

(assert (=> b!1409537 (= res!947258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409538 () Bool)

(declare-fun e!797643 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96378 (_ BitVec 32)) SeekEntryResult!10843)

(assert (=> b!1409538 (= e!797643 (= (seekEntryOrOpen!0 (select (arr!46532 a!2901) j!112) a!2901 mask!2840) (Found!10843 j!112)))))

(declare-fun b!1409539 () Bool)

(declare-fun res!947262 () Bool)

(assert (=> b!1409539 (=> (not res!947262) (not e!797642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409539 (= res!947262 (validKeyInArray!0 (select (arr!46532 a!2901) i!1037)))))

(declare-fun b!1409540 () Bool)

(declare-fun res!947263 () Bool)

(assert (=> b!1409540 (=> (not res!947263) (not e!797642))))

(assert (=> b!1409540 (= res!947263 (validKeyInArray!0 (select (arr!46532 a!2901) j!112)))))

(declare-fun b!1409541 () Bool)

(assert (=> b!1409541 (= e!797642 (not e!797645))))

(declare-fun res!947261 () Bool)

(assert (=> b!1409541 (=> res!947261 e!797645)))

(declare-fun lt!620760 () SeekEntryResult!10843)

(assert (=> b!1409541 (= res!947261 (or (not (is-Intermediate!10843 lt!620760)) (undefined!11655 lt!620760)))))

(assert (=> b!1409541 e!797643))

(declare-fun res!947259 () Bool)

(assert (=> b!1409541 (=> (not res!947259) (not e!797643))))

(assert (=> b!1409541 (= res!947259 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47660 0))(
  ( (Unit!47661) )
))
(declare-fun lt!620759 () Unit!47660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47660)

(assert (=> b!1409541 (= lt!620759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409541 (= lt!620760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46532 a!2901) j!112) mask!2840) (select (arr!46532 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121224 res!947256) b!1409534))

(assert (= (and b!1409534 res!947260) b!1409539))

(assert (= (and b!1409539 res!947262) b!1409540))

(assert (= (and b!1409540 res!947263) b!1409537))

(assert (= (and b!1409537 res!947258) b!1409535))

(assert (= (and b!1409535 res!947257) b!1409541))

(assert (= (and b!1409541 res!947259) b!1409538))

(assert (= (and b!1409541 (not res!947261)) b!1409536))

(declare-fun m!1299291 () Bool)

(assert (=> b!1409541 m!1299291))

(declare-fun m!1299293 () Bool)

(assert (=> b!1409541 m!1299293))

(assert (=> b!1409541 m!1299291))

(declare-fun m!1299295 () Bool)

(assert (=> b!1409541 m!1299295))

(assert (=> b!1409541 m!1299293))

(assert (=> b!1409541 m!1299291))

(declare-fun m!1299297 () Bool)

(assert (=> b!1409541 m!1299297))

(declare-fun m!1299299 () Bool)

(assert (=> b!1409541 m!1299299))

(declare-fun m!1299301 () Bool)

(assert (=> b!1409537 m!1299301))

(declare-fun m!1299303 () Bool)

(assert (=> b!1409535 m!1299303))

(assert (=> b!1409538 m!1299291))

(assert (=> b!1409538 m!1299291))

(declare-fun m!1299305 () Bool)

(assert (=> b!1409538 m!1299305))

(declare-fun m!1299307 () Bool)

(assert (=> b!1409536 m!1299307))

(declare-fun m!1299309 () Bool)

(assert (=> b!1409536 m!1299309))

(assert (=> b!1409536 m!1299309))

(declare-fun m!1299311 () Bool)

(assert (=> b!1409536 m!1299311))

(assert (=> b!1409536 m!1299311))

(assert (=> b!1409536 m!1299309))

(declare-fun m!1299313 () Bool)

(assert (=> b!1409536 m!1299313))

(declare-fun m!1299315 () Bool)

(assert (=> b!1409539 m!1299315))

(assert (=> b!1409539 m!1299315))

(declare-fun m!1299317 () Bool)

(assert (=> b!1409539 m!1299317))

(declare-fun m!1299319 () Bool)

(assert (=> start!121224 m!1299319))

(declare-fun m!1299321 () Bool)

(assert (=> start!121224 m!1299321))

(assert (=> b!1409540 m!1299291))

(assert (=> b!1409540 m!1299291))

(declare-fun m!1299323 () Bool)

(assert (=> b!1409540 m!1299323))

(push 1)

(assert (not b!1409536))

(assert (not start!121224))

(assert (not b!1409538))

(assert (not b!1409541))

(assert (not b!1409535))

(assert (not b!1409537))

(assert (not b!1409540))

(assert (not b!1409539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

