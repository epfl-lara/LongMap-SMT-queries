; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121172 () Bool)

(assert start!121172)

(declare-fun b!1408910 () Bool)

(declare-fun res!946639 () Bool)

(declare-fun e!797330 () Bool)

(assert (=> b!1408910 (=> (not res!946639) (not e!797330))))

(declare-datatypes ((array!96326 0))(
  ( (array!96327 (arr!46506 (Array (_ BitVec 32) (_ BitVec 64))) (size!47056 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96326)

(declare-datatypes ((List!33025 0))(
  ( (Nil!33022) (Cons!33021 (h!34284 (_ BitVec 64)) (t!47719 List!33025)) )
))
(declare-fun arrayNoDuplicates!0 (array!96326 (_ BitVec 32) List!33025) Bool)

(assert (=> b!1408910 (= res!946639 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33022))))

(declare-fun b!1408911 () Bool)

(declare-fun e!797332 () Bool)

(assert (=> b!1408911 (= e!797332 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10817 0))(
  ( (MissingZero!10817 (index!45645 (_ BitVec 32))) (Found!10817 (index!45646 (_ BitVec 32))) (Intermediate!10817 (undefined!11629 Bool) (index!45647 (_ BitVec 32)) (x!127242 (_ BitVec 32))) (Undefined!10817) (MissingVacant!10817 (index!45648 (_ BitVec 32))) )
))
(declare-fun lt!620526 () SeekEntryResult!10817)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96326 (_ BitVec 32)) SeekEntryResult!10817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408911 (= lt!620526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96327 (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47056 a!2901)) mask!2840))))

(declare-fun res!946635 () Bool)

(assert (=> start!121172 (=> (not res!946635) (not e!797330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121172 (= res!946635 (validMask!0 mask!2840))))

(assert (=> start!121172 e!797330))

(assert (=> start!121172 true))

(declare-fun array_inv!35534 (array!96326) Bool)

(assert (=> start!121172 (array_inv!35534 a!2901)))

(declare-fun b!1408912 () Bool)

(declare-fun res!946637 () Bool)

(assert (=> b!1408912 (=> (not res!946637) (not e!797330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408912 (= res!946637 (validKeyInArray!0 (select (arr!46506 a!2901) j!112)))))

(declare-fun e!797333 () Bool)

(declare-fun b!1408913 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96326 (_ BitVec 32)) SeekEntryResult!10817)

(assert (=> b!1408913 (= e!797333 (= (seekEntryOrOpen!0 (select (arr!46506 a!2901) j!112) a!2901 mask!2840) (Found!10817 j!112)))))

(declare-fun b!1408914 () Bool)

(declare-fun res!946632 () Bool)

(assert (=> b!1408914 (=> (not res!946632) (not e!797330))))

(assert (=> b!1408914 (= res!946632 (and (= (size!47056 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47056 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47056 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408915 () Bool)

(declare-fun res!946636 () Bool)

(assert (=> b!1408915 (=> (not res!946636) (not e!797330))))

(assert (=> b!1408915 (= res!946636 (validKeyInArray!0 (select (arr!46506 a!2901) i!1037)))))

(declare-fun b!1408916 () Bool)

(declare-fun res!946638 () Bool)

(assert (=> b!1408916 (=> (not res!946638) (not e!797330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96326 (_ BitVec 32)) Bool)

(assert (=> b!1408916 (= res!946638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408917 () Bool)

(assert (=> b!1408917 (= e!797330 (not e!797332))))

(declare-fun res!946633 () Bool)

(assert (=> b!1408917 (=> res!946633 e!797332)))

(declare-fun lt!620524 () SeekEntryResult!10817)

(get-info :version)

(assert (=> b!1408917 (= res!946633 (or (not ((_ is Intermediate!10817) lt!620524)) (undefined!11629 lt!620524)))))

(assert (=> b!1408917 e!797333))

(declare-fun res!946634 () Bool)

(assert (=> b!1408917 (=> (not res!946634) (not e!797333))))

(assert (=> b!1408917 (= res!946634 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47608 0))(
  ( (Unit!47609) )
))
(declare-fun lt!620525 () Unit!47608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47608)

(assert (=> b!1408917 (= lt!620525 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408917 (= lt!620524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46506 a!2901) j!112) mask!2840) (select (arr!46506 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121172 res!946635) b!1408914))

(assert (= (and b!1408914 res!946632) b!1408915))

(assert (= (and b!1408915 res!946636) b!1408912))

(assert (= (and b!1408912 res!946637) b!1408916))

(assert (= (and b!1408916 res!946638) b!1408910))

(assert (= (and b!1408910 res!946639) b!1408917))

(assert (= (and b!1408917 res!946634) b!1408913))

(assert (= (and b!1408917 (not res!946633)) b!1408911))

(declare-fun m!1298407 () Bool)

(assert (=> b!1408915 m!1298407))

(assert (=> b!1408915 m!1298407))

(declare-fun m!1298409 () Bool)

(assert (=> b!1408915 m!1298409))

(declare-fun m!1298411 () Bool)

(assert (=> b!1408911 m!1298411))

(declare-fun m!1298413 () Bool)

(assert (=> b!1408911 m!1298413))

(assert (=> b!1408911 m!1298413))

(declare-fun m!1298415 () Bool)

(assert (=> b!1408911 m!1298415))

(assert (=> b!1408911 m!1298415))

(assert (=> b!1408911 m!1298413))

(declare-fun m!1298417 () Bool)

(assert (=> b!1408911 m!1298417))

(declare-fun m!1298419 () Bool)

(assert (=> b!1408912 m!1298419))

(assert (=> b!1408912 m!1298419))

(declare-fun m!1298421 () Bool)

(assert (=> b!1408912 m!1298421))

(declare-fun m!1298423 () Bool)

(assert (=> start!121172 m!1298423))

(declare-fun m!1298425 () Bool)

(assert (=> start!121172 m!1298425))

(assert (=> b!1408917 m!1298419))

(declare-fun m!1298427 () Bool)

(assert (=> b!1408917 m!1298427))

(assert (=> b!1408917 m!1298419))

(declare-fun m!1298429 () Bool)

(assert (=> b!1408917 m!1298429))

(assert (=> b!1408917 m!1298427))

(assert (=> b!1408917 m!1298419))

(declare-fun m!1298431 () Bool)

(assert (=> b!1408917 m!1298431))

(declare-fun m!1298433 () Bool)

(assert (=> b!1408917 m!1298433))

(assert (=> b!1408913 m!1298419))

(assert (=> b!1408913 m!1298419))

(declare-fun m!1298435 () Bool)

(assert (=> b!1408913 m!1298435))

(declare-fun m!1298437 () Bool)

(assert (=> b!1408916 m!1298437))

(declare-fun m!1298439 () Bool)

(assert (=> b!1408910 m!1298439))

(check-sat (not b!1408917) (not b!1408913) (not start!121172) (not b!1408910) (not b!1408912) (not b!1408911) (not b!1408916) (not b!1408915))
(check-sat)
