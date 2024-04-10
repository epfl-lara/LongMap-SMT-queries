; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121222 () Bool)

(assert start!121222)

(declare-fun b!1409510 () Bool)

(declare-fun res!947234 () Bool)

(declare-fun e!797633 () Bool)

(assert (=> b!1409510 (=> (not res!947234) (not e!797633))))

(declare-datatypes ((array!96376 0))(
  ( (array!96377 (arr!46531 (Array (_ BitVec 32) (_ BitVec 64))) (size!47081 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96376)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409510 (= res!947234 (validKeyInArray!0 (select (arr!46531 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1409511 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!797632 () Bool)

(declare-datatypes ((SeekEntryResult!10842 0))(
  ( (MissingZero!10842 (index!45745 (_ BitVec 32))) (Found!10842 (index!45746 (_ BitVec 32))) (Intermediate!10842 (undefined!11654 Bool) (index!45747 (_ BitVec 32)) (x!127331 (_ BitVec 32))) (Undefined!10842) (MissingVacant!10842 (index!45748 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96376 (_ BitVec 32)) SeekEntryResult!10842)

(assert (=> b!1409511 (= e!797632 (= (seekEntryOrOpen!0 (select (arr!46531 a!2901) j!112) a!2901 mask!2840) (Found!10842 j!112)))))

(declare-fun b!1409512 () Bool)

(declare-fun e!797630 () Bool)

(assert (=> b!1409512 (= e!797630 true)))

(declare-fun lt!620749 () SeekEntryResult!10842)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96376 (_ BitVec 32)) SeekEntryResult!10842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409512 (= lt!620749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96377 (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47081 a!2901)) mask!2840))))

(declare-fun res!947238 () Bool)

(assert (=> start!121222 (=> (not res!947238) (not e!797633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121222 (= res!947238 (validMask!0 mask!2840))))

(assert (=> start!121222 e!797633))

(assert (=> start!121222 true))

(declare-fun array_inv!35559 (array!96376) Bool)

(assert (=> start!121222 (array_inv!35559 a!2901)))

(declare-fun b!1409513 () Bool)

(declare-fun res!947235 () Bool)

(assert (=> b!1409513 (=> (not res!947235) (not e!797633))))

(assert (=> b!1409513 (= res!947235 (validKeyInArray!0 (select (arr!46531 a!2901) j!112)))))

(declare-fun b!1409514 () Bool)

(assert (=> b!1409514 (= e!797633 (not e!797630))))

(declare-fun res!947233 () Bool)

(assert (=> b!1409514 (=> res!947233 e!797630)))

(declare-fun lt!620751 () SeekEntryResult!10842)

(assert (=> b!1409514 (= res!947233 (or (not (is-Intermediate!10842 lt!620751)) (undefined!11654 lt!620751)))))

(assert (=> b!1409514 e!797632))

(declare-fun res!947237 () Bool)

(assert (=> b!1409514 (=> (not res!947237) (not e!797632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96376 (_ BitVec 32)) Bool)

(assert (=> b!1409514 (= res!947237 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47658 0))(
  ( (Unit!47659) )
))
(declare-fun lt!620750 () Unit!47658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47658)

(assert (=> b!1409514 (= lt!620750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409514 (= lt!620751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46531 a!2901) j!112) mask!2840) (select (arr!46531 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409515 () Bool)

(declare-fun res!947232 () Bool)

(assert (=> b!1409515 (=> (not res!947232) (not e!797633))))

(assert (=> b!1409515 (= res!947232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409516 () Bool)

(declare-fun res!947239 () Bool)

(assert (=> b!1409516 (=> (not res!947239) (not e!797633))))

(assert (=> b!1409516 (= res!947239 (and (= (size!47081 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47081 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47081 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409517 () Bool)

(declare-fun res!947236 () Bool)

(assert (=> b!1409517 (=> (not res!947236) (not e!797633))))

(declare-datatypes ((List!33050 0))(
  ( (Nil!33047) (Cons!33046 (h!34309 (_ BitVec 64)) (t!47744 List!33050)) )
))
(declare-fun arrayNoDuplicates!0 (array!96376 (_ BitVec 32) List!33050) Bool)

(assert (=> b!1409517 (= res!947236 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33047))))

(assert (= (and start!121222 res!947238) b!1409516))

(assert (= (and b!1409516 res!947239) b!1409510))

(assert (= (and b!1409510 res!947234) b!1409513))

(assert (= (and b!1409513 res!947235) b!1409515))

(assert (= (and b!1409515 res!947232) b!1409517))

(assert (= (and b!1409517 res!947236) b!1409514))

(assert (= (and b!1409514 res!947237) b!1409511))

(assert (= (and b!1409514 (not res!947233)) b!1409512))

(declare-fun m!1299257 () Bool)

(assert (=> b!1409513 m!1299257))

(assert (=> b!1409513 m!1299257))

(declare-fun m!1299259 () Bool)

(assert (=> b!1409513 m!1299259))

(declare-fun m!1299261 () Bool)

(assert (=> b!1409510 m!1299261))

(assert (=> b!1409510 m!1299261))

(declare-fun m!1299263 () Bool)

(assert (=> b!1409510 m!1299263))

(declare-fun m!1299265 () Bool)

(assert (=> start!121222 m!1299265))

(declare-fun m!1299267 () Bool)

(assert (=> start!121222 m!1299267))

(declare-fun m!1299269 () Bool)

(assert (=> b!1409515 m!1299269))

(declare-fun m!1299271 () Bool)

(assert (=> b!1409517 m!1299271))

(assert (=> b!1409514 m!1299257))

(declare-fun m!1299273 () Bool)

(assert (=> b!1409514 m!1299273))

(assert (=> b!1409514 m!1299257))

(declare-fun m!1299275 () Bool)

(assert (=> b!1409514 m!1299275))

(assert (=> b!1409514 m!1299273))

(assert (=> b!1409514 m!1299257))

(declare-fun m!1299277 () Bool)

(assert (=> b!1409514 m!1299277))

(declare-fun m!1299279 () Bool)

(assert (=> b!1409514 m!1299279))

(declare-fun m!1299281 () Bool)

(assert (=> b!1409512 m!1299281))

(declare-fun m!1299283 () Bool)

(assert (=> b!1409512 m!1299283))

(assert (=> b!1409512 m!1299283))

(declare-fun m!1299285 () Bool)

(assert (=> b!1409512 m!1299285))

(assert (=> b!1409512 m!1299285))

(assert (=> b!1409512 m!1299283))

(declare-fun m!1299287 () Bool)

(assert (=> b!1409512 m!1299287))

(assert (=> b!1409511 m!1299257))

(assert (=> b!1409511 m!1299257))

(declare-fun m!1299289 () Bool)

(assert (=> b!1409511 m!1299289))

(push 1)

(assert (not b!1409511))

(assert (not b!1409517))

(assert (not b!1409515))

(assert (not b!1409512))

(assert (not b!1409514))

(assert (not b!1409513))

(assert (not start!121222))

(assert (not b!1409510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

