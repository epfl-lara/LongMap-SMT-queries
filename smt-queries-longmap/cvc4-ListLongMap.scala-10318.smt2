; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121234 () Bool)

(assert start!121234)

(declare-fun b!1409654 () Bool)

(declare-fun res!947378 () Bool)

(declare-fun e!797704 () Bool)

(assert (=> b!1409654 (=> (not res!947378) (not e!797704))))

(declare-datatypes ((array!96388 0))(
  ( (array!96389 (arr!46537 (Array (_ BitVec 32) (_ BitVec 64))) (size!47087 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96388)

(declare-datatypes ((List!33056 0))(
  ( (Nil!33053) (Cons!33052 (h!34315 (_ BitVec 64)) (t!47750 List!33056)) )
))
(declare-fun arrayNoDuplicates!0 (array!96388 (_ BitVec 32) List!33056) Bool)

(assert (=> b!1409654 (= res!947378 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33053))))

(declare-fun b!1409655 () Bool)

(declare-fun res!947379 () Bool)

(assert (=> b!1409655 (=> (not res!947379) (not e!797704))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96388 (_ BitVec 32)) Bool)

(assert (=> b!1409655 (= res!947379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947380 () Bool)

(assert (=> start!121234 (=> (not res!947380) (not e!797704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121234 (= res!947380 (validMask!0 mask!2840))))

(assert (=> start!121234 e!797704))

(assert (=> start!121234 true))

(declare-fun array_inv!35565 (array!96388) Bool)

(assert (=> start!121234 (array_inv!35565 a!2901)))

(declare-fun b!1409656 () Bool)

(declare-fun e!797702 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10848 0))(
  ( (MissingZero!10848 (index!45769 (_ BitVec 32))) (Found!10848 (index!45770 (_ BitVec 32))) (Intermediate!10848 (undefined!11660 Bool) (index!45771 (_ BitVec 32)) (x!127353 (_ BitVec 32))) (Undefined!10848) (MissingVacant!10848 (index!45772 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96388 (_ BitVec 32)) SeekEntryResult!10848)

(assert (=> b!1409656 (= e!797702 (= (seekEntryOrOpen!0 (select (arr!46537 a!2901) j!112) a!2901 mask!2840) (Found!10848 j!112)))))

(declare-fun b!1409657 () Bool)

(declare-fun e!797705 () Bool)

(assert (=> b!1409657 (= e!797705 true)))

(declare-fun lt!620805 () SeekEntryResult!10848)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96388 (_ BitVec 32)) SeekEntryResult!10848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409657 (= lt!620805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96389 (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47087 a!2901)) mask!2840))))

(declare-fun b!1409658 () Bool)

(declare-fun res!947382 () Bool)

(assert (=> b!1409658 (=> (not res!947382) (not e!797704))))

(assert (=> b!1409658 (= res!947382 (and (= (size!47087 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47087 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47087 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409659 () Bool)

(declare-fun res!947377 () Bool)

(assert (=> b!1409659 (=> (not res!947377) (not e!797704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409659 (= res!947377 (validKeyInArray!0 (select (arr!46537 a!2901) i!1037)))))

(declare-fun b!1409660 () Bool)

(assert (=> b!1409660 (= e!797704 (not e!797705))))

(declare-fun res!947376 () Bool)

(assert (=> b!1409660 (=> res!947376 e!797705)))

(declare-fun lt!620804 () SeekEntryResult!10848)

(assert (=> b!1409660 (= res!947376 (or (not (is-Intermediate!10848 lt!620804)) (undefined!11660 lt!620804)))))

(assert (=> b!1409660 e!797702))

(declare-fun res!947381 () Bool)

(assert (=> b!1409660 (=> (not res!947381) (not e!797702))))

(assert (=> b!1409660 (= res!947381 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47670 0))(
  ( (Unit!47671) )
))
(declare-fun lt!620803 () Unit!47670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47670)

(assert (=> b!1409660 (= lt!620803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409660 (= lt!620804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46537 a!2901) j!112) mask!2840) (select (arr!46537 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409661 () Bool)

(declare-fun res!947383 () Bool)

(assert (=> b!1409661 (=> (not res!947383) (not e!797704))))

(assert (=> b!1409661 (= res!947383 (validKeyInArray!0 (select (arr!46537 a!2901) j!112)))))

(assert (= (and start!121234 res!947380) b!1409658))

(assert (= (and b!1409658 res!947382) b!1409659))

(assert (= (and b!1409659 res!947377) b!1409661))

(assert (= (and b!1409661 res!947383) b!1409655))

(assert (= (and b!1409655 res!947379) b!1409654))

(assert (= (and b!1409654 res!947378) b!1409660))

(assert (= (and b!1409660 res!947381) b!1409656))

(assert (= (and b!1409660 (not res!947376)) b!1409657))

(declare-fun m!1299461 () Bool)

(assert (=> b!1409655 m!1299461))

(declare-fun m!1299463 () Bool)

(assert (=> start!121234 m!1299463))

(declare-fun m!1299465 () Bool)

(assert (=> start!121234 m!1299465))

(declare-fun m!1299467 () Bool)

(assert (=> b!1409659 m!1299467))

(assert (=> b!1409659 m!1299467))

(declare-fun m!1299469 () Bool)

(assert (=> b!1409659 m!1299469))

(declare-fun m!1299471 () Bool)

(assert (=> b!1409660 m!1299471))

(declare-fun m!1299473 () Bool)

(assert (=> b!1409660 m!1299473))

(assert (=> b!1409660 m!1299471))

(declare-fun m!1299475 () Bool)

(assert (=> b!1409660 m!1299475))

(assert (=> b!1409660 m!1299473))

(assert (=> b!1409660 m!1299471))

(declare-fun m!1299477 () Bool)

(assert (=> b!1409660 m!1299477))

(declare-fun m!1299479 () Bool)

(assert (=> b!1409660 m!1299479))

(declare-fun m!1299481 () Bool)

(assert (=> b!1409654 m!1299481))

(declare-fun m!1299483 () Bool)

(assert (=> b!1409657 m!1299483))

(declare-fun m!1299485 () Bool)

(assert (=> b!1409657 m!1299485))

(assert (=> b!1409657 m!1299485))

(declare-fun m!1299487 () Bool)

(assert (=> b!1409657 m!1299487))

(assert (=> b!1409657 m!1299487))

(assert (=> b!1409657 m!1299485))

(declare-fun m!1299489 () Bool)

(assert (=> b!1409657 m!1299489))

(assert (=> b!1409656 m!1299471))

(assert (=> b!1409656 m!1299471))

(declare-fun m!1299491 () Bool)

(assert (=> b!1409656 m!1299491))

(assert (=> b!1409661 m!1299471))

(assert (=> b!1409661 m!1299471))

(declare-fun m!1299493 () Bool)

(assert (=> b!1409661 m!1299493))

(push 1)

(assert (not start!121234))

(assert (not b!1409657))

(assert (not b!1409659))

(assert (not b!1409655))

(assert (not b!1409660))

(assert (not b!1409654))

(assert (not b!1409656))

(assert (not b!1409661))

(check-sat)

(pop 1)

