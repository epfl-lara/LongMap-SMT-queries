; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120872 () Bool)

(assert start!120872)

(declare-fun b!1406408 () Bool)

(declare-fun res!944627 () Bool)

(declare-fun e!796026 () Bool)

(assert (=> b!1406408 (=> (not res!944627) (not e!796026))))

(declare-datatypes ((array!96179 0))(
  ( (array!96180 (arr!46437 (Array (_ BitVec 32) (_ BitVec 64))) (size!46987 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96179)

(declare-datatypes ((List!32956 0))(
  ( (Nil!32953) (Cons!32952 (h!34206 (_ BitVec 64)) (t!47650 List!32956)) )
))
(declare-fun arrayNoDuplicates!0 (array!96179 (_ BitVec 32) List!32956) Bool)

(assert (=> b!1406408 (= res!944627 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32953))))

(declare-fun res!944625 () Bool)

(assert (=> start!120872 (=> (not res!944625) (not e!796026))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120872 (= res!944625 (validMask!0 mask!2840))))

(assert (=> start!120872 e!796026))

(assert (=> start!120872 true))

(declare-fun array_inv!35465 (array!96179) Bool)

(assert (=> start!120872 (array_inv!35465 a!2901)))

(declare-fun b!1406409 () Bool)

(declare-fun e!796027 () Bool)

(assert (=> b!1406409 (= e!796026 (not e!796027))))

(declare-fun res!944626 () Bool)

(assert (=> b!1406409 (=> res!944626 e!796027)))

(declare-datatypes ((SeekEntryResult!10748 0))(
  ( (MissingZero!10748 (index!45369 (_ BitVec 32))) (Found!10748 (index!45370 (_ BitVec 32))) (Intermediate!10748 (undefined!11560 Bool) (index!45371 (_ BitVec 32)) (x!126971 (_ BitVec 32))) (Undefined!10748) (MissingVacant!10748 (index!45372 (_ BitVec 32))) )
))
(declare-fun lt!619372 () SeekEntryResult!10748)

(get-info :version)

(assert (=> b!1406409 (= res!944626 (or (not ((_ is Intermediate!10748) lt!619372)) (undefined!11560 lt!619372)))))

(declare-fun e!796025 () Bool)

(assert (=> b!1406409 e!796025))

(declare-fun res!944631 () Bool)

(assert (=> b!1406409 (=> (not res!944631) (not e!796025))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96179 (_ BitVec 32)) Bool)

(assert (=> b!1406409 (= res!944631 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47470 0))(
  ( (Unit!47471) )
))
(declare-fun lt!619374 () Unit!47470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47470)

(assert (=> b!1406409 (= lt!619374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96179 (_ BitVec 32)) SeekEntryResult!10748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406409 (= lt!619372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46437 a!2901) j!112) mask!2840) (select (arr!46437 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406410 () Bool)

(assert (=> b!1406410 (= e!796027 true)))

(declare-fun lt!619373 () SeekEntryResult!10748)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406410 (= lt!619373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46437 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46437 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96180 (store (arr!46437 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46987 a!2901)) mask!2840))))

(declare-fun b!1406411 () Bool)

(declare-fun res!944630 () Bool)

(assert (=> b!1406411 (=> (not res!944630) (not e!796026))))

(assert (=> b!1406411 (= res!944630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406412 () Bool)

(declare-fun res!944628 () Bool)

(assert (=> b!1406412 (=> (not res!944628) (not e!796026))))

(assert (=> b!1406412 (= res!944628 (and (= (size!46987 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46987 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46987 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406413 () Bool)

(declare-fun res!944629 () Bool)

(assert (=> b!1406413 (=> (not res!944629) (not e!796026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406413 (= res!944629 (validKeyInArray!0 (select (arr!46437 a!2901) j!112)))))

(declare-fun b!1406414 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96179 (_ BitVec 32)) SeekEntryResult!10748)

(assert (=> b!1406414 (= e!796025 (= (seekEntryOrOpen!0 (select (arr!46437 a!2901) j!112) a!2901 mask!2840) (Found!10748 j!112)))))

(declare-fun b!1406415 () Bool)

(declare-fun res!944632 () Bool)

(assert (=> b!1406415 (=> (not res!944632) (not e!796026))))

(assert (=> b!1406415 (= res!944632 (validKeyInArray!0 (select (arr!46437 a!2901) i!1037)))))

(assert (= (and start!120872 res!944625) b!1406412))

(assert (= (and b!1406412 res!944628) b!1406415))

(assert (= (and b!1406415 res!944632) b!1406413))

(assert (= (and b!1406413 res!944629) b!1406411))

(assert (= (and b!1406411 res!944630) b!1406408))

(assert (= (and b!1406408 res!944627) b!1406409))

(assert (= (and b!1406409 res!944631) b!1406414))

(assert (= (and b!1406409 (not res!944626)) b!1406410))

(declare-fun m!1295539 () Bool)

(assert (=> b!1406411 m!1295539))

(declare-fun m!1295541 () Bool)

(assert (=> b!1406409 m!1295541))

(declare-fun m!1295543 () Bool)

(assert (=> b!1406409 m!1295543))

(assert (=> b!1406409 m!1295541))

(declare-fun m!1295545 () Bool)

(assert (=> b!1406409 m!1295545))

(assert (=> b!1406409 m!1295543))

(assert (=> b!1406409 m!1295541))

(declare-fun m!1295547 () Bool)

(assert (=> b!1406409 m!1295547))

(declare-fun m!1295549 () Bool)

(assert (=> b!1406409 m!1295549))

(declare-fun m!1295551 () Bool)

(assert (=> start!120872 m!1295551))

(declare-fun m!1295553 () Bool)

(assert (=> start!120872 m!1295553))

(assert (=> b!1406414 m!1295541))

(assert (=> b!1406414 m!1295541))

(declare-fun m!1295555 () Bool)

(assert (=> b!1406414 m!1295555))

(declare-fun m!1295557 () Bool)

(assert (=> b!1406408 m!1295557))

(declare-fun m!1295559 () Bool)

(assert (=> b!1406415 m!1295559))

(assert (=> b!1406415 m!1295559))

(declare-fun m!1295561 () Bool)

(assert (=> b!1406415 m!1295561))

(declare-fun m!1295563 () Bool)

(assert (=> b!1406410 m!1295563))

(declare-fun m!1295565 () Bool)

(assert (=> b!1406410 m!1295565))

(assert (=> b!1406410 m!1295565))

(declare-fun m!1295567 () Bool)

(assert (=> b!1406410 m!1295567))

(assert (=> b!1406410 m!1295567))

(assert (=> b!1406410 m!1295565))

(declare-fun m!1295569 () Bool)

(assert (=> b!1406410 m!1295569))

(assert (=> b!1406413 m!1295541))

(assert (=> b!1406413 m!1295541))

(declare-fun m!1295571 () Bool)

(assert (=> b!1406413 m!1295571))

(check-sat (not b!1406415) (not start!120872) (not b!1406409) (not b!1406408) (not b!1406411) (not b!1406414) (not b!1406413) (not b!1406410))
