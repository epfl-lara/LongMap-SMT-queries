; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121586 () Bool)

(assert start!121586)

(declare-fun b!1412406 () Bool)

(declare-fun res!949396 () Bool)

(declare-fun e!799285 () Bool)

(assert (=> b!1412406 (=> (not res!949396) (not e!799285))))

(declare-datatypes ((array!96524 0))(
  ( (array!96525 (arr!46599 (Array (_ BitVec 32) (_ BitVec 64))) (size!47149 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96524)

(declare-datatypes ((List!33118 0))(
  ( (Nil!33115) (Cons!33114 (h!34389 (_ BitVec 64)) (t!47812 List!33118)) )
))
(declare-fun arrayNoDuplicates!0 (array!96524 (_ BitVec 32) List!33118) Bool)

(assert (=> b!1412406 (= res!949396 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33115))))

(declare-fun b!1412407 () Bool)

(declare-fun e!799281 () Bool)

(assert (=> b!1412407 (= e!799285 (not e!799281))))

(declare-fun res!949401 () Bool)

(assert (=> b!1412407 (=> res!949401 e!799281)))

(declare-datatypes ((SeekEntryResult!10910 0))(
  ( (MissingZero!10910 (index!46020 (_ BitVec 32))) (Found!10910 (index!46021 (_ BitVec 32))) (Intermediate!10910 (undefined!11722 Bool) (index!46022 (_ BitVec 32)) (x!127613 (_ BitVec 32))) (Undefined!10910) (MissingVacant!10910 (index!46023 (_ BitVec 32))) )
))
(declare-fun lt!622315 () SeekEntryResult!10910)

(get-info :version)

(assert (=> b!1412407 (= res!949401 (or (not ((_ is Intermediate!10910) lt!622315)) (undefined!11722 lt!622315)))))

(declare-fun e!799283 () Bool)

(assert (=> b!1412407 e!799283))

(declare-fun res!949398 () Bool)

(assert (=> b!1412407 (=> (not res!949398) (not e!799283))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96524 (_ BitVec 32)) Bool)

(assert (=> b!1412407 (= res!949398 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47794 0))(
  ( (Unit!47795) )
))
(declare-fun lt!622311 () Unit!47794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47794)

(assert (=> b!1412407 (= lt!622311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622317 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96524 (_ BitVec 32)) SeekEntryResult!10910)

(assert (=> b!1412407 (= lt!622315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622317 (select (arr!46599 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412407 (= lt!622317 (toIndex!0 (select (arr!46599 a!2901) j!112) mask!2840))))

(declare-fun res!949405 () Bool)

(assert (=> start!121586 (=> (not res!949405) (not e!799285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121586 (= res!949405 (validMask!0 mask!2840))))

(assert (=> start!121586 e!799285))

(assert (=> start!121586 true))

(declare-fun array_inv!35627 (array!96524) Bool)

(assert (=> start!121586 (array_inv!35627 a!2901)))

(declare-fun b!1412408 () Bool)

(declare-fun res!949403 () Bool)

(assert (=> b!1412408 (=> (not res!949403) (not e!799285))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412408 (= res!949403 (validKeyInArray!0 (select (arr!46599 a!2901) i!1037)))))

(declare-fun b!1412409 () Bool)

(declare-fun e!799286 () Bool)

(assert (=> b!1412409 (= e!799281 e!799286)))

(declare-fun res!949397 () Bool)

(assert (=> b!1412409 (=> res!949397 e!799286)))

(declare-fun lt!622312 () SeekEntryResult!10910)

(assert (=> b!1412409 (= res!949397 (or (= lt!622315 lt!622312) (not ((_ is Intermediate!10910) lt!622312))))))

(declare-fun lt!622316 () array!96524)

(declare-fun lt!622313 () (_ BitVec 64))

(assert (=> b!1412409 (= lt!622312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622313 mask!2840) lt!622313 lt!622316 mask!2840))))

(assert (=> b!1412409 (= lt!622313 (select (store (arr!46599 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412409 (= lt!622316 (array!96525 (store (arr!46599 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47149 a!2901)))))

(declare-fun e!799282 () Bool)

(declare-fun b!1412410 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96524 (_ BitVec 32)) SeekEntryResult!10910)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96524 (_ BitVec 32)) SeekEntryResult!10910)

(assert (=> b!1412410 (= e!799282 (= (seekEntryOrOpen!0 lt!622313 lt!622316 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127613 lt!622312) (index!46022 lt!622312) (index!46022 lt!622312) (select (arr!46599 a!2901) j!112) lt!622316 mask!2840)))))

(declare-fun b!1412411 () Bool)

(assert (=> b!1412411 (= e!799286 true)))

(assert (=> b!1412411 e!799282))

(declare-fun res!949399 () Bool)

(assert (=> b!1412411 (=> (not res!949399) (not e!799282))))

(assert (=> b!1412411 (= res!949399 (and (not (undefined!11722 lt!622312)) (= (index!46022 lt!622312) i!1037) (bvslt (x!127613 lt!622312) (x!127613 lt!622315)) (= (select (store (arr!46599 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46022 lt!622312)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622314 () Unit!47794)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47794)

(assert (=> b!1412411 (= lt!622314 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622317 (x!127613 lt!622315) (index!46022 lt!622315) (x!127613 lt!622312) (index!46022 lt!622312) (undefined!11722 lt!622312) mask!2840))))

(declare-fun b!1412412 () Bool)

(assert (=> b!1412412 (= e!799283 (= (seekEntryOrOpen!0 (select (arr!46599 a!2901) j!112) a!2901 mask!2840) (Found!10910 j!112)))))

(declare-fun b!1412413 () Bool)

(declare-fun res!949402 () Bool)

(assert (=> b!1412413 (=> (not res!949402) (not e!799285))))

(assert (=> b!1412413 (= res!949402 (and (= (size!47149 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47149 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47149 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412414 () Bool)

(declare-fun res!949400 () Bool)

(assert (=> b!1412414 (=> (not res!949400) (not e!799285))))

(assert (=> b!1412414 (= res!949400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412415 () Bool)

(declare-fun res!949404 () Bool)

(assert (=> b!1412415 (=> (not res!949404) (not e!799285))))

(assert (=> b!1412415 (= res!949404 (validKeyInArray!0 (select (arr!46599 a!2901) j!112)))))

(assert (= (and start!121586 res!949405) b!1412413))

(assert (= (and b!1412413 res!949402) b!1412408))

(assert (= (and b!1412408 res!949403) b!1412415))

(assert (= (and b!1412415 res!949404) b!1412414))

(assert (= (and b!1412414 res!949400) b!1412406))

(assert (= (and b!1412406 res!949396) b!1412407))

(assert (= (and b!1412407 res!949398) b!1412412))

(assert (= (and b!1412407 (not res!949401)) b!1412409))

(assert (= (and b!1412409 (not res!949397)) b!1412411))

(assert (= (and b!1412411 res!949399) b!1412410))

(declare-fun m!1302417 () Bool)

(assert (=> b!1412415 m!1302417))

(assert (=> b!1412415 m!1302417))

(declare-fun m!1302419 () Bool)

(assert (=> b!1412415 m!1302419))

(assert (=> b!1412407 m!1302417))

(declare-fun m!1302421 () Bool)

(assert (=> b!1412407 m!1302421))

(assert (=> b!1412407 m!1302417))

(declare-fun m!1302423 () Bool)

(assert (=> b!1412407 m!1302423))

(assert (=> b!1412407 m!1302417))

(declare-fun m!1302425 () Bool)

(assert (=> b!1412407 m!1302425))

(declare-fun m!1302427 () Bool)

(assert (=> b!1412407 m!1302427))

(declare-fun m!1302429 () Bool)

(assert (=> b!1412410 m!1302429))

(assert (=> b!1412410 m!1302417))

(assert (=> b!1412410 m!1302417))

(declare-fun m!1302431 () Bool)

(assert (=> b!1412410 m!1302431))

(declare-fun m!1302433 () Bool)

(assert (=> b!1412406 m!1302433))

(declare-fun m!1302435 () Bool)

(assert (=> b!1412409 m!1302435))

(assert (=> b!1412409 m!1302435))

(declare-fun m!1302437 () Bool)

(assert (=> b!1412409 m!1302437))

(declare-fun m!1302439 () Bool)

(assert (=> b!1412409 m!1302439))

(declare-fun m!1302441 () Bool)

(assert (=> b!1412409 m!1302441))

(declare-fun m!1302443 () Bool)

(assert (=> start!121586 m!1302443))

(declare-fun m!1302445 () Bool)

(assert (=> start!121586 m!1302445))

(declare-fun m!1302447 () Bool)

(assert (=> b!1412408 m!1302447))

(assert (=> b!1412408 m!1302447))

(declare-fun m!1302449 () Bool)

(assert (=> b!1412408 m!1302449))

(declare-fun m!1302451 () Bool)

(assert (=> b!1412414 m!1302451))

(assert (=> b!1412412 m!1302417))

(assert (=> b!1412412 m!1302417))

(declare-fun m!1302453 () Bool)

(assert (=> b!1412412 m!1302453))

(assert (=> b!1412411 m!1302439))

(declare-fun m!1302455 () Bool)

(assert (=> b!1412411 m!1302455))

(declare-fun m!1302457 () Bool)

(assert (=> b!1412411 m!1302457))

(check-sat (not b!1412408) (not b!1412415) (not b!1412410) (not b!1412409) (not b!1412412) (not b!1412411) (not b!1412414) (not start!121586) (not b!1412406) (not b!1412407))
(check-sat)
