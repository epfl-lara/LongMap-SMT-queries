; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121232 () Bool)

(assert start!121232)

(declare-fun b!1409630 () Bool)

(declare-fun res!947358 () Bool)

(declare-fun e!797691 () Bool)

(assert (=> b!1409630 (=> (not res!947358) (not e!797691))))

(declare-datatypes ((array!96386 0))(
  ( (array!96387 (arr!46536 (Array (_ BitVec 32) (_ BitVec 64))) (size!47086 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96386)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409630 (= res!947358 (validKeyInArray!0 (select (arr!46536 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!797692 () Bool)

(declare-fun b!1409631 () Bool)

(declare-datatypes ((SeekEntryResult!10847 0))(
  ( (MissingZero!10847 (index!45765 (_ BitVec 32))) (Found!10847 (index!45766 (_ BitVec 32))) (Intermediate!10847 (undefined!11659 Bool) (index!45767 (_ BitVec 32)) (x!127352 (_ BitVec 32))) (Undefined!10847) (MissingVacant!10847 (index!45768 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96386 (_ BitVec 32)) SeekEntryResult!10847)

(assert (=> b!1409631 (= e!797692 (= (seekEntryOrOpen!0 (select (arr!46536 a!2901) j!112) a!2901 mask!2840) (Found!10847 j!112)))))

(declare-fun b!1409632 () Bool)

(declare-fun e!797693 () Bool)

(assert (=> b!1409632 (= e!797691 (not e!797693))))

(declare-fun res!947357 () Bool)

(assert (=> b!1409632 (=> res!947357 e!797693)))

(declare-fun lt!620796 () SeekEntryResult!10847)

(get-info :version)

(assert (=> b!1409632 (= res!947357 (or (not ((_ is Intermediate!10847) lt!620796)) (undefined!11659 lt!620796)))))

(assert (=> b!1409632 e!797692))

(declare-fun res!947356 () Bool)

(assert (=> b!1409632 (=> (not res!947356) (not e!797692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96386 (_ BitVec 32)) Bool)

(assert (=> b!1409632 (= res!947356 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47668 0))(
  ( (Unit!47669) )
))
(declare-fun lt!620794 () Unit!47668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47668)

(assert (=> b!1409632 (= lt!620794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96386 (_ BitVec 32)) SeekEntryResult!10847)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409632 (= lt!620796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46536 a!2901) j!112) mask!2840) (select (arr!46536 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!947354 () Bool)

(assert (=> start!121232 (=> (not res!947354) (not e!797691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121232 (= res!947354 (validMask!0 mask!2840))))

(assert (=> start!121232 e!797691))

(assert (=> start!121232 true))

(declare-fun array_inv!35564 (array!96386) Bool)

(assert (=> start!121232 (array_inv!35564 a!2901)))

(declare-fun b!1409633 () Bool)

(declare-fun res!947355 () Bool)

(assert (=> b!1409633 (=> (not res!947355) (not e!797691))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409633 (= res!947355 (and (= (size!47086 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47086 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47086 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409634 () Bool)

(declare-fun res!947352 () Bool)

(assert (=> b!1409634 (=> (not res!947352) (not e!797691))))

(assert (=> b!1409634 (= res!947352 (validKeyInArray!0 (select (arr!46536 a!2901) i!1037)))))

(declare-fun b!1409635 () Bool)

(declare-fun res!947353 () Bool)

(assert (=> b!1409635 (=> (not res!947353) (not e!797691))))

(declare-datatypes ((List!33055 0))(
  ( (Nil!33052) (Cons!33051 (h!34314 (_ BitVec 64)) (t!47749 List!33055)) )
))
(declare-fun arrayNoDuplicates!0 (array!96386 (_ BitVec 32) List!33055) Bool)

(assert (=> b!1409635 (= res!947353 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33052))))

(declare-fun b!1409636 () Bool)

(assert (=> b!1409636 (= e!797693 true)))

(declare-fun lt!620795 () SeekEntryResult!10847)

(assert (=> b!1409636 (= lt!620795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46536 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46536 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96387 (store (arr!46536 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47086 a!2901)) mask!2840))))

(declare-fun b!1409637 () Bool)

(declare-fun res!947359 () Bool)

(assert (=> b!1409637 (=> (not res!947359) (not e!797691))))

(assert (=> b!1409637 (= res!947359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121232 res!947354) b!1409633))

(assert (= (and b!1409633 res!947355) b!1409634))

(assert (= (and b!1409634 res!947352) b!1409630))

(assert (= (and b!1409630 res!947358) b!1409637))

(assert (= (and b!1409637 res!947359) b!1409635))

(assert (= (and b!1409635 res!947353) b!1409632))

(assert (= (and b!1409632 res!947356) b!1409631))

(assert (= (and b!1409632 (not res!947357)) b!1409636))

(declare-fun m!1299427 () Bool)

(assert (=> b!1409632 m!1299427))

(declare-fun m!1299429 () Bool)

(assert (=> b!1409632 m!1299429))

(assert (=> b!1409632 m!1299427))

(declare-fun m!1299431 () Bool)

(assert (=> b!1409632 m!1299431))

(assert (=> b!1409632 m!1299429))

(assert (=> b!1409632 m!1299427))

(declare-fun m!1299433 () Bool)

(assert (=> b!1409632 m!1299433))

(declare-fun m!1299435 () Bool)

(assert (=> b!1409632 m!1299435))

(declare-fun m!1299437 () Bool)

(assert (=> b!1409637 m!1299437))

(assert (=> b!1409630 m!1299427))

(assert (=> b!1409630 m!1299427))

(declare-fun m!1299439 () Bool)

(assert (=> b!1409630 m!1299439))

(declare-fun m!1299441 () Bool)

(assert (=> start!121232 m!1299441))

(declare-fun m!1299443 () Bool)

(assert (=> start!121232 m!1299443))

(assert (=> b!1409631 m!1299427))

(assert (=> b!1409631 m!1299427))

(declare-fun m!1299445 () Bool)

(assert (=> b!1409631 m!1299445))

(declare-fun m!1299447 () Bool)

(assert (=> b!1409635 m!1299447))

(declare-fun m!1299449 () Bool)

(assert (=> b!1409634 m!1299449))

(assert (=> b!1409634 m!1299449))

(declare-fun m!1299451 () Bool)

(assert (=> b!1409634 m!1299451))

(declare-fun m!1299453 () Bool)

(assert (=> b!1409636 m!1299453))

(declare-fun m!1299455 () Bool)

(assert (=> b!1409636 m!1299455))

(assert (=> b!1409636 m!1299455))

(declare-fun m!1299457 () Bool)

(assert (=> b!1409636 m!1299457))

(assert (=> b!1409636 m!1299457))

(assert (=> b!1409636 m!1299455))

(declare-fun m!1299459 () Bool)

(assert (=> b!1409636 m!1299459))

(check-sat (not b!1409634) (not start!121232) (not b!1409630) (not b!1409632) (not b!1409637) (not b!1409631) (not b!1409636) (not b!1409635))
